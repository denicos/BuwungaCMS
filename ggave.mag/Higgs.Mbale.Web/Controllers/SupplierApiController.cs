using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Higgs.Mbale.BAL.Interface;
using log4net;
using Higgs.Mbale.Models;
using Higgs.Mbale.Models.WebViewModel;

namespace Higgs.Mbale.Web.Controllers
{
    public class SupplierApiController : ApiController
    {
        private IUserService _userService;
       
        ILog logger = log4net.LogManager.GetLogger(typeof(SupplierApiController));
        private string userId = string.Empty;

        public SupplierApiController()
        {
        }

        public SupplierApiController(IUserService userService)
        {
            this._userService = userService;
            
            userId = Microsoft.AspNet.Identity.IdentityExtensions.GetUserId(RequestContext.Principal.Identity);
        }

        [HttpGet]
        [ActionName("GetAllSuppliers")]
        public IEnumerable<AspNetUserViewModel> GetAllSuppliers()
        {
            return _userService.GetAllSuppliers();
        }


        [HttpGet]
        [ActionName("GetAllSuppliersForAparticularBranch")]
        public IEnumerable<AspNetUserViewModel> GetAllSuppliersForAparticularBranch(long branchId)
        {
            return _userService.GetAllSuppliersForAParticularBranch(branchId);
        }
    }
}
