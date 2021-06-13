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
    
    public partial class Activity
    {
        public Activity()
        {
            this.ActivityBranches = new HashSet<ActivityBranch>();
            this.ActivityBatchCasuals = new HashSet<ActivityBatchCasual>();
            this.CasualActivities = new HashSet<CasualActivity>();
            this.LabourCosts = new HashSet<LabourCost>();
            this.Requistions = new HashSet<Requistion>();
        }
    
        public long ActivityId { get; set; }
        public string Name { get; set; }
        public double Charge { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string DeletedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
    
        public virtual ICollection<ActivityBranch> ActivityBranches { get; set; }
        public virtual ICollection<ActivityBatchCasual> ActivityBatchCasuals { get; set; }
        public virtual ICollection<CasualActivity> CasualActivities { get; set; }
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual AspNetUser AspNetUser1 { get; set; }
        public virtual AspNetUser AspNetUser2 { get; set; }
        public virtual ICollection<LabourCost> LabourCosts { get; set; }
        public virtual ICollection<Requistion> Requistions { get; set; }
    }
}
