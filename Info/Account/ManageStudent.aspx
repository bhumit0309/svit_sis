<%@ Page Title="Manage Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageStudent.aspx.cs" Inherits="Info.Account.ManageStudent" EnableEventValidation="false" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link href="../Content/style.css" rel="stylesheet" type="text/css" />
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
        <li><a runat="server">Welcome <%=HttpContext.Current.Session["Role"]%>: <b><%=HttpContext.Current.Session["FirstName"]%> <%=HttpContext.Current.Session["LastName"]%></b></a></li>
        <li><a runat="server" href="~/Account/ManagePassword">Change Password</a></li>
        <li><a runat="server" href="~/Account/Logout">Logout</a></li>
        </ul>
    </div>
    
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
        <h4>Manage the details of the Student.</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />

        <asp:PlaceHolder ID="SearchBar" runat="server" EnableViewState="true">
            <form class="form-inline">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="SortBy" ID="SortBy_Label" CssClass="control-label">Search by</asp:Label>
                    <asp:RadioButtonList ID="SortBy" runat="server" BorderWidth="0px" CssClass="form-control">
                        <asp:ListItem Selected="True">UserID</asp:ListItem>
                        <asp:ListItem>FirstName</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="SearchBy" ID="SearchBy_Label" CssClass="control-label">Value</asp:Label>
                    <asp:TextBox runat="server" ID="SearchBy" CssClass="form-control" />
                </div>
                <asp:LinkButton ID="Search" runat="server" OnClick="OnClick_Search" CssClass="btn btn-default"><span class="glyphicon glyphicon-search" /> Search </asp:LinkButton>
            </form>
        </asp:PlaceHolder>
    </div>
    <br />
    <br />
    <div class="col-md-16">
        <asp:PlaceHolder ID="Result" runat="server" Visible="false" EnableViewState="true">
            <asp:GridView ID="ResultGrid" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" PageSize="5"
                HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AutoGenerateColumns="false" AllowPaging="true"
                OnPageIndexChanging="OnPaging" ShowFooter="false" GridLines="Horizontal" EmptyDataText="No record found" HeaderStyle-HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField HeaderText="StudentID">
                        <ItemTemplate>
                            <asp:Label ID="lblStudentID" runat="server" Text='<%# Eval("UserID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Picture">
                        <ItemTemplate>
                            <asp:Image ID="ProfilePictureThumb" runat="server" CssClass="img-circle" ImageUrl='<%# "../Student/ProfilePictures/" + Eval("UserID") + ".jpg" %>' AlternateText="No Image" Height="100px" Width="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="FirstName">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="MiddleName">
                        <ItemTemplate>
                            <asp:Label ID="lblMiddleName" runat="server" Text='<%# Eval("MiddleName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="LastName">
                        <ItemTemplate>
                            <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LastName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Department">
                        <ItemTemplate>
                            <asp:Label ID="lblDepartment" runat="server" Text='<%# Eval("Department") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Semester">
                        <ItemTemplate>
                            <asp:Label ID="lblSemester" runat="server" Text='<%# Eval("Semester") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Year">
                        <ItemTemplate>
                            <asp:Label ID="lblYear" runat="server" Text='<%# Eval("Year") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Student">
                        <ItemTemplate>
                            <asp:Label ID="lblContactS" runat="server" Text='<%# Eval("Contact_S") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Parent">
                        <ItemTemplate>
                            <asp:Label ID="lblContactP" runat="server" Text='<%# Eval("Contact_P") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" OnClientClick="return confirm('Do you want to delete this student?')"
                                Text="Delete" OnClick="DeleteNotice" CommandArgument='<%# Eval("UserID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" OnClick="OnClick_Edit" Text="Edit" CommandArgument='<%# Eval("UserID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </asp:PlaceHolder>
    </div>

    <div class="form-horizontal">
        <asp:PlaceHolder ID="EditDetails" runat="server" Visible="false" EnableViewState="true">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="UserID" CssClass="col-md-2 control-label">UserID</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="UserID" CssClass="form-control" Enabled="false" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserID"
                        CssClass="text-danger" ErrorMessage="The UserID field is required." />
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
                        <asp:ListItem>2016</asp:ListItem>
                        <asp:ListItem>2015</asp:ListItem>
                        <asp:ListItem>2014</asp:ListItem>
                        <asp:ListItem>2013</asp:ListItem>
                        <asp:ListItem>2012</asp:ListItem>
                        <asp:ListItem>2011</asp:ListItem>
                        <asp:ListItem>2010</asp:ListItem>
                        <asp:ListItem>2009</asp:ListItem>
                        <asp:ListItem>2008</asp:ListItem>
                        <asp:ListItem>2007</asp:ListItem>
                        <asp:ListItem>2006</asp:ListItem>
                        <asp:ListItem>2005</asp:ListItem>
                        <asp:ListItem>2004</asp:ListItem>
                        <asp:ListItem>2003</asp:ListItem>
                        <asp:ListItem>2002</asp:ListItem>
                        <asp:ListItem>2001</asp:ListItem>
                        <asp:ListItem>2000</asp:ListItem>
                        <asp:ListItem>1999</asp:ListItem>
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
                        CssClass="text-danger" ErrorMessage="The Contact field is required." />
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Contact_P" CssClass="col-md-2 control-label">Contact:Parent</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="Contact_P" CssClass="form-control" TextMode="Phone" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Contact_P"
                        CssClass="text-danger" ErrorMessage="The Contact field is required." />
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
                    <asp:TextBox runat="server" ID="Address" TextMode="MultiLine" CssClass="form-control" Rows="4" Width="29%" Wrap="true" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The Email field is required." />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button ID="Button_Update" runat="server" OnClick="OnClick_Update" Text="Update" CssClass="btn btn-default" />
                </div>
            </div>
        </asp:PlaceHolder>
    </div>
</asp:Content>
