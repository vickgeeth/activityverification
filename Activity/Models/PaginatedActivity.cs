using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Activity.Models
{
    /// <summary>
    /// Class for Pagination
    /// </summary>
    public class PaginatedActivity
    {
        public int? draw { get; set; }
        public int? recordsTotal { get; set; }
        public int? recordFiltered { get; set; }
        public IList<Activity> data { get; set; }
    }
}