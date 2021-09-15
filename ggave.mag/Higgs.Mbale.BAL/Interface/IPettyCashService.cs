
using System.Collections.Generic;
using Higgs.Mbale.Models;

namespace Higgs.Mbale.BAL.Interface
{
   public interface IPettyCashService
    {
        PettyCash GetPettyCash(long pettyCashId);
        IEnumerable<PettyCash> GetAllPettyCash();

        IEnumerable<PettyCash> GetAllPettyCashForAParticularBranch(long branchId);
        IEnumerable<PettyCash> MapEFToModel(IEnumerable<EF.Models.PettyCash> data);
        long SavePettyCash(PettyCash cash, string userId);

        //void MarkAsDeleted(long cashId, string userId, long branchId);
        
        IEnumerable<PettyCash> GetTwentyLatestPettyCashForAParticularBranch(long branchId);
        long CheckIfBranchHasEnoughCash(long branchId, double amount, string action);
    }
}
