using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Higgs.Mbale.Models.ViewModel
{
 public   class PettyCashReportViewModel
    {
        public IEnumerable<PettyCash> PettyCashs { get; set; }

        public double TotalAmount { get; set; }
    }
}
