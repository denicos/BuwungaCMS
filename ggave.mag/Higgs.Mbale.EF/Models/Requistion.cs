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
    
    public partial class Requistion
    {
        public long RequistionId { get; set; }
        public long StatusId { get; set; }
        public long BranchId { get; set; }
        public string ApprovedById { get; set; }
        public string Description { get; set; }
        public string Response { get; set; }
        public string RequistionNumber { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string DeletedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
        public double Amount { get; set; }
        public Nullable<bool> Rejected { get; set; }
        public Nullable<bool> Approved { get; set; }
        public string AmountInWords { get; set; }
        public Nullable<long> CasualWorkerId { get; set; }
        public Nullable<long> BatchId { get; set; }
        public Nullable<long> SupplyId { get; set; }
        public Nullable<long> ActivityId { get; set; }
        public Nullable<bool> PartPayment { get; set; }
        public long RequistionCategoryId { get; set; }
        public Nullable<double> Quantity { get; set; }
        public string RepairerName { get; set; }
        public System.DateTime RepairDate { get; set; }
        public Nullable<long> UtilityCategoryId { get; set; }
    
        public virtual Activity Activity { get; set; }
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual AspNetUser AspNetUser1 { get; set; }
        public virtual AspNetUser AspNetUser2 { get; set; }
        public virtual AspNetUser AspNetUser3 { get; set; }
        public virtual Batch Batch { get; set; }
        public virtual Branch Branch { get; set; }
        public virtual CasualWorker CasualWorker { get; set; }
        public virtual RequistionCategory RequistionCategory { get; set; }
        public virtual Status Status { get; set; }
        public virtual Supply Supply { get; set; }
        public virtual UtilityCategory UtilityCategory { get; set; }
    }
}
