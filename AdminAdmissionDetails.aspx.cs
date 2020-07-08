using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineStudentAdmission.Models;

namespace OnlineStudentAdmission
{
    public partial class AdminAdmissionDetails : System.Web.UI.Page
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
                gdDetails.DataSource =
                    (from adm in entities.tbl_Std_Admission_Details
                     select new { adm.Admission_Id, adm.Name,adm.Dateofbirth, adm.Mobile, adm.Email, adm.Gender, adm.Category }).ToList();
                gdDetails.DataBind();
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != gdDetails.EditIndex)
            {
                (e.Row.Cells[6].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            gdDetails.EditIndex = e.NewEditIndex;
            this.BindGrid();
            GridViewRow row =gdDetails.Rows[e.NewEditIndex];
            string Id = Convert.ToString(gdDetails.DataKeys[e.NewEditIndex].Values[0]);
            TextBox txtDateofbirth = (row.FindControl("txtDateofbirth") as TextBox);
            RadioButtonList rdGender = (row.FindControl("rdGender") as RadioButtonList);

            using (OnlineStudentAdmissionEntities1 entities = new OnlineStudentAdmissionEntities1())
            {
                try
                {
                    tbl_Std_Admission_Details user = (from c in entities.tbl_Std_Admission_Details
                                                      where c.Admission_Id == Id
                                                      select c).FirstOrDefault();
                    txtDateofbirth.Text = user.Dateofbirth.ToString("yyyy-MM-dd");
                    rdGender.SelectedValue = user.Gender;

                }
                catch (Exception ex) { }
            }
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            gdDetails.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gdDetails.Rows[e.RowIndex];
            string Id = Convert.ToString(gdDetails.DataKeys[e.RowIndex].Values[0]);
            string name = (row.FindControl("txtName") as TextBox).Text;
            DateTime dt = Convert.ToDateTime((row.FindControl("txtDateofbirth") as TextBox).Text);
            int mobile = Convert.ToInt32((row.FindControl("txtMobile") as TextBox).Text);
            string email = (row.FindControl("txtEmail") as TextBox).Text;
            RadioButtonList gender = (row.FindControl("rdGender") as RadioButtonList);
            DropDownList ddlCategory = (row.FindControl("ddlCategory") as DropDownList);
            using (OnlineStudentAdmissionEntities1 entities = new OnlineStudentAdmissionEntities1())
            {
                try
                {
                    tbl_Std_Admission_Details user = (from c in entities.tbl_Std_Admission_Details
                                                      where c.Admission_Id == Id
                                                      select c).FirstOrDefault();
                    user.Name = name;
                    user.Dateofbirth = dt;
                    user.Mobile = mobile;
                    user.Email = email;
                    user.Gender = gender.SelectedValue;
                    user.Category = ddlCategory.SelectedValue;
                    entities.SaveChanges();
                }
                catch (Exception ex) { }
            }
            gdDetails.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string Id = Convert.ToString(gdDetails.DataKeys[e.RowIndex].Values[0]);
            using (OnlineStudentAdmissionEntities1 entities = new OnlineStudentAdmissionEntities1())
            {
                tbl_Std_Admission_Details user = (from c in entities.tbl_Std_Admission_Details
                                                  where c.Admission_Id == Id
                                                  select c).FirstOrDefault();
                entities.tbl_Std_Admission_Details.Remove(user);
                entities.SaveChanges();
            }
            this.BindGrid();
        }

    }
}