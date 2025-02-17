using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace OJTTracker
{
    public partial class UserDashboard : System.Web.UI.Page
    {
        private string connectionString = "Data Source=JESSA\\SQLEXPRESS;Initial Catalog=OJTTrackerDB;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("Login.aspx"); // Redirect if not logged in
                    return;
                }
                LoadTimeLogs();
                LoadUserProfile();
            }
           
        }

        private void LoadUserProfile()
        {
            string userId = Session["UserID"].ToString();
            string conn = "Data Source=JESSA\\SQLEXPRESS;Initial Catalog=OJTTrackerDB;Integrated Security=True;Encrypt=False";

            using (SqlConnection connConn = new SqlConnection(conn))
            {
                connConn.Open();
                string query = " SELECT Name FROM Users Where UserID = @UserID";
                using (SqlCommand cmd = new SqlCommand(query, connConn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        string name = reader["Name"].ToString();

                        lblProfilename.Text = name;
                    }
                }
            }
        }

        private void LoadTimeLogs()
        {
            if (Session["UserID"] == null) return;

            string query = "SELECT TimeIn, BreakIn, BreakOut, TimeOut, TotalHours, LogDate FROM TimeLogs WHERE UserID = @UserID ORDER BY LogDate DESC";

            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                conn.Open();
                da.Fill(dt);
                gvTimeLogs.DataSource = dt;
                gvTimeLogs.DataBind();
            }

            // **Fetch Total Hours Worked Today**
            string totalHoursQuery = @"
                SELECT SUM(
                 (DATEDIFF(MINUTE, TimeIn, TimeOut) - 
                    COALESCE(DATEDIFF(MINUTE, BreakIn, BreakOut), 0)) / 60.0) AS TotalHoursWorked
                FROM TimeLogs 
                WHERE UserID = @UserID AND CAST(LogDate AS DATE) = CAST(GETDATE() AS DATE)";

            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(totalHoursQuery, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                conn.Open();
                object result = cmd.ExecuteScalar();
                double totalHours = result != DBNull.Value ? Convert.ToDouble(result) : 0;

                // Update the label to show correct total work hours
                lblTotalHours.Text = totalHours.ToString("F2");
            }
            string totalOverallHoursQuery = @"
        SELECT SUM(
            (DATEDIFF(MINUTE, TimeIn, TimeOut) - 
            COALESCE(DATEDIFF(MINUTE, BreakIn, BreakOut), 0)) / 60.0) AS TotalOverallHours
        FROM TimeLogs 
        WHERE UserID = @UserID";

            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(totalOverallHoursQuery, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                conn.Open();
                object result = cmd.ExecuteScalar();
                double totalOverallHours = result != DBNull.Value ? Convert.ToDouble(result) : 0;

                // Update the label for total overall work hours
                lblTotalHoursWorked.Text = totalOverallHours.ToString("F2") + " hrs";
            }
        }


        protected void btnTimeIn_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null) return;

            string query = @"
                IF NOT EXISTS (SELECT 1 FROM TimeLogs WHERE UserID = @UserID AND CAST(TimeIn AS DATE) = CAST(GETDATE() AS DATE))
                INSERT INTO TimeLogs (UserID, TimeIn, LogDate) VALUES (@UserID, GETDATE(), GETDATE())";

            ExecuteNonQuery(query);
            LoadTimeLogs();
        }

        protected void btnBreakIn_Click(object sender, EventArgs e)
        {
            UpdateTimeLog("BreakIn");
        }

        protected void btnBreakOut_Click(object sender, EventArgs e)
        {
            UpdateTimeLog("BreakOut");
        }

        protected void btnTimeOut_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null) return;

            string query = @"
                UPDATE TimeLogs 
        SET TimeOut = GETDATE()
        WHERE UserID = @UserID AND TimeOut IS NULL";

            ExecuteNonQuery(query);
            LoadTimeLogs();
        }

        private void UpdateTimeLog(string columnName)
        {
            if (Session["UserID"] == null) return;

            string query = $@"
                UPDATE TimeLogs 
                SET {columnName} = GETDATE() 
                WHERE UserID = @UserID AND {columnName} IS NULL";

            ExecuteNonQuery(query);
            LoadTimeLogs();
        }

        private void ExecuteNonQuery(string query)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
