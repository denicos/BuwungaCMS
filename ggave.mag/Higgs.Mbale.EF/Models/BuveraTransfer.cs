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
    
    public partial class BuveraTransfer
    {
        public BuveraTransfer()
        {
            this.BuveraTransferGradeSizes = new HashSet<BuveraTransferGradeSize>();
        }
    
        public long BuveraTransferId { get; set; }
        public long StoreId { get; set; }
        public long BranchId { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public long ToReceiverStoreId { get; set; }
        public bool Accept { get; set; }
        public bool Reject { get; set; }
        public long FromSupplierStoreId { get; set; }
        public double TotalQuantity { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string DeletedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
        public long ProductId { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual AspNetUser AspNetUser1 { get; set; }
        public virtual AspNetUser AspNetUser2 { get; set; }
        public virtual Store Store { get; set; }
        public virtual Store Store1 { get; set; }
        public virtual Store Store2 { get; set; }
        public virtual ICollection<BuveraTransferGradeSize> BuveraTransferGradeSizes { get; set; }
        public virtual Branch Branch { get; set; }
        public virtual Product Product { get; set; }
    }
}
