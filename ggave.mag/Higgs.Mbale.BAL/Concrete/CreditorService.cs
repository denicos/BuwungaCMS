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
       
        

        public CreditorService(IUserService userService,             
            IAccountTransactionActivityService accountTransactionActivityService,
            IUtilityAccountService utilityAccountService)
        {
            
            this._userService = userService;
            this._accountTransactionActivityService = accountTransactionActivityService;
            this._utilityAccountService = utilityAccountService;
           
            
        }

        


      public IEnumerable<CreditorView> GetCreditorView()
      {
          List<CreditorView> creditorList = new List<CreditorView>();
        var suppliers =  _userService.GetAllSuppliers();
           
           
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
            
            return creditorList;
      }

        public IEnumerable<CreditorView> GetCreditorViewForAParticularDate(DateTime dateTime)
        {
            List<CreditorView> creditorList = new List<CreditorView>();
            var suppliers = _userService.GetAllSuppliers();
           
          
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
            
            return creditorList;
        }

        public IEnumerable<CreditorView> GetCreditorViewForAParticularDateForBranch(DateTime dateTime,long branchId)
        {
            List<CreditorView> creditorList = new List<CreditorView>();
            var suppliers = _userService.GetAllSuppliersForAParticularBranch(branchId);
           
           
            if (suppliers != null)
            {
                if (suppliers.Any())
                {
                    foreach (var supplier in suppliers)
                    {
                        var balance = _accountTransactionActivityService.GetBalanceForLastAccountAccountTransactionActivityForSupplierForAParticularDate(supplier.Id, dateTime);

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

            return creditorList;
        }



    }
}
