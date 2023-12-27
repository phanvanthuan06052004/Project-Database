using LibaryRepository.Entitie;

namespace LibaryRepository
{
    public class libaryManagementMenberRepository
    {
        
        public BookManagementMember? Get(string email)
            
        {
            //Lấy Email trong database để đăng nhập
            LibaryManagementContext db = new LibaryManagementContext();
           
            return db.BookManagementMembers.FirstOrDefault(x => x.Email == email);
        }
    }
}
