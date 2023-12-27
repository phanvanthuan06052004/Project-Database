namespace libaryManagement
{
    partial class LibaryManagementForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            panel1 = new Panel();
            btnExit = new FontAwesome.Sharp.IconButton();
            btnDelete = new FontAwesome.Sharp.IconButton();
            btnUpdate = new FontAwesome.Sharp.IconButton();
            btnAdd = new FontAwesome.Sharp.IconButton();
            groupBox2 = new GroupBox();
            lblPrice = new Label();
            lblCategory = new Label();
            lblAuthor = new Label();
            lblName = new Label();
            lblDescription = new Label();
            label3 = new Label();
            lblQuantity = new Label();
            lblID = new Label();
            cboCategory = new ComboBox();
            txtAuthor = new TextBox();
            txtQuantity = new TextBox();
            txtPrice = new TextBox();
            dtpReleasedDate = new DateTimePicker();
            txtDescription = new TextBox();
            txtName = new TextBox();
            txtId = new TextBox();
            btnSearch = new FontAwesome.Sharp.IconButton();
            groupBox1 = new GroupBox();
            dgvBookList = new DataGridView();
            label1 = new Label();
            lblkeyword = new Label();
            txtKeyword = new TextBox();
            panel1.SuspendLayout();
            groupBox2.SuspendLayout();
            groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)dgvBookList).BeginInit();
            SuspendLayout();
            // 
            // panel1
            // 
            panel1.BackColor = SystemColors.AppWorkspace;
            panel1.BackgroundImage = Properties.Resources.Thiết_kế_chưa_có_tên___2023_11_20T105349_465;
            panel1.Controls.Add(btnExit);
            panel1.Controls.Add(btnDelete);
            panel1.Controls.Add(btnUpdate);
            panel1.Controls.Add(btnAdd);
            panel1.Controls.Add(groupBox2);
            panel1.Controls.Add(btnSearch);
            panel1.Controls.Add(groupBox1);
            panel1.Controls.Add(label1);
            panel1.Controls.Add(lblkeyword);
            panel1.Controls.Add(txtKeyword);
            panel1.Dock = DockStyle.Fill;
            panel1.Location = new Point(0, 0);
            panel1.Name = "panel1";
            panel1.Size = new Size(1109, 645);
            panel1.TabIndex = 0;
            // 
            // btnExit
            // 
            btnExit.BackColor = Color.FromArgb(255, 128, 0);
            btnExit.IconChar = FontAwesome.Sharp.IconChar.XmarkCircle;
            btnExit.IconColor = Color.Black;
            btnExit.IconFont = FontAwesome.Sharp.IconFont.Auto;
            btnExit.IconSize = 30;
            btnExit.ImageAlign = ContentAlignment.MiddleLeft;
            btnExit.Location = new Point(401, 599);
            btnExit.Name = "btnExit";
            btnExit.Size = new Size(92, 36);
            btnExit.TabIndex = 31;
            btnExit.Text = "   Exit ";
            btnExit.UseVisualStyleBackColor = false;
            btnExit.Click += btnExit_Click_1;
            // 
            // btnDelete
            // 
            btnDelete.BackColor = Color.FromArgb(255, 128, 0);
            btnDelete.IconChar = FontAwesome.Sharp.IconChar.Eraser;
            btnDelete.IconColor = Color.Black;
            btnDelete.IconFont = FontAwesome.Sharp.IconFont.Auto;
            btnDelete.IconSize = 30;
            btnDelete.ImageAlign = ContentAlignment.BottomLeft;
            btnDelete.Location = new Point(273, 598);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(92, 36);
            btnDelete.TabIndex = 30;
            btnDelete.Text = "     Delete";
            btnDelete.UseVisualStyleBackColor = false;
            btnDelete.Click += btnDelete_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.BackColor = Color.FromArgb(255, 128, 0);
            btnUpdate.IconChar = FontAwesome.Sharp.IconChar.Pen;
            btnUpdate.IconColor = Color.Black;
            btnUpdate.IconFont = FontAwesome.Sharp.IconFont.Auto;
            btnUpdate.IconSize = 28;
            btnUpdate.ImageAlign = ContentAlignment.BottomLeft;
            btnUpdate.Location = new Point(136, 596);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(102, 38);
            btnUpdate.TabIndex = 29;
            btnUpdate.Text = "     Update";
            btnUpdate.UseVisualStyleBackColor = false;
            btnUpdate.Click += btnUpdate_Click;
            // 
            // btnAdd
            // 
            btnAdd.BackColor = Color.FromArgb(255, 128, 0);
            btnAdd.IconChar = FontAwesome.Sharp.IconChar.Plus;
            btnAdd.IconColor = Color.Black;
            btnAdd.IconFont = FontAwesome.Sharp.IconFont.Brands;
            btnAdd.IconSize = 28;
            btnAdd.ImageAlign = ContentAlignment.BottomLeft;
            btnAdd.Location = new Point(25, 596);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(86, 38);
            btnAdd.TabIndex = 28;
            btnAdd.Text = "   Add";
            btnAdd.UseVisualStyleBackColor = false;
            btnAdd.Click += btnAdd_Click;
            // 
            // groupBox2
            // 
            groupBox2.BackgroundImage = Properties.Resources.Thiết_kế_chưa_có_tên___2023_11_20T105349_465;
            groupBox2.Controls.Add(lblPrice);
            groupBox2.Controls.Add(lblCategory);
            groupBox2.Controls.Add(lblAuthor);
            groupBox2.Controls.Add(lblName);
            groupBox2.Controls.Add(lblDescription);
            groupBox2.Controls.Add(label3);
            groupBox2.Controls.Add(lblQuantity);
            groupBox2.Controls.Add(lblID);
            groupBox2.Controls.Add(cboCategory);
            groupBox2.Controls.Add(txtAuthor);
            groupBox2.Controls.Add(txtQuantity);
            groupBox2.Controls.Add(txtPrice);
            groupBox2.Controls.Add(dtpReleasedDate);
            groupBox2.Controls.Add(txtDescription);
            groupBox2.Controls.Add(txtName);
            groupBox2.Controls.Add(txtId);
            groupBox2.Font = new Font("Stencil", 10.2F, FontStyle.Regular, GraphicsUnit.Point, 0);
            groupBox2.Location = new Point(14, 57);
            groupBox2.Name = "groupBox2";
            groupBox2.Size = new Size(482, 533);
            groupBox2.TabIndex = 27;
            groupBox2.TabStop = false;
            groupBox2.Text = "  Information";
            // 
            // lblPrice
            // 
            lblPrice.AutoSize = true;
            lblPrice.BackColor = Color.LightCoral;
            lblPrice.Font = new Font("Georgia", 9F);
            lblPrice.Location = new Point(251, 361);
            lblPrice.Name = "lblPrice";
            lblPrice.Size = new Size(41, 18);
            lblPrice.TabIndex = 15;
            lblPrice.Text = "Price";
            // 
            // lblCategory
            // 
            lblCategory.AutoSize = true;
            lblCategory.BackColor = Color.LightCoral;
            lblCategory.Font = new Font("Georgia", 9F);
            lblCategory.Location = new Point(42, 482);
            lblCategory.Name = "lblCategory";
            lblCategory.Size = new Size(40, 18);
            lblCategory.TabIndex = 14;
            lblCategory.Text = "Type";
            // 
            // lblAuthor
            // 
            lblAuthor.AutoSize = true;
            lblAuthor.BackColor = Color.LightCoral;
            lblAuthor.Font = new Font("Georgia", 9F);
            lblAuthor.Location = new Point(30, 421);
            lblAuthor.Name = "lblAuthor";
            lblAuthor.Size = new Size(55, 18);
            lblAuthor.TabIndex = 13;
            lblAuthor.Text = "Author";
            // 
            // lblName
            // 
            lblName.AutoSize = true;
            lblName.BackColor = Color.LightCoral;
            lblName.Font = new Font("Georgia", 9F);
            lblName.Location = new Point(33, 84);
            lblName.Name = "lblName";
            lblName.Size = new Size(49, 18);
            lblName.TabIndex = 12;
            lblName.Text = "Name";
            // 
            // lblDescription
            // 
            lblDescription.AutoSize = true;
            lblDescription.BackColor = Color.LightCoral;
            lblDescription.Font = new Font("Georgia", 9F);
            lblDescription.Location = new Point(3, 146);
            lblDescription.Name = "lblDescription";
            lblDescription.Size = new Size(83, 18);
            lblDescription.TabIndex = 11;
            lblDescription.Text = "Description";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.BackColor = Color.LightCoral;
            label3.Font = new Font("Georgia", 9F);
            label3.Location = new Point(33, 284);
            label3.Name = "label3";
            label3.Size = new Size(39, 18);
            label3.TabIndex = 10;
            label3.Text = "Date";
            // 
            // lblQuantity
            // 
            lblQuantity.AutoSize = true;
            lblQuantity.BackColor = Color.LightCoral;
            lblQuantity.Font = new Font("Georgia", 9F);
            lblQuantity.Location = new Point(17, 357);
            lblQuantity.Name = "lblQuantity";
            lblQuantity.Size = new Size(68, 18);
            lblQuantity.TabIndex = 9;
            lblQuantity.Text = "Quantity";
            // 
            // lblID
            // 
            lblID.AutoSize = true;
            lblID.BackColor = Color.LightCoral;
            lblID.Font = new Font("Georgia", 9F);
            lblID.Location = new Point(46, 36);
            lblID.Name = "lblID";
            lblID.Size = new Size(26, 18);
            lblID.TabIndex = 8;
            lblID.Text = "ID";
            // 
            // cboCategory
            // 
            cboCategory.Font = new Font("Times New Roman", 10.2F, FontStyle.Regular, GraphicsUnit.Point, 0);
            cboCategory.FormattingEnabled = true;
            cboCategory.Location = new Point(91, 472);
            cboCategory.Name = "cboCategory";
            cboCategory.Size = new Size(361, 27);
            cboCategory.TabIndex = 7;
            // 
            // txtAuthor
            // 
            txtAuthor.Font = new Font("Times New Roman", 10.2F);
            txtAuthor.Location = new Point(91, 419);
            txtAuthor.Name = "txtAuthor";
            txtAuthor.Size = new Size(353, 27);
            txtAuthor.TabIndex = 6;
            // 
            // txtQuantity
            // 
            txtQuantity.Font = new Font("Times New Roman", 10.2F);
            txtQuantity.Location = new Point(91, 354);
            txtQuantity.Name = "txtQuantity";
            txtQuantity.Size = new Size(125, 27);
            txtQuantity.TabIndex = 5;
            // 
            // txtPrice
            // 
            txtPrice.Font = new Font("Times New Roman", 10.2F);
            txtPrice.Location = new Point(307, 354);
            txtPrice.Name = "txtPrice";
            txtPrice.Size = new Size(125, 27);
            txtPrice.TabIndex = 4;
            // 
            // dtpReleasedDate
            // 
            dtpReleasedDate.CustomFormat = "dd/MM/yyyy";
            dtpReleasedDate.Font = new Font("Times New Roman", 10.2F, FontStyle.Regular, GraphicsUnit.Point, 0);
            dtpReleasedDate.Format = DateTimePickerFormat.Custom;
            dtpReleasedDate.Location = new Point(91, 277);
            dtpReleasedDate.Name = "dtpReleasedDate";
            dtpReleasedDate.Size = new Size(152, 27);
            dtpReleasedDate.TabIndex = 3;
            // 
            // txtDescription
            // 
            txtDescription.Font = new Font("Times New Roman", 10.2F);
            txtDescription.Location = new Point(91, 142);
            txtDescription.Multiline = true;
            txtDescription.Name = "txtDescription";
            txtDescription.ScrollBars = ScrollBars.Vertical;
            txtDescription.Size = new Size(353, 102);
            txtDescription.TabIndex = 2;
            // 
            // txtName
            // 
            txtName.Font = new Font("Times New Roman", 10.2F);
            txtName.Location = new Point(91, 80);
            txtName.Name = "txtName";
            txtName.Size = new Size(353, 27);
            txtName.TabIndex = 1;
            // 
            // txtId
            // 
            txtId.Font = new Font("Times New Roman", 10.2F);
            txtId.Location = new Point(91, 36);
            txtId.Name = "txtId";
            txtId.Size = new Size(125, 27);
            txtId.TabIndex = 0;
            // 
            // btnSearch
            // 
            btnSearch.IconChar = FontAwesome.Sharp.IconChar.MagnifyingGlassChart;
            btnSearch.IconColor = Color.Black;
            btnSearch.IconFont = FontAwesome.Sharp.IconFont.Auto;
            btnSearch.IconSize = 30;
            btnSearch.ImageAlign = ContentAlignment.MiddleLeft;
            btnSearch.Location = new Point(953, 93);
            btnSearch.Name = "btnSearch";
            btnSearch.Size = new Size(106, 35);
            btnSearch.TabIndex = 26;
            btnSearch.Text = "   Search";
            btnSearch.UseVisualStyleBackColor = true;
            btnSearch.Click += btnSearch_Click;
            // 
            // groupBox1
            // 
            groupBox1.BackgroundImage = Properties.Resources.Thiết_kế_chưa_có_tên___2023_11_20T105349_465;
            groupBox1.Controls.Add(dgvBookList);
            groupBox1.Location = new Point(550, 236);
            groupBox1.Name = "groupBox1";
            groupBox1.Size = new Size(547, 360);
            groupBox1.TabIndex = 25;
            groupBox1.TabStop = false;
            groupBox1.Text = "   ListBook";
            // 
            // dgvBookList
            // 
            dgvBookList.BackgroundColor = SystemColors.ButtonFace;
            dgvBookList.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgvBookList.Location = new Point(46, 39);
            dgvBookList.Name = "dgvBookList";
            dgvBookList.RowHeadersWidth = 51;
            dgvBookList.Size = new Size(448, 306);
            dgvBookList.TabIndex = 18;
            dgvBookList.SelectionChanged += dgvBookList_SelectionChanged;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.BackColor = Color.LightCoral;
            label1.FlatStyle = FlatStyle.Flat;
            label1.Font = new Font("Showcard Gothic", 22.2F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label1.Location = new Point(343, 9);
            label1.Name = "label1";
            label1.Size = new Size(421, 46);
            label1.TabIndex = 24;
            label1.Text = "Libary Management";
            // 
            // lblkeyword
            // 
            lblkeyword.AutoSize = true;
            lblkeyword.BackColor = Color.LightCoral;
            lblkeyword.Font = new Font("Georgia", 9F);
            lblkeyword.Location = new Point(569, 107);
            lblkeyword.Name = "lblkeyword";
            lblkeyword.Size = new Size(65, 18);
            lblkeyword.TabIndex = 17;
            lblkeyword.Text = "keyword";
            // 
            // txtKeyword
            // 
            txtKeyword.Font = new Font("Times New Roman", 9F, FontStyle.Regular, GraphicsUnit.Point, 0);
            txtKeyword.Location = new Point(650, 97);
            txtKeyword.Name = "txtKeyword";
            txtKeyword.Size = new Size(275, 25);
            txtKeyword.TabIndex = 16;
            // 
            // LibaryManagementForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1109, 645);
            ControlBox = false;
            Controls.Add(panel1);
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "LibaryManagementForm";
            ShowIcon = false;
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Libary Management";
            Load += BookManagerForm_Load;
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            groupBox2.ResumeLayout(false);
            groupBox2.PerformLayout();
            groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)dgvBookList).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private Panel panel1;
        private DateTimePicker dtpReleasedDate;
        private TextBox txtDescription;
        private TextBox txtName;
        private TextBox txtId;
        private TextBox txtQuantity;
        private TextBox txtPrice;
        private TextBox txtAuthor;
        private Label lblPrice;
        private Label lblCategory;
        private Label lblAuthor;
        private Label lblName;
        private Label lblDescription;
        private Label label3;
        private Label lblQuantity;
        private Label lblID;
        private ComboBox cboCategory;
        private DataGridView dgvBookList;
        private Label lblkeyword;
        private TextBox txtKeyword;
        private GroupBox groupBox1;
        private Label label1;
        private FontAwesome.Sharp.IconButton btnSearch;
        private FontAwesome.Sharp.IconButton btnAdd;
        private GroupBox groupBox2;
        private FontAwesome.Sharp.IconButton btnUpdate;
        private FontAwesome.Sharp.IconButton btnExit;
        private FontAwesome.Sharp.IconButton btnDelete;
    }
}