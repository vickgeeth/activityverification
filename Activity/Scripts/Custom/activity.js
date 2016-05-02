// JQUERY starting point
$(function () {

    // Hide message and dialog boxes
    $("#message").hide();
    $("#dialogSales").hide();
    $("#dialogRec").hide();

    // Verification button click event handler
    $("#btnRevokeVerification").click(function () {
        BulkVerification(1, "Selected Activiti(es) are successfully revoked");
    });

    // Revoke button click event handler
    $("#btnConfirmVerification").click(function () {
        BulkVerification(2, "Selected Activiti(es) are successfully verified");

    });

    // Rest call to service to update Indicator field
    function BulkVerification(indicator, successmessage) {
        if ($('input[type="checkbox"]').length > 0) {
            var handleIds = [];
            //var handleIds = "";
            $('input[type="checkbox"]').each(function () {
                if (this.checked) {
                    handleIds.push(this.value);
                }

            });

            // Check for checkbox selections
            if (handleIds.length > 0) {

                $.post("api/activity/updateIndicators", {
                    "HandleIds": handleIds,
                    "Indicator": indicator//JSON.stringify(handleIds),

                }, function (data, status) {
                    $("#message").show();
                    $("#message").html(successmessage);
                    $("#message").removeClass("alert-danger");
                    $("#message").addClass("alert-success");

                    $('#activitiesTable').DataTable().ajax.reload();
                    // loadgrid();


                })
           .fail(function (error) {
               if (error.status == 409) {
                   showErrorMessage("Handle already exists!");
               } else {
                   showErrorMessage(error.statusText);
               }



           });
            }
            else {
                showErrorMessage("Please select atleast one activity to continue");
            }

        }
        else {

            showErrorMessage("Please select atleast one activity to continue");
        }
    }

    // "private" method to show and set error messages
    function showErrorMessage(message) {
        $("#message").html(message);
        $("#message").show();
        $("#message").addClass("alert-danger");
        $("#message").removeClass("alert-success");
    }

    //bind event handler to dynamic buttons "link"
    $(document).on('click', '.testclass', function () {

        $("#message").hide();
        // Call to Rest
        $.get("api/activity?handleId=" + this.id, function (data, status) {
            if (status == "success") {
                $("#hdnSalesId").val(data.ActivityId);
                $("#salesHandle").val(data.HandleId);
                $("#dialogSales").hide();
                $("#dialogRec").hide();
                if (data.ActivityType == "S") {
                    $("#dialogSales").show();
                    $("#invoiceIdentifier").val(data.InvoiceIdentifier);
                }
                else if (data.ActivityType == "R") {
                    $("#dialogRec").show();
                    $("#recognitionReason").val(data.ReasonDesc);
                }



                $("#salesDescription").val(data.description);
                $("#salesCapturedOn").val(data.MomentInTime);
                //  $("#salesIndicator").val(data.Indicator);
                // $('#salesIndicator').val(data.Indicator).attr("selected", "selected");
                $("#salesIndicator").val(data.Indicator).change();

                dialog.dialog("open");
            }

        })


    });

    // Modal Dialog box logic (JQuery UI)
    var dialog = $("#activityDetails").dialog({
        autoOpen: false,
        height: 520,
        width: 500,
        modal: true,
        buttons: {
            "Save Changes": saveActivities,
            Cancel: function () {
                dialog.dialog("close");
            }
        },
        close: function () {
            //form[0].reset();
            //allFields.removeClass("ui-state-error");
        }
    });



    // Save Activities 
    // Rest call
    function saveActivities() {

        // Rest call
        $.post("api/activity/update", {
            "ActivityId": $("#hdnSalesId").val(),
            "InvoiceIdentifier": $("#invoiceIdentifier").val(),
            "MomentInTime": $("#salesCapturedOn").val(),
            "description": $("#salesDescription").val(),
            "HandleId": $("#salesHandle").val(),
            "Indicator": $("#salesIndicator").val()
        }, function (data, status) {
            $("#message").show();
            $("#message").html("Activity for Handle " + $("#salesHandle").val() + " is updated successfully");
            $("#message").removeClass("alert-danger");
            $("#message").addClass("alert-success");

            $('#activitiesTable').DataTable().ajax.reload();
            //loadgrid();
            dialog.dialog("close");

        })
        .fail(function (error) {
            if (error.status == 409) {
                showErrorMessage("Handle already exists!");
            } else {
                showErrorMessage(error.statusText);
            }


        });
    }

    function loadgrid() {
        // Datatable (grid) logic
        $("#activitiesTable").DataTable({
            "searching": false,
            "pagingType": "simple_numbers",
            "lengthMenu": [10],
            "processing": true,
            "serverSide": true,
            "dom": '<"top"p>',
            //"scrollY": "200",
            //"scrollCollapse": true,
            "bSort": false,
            "ajax": "api/activity/activities",
            "columns": [
                 {
                     "data": "ActivityId",
                     'className': 'dt-body-center',
                     "render": function (data, type, row) {
                         return '<input type="checkbox" id="cb" value= "' + data + '"/>';
                     }
                 },
                {
                    "data": "HandleId",
                    'className': 'dt-body-center',
                    "render": function (data, type, row) {
                        return '<button id=' + data + ' class="testclass btn btn-link">' + data + '</button>';
                    }
                },
                { "data": "description" },
                {
                    "data": "ActivityType",
                    'className': 'dt-body-center',
                    "render": function (data, type, row) {
                        return data == "S" ? "Sales" : "Recognition";
                    }
                },
                {
                    "data": "Indicator",
                    'className': 'dt-body-center',
                    "render": function (data, type, row) {
                        return data == "1" ? "<label style='color:red'>Not Verified</label>" : "<label style='color:green'>Verified</label>";
                    }
                }

            ]
        });
    }

    loadgrid();

});