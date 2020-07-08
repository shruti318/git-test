<%@ Page Title="" Language="C#" MasterPageFile="~/StatusAdminDashboardMaster.Master" AutoEventWireup="true" CodeBehind="AdminAdmissionStatus.aspx.cs" Inherits="OnlineStudentAdmission.AdminAdmissionStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                <asp:GridView ID="gdStatus" runat="server" AutoGenerateColumns="false" DataKeyNames="Admission_Id" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
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
                                        <asp:TemplateField HeaderText="Applicantion status" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApplication_Status" runat="server"
                                                    Text='<%# Boolean.Parse(Eval("Application_Status").ToString()) ? "Submitted" : "Pending" %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddlApplicantion" runat="server">
                                                    <asp:ListItem Value="true">Submit</asp:ListItem>
                                                    <asp:ListItem Value="false">Pending</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Verification Status" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblVerification_Status" runat="server" 
                                                     Text='<%# Boolean.Parse(Eval("Verification_Status").ToString()) ? "Verified" : "Pending" %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddlVerification" runat="server">
                                                    <asp:ListItem Value="true">Submit</asp:ListItem>
                                                    <asp:ListItem Value="false">Pending</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Created By" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCreatedBy" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtCreatedBy" runat="server" Enabled="false" Text='<%# Eval("Username") %>'></asp:TextBox>
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
