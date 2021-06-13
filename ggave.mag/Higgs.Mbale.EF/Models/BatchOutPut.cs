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
    
    public partial class BatchOutPut
    {
        public BatchOutPut()
        {
            this.BatchGradeSizes = new HashSet<BatchGradeSize>();
        }
    
        public long BatchOutPutId { get; set; }
        public long BatchId { get; set; }
        public double FlourOutPut { get; set; }
        public double LossPercentage { get; set; }
        public double FlourPercentage { get; set; }
        public double BrandPercentage { get; set; }
        public double BrandOutPut { get; set; }
        public Nullable<double> Loss { get; set; }
        public Nullable<bool> Deleted { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string DeletedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<System.DateTime> DeletedOn { get; set; }
        public long BranchId { get; set; }
        public long SectorId { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual AspNetUser AspNetUser1 { get; set; }
        public virtual AspNetUser AspNetUser2 { get; set; }
        public virtual Batch Batch { get; set; }
        public virtual Sector Sector { get; set; }
        public virtual ICollection<BatchGradeSize> BatchGradeSizes { get; set; }
        public virtual Branch Branch { get; set; }
    }
}
