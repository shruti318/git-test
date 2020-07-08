using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineStudentAdmission.Models;

namespace OnlineStudentAdmission
{
    public partial class AdmissionDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["Admission_id"] != null)
                {
                    using (OnlineStudentAdmissionEntities1 _entity = new OnlineStudentAdmissionEntities1())
                    {
                        string Admission_id = Convert.ToString(Session["Admission_id"]);
                        tbl_Std_Admission_Details _student = _entity.tbl_Std_Admission_Details.Where(x => x.Admission_Id == Admission_id).Select(x => x).FirstOrDefault();
                        txtApplicantName.Text = _student.Name;
                        txtMobile.Text = Convert.ToString(_student.Mobile);
                        txtEmail.Text = _student.Email;
                        rdGender.SelectedValue = _student.Gender;
                        ddlCategory.SelectedValue = _student.Category;
                        if (((string)Session["Application_Status"]) == "Submitted")
                        {
                            btnBasic.Enabled = false;
                        }
                    }
                }
            }
        }

        protected void btnBasic_Click(object sender, EventArgs e)
        {
            try
            {
                using (OnlineStudentAdmissionEntities1 _entity = new OnlineStudentAdmissionEntities1())
                {
                    tbl_Std_Admission_Details basicdetails = new tbl_Std_Admission_Details();
                    basicdetails.Name = txtApplicantName.Text.Trim();
                    basicdetails.Mobile = Convert.ToInt32(txtMobile.Text);
                    basicdetails.Email = txtEmail.Text.Trim();
                    basicdetails.Gender = rdGender.SelectedValue;
                    basicdetails.Category = ddlCategory.SelectedValue;
                    basicdetails.CreatedBy = Convert.ToInt32(Session["ID"]);
                    basicdetails.CreatedDate = DateTime.Now;
                    bool result;
                    result = SaveBasicDetails(basicdetails); // calling SaveStudentDetails method to save the record in table.Here passing a basic details object as parameter  
                    if (result == true)
                    {
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                    }
                }
            }
            catch (Exception ex)
            {
            }

        }


        private bool SaveBasicDetails(tbl_Std_Admission_Details basicdetails)
        {
            bool result = false;
            using (OnlineStudentAdmissionEntities1 _entity = new OnlineStudentAdmissionEntities1())
            {
                int userid = Convert.ToInt32(Session["ID"].ToString());
                UserLogIn _user = _entity.UserLogIn.Where(x => x.Id == userid).Select(x => x).FirstOrDefault();
                basicdetails.Username = _user.Username;
                basicdetails.Password = _user.Password;
                if (Session["Admission_id"] == null)
                {
                    _entity.tbl_Std_Admission_Details.Add(basicdetails);
                    _entity.SaveChanges();
                    result = true;
                    tbl_Std_Admission_Details _student = _entity.tbl_Std_Admission_Details.Where(x => x.CreatedBy == userid).Select(x => x).FirstOrDefault();
                    _student.Admission_Id = basicdetails.Admission_Id;
                    Session["Admission_Id"] = _student.Admission_Id;
                }
                else
                {
                    tbl_Std_Admission_Details _student = _entity.tbl_Std_Admission_Details.Where(x => x.CreatedBy == userid).Select(x => x).FirstOrDefault();
                    _student.Name = basicdetails.Name;
                    _student.Mobile = basicdetails.Mobile;
                    _student.Gender = basicdetails.Gender;
                    _student.Category = basicdetails.Category;
                    _entity.SaveChanges();
                    result = true;
                }

            }
            return result;
        }
    }
}