using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Higgs.Mbale.Models
{
  public  class Grade
    {
        public long GradeId { get; set; }
        public string Value { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string DeletedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
        public List<Denomination> Denominations { get; set; }
    }

  public class Denomination
  {
      public long DenominationId { get; set; }
      public int Value { get; set; }
      public double Quantity { get; set; }
      public Nullable<double> Rate { get; set; }
      public double Amount { get; set; }
      public double Price { get; set; }
      public double Balance { get; set; }
      public double QuantityToRemove { get; set; }

      public double Total { get; set; }
  }

}
