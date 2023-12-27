using LibaryRepository.Entitie;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibaryRepository
{
    public class libaryRepository
    {
       

       
        private LibaryManagementContext _context;
        public Book? Get(int bookId)
        {
            _context = new LibaryManagementContext();
            return _context.Books.Find(bookId);
        }

      
        public List<Book> GetAll()
        {
            _context = new LibaryManagementContext();
            return _context.Books.Include(cat => cat.BookCategory).ToList();
        }                              



       
        public void Create(Book book)
        {
            _context = new LibaryManagementContext();
            _context.Books.Add(book); 
            _context.SaveChanges();
        }

      
        public void Update(Book book)
        {
            _context = new LibaryManagementContext();
            _context.Books.Update(book);
            _context.SaveChanges();
        }

       
        public void Delete(int id)
        {
           
            _context = new LibaryManagementContext();
            var book = _context.Books.FirstOrDefault(b => b.BookId == id);
          
            if (book != null)
            {
                _context.Books.Remove(book);
                _context.SaveChanges();
            }
        }


    }
}
