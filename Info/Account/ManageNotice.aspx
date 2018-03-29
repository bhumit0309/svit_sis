<%@ Page Title="Manage Event Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageNotice.aspx.cs" Inherits="Info.Account.ManageNotice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
        <li><a runat="server">Welcome <%=HttpContext.Current.Session["Role"]%>: <b><%=HttpContext.Current.Session["FirstName"]%> <%=HttpContext.Current.Session["LastName"]%></b></a></li>
        <li><a runat="server" href="~/Account/ManagePassword">Change Password</a></li>
        <li><a runat="server" href="~/Account/Logout">Logout</a></li>
        </ul>
    </div>
    <h2><%: Title %>.</h2>
    <link href="../Content/style.css" rel="stylesheet" type="text/css" />
    <div class="row">
        <div class="col-md-12">
            <asp:PlaceHolder ID="NoticeBoard" runat="server">
                <div class="form-horizontal">
                    <div class="form-group">
                        <div class="col-md-12" id="dvgrid">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                                <ContentTemplate>
                                    <asp:GridView ID="Notice" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" PageSize="15"
                                        HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AutoGenerateColumns="false" OnRowCancelingEdit="CancelEdit" AllowPaging="true"
                                        OnRowEditing="EditNotice" OnRowUpdating="UpdateNotice" OnPageIndexChanging="OnPaging" ShowFooter="true" GridLines="Horizontal">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Event ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNoticeID" runat="server" Text='<%# Eval("NoticeID") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblNoticeID" runat="server" Text='&raquo;' Font-Bold="true" />
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Organized by">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAuthor" runat="server" Text='<%# Eval("Author") %>' />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtEditAuthor" runat="server" Text='<%# Bind("Author") %>' CssClass="form-control" />
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="txtAuthor" runat="server" CssClass="form-control" Text="Admin" />
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Added at">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="txtDate" runat="server" Text='<%# DateTime.Now.ToString() %>' />
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Description">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNoticeText" runat="server" Text='<%# Eval("NoticeText") %>' />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtEditNoticeText" runat="server" TextMode="MultiLine" Rows="4" Text='<%# Eval("NoticeText") %>' CssClass="form-control" />
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNoticeText" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" />
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="All">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="AllFlag" runat="server" Checked='<%# Eval("AllFlag") %>' CssClass="disabled" Enabled="false" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CheckBox ID="EditAllFlag" runat="server" Checked='<%# Eval("AllFlag") %>' CssClass="enabled" />
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:CheckBox ID="AllFlag" runat="server" CssClass="enabled" />
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Faculty">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="FFlag" runat="server" Checked='<%# Eval("FFlag") %>' CssClass="disabled" Enabled="false" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CheckBox ID="EditFFlag" runat="server" Checked='<%# Eval("FFlag") %>' CssClass="enabled" />
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:CheckBox ID="FFlag" runat="server" CssClass="enabled" />
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Student">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="SFlag" runat="server" Checked='<%# Eval("SFlag") %>' CssClass="disabled" Enabled="false" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CheckBox ID="EditSFlag" runat="server" Checked='<%# Eval("SFlag") %>' CssClass="enabled" />
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:CheckBox ID="SFlag" runat="server" CssClass="enabled" />
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnDelete" runat="server" OnClientClick="return confirm('Do you want to delete this Event?')"
                                                        Text="Delete" OnClick="DeleteNotice" CommandArgument='<%# Eval("NoticeID") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Button ID="btnAdd" runat="server" OnClick="AddNotice" Text="Add" />
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField ShowEditButton="true" ButtonType="Button" />
                                        </Columns>

                                    </asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID = "Notice" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </asp:PlaceHolder>
        </div>
    </div>
</asp:Content>
