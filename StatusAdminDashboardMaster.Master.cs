using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineStudentAdmission
{
    public partial class StatusAdminDashboardMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                lbluser.Text = Session["username"].ToString();
            }
            else 
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}