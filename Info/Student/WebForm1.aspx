<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Info.Student.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/style.css" rel="stylesheet" type="text/css" />
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
            <li>
                <asp:Image runat="server" ID="ProfilePicsThumb" Height="50px" Width="50px" CssClass="img-circle" /></li>
            <li><a runat="server" href="Profile"><%=HttpContext.Current.Session["Role"]%>: <b><%=HttpContext.Current.Session["FirstName"]%> <%=HttpContext.Current.Session["LastName"]%></b></a></li>
            <li><a runat="server" href="~/Account/ManagePassword">Change Password</a></li>
            <li><a runat="server" href="~/Account/Logout">Logout</a></li>
        </ul>
    </div>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Upload Profile Picture</h4>
                </div>
                <div class="modal-body">
                    <asp:FileUpload ID="FileUpload1" runat="server" AutoPostBack="True" />
                </div>
                <div class="modal-footer">
                    <asp:Button ID="up" runat="server" CssClass="btn btn-default" OnClick="UploadProfilePicture" Text="Upload" />
                    <asp:Button runat="server" CssClass="btn btn-default" data-dismiss="modal" Text="Close" />
                </div>
            </div>

        </div>
    </div>

    <h1>Welcome <%=HttpContext.Current.Session["FirstName"]%></h1>

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
            <h2>Getting started</h2>
            <p>
                Upload your Profile Picture so you can be easily recognized.
            </p>
            <p>
                <a class="btn btn-default" data-toggle="modal" data-target="#myModal">Add Here &raquo;</a>
            </p>
        </div>
        <div class="col-md-6">
            <h2>Profile</h2>
            <p>
                SVIT SIS provides you the access to your personal as well as acedemic information from anywhere, anytime.
            </p>
            <p>
                <a class="btn btn-default" href="Profile">Manange Now &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
