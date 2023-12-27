using LibaryRepository.Entitie;
using libaryService;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace libaryManagement
{
    public partial class LibaryManagementForm : Form
    {
        private libaryServices _bookService = new libaryServices();
        private typeService _categoryService = new typeService();

       
        public LibaryManagementForm()
        {
            InitializeComponent();
        }

        //phương thức thoát chương tình
        private void BookManagerForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }


        /// <summary>
        /// phương thức load data
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void BookManagerForm_Load(object sender, EventArgs e)
        {
            
            var result = _bookService.GetAllBooks();
            dgvBookList.DataSource = null;    
            dgvBookList.DataSource = result;
           
            dgvBookList.Columns["BookCategory"].Visible = false;

            
            cboCategory.DataSource = _categoryService.GetAllCategories();
          
            cboCategory.DisplayMember = "BookGenreType";
            cboCategory.ValueMember = "BookCategoryId"; 



        }
        /// <summary>
        /// phương thúc chọn danh sách book để hiển thị trong của sổ chi tiết
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dgvBookList_SelectionChanged(object sender, EventArgs e)
        {
            if (dgvBookList.SelectedRows.Count > 0)
            {
                var selectedBook = (Book)dgvBookList.SelectedRows[0].DataBoundItem;
                txtId.Text = selectedBook.BookId.ToString();
                txtName.Text = selectedBook.BookName;
                txtDescription.Text = selectedBook.Description;
                dtpReleasedDate.Value = selectedBook.ReleaseDate;
                txtQuantity.Text = selectedBook.Quantity.ToString();
                txtPrice.Text = selectedBook.Price.ToString();
                cboCategory.SelectedValue = selectedBook.BookCategoryId;
                txtAuthor.Text = selectedBook.Author;
            }
        }

        /// <summary>
        /// phương thức tìm kiếm bằng key sau khi bạn nhập
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnSearch_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtKeyword.Text))
            {
                MessageBox.Show("The search keyword is required!!!",
                    "Search keyword required",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            var result = _bookService.SearchBooks(txtKeyword.Text.Trim());

           
            dgvBookList.DataSource = null;   
            dgvBookList.DataSource = result;

        }
        /// <summary>
        /// phương thức xóa khi nhán nut button Delete
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnDelete_Click(object sender, EventArgs e)
        {
                   
            int id;

            if (string.IsNullOrWhiteSpace(txtId.Text) || !int.TryParse(txtId.Text, out id))
            {
                MessageBox.Show("The Book ID is invalid. Please input a number!!!",
                    "Invalid Book ID",
                    MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }
            _bookService.DeleteABook(id);

           
            var result = _bookService.GetAllBooks();
            dgvBookList.DataSource = null;    
            dgvBookList.DataSource = result;

            

        }

        /// <summary>
        /// phươn thức update thông tin sách trong giao diện
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnUpdate_Click(object sender, EventArgs e)
        {
            int id;
            if (string.IsNullOrWhiteSpace(txtId.Text) || !int.TryParse(txtId.Text, out id))
            {
                MessageBox.Show("The Book ID is invalid. Please select a row in the grid to edit or input a number!!!",
                    "Invalid Book ID",
                    MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

           

            
            libaryForm libaryForm = new libaryForm();
            libaryForm.BookId = int.Parse(txtId.Text);
            libaryForm.ShowDialog();
            //refesh lại grid
            //load cái danh sách Sách vào grid
            var result = _bookService.GetAllBooks();
            dgvBookList.DataSource = null;    
            dgvBookList.DataSource = result;


        }

        /// <summary>
        /// phương thức Add sách 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnAdd_Click(object sender, EventArgs e)
        {
            libaryForm libaryForm = new libaryForm();
            libaryForm.BookId = null;
            libaryForm.ShowDialog();
           
            var result = _bookService.GetAllBooks();
            dgvBookList.DataSource = null;    
            dgvBookList.DataSource = result;
        }

        /// <summary>
        /// phươn thức thoát chương trình khi nhấn nut BUtton Exit
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnExit_Click_1(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
