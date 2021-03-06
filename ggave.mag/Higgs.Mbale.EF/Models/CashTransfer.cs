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
    
    public partial class CashTransfer
    {
        public long CashTransferId { get; set; }
        public string Response { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public long ToReceiverBranchId { get; set; }
        public bool Accept { get; set; }
        public bool Reject { get; set; }
        public long FromBranchId { get; set; }
        public double Amount { get; set; }
        public string AmountInWords { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string DeletedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
        public long SectorId { get; set; }
        public string Notes { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual AspNetUser AspNetUser1 { get; set; }
        public virtual AspNetUser AspNetUser2 { get; set; }
        public virtual Sector Sector { get; set; }
        public virtual Branch Branch { get; set; }
        public virtual Branch Branch1 { get; set; }
    }
}
