using System.Collections.Generic;
using System.Web.Http;
using Higgs.Mbale.BAL.Interface;
using log4net;
using Higgs.Mbale.Models;

namespace Higgs.Mbale.Branch.Controllers
{
    public class MillingChargeApiController : ApiController
    {
        private IMillingChargeService _millingChargeService;
        private IUserService _userService;
        ILog logger = log4net.LogManager.GetLogger(typeof(MillingChargeApiController));
        private string userId = string.Empty;
        long branchId = 0;

        public MillingChargeApiController()
        {
        }

        public MillingChargeApiController(IMillingChargeService millingChargeService, IUserService userService)
        {
            this._millingChargeService = millingChargeService;
            this._userService = userService;
            userId = Microsoft.AspNet.Identity.IdentityExtensions.GetUserId(RequestContext.Principal.Identity);
            branchId = _userService.GetLoggedUserBranchId(userId);
        }



        [HttpGet]
        [ActionName("GetMillingCharge")]
        public MillingCharge GetMillingCharge(long millingChargeId)
        {
            return _millingChargeService.GetMillingCharge(millingChargeId);
        }



        [HttpGet]
        [ActionName("GetAllMillingChargeForAParticularBranch")]
        public IEnumerable<MillingCharge> GetAllMillingChargeForAParticularBranch()
        {
            return _millingChargeService.GetTwentyLatestMillingChargesForAParticularBranch(branchId);
        }



        //[HttpGet]
        //[ActionName("Delete")]
        //public void DeleteCash(long cashId, long branchId)
        //{
        //    _cashService.MarkAsDeleted(cashId, userId, branchId);
        //}



        [HttpPost]
        [ActionName("Save")]
        public long Save(MillingCharge model)
        {

            model.BranchId = branchId;
            var millingChargeId = _millingChargeService.SaveMillingCharge(model, userId);
            return millingChargeId;
        }



    }
}
