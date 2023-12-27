using LibaryRepository;
using LibaryRepository.Entitie;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace libaryService
{
    public class libaryServices
    {
      
        private libaryRepository _repo = new libaryRepository();
        

        public List<Book> GetAllBooks()
        {
            return _repo.GetAll();
        }

      
        public List<Book> SearchBooks(string keyword)
        {
            return _repo.GetAll().Where(b => b.BookName.ToLower().Contains(keyword.ToLower()) ||
                                             b.Description.ToLower().Contains(keyword.ToLower())).ToList();
        }

      
        public void DeleteABook(int id)
        {
            _repo.Delete(id);
        }

        public Book? GetABook(int id)
        {
            return _repo.Get(id);
        }


       
        public void AddABook(Book book)
        {
            _repo.Create(book);
        }

        public void UpdateABook(Book book)
        {
            _repo.Update(book);
        }   
    }
}
