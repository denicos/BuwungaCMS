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
    
    public partial class DeliveryBatch
    {
        public long BatchId { get; set; }
        public long DeliveryId { get; set; }
        public double BatchQuantity { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<double> Price { get; set; }
        public Nullable<double> Amount { get; set; }
        public Nullable<long> ProductId { get; set; }
    
        public virtual Batch Batch { get; set; }
        public virtual Product Product { get; set; }
        public virtual Delivery Delivery { get; set; }
    }
}
