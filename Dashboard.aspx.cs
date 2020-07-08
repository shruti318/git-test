using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineStudentAdmission.Models;

namespace OnlineStudentAdmission
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (OnlineStudentAdmissionEntities1 _entity = new OnlineStudentAdmissionEntities1())
            {
                if (Session["ID"] != null)
                {
                    int userid = Convert.ToInt32(Session["ID"]);
                    tbl_Std_Admission_Details _student = _entity.tbl_Std_Admission_Details.Where(x => x.CreatedBy == userid).Select(x => x).FirstOrDefault();
                    if (_student != null)
                        if (_student.Admission_Id != null)
                        {
                            {
                                Session["Admission_id"] = _student.Admission_Id;
                                lblApplicantName.Text = _student.Name;
                                lblAppplicationStatus.Text = _student.Application_Status ? "Submitted" : "Pending";
                                lblVerification.Text = _student.Verification_Status ? "Verified" : "Pending";
                                lblAdmission_Id.Text = _student.Admission_Id;

                                if (_student.Application_Status == true)
                                {
                                    Session["Application_Status"] = "Submitted";
                                }
                                else
                                {
                                    Session["Application_Status"] = "Pending";

                                }
                            }
                        }
                }


            }


        }
    }
}