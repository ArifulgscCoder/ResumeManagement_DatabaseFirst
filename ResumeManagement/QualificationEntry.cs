//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ResumeManagement
{
    using System;
    using System.Collections.Generic;
    
    public partial class QualificationEntry
    {
        public int QualificationEntryId { get; set; }
        public int EmployeeId { get; set; }
        public int QualificationId { get; set; }
    
        public virtual Employee Employee { get; set; }
        public virtual Qualification Qualification { get; set; }
    }
}
