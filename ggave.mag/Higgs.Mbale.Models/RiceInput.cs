using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Higgs.Mbale.Models
{
  public  class RiceInput
    {
        public long RiceInputId { get; set; }
        public double TotalQuantity { get; set; }
        public double Price { get; set; }
        public double TotalAmount { get; set; }
        public long BranchId { get; set; }
        public long StoreId { get; set; }
        public Nullable<bool> Approved { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string DeletedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }

        public List<Grade> Grades { get; set; }
        public string CreatedById { get; set; }
        public string ApprovedById { get; set; }
        public string StoreName { get; set; }

        public string BranchName { get; set; }
    }
}
