using System;
using System.Collections.Generic;
using Higgs.Mbale.BAL.Interface;
using Higgs.Mbale.DAL.Interface;
using Higgs.Mbale.Models;

namespace Higgs.Mbale.BAL.Concrete
{
  public  class PettyCashService : IPettyCashService
    {
        private IPettyCashDataService _dataService;
        private IUserService _userService;
   


        public PettyCashService(IPettyCashDataService dataService, IUserService userService)

        {
            this._dataService = dataService;
            this._userService = userService;
        

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="PettyCashId"></param>
        /// <returns></returns>
        public PettyCash GetPettyCash(long pettyCashId)
        {
            var result = this._dataService.GetPettyCash(pettyCashId);
            return MapEFToModel(result);
        }

        public IEnumerable<PettyCash> GetTwentyLatestPettyCashForAParticularBranch(long branchId)
        {
            var results = this._dataService.GetTwentyLatestPettyCashForAParticularBranch(branchId);
            return MapEFToModel(results);
        }
        public IEnumerable<PettyCash> GetAllPettyCashForAParticularBranch(long branchId)
        {

            var results = this._dataService.GetAllPettyCashForAParticularBranch(branchId);
            return MapEFToModel(results);



        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IEnumerable<PettyCash> GetAllPettyCash()
        {
            var results = this._dataService.GetAllPettyCashs();
            return MapEFToModel(results);
        }

        private double GetBalanceForLastPettyCash(long branchId)
        {
            double balance = 0;

            var result = this._dataService.GetLatestPettyCashForAParticularBranch(branchId);
            if (result.BranchId > 0)
            {
                balance = result.Balance;
            }

            return balance;


        }

        public long CheckIfBranchHasEnoughCash(long branchId, double amount, string action)
        {
            long cashId = 0;
            double OldBalance = 0;

            OldBalance = GetBalanceForLastPettyCash(branchId);

            if (action == "-")
            {
                if (OldBalance < amount)
                {
                    cashId = -1;
                    return cashId;
                }
                cashId = 1;
                return cashId;
            }
            else
            {
                cashId = 1;
                return cashId;
            }


        }

        public long SavePettyCash(PettyCash cash, string userId)
        {
            long cashId = 0;
            double startAmount = 0;
            double OldBalance = 0;
            double NewBalance = 0;

            if (cash.BranchId != null)
            {

                OldBalance = GetBalanceForLastPettyCash(Convert.ToInt64(cash.BranchId));
                startAmount = OldBalance;


                if (cash.Action == "-")
                {
                    if (OldBalance < cash.Amount)
                    {
                        cashId = -1;
                        return cashId;
                    }
                    NewBalance = OldBalance - cash.Amount;
                }
                else
                {
                    NewBalance = OldBalance + cash.Amount;
                }

                var cashDTO = new DTO.PettyCashDTO()
                {

                    Amount = cash.Amount,
                    StartAmount = startAmount,
                    Balance = NewBalance,
                    Notes = cash.Notes,
                    PettyCashId = cash.PettyCashId,
                    
                    Action = cash.Action,
                    BranchId = cash.BranchId,
                    
                    Deleted = cash.Deleted,
                    CreatedBy = cash.CreatedBy,
                    CreatedOn = cash.CreatedOn,
                    RequistionCategoryId = cash.RequistionCategoryId,

                };

                cashId = this._dataService.SavePettyCash(cashDTO, userId);
            }

          

            return cashId;
        }

      
        /// <summary>
        /// 
        /// </summary>
        /// <param name="cashId"></param>
        /// <param name="userId"></param>
        //public void MarkAsDeleted(long cashId, string userId, long branchId)
        //{
        //    _dataService.MarkAsDeleted(cashId, userId, branchId);
        //}


        #region Mapping Methods

        public IEnumerable<PettyCash> MapEFToModel(IEnumerable<EF.Models.PettyCash> data)
        {
            var list = new List<PettyCash>();
            foreach (var result in data)
            {
                list.Add(MapEFToModel(result));
            }
            return list;
        }


        public PettyCash MapEFToModel(EF.Models.PettyCash data)
        {
           
            if (data != null)
            {

                var cash = new PettyCash()
                {

                    Action = data.Action,
                    StartAmount = data.StartAmount,
                    Balance = data.Balance,
                    Amount = data.Amount,
                    Notes = data.Notes,
                    PettyCashId = data.PettyCashId,
                    
                    BranchId = data.BranchId,
                    BranchName = data.Branch != null ? data.Branch.Name : "",
                    RequistionCategoryId = data.RequistionCategoryId,
                    RequistionCategoryName = data.RequistionCategory != null ? data.RequistionCategory.Name : "",
                    CreatedOn = data.CreatedOn,
                    TimeStamp = data.TimeStamp,
                    Deleted = data.Deleted,
                    CreatedBy = _userService.GetUserFullName(data.AspNetUser),
                   

                };
                return cash;
            }
            return null;
        }


        #endregion
    }
}
