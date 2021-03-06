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
    
    public partial class Product
    {
        public Product()
        {
            this.BatchProducts = new HashSet<BatchProduct>();
            this.Stocks = new HashSet<Stock>();
            this.StockProducts = new HashSet<StockProduct>();
            this.StoreStocks = new HashSet<StoreStock>();
            this.Orders = new HashSet<Order>();
            this.CashSales = new HashSet<CashSale>();
            this.DeliveryBatches = new HashSet<DeliveryBatch>();
            this.CashSaleBatches = new HashSet<CashSaleBatch>();
            this.AspNetUserProducts = new HashSet<AspNetUserProduct>();
            this.Buveras = new HashSet<Buvera>();
            this.BuveraTransfers = new HashSet<BuveraTransfer>();
            this.Deliveries = new HashSet<Delivery>();
        }
    
        public long ProductId { get; set; }
        public string Name { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string DeletedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
    
        public virtual ICollection<BatchProduct> BatchProducts { get; set; }
        public virtual ICollection<Stock> Stocks { get; set; }
        public virtual ICollection<StockProduct> StockProducts { get; set; }
        public virtual ICollection<StoreStock> StoreStocks { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual AspNetUser AspNetUser1 { get; set; }
        public virtual AspNetUser AspNetUser2 { get; set; }
        public virtual ICollection<CashSale> CashSales { get; set; }
        public virtual ICollection<DeliveryBatch> DeliveryBatches { get; set; }
        public virtual Product Product1 { get; set; }
        public virtual Product Product2 { get; set; }
        public virtual ICollection<CashSaleBatch> CashSaleBatches { get; set; }
        public virtual ICollection<AspNetUserProduct> AspNetUserProducts { get; set; }
        public virtual ICollection<Buvera> Buveras { get; set; }
        public virtual ICollection<BuveraTransfer> BuveraTransfers { get; set; }
        public virtual ICollection<Delivery> Deliveries { get; set; }
    }
}
