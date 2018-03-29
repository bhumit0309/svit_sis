<%@ Page Title="Edit Attandance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="Info.Faculty.Attendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <link href="../Content/style.css" rel="stylesheet" type="text/css" />
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
        <li><asp:Image runat="server" ID="ProfilePicsThumb" Height="50px" Width="50px" CssClass="img-circle" /></li>
        <li><a runat="server">Welcome <%=HttpContext.Current.Session["Role"]%>: <b><%=HttpContext.Current.Session["FirstName"]%> <%=HttpContext.Current.Session["LastName"]%></b></a></li>
        <li><a runat="server" href="~/Account/ManagePassword">Change Password</a></li>
        <li><a runat="server" href="~/Account/Logout">Logout</a></li>
        </ul>
    </div>
    <h2><%: Title %>.</h2>

    <div class="form-horizontal">
        <h4>Select the following fields.</h4>
        <hr />
        <div class="form-group">
            <asp:Label runat="server" ID="Department_Label" AssociatedControlID="Department" CssClass="col-md-2 control-label">Department</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="Department" runat="server" CssClass="form-control" Width="29%" DataSourceID="SqlDataSource1" DataTextField="Department" DataValueField="Department" AutoPostBack="true" >
                </asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT [Department] FROM [Student_Reg]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Sem" CssClass="col-md-2 control-label">Semester</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="Sem" runat="server" CssClass="form-control" Width="29%" DataSourceID="SqlDataSource2" DataTextField="Semester" DataValueField="Semester" AutoPostBack="true">
                </asp:DropDownList>

                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT [Semester] FROM [Student_Reg] WHERE ([Department] = @Department)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Department" PropertyName="SelectedValue" Name="Department" Type="String"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Slot" CssClass="col-md-2 control-label">Slot</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="Slot" runat="server" CssClass="form-control" Width="29%" AutoPostBack="true" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" ID="Button_Show" Text="Show" CssClass="btn btn-default" OnClick="Show" />

            </div>
        </div>
        <div class="form-group">
            <div class="col-md-12">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:GridView runat="server" ID="AttendanceGrid" CssClass="mydatagrid" PagerStyle-CssClass="pager" PageSize="80"
                            HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AutoGenerateColumns="false" AllowPaging="true"
                            OnPageIndexChanging="OnPaging" ShowFooter="false" GridLines="Horizontal">
                            <Columns>
                                <asp:TemplateField HeaderText="Student ID" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStudentID" runat="server" Text='<%# Eval("UserID") %>' CssClass="control-label" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Picture">
                                    <ItemTemplate>
                                        <asp:Image ID="ProfilePictureThumb" runat="server" CssClass="img-circle" ImageUrl='<%# Eval("URL") %>' AlternateText="No Image" Height="100px" Width="100px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFName" runat="server" Text='<%# Eval("FirstName") %>' CssClass="control-label" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Middle Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMName" runat="server" Text='<%# Eval("MiddleName") %>' CssClass="control-label" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLName" runat="server" Text='<%# Eval("LastName") %>' CssClass="control-label" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="HeaderCheckBox" runat="server" OnCheckedChanged="HeaderCheckBox_CheckedChanged" AutoPostBack="true" /> Present / Absent
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="ItemCheckBox" runat="server" AutoPostBack="true" OnCheckedChanged="ItemCheckBox_CheckedChanged" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="AttendanceGrid" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="form-group">
        <div class="col-md-10">
            <asp:Button ID="Submit" runat="server" Visible="false" Text="Submit Attendance" CssClass="btn btn-default" OnClientClick="return confirm('Do you want to mark this attendence? No changes are possible after submitting. Contact Administrator for changes after Submitting.')" OnClick="Submit_Click" />
        </div>
            </div>
    </div>
</asp:Content>

