using LibaryRepository.Entitie;
using libaryService;

namespace libaryManagement
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text; 
            string password = txtPassword.Text;
            libaryManagementMemberServices se = new libaryManagementMemberServices(); ;

            BookManagementMember account = se.CheckLogin(email, password);
            if (account == null)
            {
                MessageBox.Show("Login failed. Please check your credentials",
                                 "Wrong credentials", MessageBoxButtons.OK,
                                 MessageBoxIcon.Error);
                return;
            }
            
            if (account.MemberRole != 1)
            {
                MessageBox.Show("You are not allowed to access this function!",
                                "Access denied", MessageBoxButtons.OK,
                                MessageBoxIcon.Error);
                return;
            }

           
            LibaryManagementForm bookMgt = new LibaryManagementForm();
            bookMgt.Show(); 
            this.Hide(); 
        }
    }
}
