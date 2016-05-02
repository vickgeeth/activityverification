using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Activity.Models
{
    public class InputParams
    {
        public int Indicator { get; set; }
        public IList<int> HandleIds { get; set; }
    }
}