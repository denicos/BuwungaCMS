using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Higgs.Mbale.Models
{
 public   class Cash
    {
        public long CashId { get; set; }
        public long TransactionSubTypeId { get; set; }
        public Nullable<long> BranchId { get; set; }
        public long SectorId { get; set; }
        public double StartAmount { get; set; }
        public string Action { get; set; }
        public string Notes { get; set; }
        public double Amount { get; set; }
        public double Balance { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public string CreatedBy { get; set; }
        public string DeletedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
        public Nullable<long> RequistionCategoryId { get; set; }

        public string CustomerId { get; set; }


        public string BranchName { get; set; }
        public string TransactionSubTypeName { get; set; }
        public string SectorName { get; set; }
        public string RequistionCategoryName { get; set; }
        public string CustomerName { get; set; }
    
    }
}
