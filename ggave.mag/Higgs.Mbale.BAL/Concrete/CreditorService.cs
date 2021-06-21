using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Higgs.Mbale.DTO;
using Higgs.Mbale.BAL.Interface;
using Higgs.Mbale.DAL.Interface;
using Higgs.Mbale.Models;
using Higgs.Mbale.Helpers;


namespace Higgs.Mbale.BAL.Concrete
{
  public  class CreditorService : ICreditorService
    {
      
        private IUserService _userService;
       
        private IAccountTransactionActivityService _accountTransactionActivityService;
        private IUtilityAccountService _utilityAccountService;
        private IBranchService _branchService;
       

        

        public CreditorService(IUserService userService,             
            IAccountTransactionActivityService accountTransactionActivityService,
            IUtilityAccountService utilityAccountService,IBranchService branchService)
        {
            
            this._userService = userService;
            this._accountTransactionActivityService = accountTransactionActivityService;
            this._utilityAccountService = utilityAccountService;
            this._branchService = branchService;
            
        }

        


      public IEnumerable<CreditorView> GetCreditorView()
      {
          List<CreditorView> creditorList = new List<CreditorView>();
        var suppliers =  _userService.GetAllSuppliers();
            var outsourcers = _userService.GetAllOutSourcers();
            var utilityCategories = _utilityAccountService.GetAllUtilityCategories();
            var branches = _branchService.GetAllBranches();
            foreach (var branch in branches)
            {
                foreach (var utilityCategory in utilityCategories)
                {
                    var result = _utilityAccountService.GetBalanceForLastUtilityAccount(branch.BranchId, utilityCategory.UtilityCategoryId);
                    if (result > 0)
                    {
                        var creditorView = new CreditorView()
                        {
                            //Id = utilityCategory.UtilityCategoryId,
                            Amount = result,
                            CreditorName = utilityCategory.Name,
                             BranchName = branch.Name,
                            

                        };
                        creditorList.Add(creditorView);
                    }

                   
                }
            }
        if (suppliers != null)
        {
            if (suppliers.Any())
            {
                foreach (var supplier in suppliers)
                {
                    var balance = _accountTransactionActivityService.GetBalanceForLastAccountAccountTransactionActivityForSupplier(supplier.Id);
                  
                    if (balance > 0)
                    {
                        var creditorView = new CreditorView()
                        {
                            Id = supplier.Id,
                            Amount = balance,
                            CreditorName = supplier.FirstName + ' ' + supplier.LastName,
                            CreditorNumber = supplier.UniqueNumber,

                        };
                        creditorList.Add(creditorView);
                    }
                   
                }
            }
        }
            if (outsourcers != null)
            {
                if (outsourcers.Any())
                {
                    foreach (var outsourcer in outsourcers)
                    {
                        var balance = _accountTransactionActivityService.GetBalanceForLastAccountAccountTransactionActivityForSupplier(outsourcer.Id);

                        if (balance > 0)
                        {
                            var creditorView = new CreditorView()
                            {
                                Id = outsourcer.Id,
                                Amount = balance,
                                CreditorName = outsourcer.FirstName + ' ' + outsourcer.LastName,
                               // CreditorNumber = supplier.UniqueNumber,

                            };
                            creditorList.Add(creditorView);
                        }

                    }
                }
            }
            return creditorList;
      }

        public IEnumerable<CreditorView> GetCreditorViewForAParticularDate(DateTime dateTime)
        {
            List<CreditorView> creditorList = new List<CreditorView>();
            var suppliers = _userService.GetAllSuppliers();
            var outsourcers = _userService.GetAllOutSourcers();
            var utilityCategories = _utilityAccountService.GetAllUtilityCategories();
            var branches = _branchService.GetAllBranches();
            foreach (var branch in branches)
            {
                foreach (var utilityCategory in utilityCategories)
                {
                    var result = _utilityAccountService.GetBalanceForLastUtilityAccountForAParticularDate(branch.BranchId, utilityCategory.UtilityCategoryId,dateTime);
                    if (result > 0)
                    {
                        var creditorView = new CreditorView()
                        {
                            //Id = utilityCategory.UtilityCategoryId,
                            Amount = result,
                            CreditorName = utilityCategory.Name,
                            BranchName = branch.Name,


                        };
                        creditorList.Add(creditorView);
                    }


                }
            }
            if (suppliers != null)
            {
                if (suppliers.Any())
                {
                    foreach (var supplier in suppliers)
                    {
                        var balance = _accountTransactionActivityService.GetBalanceForLastAccountAccountTransactionActivityForSupplierForAParticularDate(supplier.Id,dateTime);

                        if (balance > 0)
                        {
                            var creditorView = new CreditorView()
                            {
                                Id = supplier.Id,
                                Amount = balance,
                                CreditorName = supplier.FirstName + ' ' + supplier.LastName,
                                CreditorNumber = supplier.UniqueNumber,

                            };
                            creditorList.Add(creditorView);
                        }

                    }
                }
            }
            if (outsourcers != null)
            {
                if (outsourcers.Any())
                {
                    foreach (var outsourcer in outsourcers)
                    {
                        var balance = _accountTransactionActivityService.GetBalanceForLastAccountAccountTransactionActivityForSupplierForAParticularDate(outsourcer.Id, dateTime);

                        if (balance > 0)
                        {
                            var creditorView = new CreditorView()
                            {
                                Id = outsourcer.Id,
                                Amount = balance,
                                CreditorName = outsourcer.FirstName + ' ' + outsourcer.LastName,
                                
                            };
                            creditorList.Add(creditorView);
                        }

                    }
                }
            }
            return creditorList;
        }

     
      
        #region Mapping Methods

        private IEnumerable<Creditor> MapEFToModel(IEnumerable<EF.Models.Creditor> data)
        {
            var list = new List<Creditor>();
            foreach (var result in data)
            {
                list.Add(MapEFToModel(result));
            }
            return list;
        }

        /// <summary>
        /// Maps Creditor EF object to Creditor Model Object and
        /// returns the Creditor model object.
        /// </summary>
        /// <param name="result">EF Creditor object to be mapped.</param>
        /// <returns>Creditor Model Object.</returns>
        public Creditor MapEFToModel(EF.Models.Creditor data)
        {
            var accountName = string.Empty;
            var accountUniqueNumber = string.Empty;

            if (data != null)
            {

                if (data.CasualWorkerId != null)
                {
                    accountName = (data.CasualWorker.FirstName + " " + data.CasualWorker.LastName);
                }
                else if (data.AspNetUserId != null)
                {
                    accountName = _userService.GetUserFullName(data.AspNetUser);
                    accountUniqueNumber = data.AspNetUser.UniqueNumber;
                }
                var creditor = new Creditor()
                {

                    BranchName = data.Branch != null ? data.Branch.Name : "",
                    SectorName = data.Sector != null ? data.Sector.Name : "",
                    AccountName = accountName,
                    AccountUniqueNumber = accountUniqueNumber,
                    BranchId = data.BranchId,
                    AspNetUserId = data.AspNetUserId,
                    CasualWorkerId = data.CasualWorkerId,
                    Action = data.Action,
                    SectorId = data.SectorId,
                    Amount = data.Amount,
                    CreditorId = data.CreditorId,
                    CreatedOn = data.CreatedOn,
                    TimeStamp = data.TimeStamp,
                    Deleted = data.Deleted,
                    CreatedBy = _userService.GetUserFullName(data.AspNetUser),
                    UpdatedBy = _userService.GetUserFullName(data.AspNetUser1),

                };
                return creditor;
            }
            return null;
        }



       #endregion
    }
}
