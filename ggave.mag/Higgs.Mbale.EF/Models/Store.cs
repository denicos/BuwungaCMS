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
    
    public partial class Store
    {
        public Store()
        {
            this.StoreStocks = new HashSet<StoreStock>();
            this.Stocks = new HashSet<Stock>();
            this.StoreGradeSizes = new HashSet<StoreGradeSize>();
            this.BuveraGradeSizes = new HashSet<BuveraGradeSize>();
            this.StoreBuveraGradeSizes = new HashSet<StoreBuveraGradeSize>();
            this.FlourTransferGradeSizes = new HashSet<FlourTransferGradeSize>();
            this.Buveras = new HashSet<Buvera>();
            this.BuveraTransfers = new HashSet<BuveraTransfer>();
            this.BuveraTransfers1 = new HashSet<BuveraTransfer>();
            this.BuveraTransfers2 = new HashSet<BuveraTransfer>();
            this.BuveraTransferGradeSizes = new HashSet<BuveraTransferGradeSize>();
            this.StoreBuveraTransferGradeSizes = new HashSet<StoreBuveraTransferGradeSize>();
            this.StoreFlourTransferGradeSizes = new HashSet<StoreFlourTransferGradeSize>();
            this.FlourTransfers = new HashSet<FlourTransfer>();
            this.FlourTransfers1 = new HashSet<FlourTransfer>();
            this.FlourTransfers2 = new HashSet<FlourTransfer>();
            this.MaizeBrandStores = new HashSet<MaizeBrandStore>();
            this.CashSales = new HashSet<CashSale>();
            this.Supplies = new HashSet<Supply>();
            this.InventoryPurchases = new HashSet<InventoryPurchase>();
            this.Deliveries = new HashSet<Delivery>();
        }
    
        public long StoreId { get; set; }
        public string Name { get; set; }
        public long BranchId { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string DeletedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
        public string OutSourcerId { get; set; }
    
        public virtual ICollection<StoreStock> StoreStocks { get; set; }
        public virtual ICollection<Stock> Stocks { get; set; }
        public virtual ICollection<StoreGradeSize> StoreGradeSizes { get; set; }
        public virtual ICollection<BuveraGradeSize> BuveraGradeSizes { get; set; }
        public virtual ICollection<StoreBuveraGradeSize> StoreBuveraGradeSizes { get; set; }
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual AspNetUser AspNetUser1 { get; set; }
        public virtual AspNetUser AspNetUser2 { get; set; }
        public virtual ICollection<FlourTransferGradeSize> FlourTransferGradeSizes { get; set; }
        public virtual ICollection<Buvera> Buveras { get; set; }
        public virtual ICollection<BuveraTransfer> BuveraTransfers { get; set; }
        public virtual ICollection<BuveraTransfer> BuveraTransfers1 { get; set; }
        public virtual ICollection<BuveraTransfer> BuveraTransfers2 { get; set; }
        public virtual ICollection<BuveraTransferGradeSize> BuveraTransferGradeSizes { get; set; }
        public virtual ICollection<StoreBuveraTransferGradeSize> StoreBuveraTransferGradeSizes { get; set; }
        public virtual ICollection<StoreFlourTransferGradeSize> StoreFlourTransferGradeSizes { get; set; }
        public virtual ICollection<FlourTransfer> FlourTransfers { get; set; }
        public virtual ICollection<FlourTransfer> FlourTransfers1 { get; set; }
        public virtual ICollection<FlourTransfer> FlourTransfers2 { get; set; }
        public virtual ICollection<MaizeBrandStore> MaizeBrandStores { get; set; }
        public virtual ICollection<CashSale> CashSales { get; set; }
        public virtual ICollection<Supply> Supplies { get; set; }
        public virtual ICollection<InventoryPurchase> InventoryPurchases { get; set; }
        public virtual Branch Branch { get; set; }
        public virtual AspNetUser AspNetUser21 { get; set; }
        public virtual ICollection<Delivery> Deliveries { get; set; }
    }
}
