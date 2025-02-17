using System;
using System.Data.SqlClient;
using System.Web;

namespace OJTTracker
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.Now.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache); // Corrected line
            Response.Cache.SetNoStore();

            if (Session["UserID"] != null)
            {
                // If logged in, redirect to the User Dashboard
                Response.Redirect("UserDashboard.aspx");
            }
        }

        protected void Loginbtn_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=JESSA\\SQLEXPRESS;Initial Catalog=OJTTrackerDB;Integrated Security=True;Encrypt=False";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "SELECT * FROM Users WHERE Email = @Email AND PasswordHash = @Password";

                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@Email", username.Text);
                        cmd.Parameters.AddWithValue("@Password", password.Text);

                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.HasRows)
                        {
                            reader.Read();
                            string role = reader["Role"].ToString();
                            int userId = Convert.ToInt32(reader["UserID"]); // Get UserID

                            // Store UserID and Role in session
                            Session["UserID"] = userId;
                            Session["UserRole"] = role;
                            Session["UserEmail"] = username.Text;

                            reader.Close();
                            if (role == "Admin")
                            {
                                Response.Redirect("AdminDashboard.aspx");
                            }
                            else
                            {
                                Response.Redirect("UserDashboard.aspx");
                            }
                        }
                        else
                        {
                            Errorlabel.Text = "Invalid email or Password";
                        }
                        reader.Close();
                    }
                }
                catch (Exception ex)
                {
                    Errorlabel.Text = ex.Message;
                }


            }
        }
    }
}