using System.Collections.Generic;
using System.Web.Http;
using Higgs.Mbale.BAL.Interface;
using log4net;
using Higgs.Mbale.Models;

namespace Higgs.Mbale.Web.Controllers
{
    public class PettyCashApiController : ApiController
    {
        private IPettyCashService _pettyCashService;
        private IUserService _userService;
        ILog logger = log4net.LogManager.GetLogger(typeof(PettyCashApiController));
        private string userId = string.Empty;

        public PettyCashApiController()
        {
        }

        public PettyCashApiController(IPettyCashService pettyCashService, IUserService userService)
        {
            this._pettyCashService = pettyCashService;
            this._userService = userService;
            userId = Microsoft.AspNet.Identity.IdentityExtensions.GetUserId(RequestContext.Principal.Identity);
        }



        [HttpGet]
        [ActionName("GetPettyCash")]
        public PettyCash GetPettyCash(long pettyCashId)
        {
            return _pettyCashService.GetPettyCash(pettyCashId);
        }

        [HttpGet]
        [ActionName("GetAllPettyCash")]
        public IEnumerable<PettyCash> GetAllPettyCash()
        {
            return _pettyCashService.GetAllPettyCash();
        }

        [HttpGet]
        [ActionName("GetAllPettyCashForAParticularBranch")]
        public IEnumerable<PettyCash> GetAllPettyCashForAParticularBranch(long branchId)
        {
            return _pettyCashService.GetTwentyLatestPettyCashForAParticularBranch(branchId);
        }



        //[HttpGet]
        //[ActionName("Delete")]
        //public void DeletePettyCash(long pettyCashId, long branchId)
        //{
        //    _pettyCashService.MarkAsDeleted(pettyCashId, userId, branchId);
        //}



        [HttpPost]
        [ActionName("Save")]
        public long Save(PettyCash model)
        {
            //if (model.BranchId == null || model.BranchId == 0)
            //{
            //     _cashService.SaveApplicationCash(model, userId);
            //}
            var pettyCashId = _pettyCashService.SavePettyCash(model, userId);
            return pettyCashId;
        }


    }
}
