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
    /// <summary>
    /// Reason controller inheried from ApiController
    /// </summary>
    public class ReasonController : ApiController
    {
        /// <summary>
        /// Retrieve collection of reason objects
        /// </summary>
        /// <returns></returns>
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

       
    }
}
