using LibaryRepository;
using LibaryRepository.Entitie;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace libaryService
{
    public class typeService
    {
        private typeRepository _repo;
        public List<BookType> GetAllCategories()
        {
            _repo = new typeRepository();
            return _repo.GetAll();
        }
    }
}
