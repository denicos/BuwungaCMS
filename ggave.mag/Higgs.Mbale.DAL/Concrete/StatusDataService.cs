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
    public class StatusDataService: DataServiceBase,IStatusDataService
    {
       
       public StatusDataService(IUnitOfWork<MbaleEntities> unitOfWork)
            : base(unitOfWork)
        {

        }
              
        public IEnumerable<Status> GetAllStatuses()
        {
            return this.UnitOfWork.Get<Status>().AsQueryable().Where(e => e.Deleted == false); 
        }


    }
}
