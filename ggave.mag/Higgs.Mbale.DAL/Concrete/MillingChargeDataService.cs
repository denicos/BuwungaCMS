using System;
using System.Collections.Generic;
using System.Linq;
using Higgs.Mbale.EF.Models;
using Higgs.Mbale.DAL.Interface;
using Higgs.Mbale.EF.UnitOfWork;
using Higgs.Mbale.DTO;

namespace Higgs.Mbale.DAL.Concrete
{
   public  class MillingChargeDataService : DataServiceBase,IMillingChargeDataService
    {
        public MillingChargeDataService(IUnitOfWork<MbaleEntities> unitOfWork)
         : base(unitOfWork)
        {

        }

        public IEnumerable<MillingCharge> GetAllMillingCharges()
        {
            return this.UnitOfWork.Get<MillingCharge>().AsQueryable().Where(e => e.Deleted == false);
        }

        public MillingCharge GetMillingCharge(long millingChargeId)
        {
            return this.UnitOfWork.Get<MillingCharge>().AsQueryable()
                 .FirstOrDefault(c =>
                    c.MillingChargeId == millingChargeId &&
                    c.Deleted == false
                );
        }

        public IEnumerable<MillingCharge> GetAllMillingChargesForAParticularBranch(long branchId)
        {

            return this.UnitOfWork.Get<MillingCharge>().AsQueryable().Where(e => e.Deleted == false && e.BranchId == branchId);
        }

        public IEnumerable<MillingCharge> GetTwentyLatestMillingChargesForAParticularBranch(long branchId)
        {

            return this.UnitOfWork.Get<MillingCharge>().AsQueryable().Where(e => e.Deleted == false && e.BranchId == branchId).OrderByDescending(e => e.MillingChargeId).Take(20);
        }

       

        public long SaveMillingCharge(MillingChargeDTO millingChargeDTO, string userId)
        {
            long millingChargeId = 0;

            if (millingChargeDTO.MillingChargeId == 0)
            {

                var millingCharge = new MillingCharge()
                {

                    Amount = millingChargeDTO.Amount,
                    Quantity = millingChargeDTO.Quantity,
                    Notes = millingChargeDTO.Notes,
                    
                    BranchId = millingChargeDTO.BranchId,
                    CreatedOn = DateTime.Now,
                    TimeStamp = DateTime.Now,
                    CreatedBy = userId,
                    Deleted = false,
                   

                };

                this.UnitOfWork.Get<MillingCharge>().AddNew(millingCharge);
                this.UnitOfWork.SaveChanges();
                millingChargeId = millingCharge.MillingChargeId;
                return millingChargeId;
            }

            else
            {
                var result = this.UnitOfWork.Get<MillingCharge>().AsQueryable()
                    .FirstOrDefault(e => e.MillingChargeId == millingChargeDTO.MillingChargeId);
                if (result != null)
                {
                   
                    result.Amount = millingChargeDTO.Amount;

                    result.Quantity = millingChargeDTO.Quantity;
                    
                    result.Notes = millingChargeDTO.Notes;

                    result.BranchId = millingChargeDTO.BranchId;

                    result.TimeStamp = DateTime.Now;
                    result.Deleted = millingChargeDTO.Deleted;
                    result.DeletedBy = millingChargeDTO.DeletedBy;
                    result.DeletedOn = millingChargeDTO.DeletedOn;
                    
                    this.UnitOfWork.Get<MillingCharge>().Update(result);
                    this.UnitOfWork.SaveChanges();
                }
                return millingChargeDTO.MillingChargeId;
            }
        }

        public void MarkAsDeleted(long pettyCashId, string userId, long branchId)
        {


            //using (var dbContext = new MbaleEntities())
            //{
            //    //TODO: THROW NOT IMPLEMENTED EXCEPTION
            //    dbContext.Mark_Cash_AsDeleted(pettyCashId, userId, branchId);
            //}

        }

    }
}
