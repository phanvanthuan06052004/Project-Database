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
    public partial class libaryForm : Form
    {
       
        public int? BookId { get; set; }
        private libaryServices _bookService = new(); 
        private typeService _categoryService = new();
        public libaryForm()
        {
            InitializeComponent();
        }

        private void BookForm_Load(object sender, EventArgs e)
        {

           
            cboCategory.DataSource = _categoryService.GetAllCategories();
          
            cboCategory.DisplayMember = "BookGenreType";
            cboCategory.ValueMember = "BookCategoryId"; 

            if (this.BookId != null)
            {
                
                var book = _bookService.GetABook((int)BookId);

                txtId.Text = book.BookId.ToString();
                txtName.Text = book.BookName;
                txtDescription.Text = book.Description;
                dtpReleasedDate.Value = book.ReleaseDate;
                txtQuantity.Text = book.Quantity.ToString();
                txtPrice.Text = book.Price.ToString();
                cboCategory.SelectedValue = book.BookCategoryId;
                txtAuthor.Text = book.Author;
                lblFormTitle.Text = "Update a Book...";
            }

        }
        private void btnCancel_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
           

            Book book = new()
            {
                BookId = int.Parse(txtId.Text.Trim()),
                BookName = txtName.Text.Trim(),
                Description = txtDescription.Text.Trim(),
                ReleaseDate = dtpReleasedDate.Value.Date, 
                Author = txtAuthor.Text.Trim(),
                Quantity = int.Parse(txtQuantity.Text.Trim()),
                Price = double.Parse(txtPrice.Text.Trim()),
                BookCategoryId = int.Parse(cboCategory.SelectedValue.ToString())
            };

            if (BookId != null)  
                _bookService.UpdateABook(book);
            else
                _bookService.AddABook(book);

            Close();  

        }
    }
}
