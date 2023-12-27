namespace libaryManagement
{
    partial class libaryForm
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
            txtId = new TextBox();
            txtDescription = new TextBox();
            txtName = new TextBox();
            txtQuantity = new TextBox();
            txtPrice = new TextBox();
            dtpReleasedDate = new DateTimePicker();
            txtAuthor = new TextBox();
            cboCategory = new ComboBox();
            lblId = new Label();
            lblDate = new Label();
            lblPrice = new Label();
            lblQuantity = new Label();
            lblAuthor = new Label();
            lblCategory = new Label();
            lblDescription = new Label();
            lblName = new Label();
            lblFormTitle = new Label();
            groupBox1 = new GroupBox();
            btnCancel = new FontAwesome.Sharp.IconButton();
            btnSave = new FontAwesome.Sharp.IconButton();
            groupBox1.SuspendLayout();
            SuspendLayout();
            // 
            // txtId
            // 
            txtId.Location = new Point(107, 26);
            txtId.Name = "txtId";
            txtId.Size = new Size(125, 27);
            txtId.TabIndex = 0;
            // 
            // txtDescription
            // 
            txtDescription.Location = new Point(107, 138);
            txtDescription.Multiline = true;
            txtDescription.Name = "txtDescription";
            txtDescription.ScrollBars = ScrollBars.Vertical;
            txtDescription.Size = new Size(353, 102);
            txtDescription.TabIndex = 1;
            // 
            // txtName
            // 
            txtName.Location = new Point(107, 76);
            txtName.Name = "txtName";
            txtName.Size = new Size(353, 27);
            txtName.TabIndex = 2;
            // 
            // txtQuantity
            // 
            txtQuantity.Location = new Point(107, 331);
            txtQuantity.Name = "txtQuantity";
            txtQuantity.Size = new Size(136, 27);
            txtQuantity.TabIndex = 3;
            // 
            // txtPrice
            // 
            txtPrice.Location = new Point(337, 331);
            txtPrice.Name = "txtPrice";
            txtPrice.Size = new Size(136, 27);
            txtPrice.TabIndex = 4;
            // 
            // dtpReleasedDate
            // 
            dtpReleasedDate.CustomFormat = "dd/MM/yyyy";
            dtpReleasedDate.Format = DateTimePickerFormat.Custom;
            dtpReleasedDate.Location = new Point(107, 286);
            dtpReleasedDate.Name = "dtpReleasedDate";
            dtpReleasedDate.Size = new Size(152, 27);
            dtpReleasedDate.TabIndex = 5;
            // 
            // txtAuthor
            // 
            txtAuthor.Location = new Point(107, 392);
            txtAuthor.Name = "txtAuthor";
            txtAuthor.Size = new Size(353, 27);
            txtAuthor.TabIndex = 6;
            // 
            // cboCategory
            // 
            cboCategory.FormattingEnabled = true;
            cboCategory.Location = new Point(107, 451);
            cboCategory.Name = "cboCategory";
            cboCategory.Size = new Size(353, 28);
            cboCategory.TabIndex = 7;
            // 
            // lblId
            // 
            lblId.AutoSize = true;
            lblId.Font = new Font("Georgia", 9F);
            lblId.Location = new Point(63, 23);
            lblId.Name = "lblId";
            lblId.Size = new Size(26, 18);
            lblId.TabIndex = 10;
            lblId.Text = "ID";
            // 
            // lblDate
            // 
            lblDate.AutoSize = true;
            lblDate.Font = new Font("Georgia", 9F);
            lblDate.Location = new Point(51, 286);
            lblDate.Name = "lblDate";
            lblDate.Size = new Size(39, 18);
            lblDate.TabIndex = 11;
            lblDate.Text = "Date";
            // 
            // lblPrice
            // 
            lblPrice.AutoSize = true;
            lblPrice.Font = new Font("Georgia", 9F);
            lblPrice.Location = new Point(280, 338);
            lblPrice.Name = "lblPrice";
            lblPrice.Size = new Size(41, 18);
            lblPrice.TabIndex = 12;
            lblPrice.Text = "Price";
            // 
            // lblQuantity
            // 
            lblQuantity.AutoSize = true;
            lblQuantity.Font = new Font("Georgia", 9F);
            lblQuantity.Location = new Point(22, 331);
            lblQuantity.Name = "lblQuantity";
            lblQuantity.Size = new Size(68, 18);
            lblQuantity.TabIndex = 13;
            lblQuantity.Text = "Quantity";
            // 
            // lblAuthor
            // 
            lblAuthor.AutoSize = true;
            lblAuthor.Font = new Font("Georgia", 9F);
            lblAuthor.Location = new Point(33, 395);
            lblAuthor.Name = "lblAuthor";
            lblAuthor.Size = new Size(55, 18);
            lblAuthor.TabIndex = 14;
            lblAuthor.Text = "Author";
            // 
            // lblCategory
            // 
            lblCategory.AutoSize = true;
            lblCategory.Font = new Font("Georgia", 9F);
            lblCategory.Location = new Point(47, 461);
            lblCategory.Name = "lblCategory";
            lblCategory.Size = new Size(40, 18);
            lblCategory.TabIndex = 15;
            lblCategory.Text = "Type";
            // 
            // lblDescription
            // 
            lblDescription.AutoSize = true;
            lblDescription.Font = new Font("Georgia", 9F);
            lblDescription.Location = new Point(7, 141);
            lblDescription.Name = "lblDescription";
            lblDescription.Size = new Size(83, 18);
            lblDescription.TabIndex = 16;
            lblDescription.Text = "Description";
            // 
            // lblName
            // 
            lblName.AutoSize = true;
            lblName.Font = new Font("Georgia", 9F);
            lblName.Location = new Point(38, 79);
            lblName.Name = "lblName";
            lblName.Size = new Size(49, 18);
            lblName.TabIndex = 17;
            lblName.Text = "Name";
            // 
            // lblFormTitle
            // 
            lblFormTitle.AutoSize = true;
            lblFormTitle.Font = new Font("Ravie", 18F, FontStyle.Bold, GraphicsUnit.Point, 0);
            lblFormTitle.Location = new Point(72, 31);
            lblFormTitle.Name = "lblFormTitle";
            lblFormTitle.Size = new Size(258, 40);
            lblFormTitle.TabIndex = 18;
            lblFormTitle.Text = "ADD A BOOK";
            // 
            // groupBox1
            // 
            groupBox1.Controls.Add(btnCancel);
            groupBox1.Controls.Add(btnSave);
            groupBox1.Controls.Add(lblName);
            groupBox1.Controls.Add(lblDescription);
            groupBox1.Controls.Add(lblCategory);
            groupBox1.Controls.Add(lblAuthor);
            groupBox1.Controls.Add(lblQuantity);
            groupBox1.Controls.Add(lblPrice);
            groupBox1.Controls.Add(lblDate);
            groupBox1.Controls.Add(lblId);
            groupBox1.Controls.Add(cboCategory);
            groupBox1.Controls.Add(txtAuthor);
            groupBox1.Controls.Add(dtpReleasedDate);
            groupBox1.Controls.Add(txtPrice);
            groupBox1.Controls.Add(txtQuantity);
            groupBox1.Controls.Add(txtName);
            groupBox1.Controls.Add(txtDescription);
            groupBox1.Controls.Add(txtId);
            groupBox1.FlatStyle = FlatStyle.Flat;
            groupBox1.Location = new Point(71, 94);
            groupBox1.Name = "groupBox1";
            groupBox1.Size = new Size(543, 583);
            groupBox1.TabIndex = 19;
            groupBox1.TabStop = false;
            groupBox1.Text = "   Libary";
            // 
            // btnCancel
            // 
            btnCancel.IconChar = FontAwesome.Sharp.IconChar.XmarkCircle;
            btnCancel.IconColor = Color.Black;
            btnCancel.IconFont = FontAwesome.Sharp.IconFont.Auto;
            btnCancel.IconSize = 27;
            btnCancel.ImageAlign = ContentAlignment.TopLeft;
            btnCancel.Location = new Point(401, 524);
            btnCancel.Name = "btnCancel";
            btnCancel.Size = new Size(110, 33);
            btnCancel.TabIndex = 19;
            btnCancel.Text = "   Cancel";
            btnCancel.UseVisualStyleBackColor = true;
            btnCancel.Click += btnCancel_Click;
            // 
            // btnSave
            // 
            btnSave.IconChar = FontAwesome.Sharp.IconChar.Bookmark;
            btnSave.IconColor = Color.Black;
            btnSave.IconFont = FontAwesome.Sharp.IconFont.Auto;
            btnSave.IconSize = 27;
            btnSave.ImageAlign = ContentAlignment.MiddleLeft;
            btnSave.Location = new Point(262, 524);
            btnSave.Name = "btnSave";
            btnSave.Size = new Size(110, 33);
            btnSave.TabIndex = 18;
            btnSave.Text = "     Save";
            btnSave.UseVisualStyleBackColor = true;
            btnSave.Click += btnSave_Click;
            // 
            // libaryForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            BackgroundImage = Properties.Resources.Thiết_kế_chưa_có_tên___2023_11_20T093037_802;
            ClientSize = new Size(686, 708);
            ControlBox = false;
            Controls.Add(groupBox1);
            Controls.Add(lblFormTitle);
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "libaryForm";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Add And Update";
            Load += BookForm_Load;
            groupBox1.ResumeLayout(false);
            groupBox1.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private TextBox txtId;
        private TextBox txtDescription;
        private TextBox txtName;
        private TextBox txtQuantity;
        private TextBox txtPrice;
        private DateTimePicker dtpReleasedDate;
        private TextBox txtAuthor;
        private ComboBox cboCategory;
        private Label lblId;
        private Label lblDate;
        private Label lblPrice;
        private Label lblQuantity;
        private Label lblAuthor;
        private Label lblCategory;
        private Label lblDescription;
        private Label lblName;
        private Label lblFormTitle;
        private GroupBox groupBox1;
        private FontAwesome.Sharp.IconButton btnCancel;
        private FontAwesome.Sharp.IconButton iconButton1;
        private FontAwesome.Sharp.IconButton btnSave;
    }
}