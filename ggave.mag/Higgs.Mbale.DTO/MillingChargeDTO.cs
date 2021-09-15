using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Higgs.Mbale.DTO
{
 public   class MillingChargeDTO
    {
        public long MillingChargeId { get; set; }
        public Nullable<long> BranchId { get; set; }
        public double Quantity { get; set; }
        public string Notes { get; set; }
        public double Amount { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public string CreatedBy { get; set; }
        public string DeletedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }

    }
}
