using System;
using System.Collections.Generic;
using Higgs.Mbale.Models;

namespace Higgs.Mbale.BAL.Interface
{
  public  interface ICreditorService
    {
           

        IEnumerable<CreditorView> GetCreditorView();
      

        IEnumerable<CreditorView> GetCreditorViewForAParticularDate(DateTime dateTime);

        IEnumerable<CreditorView> GetCreditorViewForAParticularDateForBranch(DateTime dateTime,long branchId);



    }
}
