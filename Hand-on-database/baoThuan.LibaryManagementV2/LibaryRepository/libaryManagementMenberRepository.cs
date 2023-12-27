using LibaryRepository.Entitie;

namespace LibaryRepository
{
    public class libaryManagementMenberRepository
    {
        
        public BookManagementMember? Get(string email)
        {
            LibaryManagementContext db = new LibaryManagementContext();
           
            return db.BookManagementMembers.FirstOrDefault(x => x.Email == email);
        }
    }
}
