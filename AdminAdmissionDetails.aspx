<%@ Page Title="" Language="C#" MasterPageFile="~/StatusAdminDashboardMaster.Master" AutoEventWireup="true" CodeBehind="AdminAdmissionDetails.aspx.cs" Inherits="OnlineStudentAdmission.AdminAdmissionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid text-center">
        <div class="row content">
            <div class="col-sm-8 text-left">
                <div class="container">
                    <h2>Admission Details</h2>
                    <p>&nbsp;</p>
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">Applicantion Details</div>
                            <div class="panel-body">
                                <asp:GridView ID="gdDetails" runat="server" AutoGenerateColumns="false" DataKeyNames="Admission_Id" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                                    OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added.">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Applicant Name" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date Of Birth" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDateofbirth" runat="server" Text='<%# Eval("Dateofbirth") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtDateofbirth" runat="server" TextMode="Date"  Text='<%# Eval("Dateofbirth") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mobile" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtMobile" runat="server" TextMode="Number" Text='<%# Eval("Mobile") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Text='<%# Eval("Email") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Gender" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:RadioButtonList ID="rdGender" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="Male">Male </asp:ListItem>
                                                    <asp:ListItem Value="Female">Female </asp:ListItem>
                                                </asp:RadioButtonList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Category" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCategory" runat="server"
                                                    Text='<%# Eval("Category") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddlCategory" runat="server">
                                                    <asp:ListItem Value="General">General</asp:ListItem>
                                                    <asp:ListItem Value="OBC">OBC</asp:ListItem>
                                                    <asp:ListItem Value="other">other</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150" />
                                    </Columns>
                                </asp:GridView>
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
