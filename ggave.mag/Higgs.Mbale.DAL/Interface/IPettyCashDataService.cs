using System.Collections.Generic;
using Higgs.Mbale.DTO;
using Higgs.Mbale.EF.Models;

namespace Higgs.Mbale.DAL.Interface
{
   public interface IPettyCashDataService
    {
        IEnumerable<PettyCash> GetAllPettyCashs();
        PettyCash GetPettyCash(long pettyCashId);
        long SavePettyCash(PettyCashDTO pettyCash, string userId);
        //void MarkAsDeleted(long pettyCashId, string userId);
        IEnumerable<PettyCash> GetAllPettyCashForAParticularBranch(long branchId);
       PettyCash GetLatestPettyCashForAParticularBranch(long branchId);
        IEnumerable<PettyCash> GetTwentyLatestPettyCashForAParticularBranch(long branchId);
      

    }
}
