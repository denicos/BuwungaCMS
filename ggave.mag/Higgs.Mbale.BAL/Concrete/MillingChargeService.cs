using System;
using System.Collections.Generic;
using Higgs.Mbale.BAL.Interface;
using Higgs.Mbale.DAL.Interface;
using Higgs.Mbale.Models;
using System.Configuration;

namespace Higgs.Mbale.BAL.Concrete
{
 public   class MillingChargeService : IMillingChargeService
    {
        private long transactionSubTypeId = Convert.ToInt64(ConfigurationManager.AppSettings["otherIncomeId"]);
        private long sectorId = Convert.ToInt64(ConfigurationManager.AppSettings["SectorId"]);
        private double millingChargeAmount = Convert.ToDouble(ConfigurationManager.AppSettings["millingcharge"]);
        private IMillingChargeDataService _dataService;
        private IUserService _userService;
        private ICashService _cashService;



        public MillingChargeService(IMillingChargeDataService dataService, IUserService userService,ICashService cashService)

        {
            this._dataService = dataService;
            this._userService = userService;
            this._cashService = cashService;


        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="millingChargeId"></param>
        /// <returns></returns>
        public MillingCharge GetMillingCharge(long millingChargeId)
        {
            var result = this._dataService.GetMillingCharge(millingChargeId);
            return MapEFToModel(result);
        }

        public IEnumerable<MillingCharge> GetTwentyLatestMillingChargesForAParticularBranch(long branchId)
        {
            var results = this._dataService.GetTwentyLatestMillingChargesForAParticularBranch(branchId);
            return MapEFToModel(results);
        }
        public IEnumerable<MillingCharge> GetAllMillingChargesForAParticularBranch(long branchId)
        {

            var results = this._dataService.GetAllMillingChargesForAParticularBranch(branchId);
            return MapEFToModel(results);



        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IEnumerable<MillingCharge> GetAllMillingCharges()
        {
            var results = this._dataService.GetAllMillingCharges();
            return MapEFToModel(results);
        }

              
        public long SaveMillingCharge(MillingCharge millingCharge, string userId)
        {

            long millingChargeId = 0;

            if(millingCharge.MillingChargeId == 0)
            {
                double amount = (millingCharge.Quantity * millingChargeAmount);
                var notes = "Milling Charge for  " + millingCharge.Quantity + " kgs of Maize";
                var millingChargeDTO = new DTO.MillingChargeDTO()
                {
                    MillingChargeId = millingCharge.MillingChargeId,
                    Amount = millingCharge.MillingChargeId == 0 ? amount :millingCharge.Amount ,
                    Quantity = millingCharge.Quantity,
                    Notes = notes,

                    BranchId = millingCharge.BranchId,



                };
                millingChargeId = this._dataService.SaveMillingCharge(millingChargeDTO, userId);
                if (millingChargeId != 0)
                {
                    var cash = new Cash()
                    {

                        Amount = Convert.ToDouble(millingCharge.Amount),
                        Notes = notes,
                        Action = "+",
                        BranchId = Convert.ToInt64(millingCharge.BranchId),
                        TransactionSubTypeId = transactionSubTypeId,
                        SectorId = sectorId,

                    };
                    _cashService.SaveCash(cash, userId);


                }
            }
           

            return millingChargeId;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="millingChargeId"></param>
        /// <param name="userId"></param>
        //public void MarkAsDeleted(long millingChargeId, string userId, long branchId)
        //{
        //    _dataService.MarkAsDeleted(millingChargeId, userId, branchId);
        //}


        #region Mapping Methods

        public IEnumerable<MillingCharge> MapEFToModel(IEnumerable<EF.Models.MillingCharge> data)
        {
            var list = new List<MillingCharge>();
            foreach (var result in data)
            {
                list.Add(MapEFToModel(result));
            }
            return list;
        }


        public MillingCharge MapEFToModel(EF.Models.MillingCharge data)
        {

            if (data != null)
            {

                var millingCharge = new MillingCharge()
                {

                    MillingChargeId = data.MillingChargeId,
                    
                    Quantity = data.Quantity,
                    Amount = data.Amount,
                    Notes = data.Notes,
                    BranchId = data.BranchId,
                    BranchName = data.Branch != null ? data.Branch.Name : "",
                   
                    CreatedOn = data.CreatedOn,
                    TimeStamp = data.TimeStamp,
                    Deleted = data.Deleted,
                    CreatedBy = _userService.GetUserFullName(data.AspNetUser),


                };
                return millingCharge;
            }
            return null;
        }


        #endregion
    }
}
