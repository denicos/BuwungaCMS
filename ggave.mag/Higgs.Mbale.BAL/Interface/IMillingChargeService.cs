
using System.Collections.Generic;
using Higgs.Mbale.Models;

namespace Higgs.Mbale.BAL.Interface
{
   public interface IMillingChargeService
    {
        IEnumerable<MillingCharge> GetAllMillingCharges();
        MillingCharge GetMillingCharge(long millingChargeId);
        long SaveMillingCharge(MillingCharge millingCharge, string userId);
        //void MarkAsDeleted(long millingChargeId, string userId);
        IEnumerable<MillingCharge> GetAllMillingChargesForAParticularBranch(long branchId);

        IEnumerable<MillingCharge> GetTwentyLatestMillingChargesForAParticularBranch(long branchId);

    }
}
