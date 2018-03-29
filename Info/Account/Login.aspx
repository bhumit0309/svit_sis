<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Info.Account.Login" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Use Your Enrollment to log in.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" ID="ErrorMsg" CssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Role" CssClass="col-md-2 control-label">Role</asp:Label>
                        <div class="col-md-10">

                            <asp:RadioButtonList ID="Role" runat="server" CssClass="form-control" RepeatDirection="Vertical" Width="44%" BorderWidth="0">
                                <asp:ListItem Selected="True">Admin</asp:ListItem>
                                <asp:ListItem>Student</asp:ListItem>
                                <asp:ListItem>Faculty</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Role" CssClass="text-danger" ErrorMessage="The Role field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="UserID" CssClass="col-md-2 control-label">UserID</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="UserID" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserID"
                                CssClass="text-danger" ErrorMessage="The UerID field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                      <!--  <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div> -->
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
                <p class="col-md-offset-2 col-nd-10">
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                </p>
            </section>
        </div>
    </div>
</asp:Content>
