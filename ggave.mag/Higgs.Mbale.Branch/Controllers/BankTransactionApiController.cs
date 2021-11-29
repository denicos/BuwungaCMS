using System.Collections.Generic;
using System.Web.Http;
using Higgs.Mbale.BAL.Interface;
using Higgs.Mbale.Models;

namespace Higgs.Mbale.Branch.Controllers
{
    public class BankTransactionApiController : ApiController
    {
        private IBankTransactionService _bankTransactionService;
        private IUserService _userService;
        private IBankService _bankService;
        long branchId = 0;

        private string userId = string.Empty;

        public BankTransactionApiController()
        {
        }

        public BankTransactionApiController(IBankTransactionService bankTransactionService, IUserService userService,IBankService bankService)
        {
            this._bankTransactionService = bankTransactionService;
            this._bankService = bankService;
            this._userService = userService;
            userId = Microsoft.AspNet.Identity.IdentityExtensions.GetUserId(RequestContext.Principal.Identity);
            branchId = _userService.GetLoggedUserBranchId(userId);
        }

        [HttpGet]
        [ActionName("GetBankTransaction")]
        public BankTransaction GetBankTransaction(long bankTransactionId)
        {
            return _bankTransactionService.GetBankTransaction(bankTransactionId);
        }

        [HttpGet]
        [ActionName("GetBankParticularBranch")]
        public Bank GetBankParticularBranch()
        {
            return _bankService.GetBankParticularBranch(branchId);
        }

        [HttpGet]
        [ActionName("GetLatestTwentyBankTransactionsForAParticularBranchAndBank")]
        public IEnumerable<BankTransaction> GetLatestTwentyBankTransactionsForAParticularBranchAndBank()
        {
            var bank = _bankService.GetBankParticularBranch(branchId);
            long bankId = bank.BankId;
            return _bankTransactionService.GetLatestTwentyBankTransactionsForAParticularBranchAndBank(branchId, bankId);
        }


        [HttpGet]
        [ActionName("Delete")]
        public void DeleteBankTransaction(long bankTransactionId)
        {
            _bankTransactionService.MarkAsDeleted(bankTransactionId, userId);
        }



        [HttpPost]
        [ActionName("Save")]
        public long Save(BankTransaction model)
        {
            var bank = _bankService.GetBankParticularBranch(branchId);
            model.BankId = bank.BankId;
            model.BranchId = branchId;
            var bankTransactionId = _bankTransactionService.SaveBankTransaction(model, userId);
            return bankTransactionId;
        }
    }
}
