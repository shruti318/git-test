<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineStudentAdmission.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 900px;
            height: 285px;
        }

        .auto-style12 {
            width: 121px;
        }

        .row.content {
            height: 510px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center" style="width: 50%;">
        <div class="row content">
            <div class="col-sm-8 text-left">
                <div class="container" style="width: 900px;">
                    <h2>&nbsp;</h2>
                    <p>&nbsp;</p>
                    <div class="panel-group" style="width: 50%;">
                        <div class="panel panel-default">
                            <div class="panel-heading">User Login</div>
                            <div class="panel-body">
                                <table class="nav-justified">
                                    <h2>Login</h2>
                                    <div class="input-group" style="width: 40%">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <asp:TextBox ID="txtUsername" class="form-control" placeholder="Username" runat="server"></asp:TextBox>
                                    </div>
                                    <br />
                                    <div class="input-group" style="width: 40%">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <asp:TextBox ID="txtPassword" class="form-control" TextMode="Password"  placeholder="Password" runat="server"></asp:TextBox>
                                    </div>
                                    <br />
                                    <div class="input-group">
                                        <asp:Button ID="btnLogIn" class="btn btn-default" runat="server" Text="Login" OnClick="btnLogIn_Click" Width="78px" />
                                    </div>
                                    <br />
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

