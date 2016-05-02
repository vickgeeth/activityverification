using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Activity.Models
{
    public class Activity
    {
        public int ActivityId { get; set; }
        public int HandleId { get; set; }
        public string description { get; set; }
        public DateTime? MomentInTime { get; set; }
        public int Indicator { get; set; }
        public string ActivityType { get; set; }
        public string InvoiceIdentifier { get; set; }
        public int? ReasonId { get; set; }
        public string ReasonDesc { get; set; }
    }
}