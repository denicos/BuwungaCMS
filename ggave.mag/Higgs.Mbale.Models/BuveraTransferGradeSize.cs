using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Higgs.Mbale.Models
{
 public   class BuveraTransferGradeSize
    {
        public long BuveraTransferId { get; set; }
        public long GradeId { get; set; }
        public long SizeId { get; set; }
        public long StoreId { get; set; }
        public double Quantity { get; set; }
        public double Rate { get; set; }
        public double Amount { get; set; }
        public System.DateTime TimeStamp { get; set; }
    }
}
