using LibaryRepository;
using LibaryRepository.Entitie;

namespace libaryService
{
    public class libaryManagementMemberServices
    {
      

        public BookManagementMember? CheckLogin(string email, string password)
        {
            libaryManagementMenberRepository repo = new libaryManagementMenberRepository();

            BookManagementMember account = repo.Get(email); //tìm accoun theo email


            return account != null && account.Password == password ? account : null;
        }
    }
}
