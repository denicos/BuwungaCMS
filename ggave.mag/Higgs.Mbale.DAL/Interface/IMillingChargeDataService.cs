using System.Collections.Generic;
using Higgs.Mbale.DTO;
using Higgs.Mbale.EF.Models;

namespace Higgs.Mbale.DAL.Interface
{
   public interface IMillingChargeDataService
    {
        IEnumerable<MillingCharge> GetAllMillingCharges();
        MillingCharge GetMillingCharge(long millingChargeId);
        long SaveMillingCharge(MillingChargeDTO millingCharge, string userId);
        //void MarkAsDeleted(long millingChargeId, string userId);
        IEnumerable<MillingCharge> GetAllMillingChargesForAParticularBranch(long branchId);
      
        IEnumerable<MillingCharge> GetTwentyLatestMillingChargesForAParticularBranch(long branchId);
       
    }
}
