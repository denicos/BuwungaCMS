using System;
using System.Collections.Generic;
using System.Web.Http;
using Higgs.Mbale.BAL.Interface;
using log4net;
using Higgs.Mbale.Models;
using Higgs.Mbale.Models.WebViewModel;

namespace Higgs.Mbale.Branch.Controllers
{
    public class SupplierApiController : ApiController
    {
        private IUserService _userService;
       
        ILog logger = log4net.LogManager.GetLogger(typeof(SupplierApiController));
        private string userId = string.Empty;
        long branchId = 0;
        public SupplierApiController()
        {
        }

        public SupplierApiController(IUserService userService)
        {
            this._userService = userService;
            
            userId = Microsoft.AspNet.Identity.IdentityExtensions.GetUserId(RequestContext.Principal.Identity);
            branchId = _userService.GetLoggedUserBranchId(userId);
        }

        [HttpGet]
        [ActionName("GetAllSuppliers")]
        public IEnumerable<AspNetUserViewModel> GetAllSuppliers()
        {
            // return _userService.GetAllSuppliers();
            return _userService.GetAllSuppliersForAParticularBranch(branchId);
        }
    }
}
