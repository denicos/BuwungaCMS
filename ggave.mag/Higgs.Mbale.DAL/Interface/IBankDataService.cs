using System;
using System.Collections.Generic;
using Higgs.Mbale.DTO;
using Higgs.Mbale.EF.Models;


namespace Higgs.Mbale.DAL.Interface
{
  public  interface IBankDataService
    {
        IEnumerable<Bank> GetAllBanks();
        Bank GetBank(long bankId);
        long SaveBank(BankDTO bank, string userId);
        void MarkAsDeleted(long bankId, string userId);
        Bank GetBankParticularBranch(long branchId);
    }
}
