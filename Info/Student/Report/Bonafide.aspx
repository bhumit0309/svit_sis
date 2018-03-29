<%@ Page Title="Bonafide Certificate" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bonafide.aspx.cs" Inherits="Info.Student.Report.Bonafide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
            <li><asp:Image runat="server" ID="ProfilePicsThumb" Height="50px" Width="50px" CssClass="img-circle" /></li>
            <li><a runat="server" href="Profile"><%=HttpContext.Current.Session["Role"]%>: <b><%=HttpContext.Current.Session["FirstName"]%> <%=HttpContext.Current.Session["LastName"]%></b></a></li>
            <li><a runat="server" href="~/Account/ManagePassword">Change Password</a></li>
            <li><a runat="server" href="~/Account/Logout">Logout</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h4>Purpose for Bonafide Certificate</h4>
                <hr />
                <div class="col-md-12">
                    <asp:RadioButtonList runat="server" ID="Purpose" RepeatDirection="Vertical" BorderWidth="0" OnSelectedIndexChanged="showhidediv" CssClass="form-control" AutoPostBack="true">
                        <asp:ListItem Selected="True" Text="Passport" />
                        <asp:ListItem Text="Others" />
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="PurposeRequired" runat="server" ControlToValidate="Purpose" ErrorMessage="Select any one option." />
                    <div id="other" runat="server">
                        <p class="info">Please Specify.</p>
                        <br />
                        <asp:TextBox runat="server" ID="SpecialPurpose" />
                        <asp:RequiredFieldValidator ID="SpecialPurposeRequired" runat="server" ControlToValidate="SpecialPurpose" ErrorMessage="Required" CssClass="text-danger" />
                        <br />
                    </div>
                    <div>
                        <asp:Button ID="GenerateReport" CssClass="btn btn-primary" Text="Generate Report" OnClick="GenerateReport_Click" runat="server"/>
                    
                    </div>
                    <br /><br />
                    <p class="text-danger"><b>Note: </b>Student need to get it signed from the Principal for authentication.</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
