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
        IEnumerable<DebtorView> GenerateDebtorReportForAParticularDateForBranch(DateTime dateTime, long branchId);


        IEnumerable<DebtorView> GetAdvancePaymentViewForAParticularDate(DateTime dateTime);

        IEnumerable<DebtorView> GetAdvancePaymentViewForBranch(long branchId);

        IEnumerable<DebtorView> GetAdvancePaymentViewForAParticularDateForBranch(DateTime dateTime,long branchId);


    }
}
