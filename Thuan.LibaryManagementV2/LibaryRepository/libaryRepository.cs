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
        //HÀM KIÊM TRA bookID
        public Book? Get(int bookId)
        {
            _context = new LibaryManagementContext();
            return _context.Books.Find(bookId);
        }

        //hàm lấy tất cả danh sách
        public List<Book> GetAll()
        {
            _context = new LibaryManagementContext();
            return _context.Books.Include(cat => cat.BookCategory).ToList();
        }                              


        //hàm Add and save
       
        public void Create(Book book)
        {
            _context = new LibaryManagementContext();
            _context.Books.Add(book); 
            _context.SaveChanges();
        }

        //hàm UPdate and save
      
        public void Update(Book book)
        {
            _context = new LibaryManagementContext();
            _context.Books.Update(book);
            _context.SaveChanges();
        }

       //hàm xóa and save
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
