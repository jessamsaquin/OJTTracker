using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using Microsoft.AspNetCore.Identity;

namespace OJTTracker
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("Login.aspx"); // Redirect if not logged in
                    return;
                }
                
                LoadInternList();
                lblTotalInterns.Text = GetTotalInternCount().ToString();
            }
        }

        protected void LblLogout(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();

            Response.Redirect("Login.aspx");

        }

        private int GetTotalInternCount()
        {
            int count = 0;
            string connectionString = "Data Source=JESSA\\SQLEXPRESS;Initial Catalog=OJTTrackerDB;Integrated Security=True;Encrypt=False";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Users Where Role = 'User'";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    count = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            return count;
        }

        private void LoadInternList()
        {
            string connectionString = "Data Source=JESSA\\SQLEXPRESS;Initial Catalog=OJTTrackerDB;Integrated Security=True;Encrypt=False";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT UserID, Name, Email, CreatedAt FROM Users WHERE Role = 'User'";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        gvInterns.DataSource = dt;
                        gvInterns.DataBind();
                    }
                }
            }
        }

        protected void AddNewbtn(object sender, EventArgs e)
        {
            Popuppnl.Visible = true;

            txtName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            ddlRole.SelectedIndex = 0;

            }

        private object GetHash(string password)
        {
            var hasher = new PasswordHasher<object>();
            return hasher.HashPassword(null, password);
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Popuppnl.Visible = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string connectionString = "Data Source=JESSA\\SQLEXPRESS;Initial Catalog=OJTTrackerDB;Integrated Security=True;Encrypt=False";
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Users (Name, Email, PasswordHash, Role, CreatedAt) VALUES (@Name, @Email, @PasswordHash, @Role, @CreatedAt)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@PasswordHash", GetHash(txtPassword.Text));
                        cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);
                        cmd.Parameters.AddWithValue("@CreatedAt", DateTime.Now);
                        cmd.ExecuteNonQuery();
                    }
                }

                Popuppnl.Visible = false;

                // Refresh GridView
                LoadInternList();
            }
        }

        protected void chkShowPasswordchange(object sender, EventArgs e)
        {
            txtPassword.TextMode = chkShowPassword.Checked ? TextBoxMode.SingleLine : TextBoxMode.Password;
        }
    }
}