using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Higgs.Mbale.Models
{
  public  class StockProduct
    {
        public long StockId { get; set; }
        public long ProductId { get; set; }
        public double Quantity { get; set; }
        public System.DateTime TimeStamp { get; set; }
    }
}
