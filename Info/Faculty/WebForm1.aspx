<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Info.Faculty.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/style.css" rel="stylesheet" type="text/css" />
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
            <li>
                <asp:Image runat="server" ID="ProfilePicsThumb" Height="50px" Width="50px" CssClass="img-circle" /></li>
            <li><a runat="server">Welcome <%=HttpContext.Current.Session["Role"]%>: <b><%=HttpContext.Current.Session["FirstName"]%> <%=HttpContext.Current.Session["LastName"]%></b></a></li>
            <li><a runat="server" href="~/Account/ManagePassword">Change Password</a></li>
            <li><a runat="server" href="~/Account/Logout">Logout</a></li>
        </ul>
    </div>
    <div class="jumbotron">
        <asp:PlaceHolder ID="NoticeBoard" runat="server">
            <div class="form-horizontal">
                <div class="form-group">
                    <div class="col-md-12" id="dvgrid">
                        <asp:GridView ID="Notice" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" PageSize="15"
                            HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AutoGenerateColumns="false" AllowPaging="true"
                            OnPageIndexChanging="OnPaging" ShowFooter="False" GridLines="Horizontal" CellPadding="5" CellSpacing="5">
                            <Columns>
                                <asp:TemplateField HeaderText="Event ID">
                                    <ItemTemplate>
                                        <asp:Label CssClass="lbl lbl-default" ID="lblItemNoticeID" runat="server" Text='<%# Eval("NoticeID") %>' />
                                        
                                    </ItemTemplate>

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Organized by">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAuthor" runat="server" Text='<%# Eval("Author") %>' />
                                    </ItemTemplate>

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Added at">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date") %>' />
                                    </ItemTemplate>

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNoticeText" runat="server" Text='<%# Eval("NoticeText") %>' />
                                    </ItemTemplate>

                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>

                    </div>
                </div>
            </div>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-6">
            <h2>Student Attendance</h2>
            <p>
                Select the list of students using some parameters and mark their attendance.
            </p>
            <p>
                <a class="btn btn-default" href="Attendance">Mark Now &raquo;</a>
            </p>
        </div>
        <div class="col-md-6">
            <h2>Internal Examination Marks</h2>
            <p>
                Select the list of students using some parameters and insert their marks.
            </p>
            <p>
                <a class="btn btn-default" href="Result.aspx">Add here &raquo;</a>
            </p>
        </div>
        <div class="col-md-6">
            <h2>Upcoming Events</h2>
            <p>
                Aknowledgement the users about the recently done activities by faculties, admin and management.
            </p>
            <p>
                <a class="btn btn-default" href="ManageNotice">Add Now &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
