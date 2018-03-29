<%@ Page Title="Generate Grade History Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Marksheet.aspx.cs" Inherits="Info.Student.Report.Marksheet" %>
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
                <h4><%# Title %></h4>
                <hr />
                <div class="col-md-12">
                    <asp:RadioButtonList runat="server" ID="Semester" BorderWidth="0px" CssClass="form-control" AutoPostBack="true" DataSourceID="SqlDataSource1" DataTextField="Semester" DataValueField="Semester" />
                    
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT [Semester] FROM [Result] WHERE ([StudentID] = @StudentID)">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="UserID" Name="StudentID" Type="String"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="GenerateReport" CssClass="btn btn-primary" Text="Generate Report" runat="server" OnClick="GenerateReport_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
