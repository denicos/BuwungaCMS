﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Higgs.Mbale.DTO
{
   public class BatchDeliveryGradeSizeDTO
    {
        public long BatchId { get; set; }
        public long DeliveryId { get; set; }
        public long GradeId { get; set; }
        public long SizeId { get; set; }
        public double Quantity { get; set; }
        public double Amount { get; set; }
        public double Price { get; set; }
        public System.DateTime TimeStamp { get; set; }
        

    }
}
