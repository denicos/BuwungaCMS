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
    
    public partial class UtilityAccount
    {
        public long UtilityAccountId { get; set; }
        public long UtilityCategoryId { get; set; }
        public double Amount { get; set; }
        public string InvoiceNumber { get; set; }
        public string Description { get; set; }
        public string Action { get; set; }
        public long BranchId { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public double Balance { get; set; }
        public double StartAmount { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string DeletedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual AspNetUser AspNetUser1 { get; set; }
        public virtual AspNetUser AspNetUser2 { get; set; }
        public virtual UtilityCategory UtilityCategory { get; set; }
        public virtual Branch Branch { get; set; }
    }
}
