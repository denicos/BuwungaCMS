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
    
    public partial class Region
    {
        public Region()
        {
            this.AspNetUsers = new HashSet<AspNetUser>();
            this.Locations = new HashSet<Location>();
        }
    
        public long RegionId { get; set; }
        public string Name { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string Initials { get; set; }
    
        public virtual ICollection<AspNetUser> AspNetUsers { get; set; }
        public virtual ICollection<Location> Locations { get; set; }
    }
}
