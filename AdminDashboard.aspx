<%@ Page Title="" Language="C#" MasterPageFile="~/StatusAdminDashboardMaster.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="OnlineStudentAdmission.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 173px;
    }
    .auto-style2 {
        width: 196px;
    }
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <div class="row content">
            <div class="col-sm-8 text-left">
                <div class="container">
                    <h2>Manage User</h2>
                    <p>Add,Update or delete user and password.</p>
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">Modify User</div>
                            <div class="panel-body">
                                <asp:GridView ID="gdUserInfo" runat="server" AutoGenerateColumns="false" DataKeyNames="Id"
                                    OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                                    OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added.">
                                    <Columns>
                                        <asp:TemplateField HeaderText="User Name" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Username") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Password" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtPassword" runat="server" Text='<%# Eval("Password") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150" />
                                    </Columns>

                                </asp:GridView>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">Add New User</div>
                            <div class="panel-body">
                                <table border="0" class="nav-justified" cellpadding="0" cellspacing="0" style="text-align: left; border-collapse: separate">

                        <tr>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtUserName" placeholder="User Name" runat="server" Width="140" />
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtPassword" placeholder="Password" runat="server" Width="140" />
                            </td>
                            <td>
                                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" Width="60px" />
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
</asp:Content>
