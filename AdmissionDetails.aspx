<%@ Page Title="" Language="C#" MasterPageFile="~/StatusDashboardMaster.Master" AutoEventWireup="true" CodeBehind="AdmissionDetails.aspx.cs" Inherits="OnlineStudentAdmission.AdmissionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            width: 146px;
        }

        .auto-style2 {
            width: 146px;
            height: 24px;
        }

        .auto-style3 {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <div class="row content">
            <div class="col-sm-8 text-left">
                <div class="container">
                    <h2>Admission Details </h2>
                    <p>
                        Kindly proceed step by step and follow the guidelines.
                    </p>
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#basic">Basic</a></li>
                        <li><a data-toggle="tab" href="#">Personal</a></li>
                        <li><a data-toggle="tab" href="#">Academic</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="basic" class="tab-pane fade in active">
                            <h3>Basic Details</h3>
                            <table class="nav-justified" style="margin: 5px; padding: 5px; border-spacing: 5px; border-collapse: separate">
                                <tr>
                                    <td class="auto-style1">Applicant Name</td>
                                    <td>
                                        <asp:TextBox ID="txtApplicantName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="auto-style1">Mobile</td>
                                    <td>
                                        <asp:TextBox ID="txtMobile" runat="server" TextMode="Number"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">Email</td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">Gender</td>
                                    <td>
                                        <asp:RadioButtonList ID="rdGender" ForeColor="black" runat="server" RepeatDirection="Horizontal" BorderColor="Black">
                                            <asp:ListItem Selected="True" Value="Male">Male</asp:ListItem>
                                            <asp:ListItem Value="Female">Female</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Category</td>
                                    <td class="auto-style3">
                                        <asp:DropDownList ID="ddlCategory" runat="server">
                                            <asp:ListItem Selected="True">select</asp:ListItem>
                                            <asp:ListItem>General</asp:ListItem>
                                            <asp:ListItem>OBC</asp:ListItem>
                                            <asp:ListItem>other</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnBasic" CssClass="btn-primary" runat="server" Text="Save & Next" OnClick="btnBasic_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
