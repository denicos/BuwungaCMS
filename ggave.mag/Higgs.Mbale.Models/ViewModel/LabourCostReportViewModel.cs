using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Higgs.Mbale.Models.ViewModel
{
 public   class LabourCostReportViewModel
    {
        public IEnumerable<LabourCost> LabourCosts { get; set; }
        public decimal TotalAmount { get; set; }
    }
}
