using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Higgs.Mbale.Models
{
  public  class BatchToDeliverGrades
    {
        public long BatchId { get; set; }
        public IEnumerable<Grade> SelectedBatchGrades { get; set; }
    }
}
