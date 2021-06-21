using System;
using System.Collections.Generic;
using Higgs.Mbale.Models;


namespace Higgs.Mbale.BAL.Interface
{
public    interface IDebtorService
    {
        IEnumerable<DebtorView> GetDebtorView();
      

        IEnumerable<DebtorView> GetDebtorViewForAParticularDate(DateTime dateTime);
     

        IEnumerable<DebtorView> GetAdvancePaymentView();
      
        IEnumerable<DebtorView> GetAdvancePaymentViewForAParticularDate(DateTime dateTime);


    }
}
