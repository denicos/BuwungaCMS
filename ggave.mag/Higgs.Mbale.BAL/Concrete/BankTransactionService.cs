using System;
using System.Collections.Generic;
using Higgs.Mbale.BAL.Interface;
using Higgs.Mbale.DAL.Interface;
using Higgs.Mbale.Models;



namespace Higgs.Mbale.BAL.Concrete
{
  public  class BankTransactionService : IBankTransactionService
    {
        private IBankTransactionDataService _dataService;
        private IUserService _userService;


        public BankTransactionService(IBankTransactionDataService dataService, IUserService userService)
        {
            this._dataService = dataService;
            this._userService = userService;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="BankTransactionId"></param>
        /// <returns></returns>
        public BankTransaction GetBankTransaction(long bankTransactionId)
        {
            var result = this._dataService.GetBankTransaction(bankTransactionId);
            return MapEFToModel(result);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IEnumerable<BankTransaction> GetAllBankTransactions()
        {
            var results = this._dataService.GetAllBankTransactions();
            return MapEFToModel(results);
        }

        public IEnumerable<BankTransaction> GetLatestTwentyBankTransactionsForAParticularBranchAndBank(long branchId, long bankId)
        {
            var results = this._dataService.GetLatestTwentyBankTransactionsForAParticularBranchAndBank(branchId, bankId);
            return MapEFToModel(results);
        }

        private double GetBalanceForLastBankTransaction(long bankId,long branchId)
        {
            double balance = 0;

           
            if (bankId != 0 && branchId != 0)
            {
                var result = this._dataService.GetLatestBankTransactionForAParticularBranchAndBank(bankId,branchId);
                if (result.BankTransactionId > 0)
                {
                    balance = result.Balance;
                }

                
            }
            return balance;
        }

        public long SaveBankTransaction(BankTransaction bankTransaction, string userId)
        {

            long bankTransactionId = 0;
            double startAmount = 0;
            double OldBalance = 0;
            double newBalance = 0;

            if (bankTransaction.BranchId != null)
            {
                OldBalance = GetBalanceForLastBankTransaction(bankTransaction.BankId, Convert.ToInt64(bankTransaction.BranchId));
                startAmount = OldBalance;


                if (bankTransaction.Action == "-")
                {
                    newBalance = OldBalance - bankTransaction.Amount;
                }
                else
                {
                    newBalance = OldBalance + bankTransaction.Amount;
                }

                var bankTransactionDTO = new DTO.BankTransactionDTO()
                {
                    BankTransactionId = bankTransaction.BankTransactionId,
                    Amount = bankTransaction.Amount,
                    StartAmount = startAmount,
                    Notes = bankTransaction.Notes,
                    Action = bankTransaction.Action,
                    Balance = newBalance,

                    
                    BranchId = bankTransaction.BranchId,

                    CreatedOn = bankTransaction.CreatedOn,
                    TimeStamp = bankTransaction.TimeStamp,

                    Deleted = bankTransaction.Deleted,
                    CreatedBy = bankTransaction.CreatedBy,
                    BankId = bankTransaction.BankId,
                    DeletedOn = bankTransaction.DeletedOn,


                };

                bankTransactionId = this._dataService.SaveBankTransaction(bankTransactionDTO, userId);

                return bankTransactionId;
            }
            else
            {
                return -1;
            }
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="BankTransactionId"></param>
        /// <param name="userId"></param>
        public void MarkAsDeleted(long bankTransactionId, string userId)
        {
            _dataService.MarkAsDeleted(bankTransactionId, userId);
        }


        #region Mapping Methods

        private IEnumerable<BankTransaction> MapEFToModel(IEnumerable<EF.Models.BankTransaction> data)
        {
            var list = new List<BankTransaction>();
            foreach (var result in data)
            {
                list.Add(MapEFToModel(result));
            }
            return list;
        }

        /// <summary>
        /// Maps BankTransaction EF object to BankTransaction Model Object and
        /// returns the BankTransaction model object.
        /// </summary>
        /// <param name="result">EF BankTransaction object to be mapped.</param>
        /// <returns>BankTransaction Model Object.</returns>
        public BankTransaction MapEFToModel(EF.Models.BankTransaction data)
        {
            if (data != null)
            {
                var BankTransaction = new BankTransaction()
                {
                    BankTransactionId = data.BankTransactionId,
                    Amount = data.Amount,
                    StartAmount = data.StartAmount,
                    Notes = data.Notes,
                    Action = data.Action,
                    Balance = data.Balance,

                   
                    BranchId = data.BranchId,
                    

                    BankId = data.BankId,
                    CreatedOn = data.CreatedOn,
                    TimeStamp = data.TimeStamp,

                    Deleted = data.Deleted,
                    CreatedBy = _userService.GetUserFullName(data.AspNetUser),

                    BranchName = data.Branch != null ? data.Branch.Name : "",
                    
                    BankName = data.Bank != null ? data.Bank.Name : "",

                };
                return BankTransaction;
            }
            return null;
        }



        #endregion
    }
}
