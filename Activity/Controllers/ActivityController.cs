using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Activity.DataContext.Domain;
using models = Activity.Models;

namespace Activity.Controllers
{
    public class ActivityController : ApiController
    {
        [HttpGet]
        public HttpResponseMessage Activities(int draw, int start, int length)
        {
            var modelActivities = new List<models.Activity>();
            using (var context = new perksEntities())
            {
                var activities = context.Activities.OrderBy(x => x.HandleId).ToList();
                                
                activities.ForEach(x =>
                {
                    modelActivities.Add(new models.Activity()
                    {
                        ActivityId = x.ActivityId,
                        ActivityType = x.ActivityTypes.FirstOrDefault().ActType,
                        description = x.Description,
                        HandleId = x.HandleId,
                        Indicator = x.Indicator,
                        InvoiceIdentifier = x.ActivityTypes.FirstOrDefault().InvoiceIdentifier,
                        MomentInTime = x.MomentInTime,
                        ReasonId = x.ActivityTypes.FirstOrDefault().ReasonId,
                        ReasonDesc = x.ActivityTypes.FirstOrDefault().Reason == null ? null : x.ActivityTypes.FirstOrDefault().Reason.Description


                    });
                });


            }

            int pagesize = start / length;

            return modelActivities.Count == 0 ? Request.CreateResponse(HttpStatusCode.NotFound) :
                Request.CreateResponse(HttpStatusCode.OK, new models.PaginatedActivity()
                {
                    draw = draw,
                    recordFiltered = modelActivities.Skip(length * pagesize).Take(length).ToList().Count,
                    recordsTotal = modelActivities.Count,
                    data = modelActivities.Skip(length * pagesize).Take(length).ToList()
                });
        }

        // GET: api/Activity
        public HttpResponseMessage Get()
        {
            var modelActivities = new List<models.Activity>();
            using (var context = new perksEntities())
            {
                var activities = context.Activities.ToList();
                activities.ForEach(x =>
                {
                    modelActivities.Add(new models.Activity()
                    {
                        ActivityId = x.ActivityId,
                        ActivityType = x.ActivityTypes.FirstOrDefault().ActType,
                        description = x.Description,
                        HandleId = x.HandleId,
                        Indicator = x.Indicator,
                        InvoiceIdentifier = x.ActivityTypes.FirstOrDefault().InvoiceIdentifier,
                        MomentInTime = x.MomentInTime,
                        ReasonId = x.ActivityTypes.FirstOrDefault().ReasonId,
                        ReasonDesc = x.ActivityTypes.FirstOrDefault().Reason == null? null : x.ActivityTypes.FirstOrDefault().Reason.Description 


                    });
                });
            }

            return Request.CreateResponse(HttpStatusCode.OK, modelActivities);
        }

        // GET: api/Activity/5
        public HttpResponseMessage Get(int handleId)
        {
            var model = new models.Activity();
            using (var context = new perksEntities())
            {
                var activities = context.Activities.Where(x => x.HandleId == handleId).FirstOrDefault();
                model.HandleId = activities.HandleId;
                model.ActivityId = activities.ActivityId;
                model.ActivityType = activities.ActivityTypes.FirstOrDefault().ActType;
                model.description = activities.Description;
                model.Indicator = activities.Indicator;
                model.InvoiceIdentifier = activities.ActivityTypes.FirstOrDefault().InvoiceIdentifier;
                model.MomentInTime = activities.MomentInTime;
                model.ReasonDesc = activities.ActivityTypes.FirstOrDefault().Reason  == null ? 
                    null : activities.ActivityTypes.FirstOrDefault().Reason.Description;
                model.ReasonId = activities.ActivityTypes.FirstOrDefault().ReasonId;
               
            }

            return Request.CreateResponse(HttpStatusCode.OK, model);
        }

        // POST: api/Activity
        public void Post([FromBody]string value)
        {
        }

        [HttpPost]
        public HttpResponseMessage UpdateIndicators([FromBody]models.InputParams inputParams)
        {
            if (inputParams.HandleIds == null)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Bad Request");
            }
            else
            {
                using (var context = new perksEntities())
                {
                    foreach(int param in inputParams.HandleIds)
                    {
                        var model = context.Activities.SingleOrDefault(y => y.ActivityId == param);
                        model.Indicator = inputParams.Indicator;
                        context.SaveChanges();
                    }
                   
                }
            }

                return Request.CreateResponse(HttpStatusCode.OK, "Activities are updated successfully");
        }

        // PUT: api/Activity/5
        [HttpPost]
        public HttpResponseMessage Update([FromBody]models.Activity activity)
        {
            if (activity == null)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Bad Request");
            }
            else
            {
                using (var context = new perksEntities())
                {
                    if (context.Activities.Where(x => x.HandleId == activity.HandleId && x.ActivityId != activity.ActivityId).Count() > 0)
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.Conflict, "Duplicate Handler");
                    }
                    var model = context.Activities.SingleOrDefault(y => y.ActivityId == activity.ActivityId);
                    model.HandleId = activity.HandleId;
                    model.Indicator = activity.Indicator;
                    context.SaveChanges();
                }

                return Request.CreateResponse(HttpStatusCode.OK, activity);
            }
        }

        // DELETE: api/Activity/5
        public void Delete(int id)
        {
        }
    }
}
