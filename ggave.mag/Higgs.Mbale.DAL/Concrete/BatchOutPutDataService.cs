using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Higgs.Mbale.DAL.Interface;
using Higgs.Mbale.EF.Models;
using Higgs.Mbale.EF.UnitOfWork;
using Higgs.Mbale.DTO;
using EntityFramework.Extensions;

namespace Higgs.Mbale.DAL.Concrete
{
 public   class BatchOutPutDataService : DataServiceBase,IBatchOutPutDataService
    {
     
        
       public BatchOutPutDataService(IUnitOfWork<MbaleEntities> unitOfWork)
            : base(unitOfWork)
        {

        }

      
        public IEnumerable<BatchOutPut> GetAllBatchOutPuts()
        {
            return this.UnitOfWork.Get<BatchOutPut>().AsQueryable().Where(e => e.Deleted == false); 
        }

        public IEnumerable<BatchOutPut> GetAllBatchOutPutsForAParticularBatch(long batchId)
        {
            return this.UnitOfWork.Get<BatchOutPut>().AsQueryable().Where(e => e.Deleted == false && e.BatchId == batchId);
        }


        public BatchOutPut GetBatchOutPut(long batchOutPutId)
        {
            return this.UnitOfWork.Get<BatchOutPut>().AsQueryable()
                 .FirstOrDefault(c =>
                    c.BatchOutPutId == batchOutPutId &&
                    c.Deleted == false
                );
        }

        /// <summary>
        /// Saves a new batchoutput or updates an already existing BatchOutPut.
        /// </summary>
        /// <param name="Batch">BatchOutPut to be saved or updated.</param>
        /// <param name="BatchId">BatchOutPutId of the BatchOutPut creating or updating</param>
        /// <returns>BatchOutPutId</returns>
        public long SaveBatchOutPut(BatchOutPutDTO batchOutPutDTO, string userId)
        {
            long batchOutPutId = 0;
            var resultBatch = this.UnitOfWork.Get<BatchOutPut>().AsQueryable()
                    .FirstOrDefault(e => e.BatchId == batchOutPutDTO.BatchId);
            //if (resultBatch != null && batchOutPutDTO.BatchOutPutId == 0)
            //{
            //    return batchOutPutId;
            //}
            //else
            //{
                if (batchOutPutDTO.BatchOutPutId == 0)
                {

                    var batchOutPut = new BatchOutPut()
                    {
                        Loss = batchOutPutDTO.Loss,
                        FlourOutPut = batchOutPutDTO.FlourOutPut,
                        BrandOutPut = batchOutPutDTO.BrandOutPut,
                        BatchId = batchOutPutDTO.BatchId,
                        LossPercentage = batchOutPutDTO.LossPercentage,
                        BrandPercentage = batchOutPutDTO.BrandPercentage,
                        FlourPercentage = batchOutPutDTO.FlourPercentage,
                        BranchId = batchOutPutDTO.BranchId,
                        SectorId = batchOutPutDTO.SectorId,
                        CreatedOn = DateTime.Now,
                        TimeStamp = DateTime.Now,
                        CreatedBy = userId,
                        Deleted = false,



                    };

                    this.UnitOfWork.Get<BatchOutPut>().AddNew(batchOutPut);
                    this.UnitOfWork.SaveChanges();
                    batchOutPutId = batchOutPut.BatchOutPutId;


                    return batchOutPutId;
                }

                else
                {
                    var result = this.UnitOfWork.Get<BatchOutPut>().AsQueryable()
                        .FirstOrDefault(e => e.BatchOutPutId == batchOutPutDTO.BatchOutPutId);
                    if (result != null)
                    {
                        result.Loss = batchOutPutDTO.Loss;
                        result.FlourOutPut = batchOutPutDTO.FlourOutPut;
                        result.BrandOutPut = batchOutPutDTO.BrandOutPut;
                        result.BatchId = batchOutPutDTO.BatchId;
                        result.LossPercentage = batchOutPutDTO.LossPercentage;
                        result.BrandPercentage = batchOutPutDTO.BrandPercentage;
                        result.FlourPercentage = batchOutPutDTO.FlourPercentage;
                        result.SectorId = batchOutPutDTO.SectorId;
                        result.BranchId = batchOutPutDTO.BranchId;
                        result.UpdatedBy = userId;
                        result.TimeStamp = DateTime.Now;
                        result.Deleted = batchOutPutDTO.Deleted;
                        result.DeletedBy = batchOutPutDTO.DeletedBy;
                        result.DeletedOn = batchOutPutDTO.DeletedOn;

                        this.UnitOfWork.Get<BatchOutPut>().Update(result);
                        this.UnitOfWork.SaveChanges();
                    }
                    return batchOutPutDTO.BatchOutPutId;
                }    
            }
                  
        //}

        public void MarkAsDeleted(long batchOutPutId, string userId)
        {


            using (var dbContext = new MbaleEntities())
            {
               // dbContext.Mark_Estate_And_RelatedData_AsDeleted(SectorId, userId);
            }

        }

        public void SaveBatchGradeSize(BatchGradeSizeDTO batchGradeSizeDTO)
        {
            var batchGradeSize = new BatchGradeSize()
            {
                BatchOutPutId = batchGradeSizeDTO.BatchOutPutId,
                GradeId = batchGradeSizeDTO.GradeId,
                SizeId =  batchGradeSizeDTO.SizeId,
                Quantity = batchGradeSizeDTO.Quantity,
                Balance = batchGradeSizeDTO.Balance,
                BuveraAmount = batchGradeSizeDTO.BuveraAmount,
                TimeStamp = DateTime.Now
            };
            this.UnitOfWork.Get<BatchGradeSize>().AddNew(batchGradeSize);
            this.UnitOfWork.SaveChanges();
        }

        public void PurgeBatchGradeSize(long batchOutPutId)
        {
            this.UnitOfWork.Get<BatchGradeSize>().AsQueryable()
                .Where(m => m.BatchOutPutId == batchOutPutId)
                .Delete();
        }

        public void UpdateBatchGradeSizes(BatchGradeSizeDTO batchGradeSize )
        {
            var result = this.UnitOfWork.Get<BatchGradeSize>().AsQueryable()
                       .FirstOrDefault(e => e.BatchOutPutId == batchGradeSize.BatchOutPutId && e.GradeId == batchGradeSize.GradeId && e.SizeId ==batchGradeSize.SizeId);
            if (result != null)
            {
                result.SizeId = result.SizeId;
                result.GradeId = result.GradeId;
                result.Quantity = result.Quantity;
                result.BatchOutPutId = result.BatchOutPutId;
                result.Balance = batchGradeSize.Balance;
                result.BuveraAmount = batchGradeSize.BuveraAmount;
                result.TimeStamp = DateTime.Now;


                this.UnitOfWork.Get<BatchGradeSize>().Update(result);
                this.UnitOfWork.SaveChanges();
            }
        }
        public IEnumerable<BatchSupply> GetBatchSupplies(long batchId)
        {
          return  this.UnitOfWork.Get<BatchSupply>().AsQueryable()
                .Where(m => m.BatchId == batchId);
        }

        public void UpdateBatchBrandBalance(long batchId, double quantity, string userId)
        {
            using (var dbContext = new MbaleEntities())
            {
                dbContext.UpdateBatchBrandQuantity(batchId, quantity, userId);
            }
        }
    }
}
