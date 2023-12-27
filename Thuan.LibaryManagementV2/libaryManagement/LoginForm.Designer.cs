namespace libaryManagement
{
    partial class LoginForm
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            panel1 = new Panel();
            label1 = new Label();
            panel2 = new Panel();
            btnLogin = new Button();
            label4 = new Label();
            label2 = new Label();
            txtPassword = new TextBox();
            txtEmail = new TextBox();
            label3 = new Label();
            panel1.SuspendLayout();
            panel2.SuspendLayout();
            SuspendLayout();
            // 
            // panel1
            // 
            panel1.BackColor = Color.FromArgb(128, 255, 128);
            panel1.BackgroundImage = Properties.Resources.Thiết_kế_chưa_có_tên___2023_11_20T030204_284;
            panel1.BackgroundImageLayout = ImageLayout.Zoom;
            panel1.Controls.Add(label1);
            panel1.Controls.Add(panel2);
            panel1.Dock = DockStyle.Fill;
            panel1.Location = new Point(0, 0);
            panel1.Name = "panel1";
            panel1.Size = new Size(534, 478);
            panel1.TabIndex = 0;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.BackColor = Color.FromArgb(255, 255, 192);
            label1.FlatStyle = FlatStyle.Popup;
            label1.Font = new Font("Harlow Solid Italic", 18F, FontStyle.Bold | FontStyle.Italic, GraphicsUnit.Point, 0);
            label1.Location = new Point(32, 9);
            label1.Name = "label1";
            label1.Size = new Size(465, 38);
            label1.TabIndex = 1;
            label1.Text = "Wellcome To Libary Management";
            // 
            // panel2
            // 
            panel2.BackColor = Color.DarkSalmon;
            panel2.BackgroundImageLayout = ImageLayout.Stretch;
            panel2.Controls.Add(btnLogin);
            panel2.Controls.Add(label4);
            panel2.Controls.Add(label2);
            panel2.Controls.Add(txtPassword);
            panel2.Controls.Add(txtEmail);
            panel2.Controls.Add(label3);
            panel2.Location = new Point(104, 50);
            panel2.Name = "panel2";
            panel2.Size = new Size(300, 416);
            panel2.TabIndex = 0;
            // 
            // btnLogin
            // 
            btnLogin.BackColor = Color.Peru;
            btnLogin.Font = new Font("Segoe UI", 13.8F, FontStyle.Bold, GraphicsUnit.Point, 0);
            btnLogin.Location = new Point(64, 299);
            btnLogin.Name = "btnLogin";
            btnLogin.Size = new Size(172, 40);
            btnLogin.TabIndex = 8;
            btnLogin.Text = "Sign In";
            btnLogin.UseVisualStyleBackColor = false;
            btnLogin.Click += btnLogin_Click;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.BackColor = Color.FromArgb(255, 192, 128);
            label4.Location = new Point(48, 216);
            label4.Name = "label4";
            label4.Size = new Size(73, 20);
            label4.TabIndex = 7;
            label4.Text = "Password:";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.BackColor = Color.FromArgb(255, 192, 128);
            label2.Location = new Point(49, 125);
            label2.Name = "label2";
            label2.Size = new Size(49, 20);
            label2.TabIndex = 6;
            label2.Text = "Email:";
            // 
            // txtPassword
            // 
            txtPassword.Location = new Point(44, 241);
            txtPassword.Name = "txtPassword";
            txtPassword.Size = new Size(220, 27);
            txtPassword.TabIndex = 5;
            txtPassword.UseSystemPasswordChar = true;
            // 
            // txtEmail
            // 
            txtEmail.Location = new Point(44, 151);
            txtEmail.Name = "txtEmail";
            txtEmail.Size = new Size(220, 27);
            txtEmail.TabIndex = 4;
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.BackColor = Color.White;
            label3.FlatStyle = FlatStyle.Flat;
            label3.Font = new Font("Wide Latin", 16.2F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label3.Location = new Point(49, 42);
            label3.Name = "label3";
            label3.Size = new Size(200, 34);
            label3.TabIndex = 3;
            label3.Text = "LOGIN";
            // 
            // LoginForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(534, 478);
            Controls.Add(panel1);
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "LoginForm";
            ShowIcon = false;
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Login";
            panel1.ResumeLayout(false);
            panel1.PerformLayout();
            panel2.ResumeLayout(false);
            panel2.PerformLayout();
            ResumeLayout(false);
        }

        #endregion

        private Panel panel1;
        private Panel panel2;
        private Label label1;
        private Label label3;
        private TextBox txtPassword;
        private TextBox txtEmail;
        private Button btnLogin;
        private Label label4;
        private Label label2;
    }
}
