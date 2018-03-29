<%@ Page Title="Add new Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Info.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
        <li><a runat="server">Welcome <%=HttpContext.Current.Session["Role"]%>: <b><%=HttpContext.Current.Session["FirstName"]%> <%=HttpContext.Current.Session["LastName"]%></b></a></li>
        <li><a runat="server" href="~/Account/ManagePassword">Change Password</a></li>
        <li><a runat="server" href="~/Account/Logout">Logout</a></li>
        </ul>
    </div>
    
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account for Student</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserID" CssClass="col-md-2 control-label">UserID</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserID" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserID"
                    CssClass="text-danger" ErrorMessage="The UserID field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="col-md-2 control-label">First Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName"
                    CssClass="text-danger" ErrorMessage="The First Name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="MiddleName" CssClass="col-md-2 control-label">Middle Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="MiddleName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="MiddleName"
                    CssClass="text-danger" ErrorMessage="The Middle Name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="LastName" CssClass="col-md-2 control-label">Last Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="LastName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName"
                    CssClass="text-danger" ErrorMessage="The Last Name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Department" CssClass="col-md-2 control-label">Department</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="Department" runat="server" CssClass="form-control" Width="29%">
                    <asp:ListItem>Aeronautical Engineering</asp:ListItem>
                    <asp:ListItem>Computer Engineering</asp:ListItem>
                    <asp:ListItem>Civil Engineering</asp:ListItem>
                    <asp:ListItem>Electrical Engineering</asp:ListItem>
                    <asp:ListItem>IT Engineering</asp:ListItem>
                    <asp:ListItem>IC Engineering</asp:ListItem>
                    <asp:ListItem>Mechanical Engineering</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Department"
                    CssClass="text-danger" ErrorMessage="The Department field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Year" CssClass="col-md-2 control-label">Year</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="Year" runat="server" CssClass="form-control" Width="29%">
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Year"
                    CssClass="text-danger" ErrorMessage="The Year field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Contact_S" CssClass="col-md-2 control-label">Contact:Student</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Contact_S" CssClass="form-control" TextMode="Phone" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Contact_S"
                    CssClass="text-danger" ErrorMessage="The Contact:Student field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Contact_P" CssClass="col-md-2 control-label">Contact:Parent</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Contact_P" CssClass="form-control" TextMode="Phone" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Contact_P"
                    CssClass="text-danger" ErrorMessage="The Contact:Parent field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" TextMode="Email" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The Email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Address" CssClass="col-md-2 control-label">Address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Address" TextMode="MultiLine" CssClass="form-control" Height="80px" Width="29%" Wrap="true" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The Email field is required." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
