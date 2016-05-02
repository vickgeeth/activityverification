BEGIN TRANSACTION T;

DELETE FROM dbo.ActivityType;
GO

DELETE FROM dbo.Activity;
GO

DELETE FROM dbo.Reason;
GO



DBCC CHECKIDENT('dbo.Activity', RESEED, 0)
GO

DBCC CHECKIDENT('dbo.Reason', RESEED, 0)
GO

DBCC CHECKIDENT('dbo.ActivityType', RESEED, 0)
GO


INSERT INTO dbo.Reason (Description) VALUES ('Goin above and beyond');
INSERT INTO dbo.Reason (Description) VALUES ('Creative Ideas');
INSERT INTO dbo.Reason (Description) VALUES ('Cost Savings');
INSERT INTO dbo.Reason (Description) VALUES ('Teamwork');
INSERT INTO dbo.Reason (Description) VALUES ('Other');




INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (10, 'Description 1', '01/01/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (11, 'Description 2', '01/02/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (12, 'Description 3', '01/03/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (13, 'Description 4', '01/04/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (14, 'Description 5', '01/05/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (15, 'Description 6', '01/06/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (16, 'Description 7', '01/07/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (17, 'Description 8', '01/08/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (18, 'Description 9', '01/09/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (19, 'Description 10', '01/10/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (20, 'Description 11', '01/01/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (21, 'Description 12', '01/02/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (22, 'Description 13', '01/03/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (23, 'Description 14', '01/04/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (24, 'Description 15', '01/05/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (25, 'Description 16', '01/06/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (26, 'Description 17', '01/07/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (27, 'Description 18', '01/08/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (28, 'Description 19', '01/09/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (29, 'Description 20', '01/10/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (30, 'Description 21', '01/11/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (31, 'Description 22', '01/12/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (32, 'Description 23', '01/13/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (33, 'Description 24', '01/14/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (34, 'Description 25', '01/14/2016', 1);
INSERT INTO dbo.Activity (HandleId, Description, MomentInTime, Indicator) VALUES (35, 'Description 26', '01/14/2016', 1);

INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('S', 'Invoice Identifier 1', 1, null);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('S', 'Invoice Identifier 2', 2, null);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('S', 'Invoice Identifier 3', 3, null);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('S', 'Invoice Identifier 4', 4, null);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('S', 'Invoice Identifier 5', 5, null);

INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('R', null, 6, 1);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('R', null, 7, 2);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('R', null, 8, 3);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('R', null, 9, 4);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('R', null, 10, 5);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('R', null, 11, 1);

INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('S', 'Invoice Identifier 6', 12, null);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('S', 'Invoice Identifier 7', 13, null);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('R', null, 14, 1);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('R', null, 15, 2);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('R', null, 16, 3);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('R', null, 17, 4);

INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('S', 'Invoice Identifier 8', 18, null);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('S', 'Invoice Identifier 9', 19, null);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('S', 'Invoice Identifier 10', 20, null);

INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('R', null, 21, 1);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('R', null, 22, 2);

INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('S', 'Invoice Identifier 11', 23, null);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('S', 'Invoice Identifier 12', 24, null);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('S', 'Invoice Identifier 13', 25, null);
INSERT INTO dbo.ActivityType (ActType, InvoiceIdentifier, ActivityId, ReasonId) VALUES ('S', 'Invoice Identifier 14', 26, null);


COMMIT TRAN T;
