using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Higgs.Mbale.DAL.Interface;
using Higgs.Mbale.EF.Models;
using Higgs.Mbale.EF.UnitOfWork;
using Higgs.Mbale.DTO;

namespace Higgs.Mbale.DAL.Concrete
{
 public   class GradeDataService : DataServiceBase,IGradeDataService
    {
      
       public GradeDataService(IUnitOfWork<MbaleEntities> unitOfWork)
            : base(unitOfWork)
        {

        }
              
        public IEnumerable<Grade> GetAllGrades()
        {
            return this.UnitOfWork.Get<Grade>().AsQueryable().Where(e => e.Deleted == false); 
        }

        public IEnumerable<Size> GetAllSizes()
        {
            return this.UnitOfWork.Get<Size>().AsQueryable().Where(e => e.Deleted == false);
        }

        public Size GetSize(long sizeId)
        {
            return this.UnitOfWork.Get<Size>().AsQueryable()
                 .FirstOrDefault(c =>
                    c.SizeId == sizeId &&
                    c.Deleted == false
                );
        }
    }
}
