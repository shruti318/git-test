<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="OnlineStudentAdmission.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row content">
            <div class="col-sm-8 text-left">
                <div class="container" style="width: 900px;">
                    <table>
                        <tr>
                            <td>
                                <marquee behavior="scroll" height="100px" direction="right" scroll onmouseover="this.setAttribute('scrollamount', 0, 0);this.stop();" onmouseout="this.setAttribute('scrollamount', 5, 0);this.start();" scrollamount="12" valign="center">
                    <img src="Images/Onlinestd1.jpg" />
                    <img src="Images/onlinestd2.jpg" />
                    <img src="Images/onlinestd3.jpg" />
                    <img src="Images/onlinestd4.jpg" />
                    <img src="Images/onlinestd5.jpg" />
                </marquee>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="container-fluid text-center">
                                    <div class="row content">
                                        <div class="col-sm-8 text-left">
                                            <h1>Welcome</h1>
                                            <p>
                                                'Online Student Admission System' is to automate  admission structure and its related operation and functionality. 
                    The objective of the initiative is to provide support to the academic staff and admission seeking candidates by providing a faster,   easy and transparent approach of keeping records and use them for reference and further proceedings.
                                            </p>
                                            <hr />
                                            <h3>Steps For Online Admission</h3>
                                            <p>
                                                Firstly Login ,and follow the instrucions .
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
