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
    public class ReasonController : ApiController
    {
        // GET: api/Reason
        public HttpResponseMessage Get()
        {
            using (var context = new perksEntities())
            {
                var reasons = new List<models.Reason>();
                context.Reasons.ToList().ForEach(x => {
                    reasons.Add(new Models.Reason()
                    {
                        Description = x.Description,
                        Id = x.ReasonId
                    });
                });
                return Request.CreateResponse(HttpStatusCode.OK, reasons);
            }
                
        }

        // GET: api/Reason/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Reason
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Reason/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Reason/5
        public void Delete(int id)
        {
        }
    }
}
