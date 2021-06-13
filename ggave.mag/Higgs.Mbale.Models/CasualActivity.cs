﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Higgs.Mbale.Models
{
 public   class CasualActivity
    {
        public long CasualActivityId { get; set; }
        public long BatchId { get; set; }
        public long CasualWorkerId { get; set; }
        public double Quantity { get; set; }
        public long BranchId { get; set; }
        public long SectorId { get; set; }
        public string Notes { get; set; }
        public double Amount { get; set; }
        public bool Deleted { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string DeletedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
        public long ActivityId { get; set; }

        public string ActivityName { get; set; }
        public string BranchName { get; set; }
        public string SectorName { get; set; }
        public string CasualWorkerName { get; set; }
        public string BatchNumber { get; set; }

        public string Action { get; set; }
        public long TransactionSubTypeId { get; set; }
    }
}
