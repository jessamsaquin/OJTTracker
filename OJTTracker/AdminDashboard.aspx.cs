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
                BindGrid();
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
                string query = "SELECT UserID, Name, Email, Role, CreatedAt FROM Users WHERE Role = 'User'";

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


                LoadInternList();
                lblTotalInterns.Text = GetTotalInternCount().ToString();
            }
        }

        protected void chkShowPasswordchange(object sender, EventArgs e)
        {
            txtPassword.TextMode = chkShowPassword.Checked ? TextBoxMode.SingleLine : TextBoxMode.Password;
        }

        protected void EditIntern(object sender, EventArgs e)
        {

            LinkButton lnkButton = sender as LinkButton;
            GridViewRow gvRow = lnkButton.NamingContainer as GridViewRow;


            string userID = gvInterns.DataKeys[gvRow.RowIndex].Value.ToString();


            PopulateEditForm(userID);


            EditPopupPanel.Visible = true;
        }

        private void PopulateEditForm(string userID)
        {
            string connectionString = "Data Source=JESSA\\SQLEXPRESS;Initial Catalog=OJTTrackerDB;Integrated Security=True;Encrypt=False";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT UserID, Name, Email, Role FROM Users WHERE UserID = @UserID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtEditUserID.Text = reader["UserID"].ToString();
                            txtEditName.Text = reader["Name"].ToString();
                            txtEditEmail.Text = reader["Email"].ToString();
                            ddlEditRole.SelectedValue = reader["Role"].ToString();
                        }
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string connectionString = "Data Source=JESSA\\SQLEXPRESS;Initial Catalog=OJTTrackerDB;Integrated Security=True;Encrypt=False";

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query;
                    SqlCommand cmd;

                    if (string.IsNullOrEmpty(txtEditPassword.Text))
                    {// Update without new password
                        query = "UPDATE Users SET Name = @Name, Email = @Email, Role = @Role WHERE UserID = @UserID";
                        cmd = new SqlCommand(query, conn);
                    }
                    else
                    {
                        // Update with new password
                        query = "UPDATE Users SET Name = @Name, Email = @Email, PasswordHash = @PasswordHash, Role = @Role WHERE UserID = @UserID";
                        cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@PasswordHash", GetHash(txtEditPassword.Text));
                    }

                    cmd.Parameters.AddWithValue("@UserID", txtEditUserID.Text);
                    cmd.Parameters.AddWithValue("@Name", txtEditName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEditEmail.Text);
                    cmd.Parameters.AddWithValue("@Role", ddlEditRole.SelectedValue);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }


                LoadInternList();
                EditPopupPanel.Visible = false;
            }
        }

        protected void btnCloseEdit_Click(object sender, EventArgs e)
        {
            EditPopupPanel.Visible = false;
        }

        protected void DeleteIntern(object sender, EventArgs e)
        {

            LinkButton lnkButton = sender as LinkButton;
            GridViewRow gvRow = lnkButton.NamingContainer as GridViewRow;


            string userID = gvInterns.DataKeys[gvRow.RowIndex].Value.ToString();

            string connectionString = "Data Source=JESSA\\SQLEXPRESS;Initial Catalog=OJTTrackerDB;Integrated Security=True;Encrypt=False";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Users WHERE UserID = @UserID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            LoadInternList();
            lblTotalInterns.Text = GetTotalInternCount().ToString();
        }



        protected void BindGrid(string searchText = "")
        {
            string connectionString = "Data Source=JESSA\\SQLEXPRESS;Initial Catalog=OJTTrackerDB;Integrated Security=True;Encrypt=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT UserID, Name, Email, Role, CreatedAt FROM Users WHERE Role = 'User' AND (Name LIKE @Search OR Email LIKE @Search)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Search", "%" + searchText + "%");
                    con.Open();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvInterns.DataSource = dt;
                    gvInterns.DataBind();
                }
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BindGrid(txtSearch.Text.Trim()); // Call BindGrid with search text
        }
    }
    }

       
    // <-- This properly closes the `AdminDashboard` class. REMOVE any extra `}` after this!
