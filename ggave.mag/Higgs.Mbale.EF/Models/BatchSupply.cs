//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Higgs.Mbale.EF.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class BatchSupply
    {
        public long BatchId { get; set; }
        public long SupplyId { get; set; }
        public double Quantity { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public double NormalBags { get; set; }
        public double BagsOfStones { get; set; }
    
        public virtual Batch Batch { get; set; }
        public virtual Supply Supply { get; set; }
    }
}
