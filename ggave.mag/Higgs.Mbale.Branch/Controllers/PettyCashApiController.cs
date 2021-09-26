using System.Collections.Generic;
using System.Web.Http;
using Higgs.Mbale.BAL.Interface;
using log4net;
using Higgs.Mbale.Models;

namespace Higgs.Mbale.Branch.Controllers
{
    public class PettyCashApiController : ApiController
    {
        
        private IPettyCashService _pettyCashService;
        private IUserService _userService;
        ILog logger = log4net.LogManager.GetLogger(typeof(CashApiController));
        private string userId = string.Empty;
        long branchId = 0;

        public PettyCashApiController()
        {
        }

        public PettyCashApiController(IPettyCashService pettyCashService, IUserService userService)
        {
            this._pettyCashService = pettyCashService;
            this._userService = userService;
            userId = Microsoft.AspNet.Identity.IdentityExtensions.GetUserId(RequestContext.Principal.Identity);
            branchId = _userService.GetLoggedUserBranchId(userId);
        }



        [HttpGet]
        [ActionName("GetPettyCash")]
        public PettyCash GetPettyCash(long pettyCashId)
        {
            return _pettyCashService.GetPettyCash(pettyCashId);
        }



        [HttpGet]
        [ActionName("GetAllPettyCashForAParticularBranch")]
        public IEnumerable<PettyCash> GetAllPettyCashForAParticularBranch()
        {
            return _pettyCashService.GetTwentyLatestPettyCashForAParticularBranch(branchId);
        }



        //[HttpGet]
        //[ActionName("Delete")]
        //public void DeleteCash(long cashId, long branchId)
        //{
        //    _cashService.MarkAsDeleted(cashId, userId, branchId);
        //}



        [HttpPost]
        [ActionName("Save")]
        public long Save(PettyCash model)
        {

            model.BranchId = branchId;
            var pettyCashId = _pettyCashService.SavePettyCash(model, userId);
            return pettyCashId;
        }



    }
}
