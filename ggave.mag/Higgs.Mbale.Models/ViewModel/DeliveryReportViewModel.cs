﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Higgs.Mbale.Models.ViewModel
{
  public  class DeliveryReportViewModel
    {
        public IEnumerable<Delivery> Deliveries { get; set; }
        public double TotalQuantity { get; set; }
        public decimal TotalAmount { get; set; }
       
    }
}
