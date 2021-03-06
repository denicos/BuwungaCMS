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
 public   class LabourCostService : ILabourCostService
    {
        
        private ILabourCostDataService _dataService;
        private IUserService _userService;
        private IActivityService _activityService;
        

        public LabourCostService(ILabourCostDataService dataService,IUserService userService,IActivityService activityService)
        {
            this._dataService = dataService;
            this._userService = userService;
            this._activityService = activityService;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="LabourCostId"></param>
        /// <returns></returns>
        public LabourCost GetLabourCost(long labourCostId)
        {
            var result = this._dataService.GetLabourCost(labourCostId);
            return MapEFToModel(result);
        }


        public LabourCost GetBatchLabourCost(long activityId, long batchId)
        {
            var result = this._dataService.GetBatchLabourCost(activityId, batchId);
            return MapEFToModel(result);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IEnumerable<LabourCost> GetAllLabourCosts()
        {
            var results = this._dataService.GetAllLabourCosts();
            return MapEFToModel(results);
        }

        public IEnumerable<LabourCost> GetAllLabourCostsForAParticularBatch(long batchId)
        {
            var results = this._dataService.GetAllLabourCostsForAParticularBatch(batchId);
            return MapEFToModel(results);
        }
       
        public long SaveLabourCost(LabourCost labourCost, string userId)
        {
            double amount = 0;
            //    double rate =0;
            //var activity = _activityService.GetActivity(labourCost.ActivityId);
            //if (activity != null)
            //{
            //    rate = activity.Charge;
            //}
            amount = labourCost.Quantity * labourCost.Rate;
            var labourCostDTO = new DTO.LabourCostDTO()
            {
                LabourCostId = labourCost.LabourCostId,
                BatchId = labourCost.BatchId,
                Rate = labourCost.Rate,
                Quantity = labourCost.Quantity,
                ActivityId = labourCost.ActivityId,
                BranchId = labourCost.BranchId,
                Amount = amount,
                 Deleted = labourCost.Deleted,
                CreatedBy = labourCost.CreatedBy,
                CreatedOn = labourCost.CreatedOn,
                

            };

           var LabourCostId = this._dataService.SaveLabourCost(labourCostDTO, userId);

           return LabourCostId;
                      
        }

        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="LabourCostId"></param>
        /// <param name="userId"></param>
        public void MarkAsDeleted(long LabourCostId, string userId)
        {
            _dataService.MarkAsDeleted(LabourCostId, userId);
        }

      
        #region Mapping Methods

        public IEnumerable<LabourCost> MapEFToModel(IEnumerable<EF.Models.LabourCost> data)
        {
            var list = new List<LabourCost>();
            foreach (var result in data)
            {
                list.Add(MapEFToModel(result));
            }
            return list;
        }

        /// <summary>
        /// Maps LabourCost EF object to LabourCost Model Object and
        /// returns the LabourCost model object.
        /// </summary>
        /// <param name="result">EF LabourCost object to be mapped.</param>
        /// <returns>LabourCost Model Object.</returns>
        public LabourCost MapEFToModel(EF.Models.LabourCost data)
        {
           
            if (data != null)
            {
              var   labourCost = new LabourCost()
                {
                    LabourCostId = data.LabourCostId,
                    Amount = data.Amount,
                    
                    BranchId = data.BranchId,
                    BatchId = data.BatchId,
                    Rate = data.Rate,
                    Quantity = data.Quantity,
                    ActivityId = data.ActivityId,
                    ActivityName = data.Activity != null ? data.Activity.Name : "",
                    BatchNumber = data.Batch != null ? data.Batch.Name : "",
                    BranchName = data.Branch != null ? data.Branch.Name : "",
                    
                    CreatedOn = data.CreatedOn,
                    TimeStamp = data.TimeStamp,
                    Deleted = data.Deleted,
                    CreatedBy = _userService.GetUserFullName(data.AspNetUser),
                    UpdatedBy = _userService.GetUserFullName(data.AspNetUser1),


                };
                 return labourCost;
            }
            
            return null;
        }



       #endregion
    }
}
