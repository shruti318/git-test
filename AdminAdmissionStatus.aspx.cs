using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineStudentAdmission.Models;

namespace OnlineStudentAdmission
{
    public partial class AdminAdmissionStatus : System.Web.UI.Page
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
                gdStatus.DataSource =
                    (from adm in entities.tbl_Std_Admission_Details
                     select new { adm.Admission_Id, adm.Name, adm.Application_Status, adm.Verification_Status,adm.Username }).ToList();
                gdStatus.DataBind();
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != gdStatus.EditIndex)
            {
                (e.Row.Cells[4].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            gdStatus.EditIndex = e.NewEditIndex;
            this.BindGrid();
            GridViewRow row = gdStatus.Rows[e.NewEditIndex];
            string Id = Convert.ToString(gdStatus.DataKeys[e.NewEditIndex].Values[0]);
            DropDownList ddlApplicantion = (row.FindControl("ddlApplicantion") as DropDownList);
            DropDownList ddlVerification = (row.FindControl("ddlVerification") as DropDownList);

            using (OnlineStudentAdmissionEntities1 entities = new OnlineStudentAdmissionEntities1())
            {
                try
                {
                    tbl_Std_Admission_Details user = (from c in entities.tbl_Std_Admission_Details
                                                      where c.Admission_Id == Id
                                                      select c).FirstOrDefault();
                    ddlApplicantion.SelectedValue= Boolean.Parse((user.Application_Status).ToString())?"true":"false" ;
                    ddlVerification.SelectedValue = Boolean.Parse((user.Verification_Status).ToString()) ? "true" : "false";

                }
                catch (Exception ex) { }
            }

        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            gdStatus.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gdStatus.Rows[e.RowIndex];
            string Id = Convert.ToString(gdStatus.DataKeys[e.RowIndex].Values[0]);
            string name = (row.FindControl("txtName") as TextBox).Text;
            DropDownList ddlApplicantion = (row.FindControl("ddlApplicantion") as DropDownList);
            DropDownList ddlVerification = (row.FindControl("ddlVerification") as DropDownList);
            using (OnlineStudentAdmissionEntities1 entities = new OnlineStudentAdmissionEntities1())
            {
                try
                {
                    tbl_Std_Admission_Details user = (from c in entities.tbl_Std_Admission_Details
                                                      where c.Admission_Id == Id
                                                      select c).FirstOrDefault();
                    user.Name = name;
                    user.Application_Status = Convert.ToBoolean(ddlApplicantion.SelectedValue);
                    user.Verification_Status = Convert.ToBoolean(ddlVerification.SelectedValue);
                    entities.SaveChanges();
                }
                catch (Exception ex) { }
            }
            gdStatus.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string Id = Convert.ToString(gdStatus.DataKeys[e.RowIndex].Values[0]);
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