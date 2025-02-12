using System;
using System.Data.SqlClient;

namespace OJTTracker
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

                            Session["UserEmail"] = username.Text;
                            Session["UserRole"] = role;

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