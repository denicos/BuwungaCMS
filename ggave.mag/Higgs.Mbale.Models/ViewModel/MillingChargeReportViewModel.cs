using System;
using System.Collections.Generic;


namespace Higgs.Mbale.Models.ViewModel
{
  public  class MillingChargeReportViewModel
    {
        public IEnumerable<MillingCharge> MillingCharges { get; set; }

        public double TotalQuantity { get; set; }
        public double TotalAmount { get; set; }

    }
}
