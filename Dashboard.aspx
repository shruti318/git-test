<%@ Page Title="" Language="C#" MasterPageFile="~/StatusDashboardMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OnlineStudentAdmission.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 235px;
        }
        .auto-style2 {
            width: 236px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <div class="row content">
            <div class="col-sm-8 text-left">
                <div class="container">
                    <h2>Admission Status</h2>
                    <p>Kindly Visit Regularly For Latest Updates</p>
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">Applicant Information</div>
                            <div class="panel-body">
                                <table class="nav-justified">
                                    <tr>
                                        <td class="auto-style1">Application Number</td>
                                        <td>
                                            <asp:Label ID="lblAdmission_Id" runat="server" Text="Still Not Appplied"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">Applicant Name</td>
                                        <td>
                                            <asp:Label ID="lblApplicantName" runat="server" Text="Nill"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        
                        <div class="panel panel-default">
                            <div class="panel-heading">Summary</div>
                            <div class="panel-body">
                                <table class="nav-justified">
                                    <tr>
                                        <td class="auto-style2">Appplication Status</td>
                                        <td>
                                            <asp:Label ID="lblAppplicationStatus" runat="server" Text="Appplication Status will be shown here"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">Verification Status</td>
                                        <td>
                                            <asp:Label ID="lblVerification" runat="server" Text="Verification Status will be shown here"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <p>
        &nbsp;
    </p>

</asp:Content>
