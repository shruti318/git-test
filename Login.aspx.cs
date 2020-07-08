using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineStudentAdmission.Models;

namespace OnlineStudentAdmission
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            OnlineStudentAdmissionEntities1 stdAdm = new OnlineStudentAdmissionEntities1();
            var result = stdAdm.GetLoginInfo(txtUsername.Text.Trim(), txtPassword.Text.Trim());
            string str = result.FirstOrDefault();

            if (str != "User Does not Exists")
            {
                string userid = str.Split(',')[0];
                string IsAdmin = str.Split(',')[1];
                Session["ID"] = userid;
                //Session["IsAdmin"] = IsAdmin;
                Session["username"] = txtUsername.Text.Trim();
                if (IsAdmin == "1")
                {
                    Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                    Response.Redirect("Dashboard.aspx");
                }

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + str + "');", true);
            }
        }
    }
}