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
 public   class DebtorService : IDebtorService
    {
         
        
        private IUserService _userService;
      
        private IAccountTransactionActivityService _accountTransactionActivityService;
        private IUtilityAccountService _utilityAccountService;
        private IBranchService _branchService;

        

        public DebtorService(IUserService userService, IAccountTransactionActivityService accountTransactionActivityService,
            IUtilityAccountService utilityAccountService,IBranchService branchService)
        {
            
            this._userService = userService;
         
            this._accountTransactionActivityService = accountTransactionActivityService;
            this._branchService = branchService;
            this._utilityAccountService = utilityAccountService;
            
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="DebtorId"></param>
        /// <returns></returns>
       
      

       public IEnumerable<DebtorView> GetDebtorView()
       {
           List<DebtorView> debtorList = new List<DebtorView>();
           var customers = _userService.GetAllCustomers();
         
            if (customers != null)
           {
               if (customers.Any())
               {
                   foreach (var customer in customers)
                   {
                       var balance = _accountTransactionActivityService.GetBalanceForLastAccountAccountTransactionActivityForSupplier(customer.Id);

                       if (balance < 0)
                       {
                            
                                var debtorView = new DebtorView()
                                {
                                    Id = customer.Id,
                                    Amount = balance * -1,
                                    DebtorName = customer.FirstName + ' ' + customer.LastName,
                                   //BranchName = supplier.UniqueNumber,

                                };
                                debtorList.Add(debtorView);
                            
                          
                       }

                   }
               }
           }
           return debtorList;
       }

        public IEnumerable<DebtorView> GetDebtorViewForAParticularDate(DateTime dateTime)
        {
            List<DebtorView> debtorList = new List<DebtorView>();
            var customers = _userService.GetAllCustomers();

            var utilityCategories = _utilityAccountService.GetAllUtilityCategories();
            var branches = _branchService.GetAllBranches();
            foreach (var branch in branches)
            {
                foreach (var utilityCategory in utilityCategories)
                {
                    var result = _utilityAccountService.GetBalanceForLastUtilityAccount(branch.BranchId, utilityCategory.UtilityCategoryId);
                    if (result < 0)
                    {
                        var debtorView = new DebtorView()
                        {

                            Amount = result * -1,
                            DebtorName = utilityCategory.Name,
                            BranchName = branch.Name,


                        };
                        debtorList.Add(debtorView);
                    }


                }
            }
            if (customers != null)
            {
                if (customers.Any())
                {
                    foreach (var customer in customers)
                    {
                        var balance = _accountTransactionActivityService.GetBalanceForLastAccountAccountTransactionActivityForSupplierForAParticularDate(customer.Id,dateTime);

                        if (balance < 0)
                        {
                            var debtorView = new DebtorView()
                            {
                                Id = customer.Id,
                                Amount = balance * -1,
                                DebtorName = customer.FirstName + ' ' + customer.LastName,
                                //CreditorNumber = supplier.UniqueNumber,

                            };
                            debtorList.Add(debtorView);
                        }

                    }
                }
            }
            return debtorList;
        }

        public IEnumerable<DebtorView> GenerateDebtorReportForAParticularDateForBranch(DateTime dateTime,long branchId)
        {
            List<DebtorView> debtorList = new List<DebtorView>();
            var customers = _userService.GetAllCustomersForAParticularBranch(branchId);
            var branchName = string.Empty;
            if (branchId != 0)
            {
                var branch = _branchService.GetBranch(branchId);
                branchName = branch.Name;
            }

            if (customers != null)
            {
                if (customers.Any())
                {
                    foreach (var customer in customers)
                    {
                        var balance = _accountTransactionActivityService.GetBalanceForLastAccountAccountTransactionActivityForSupplierForAParticularDate(customer.Id, dateTime);

                        if (balance < 0)
                        {
                            var debtorView = new DebtorView()
                            {
                                Id = customer.Id,
                                Amount = balance * -1,
                                DebtorName = customer.FirstName + ' ' + customer.LastName,
                                BranchName = branchName,
                                
                            };
                            debtorList.Add(debtorView);
                        }

                    }
                }
            }
            return debtorList;
        }

        public IEnumerable<DebtorView> GetAdvancePaymentView()
       {
           List<DebtorView> advancePaymentList = new List<DebtorView>();
       
           var customers = _userService.GetAllCustomers();
           if (customers != null)
           {
               if (customers.Any())
               {
                   foreach (var customer in customers)
                   {
                       var balance = _accountTransactionActivityService.GetBalanceForLastAccountAccountTransactionActivityForSupplier(customer.Id);

                       if (balance > 0)
                       {
                           var debtorView = new DebtorView()
                           {
                               Id = customer.Id,
                               Amount = balance,
                               DebtorName = customer.FirstName + ' ' + customer.LastName,
                               
                           };
                           advancePaymentList.Add(debtorView);
                       }

                   }
               }
           }
           return advancePaymentList;
       }

        public IEnumerable<DebtorView> GetAdvancePaymentViewForBranch(long branchId)
        {
            List<DebtorView> advancePaymentList = new List<DebtorView>();
            var branchName = string.Empty;
            if (branchId != 0)
            {
                var branch = _branchService.GetBranch(branchId);
                branchName = branch.Name;
            }
            var customers = _userService.GetAllCustomersForAParticularBranch(branchId);
            if (customers != null)
            {
                if (customers.Any())
                {
                    foreach (var customer in customers)
                    {
                        var balance = _accountTransactionActivityService.GetBalanceForLastAccountAccountTransactionActivityForSupplier(customer.Id);

                        if (balance > 0)
                        {
                            var debtorView = new DebtorView()
                            {
                                Id = customer.Id,
                                Amount = balance,
                                DebtorName = customer.FirstName + ' ' + customer.LastName,
                                BranchName = branchName,

                            };
                            advancePaymentList.Add(debtorView);
                        }

                    }
                }
            }
            return advancePaymentList;
        }

        public IEnumerable<DebtorView> GetAdvancePaymentViewForAParticularDate(DateTime dateTime)
        {
            List<DebtorView> advancePaymentList = new List<DebtorView>();

            var customers = _userService.GetAllCustomers();
            if (customers != null)
            {
                if (customers.Any())
                {
                    foreach (var customer in customers)
                    {
                        var balance = _accountTransactionActivityService.GetBalanceForLastAccountAccountTransactionActivityForSupplierForAParticularDate(customer.Id,dateTime);

                        if (balance > 0)
                        {
                            var debtorView = new DebtorView()
                            {
                                Id = customer.Id,
                                Amount = balance,
                                DebtorName = customer.FirstName + ' ' + customer.LastName,

                            };
                            advancePaymentList.Add(debtorView);
                        }

                    }
                }
            }
            return advancePaymentList;
        }

        public IEnumerable<DebtorView> GetAdvancePaymentViewForAParticularDateForBranch(DateTime dateTime,long branchId)
        {
            List<DebtorView> advancePaymentList = new List<DebtorView>();
            var branchName = string.Empty;
            if(branchId != 0 )
            {
                var branch = _branchService.GetBranch(branchId);
                branchName = branch.Name;
            }

            var customers = _userService.GetAllCustomersForAParticularBranch(branchId);
            if (customers != null)
            {
                if (customers.Any())
                {
                    foreach (var customer in customers)
                    {
                        var balance = _accountTransactionActivityService.GetBalanceForLastAccountAccountTransactionActivityForSupplierForAParticularDate(customer.Id, dateTime);

                        if (balance > 0)
                        {
                            var debtorView = new DebtorView()
                            {
                                Id = customer.Id,
                                Amount = balance,
                                DebtorName = customer.FirstName + ' ' + customer.LastName,
                                BranchName = branchName,

                            };
                            advancePaymentList.Add(debtorView);
                        }

                    }
                }
            }
            return advancePaymentList;
        }





     
    }
}
