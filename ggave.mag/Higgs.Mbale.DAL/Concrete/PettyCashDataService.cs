using System;
using System.Collections.Generic;
using System.Linq;
using Higgs.Mbale.EF.Models;
using Higgs.Mbale.DAL.Interface;
using Higgs.Mbale.EF.UnitOfWork;
using Higgs.Mbale.DTO;

namespace Higgs.Mbale.DAL.Concrete
{
   public class PettyCashDataService : DataServiceBase,IPettyCashDataService
    {
        public PettyCashDataService(IUnitOfWork<MbaleEntities> unitOfWork)
           : base(unitOfWork)
        {

        }

        public IEnumerable<PettyCash> GetAllPettyCashs()
        {
            return this.UnitOfWork.Get<PettyCash>().AsQueryable().Where(e => e.Deleted == false);
        }

        public PettyCash GetPettyCash(long pettyCashId)
        {
            return this.UnitOfWork.Get<PettyCash>().AsQueryable()
                 .FirstOrDefault(c =>
                    c.PettyCashId == pettyCashId &&
                    c.Deleted == false
                );
        }

        public IEnumerable<PettyCash> GetAllPettyCashForAParticularBranch(long branchId)
        {

            return this.UnitOfWork.Get<PettyCash>().AsQueryable().Where(e => e.Deleted == false && e.BranchId == branchId);
        }

        public IEnumerable<PettyCash> GetTwentyLatestPettyCashForAParticularBranch(long branchId)
        {

            return this.UnitOfWork.Get<PettyCash>().AsQueryable().Where(e => e.Deleted == false && e.BranchId == branchId).OrderByDescending(e => e.PettyCashId).Take(20);
        }

        public PettyCash GetLatestPettyCashForAParticularBranch(long branchId)
        {

            PettyCash cash = new PettyCash();
            var cashActivities = this.UnitOfWork.Get<PettyCash>().AsQueryable().Where(e => e.BranchId == branchId).OrderByDescending(e => e.PettyCashId).First();
            
                return cash;
            
        }


        public long SavePettyCash(PettyCashDTO pettyCashDTO, string userId)
        {
            long pettyCashId = 0;

            if (pettyCashDTO.PettyCashId == 0)
            {

                var pettyCash = new PettyCash()
                {

                    Amount = pettyCashDTO.Amount,
                    StartAmount = pettyCashDTO.StartAmount,
                    Notes = pettyCashDTO.Notes,
                    Action = pettyCashDTO.Action,
                    Balance = pettyCashDTO.Balance,
                    BranchId = pettyCashDTO.BranchId,
                    CreatedOn = DateTime.Now,
                    TimeStamp = DateTime.Now,
                    CreatedBy = userId,
                    Deleted = false,
                    RequistionCategoryId = pettyCashDTO.RequistionCategoryId,

                };

                this.UnitOfWork.Get<PettyCash>().AddNew(pettyCash);
                this.UnitOfWork.SaveChanges();
                pettyCashId = pettyCash.PettyCashId;
                return pettyCashId;
            }

            else
            {
                var result = this.UnitOfWork.Get<PettyCash>().AsQueryable()
                    .FirstOrDefault(e => e.PettyCashId == pettyCashDTO.PettyCashId);
                if (result != null)
                {
                    result.Action = pettyCashDTO.Action;
                    result.Amount = pettyCashDTO.Amount;

                    result.StartAmount = pettyCashDTO.StartAmount;
                    result.Balance = pettyCashDTO.Balance;
                    result.Notes = pettyCashDTO.Notes;
                    
                    result.BranchId = pettyCashDTO.BranchId;
                    
                    result.TimeStamp = DateTime.Now;
                    result.Deleted = pettyCashDTO.Deleted;
                    result.DeletedBy = pettyCashDTO.DeletedBy;
                    result.DeletedOn = pettyCashDTO.DeletedOn;
                    result.RequistionCategoryId = pettyCashDTO.RequistionCategoryId;

                    this.UnitOfWork.Get<PettyCash>().Update(result);
                    this.UnitOfWork.SaveChanges();
                }
                return pettyCashDTO.PettyCashId;
            }
        }

        //public void MarkAsDeleted(long pettyCashId, string userId, long branchId)
        //{


        //    //using (var dbContext = new MbaleEntities())
        //    //{
        //    //    //TODO: THROW NOT IMPLEMENTED EXCEPTION
        //    //    dbContext.Mark_Cash_AsDeleted(pettyCashId, userId, branchId);
        //    //}

        //}


        
    }
}
