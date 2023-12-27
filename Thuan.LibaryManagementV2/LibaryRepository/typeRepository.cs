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
       //phương thức lấy tất cả danh sách BOOltype
        public List<BookType> GetAll()
        {
          
            return new LibaryManagementContext().BookTypes.ToList();
        }
    }
}
