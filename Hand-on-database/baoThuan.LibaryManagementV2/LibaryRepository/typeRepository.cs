using LibaryRepository.Entitie;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibaryRepository
{
    public class typeRepository
    {
       
        public List<BookType> GetAll()
        {
          
            return new LibaryManagementContext().BookTypes.ToList();
        }
    }
}
