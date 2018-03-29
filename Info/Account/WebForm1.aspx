<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Info.Account.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
        <li><a runat="server">Welcome <%=HttpContext.Current.Session["Role"]%>: <b><%=HttpContext.Current.Session["FirstName"]%> <%=HttpContext.Current.Session["LastName"]%></b></a></li>
        <li><a runat="server" href="~/Account/ManagePassword">Change Password</a></li>
        <li><a runat="server" href="~/Account/Logout">Logout</a></li>
        </ul>
    </div>
    <div class="jumbotron">
        <h1>Welcome to SVIT SIS</h1>
        <p class="lead">SVIT SIS will provide you the access to information from anywhere, anytime. It is developed to simplify the manual system of student data management.</p>
        <p><a href="../Account/ManageStudent" class="btn btn-primary btn-lg">Manage Student &raquo;</a> &emsp; <a href="../Account/ManageFaculty" class="btn btn-primary btn-lg">Manage Faculty &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Add new Student</h2>
            <p>
                The Student will be registered by the Administrator only. So kindly add details of the new Student.
            </p>
            <p>
                <a class="btn btn-default" href="Register">Click Here &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Add new Faculties</h2>
            <p>
                The Faculty will be registered by the Administrator only. So kindly add details of the new Faculty.
            </p>
            <p>
                <a class="btn btn-default" href="Register1">Click Here &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Recent Activities</h2>
            <p>
                Aknowledgement the users about the recently organized events by faculties, admin and management.
            </p>
            <p>
                <a class="btn btn-default" href="ManageNotice">Add Now &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
