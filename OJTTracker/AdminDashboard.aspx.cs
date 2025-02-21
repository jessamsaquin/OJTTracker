using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            }
        }

        protected void LblLogout(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();

            Response.Redirect("Login.aspx");

        }
    }
}