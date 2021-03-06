using System.Collections.Generic;
using System.Web.Http;
using Higgs.Mbale.BAL.Interface;
using log4net;
using Higgs.Mbale.Models;

namespace Higgs.Mbale.Web.Controllers
{
    public class AccountTransactionActivityApiController : ApiController
    {
        private IAccountTransactionActivityService _accountTransactionActivityService;
            private IUserService _userService;
            ILog logger = log4net.LogManager.GetLogger(typeof(AccountTransactionActivityApiController));
            private string userId = string.Empty;

            public AccountTransactionActivityApiController()
            {
            }

            public AccountTransactionActivityApiController(IAccountTransactionActivityService accountTransactionActivityService, IUserService userService)
            {
                this._accountTransactionActivityService = accountTransactionActivityService;
                this._userService = userService;
                userId = Microsoft.AspNet.Identity.IdentityExtensions.GetUserId(RequestContext.Principal.Identity);
            }


            
            [HttpGet]
            [ActionName("GetAccountTransactionActivity")]
            public AccountTransactionActivity GetAccountTransactionActivity(long transactionActivityId)
            {
                return _accountTransactionActivityService.GetAccountTransactionActivity(transactionActivityId);
            }

            [HttpGet]
            [ActionName("GetAllAccountTransactionActivities")]
            public IEnumerable<AccountTransactionActivity> GetAllAccountTransactionActivities()
            {
                return _accountTransactionActivityService.GetAllAccountTransactionActivities();
            }

            [HttpGet]
            [ActionName("GetAllAccountTransactionActivitiesForAParticularAccount")]
            public IEnumerable<AccountTransactionActivity> GetAllAccountTransactionActivitiesForAParticularAccount(string accountId)
            {
                return _accountTransactionActivityService.GetLatestFortyAccountTransactionActivitiesForAParticularAccount(accountId);
            }
          
          

            [HttpGet]
            [ActionName("Delete")]
            public void DeleteAccountTransactionActivity(long accountTransactionActivityId)
            {
                _accountTransactionActivityService.MarkAsDeleted(accountTransactionActivityId, userId);
            }

            [HttpPost]
            [ActionName("SaveAdvancedPayment")]
            public long SaveAdvancedPayment(AccountTransactionActivity model)
            {

                var accountTransactionActivityId = _accountTransactionActivityService.SaveAccountTransactionActivity(model, userId);
                return accountTransactionActivityId;
            }
           
            [HttpGet]
            [ActionName("GetAllAdvancedPaymentsForAParticularAspNetUser")]
            public IEnumerable<AccountTransactionActivity> GetAllAdvancedPaymentsForAParticularAspNetUser(string accountId, long transactionSubTypeId)
            {
               return _accountTransactionActivityService.GetAllAdvancedPaymentsForAParticularAspNetUser(accountId,transactionSubTypeId);
            }

           

            [HttpPost]
            [ActionName("Save")]
            public long Save(AccountTransactionActivity model)
            {

                var accountTransactionActivityId = _accountTransactionActivityService.SaveAccountTransactionActivity(model, userId);
                return accountTransactionActivityId;
            }

            [HttpGet]
            [ActionName("GetAllPaymentModes")]
            public IEnumerable<PaymentMode> GetAllPaymentModes()
            {
                return _accountTransactionActivityService.GetAllPaymentModes();
            }

           
    }
}
