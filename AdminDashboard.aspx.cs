using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineStudentAdmission.Models;

namespace OnlineStudentAdmission
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        private void BindGrid()
        {
            using (OnlineStudentAdmissionEntities1 entities = new OnlineStudentAdmissionEntities1())
            {

                gdUserInfo.DataSource =
                    (from user in entities.UserLogIn
                     select new { user.Id, user.Username, user.Password }).ToList();

                gdUserInfo.DataBind();
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != gdUserInfo.EditIndex)
            {
                (e.Row.Cells[2].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            gdUserInfo.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            gdUserInfo.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gdUserInfo.Rows[e.RowIndex];
            int Id = Convert.ToInt32(gdUserInfo.DataKeys[e.RowIndex].Values[0]);
            string name = (row.FindControl("txtName") as TextBox).Text;
            string password = (row.FindControl("txtPassword") as TextBox).Text;
            using (OnlineStudentAdmissionEntities1 entities = new OnlineStudentAdmissionEntities1())
            {
                UserLogIn user = (from c in entities.UserLogIn
                                  where c.Id == Id
                                  select c).FirstOrDefault();
                user.Username = name;
                user.Password = password;
                entities.SaveChanges();
            }
            gdUserInfo.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Id = Convert.ToInt32(gdUserInfo.DataKeys[e.RowIndex].Values[0]);
            using (OnlineStudentAdmissionEntities1 entities = new OnlineStudentAdmissionEntities1())
            {
                UserLogIn user = (from c in entities.UserLogIn
                                  where c.Id == Id
                                  select c).FirstOrDefault();
                entities.UserLogIn.Remove(user);
                entities.SaveChanges();
            }
            this.BindGrid();
        }

        protected void Insert(object sender, EventArgs e)
        {
            using (OnlineStudentAdmissionEntities1 entities = new OnlineStudentAdmissionEntities1())
            {
                UserLogIn user = new UserLogIn
                {
                    Username = txtUserName.Text,
                    Password = txtPassword.Text,
                    IsAdmin = false,
                    LoginDate = System.DateTime.Now
                };
                entities.UserLogIn.Add(user);
                entities.SaveChanges();
                txtPassword.Text = "";
                txtUserName.Text = "";
            }

            this.BindGrid();
        }

    }
}