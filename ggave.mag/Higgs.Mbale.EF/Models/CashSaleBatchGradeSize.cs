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
    
    public partial class CashSaleBatchGradeSize
    {
        public long BatchId { get; set; }
        public long CashSaleId { get; set; }
        public long GradeId { get; set; }
        public long SizeId { get; set; }
        public double Quantity { get; set; }
        public double Amount { get; set; }
        public double Price { get; set; }
        public System.DateTime TimeStamp { get; set; }
    
        public virtual Batch Batch { get; set; }
        public virtual CashSale CashSale { get; set; }
        public virtual Grade Grade { get; set; }
        public virtual Size Size { get; set; }
    }
}
