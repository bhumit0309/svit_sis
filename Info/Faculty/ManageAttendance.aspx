<%@ Page Title="Manage Attendance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageAttendance.aspx.cs" Inherits="Info.Faculty.ManageAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <script type="text/javascript">

    </script>
    <link href="../Content/style.css" rel="stylesheet" type="text/css" />
    <div class="row">
        <div class="col-md-8">
            <asp:PlaceHolder ID="NoticeBoard" runat="server">
                <div class="form-horizontal">
                    <div class="form-group">
                        <div class="col-md-10" id="dvgrid">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="Attendance" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" PageSize="5" 
                                        HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Student_ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStudent_ID" runat="server" Text='<%# Eval("StudentID") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblStudent_ID" runat="server" Text='&raquo;' Font-Bold="true" />
                                                </FooterTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="FirstName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("First_Name") %>' />
                                                </ItemTemplate>
                                               <%-- <EditItemTemplate>
                                                    <asp:DropDownList ID="txtEditAuthor" runat="server" SelectedValue='<%# Bind("Author") %>' CssClass="form-control">
                                                        <asp:ListItem>Admin</asp:ListItem>
                                                        <asp:ListItem>Faculty</asp:ListItem>
                                                    </asp:DropDownList>
                                                </EditItemTemplate>--%>
                                                <%--<FooterTemplate>
                                                    <asp:DropDownList ID="txtAuthor" runat="server" CssClass="form-control">
                                                        <asp:ListItem Selected="True">Admin</asp:ListItem>
                                                        <asp:ListItem>Faculty</asp:ListItem>
                                                    </asp:DropDownList>
                                                </FooterTemplate>--%>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="MiddleName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMiddleName" runat="server" Text='<%# Eval("Middle_Name") %>' />
                                                </ItemTemplate>
                                                <%--<FooterTemplate>
                                                    <asp:Label ID="txtDate" runat="server" Text='<%# DateTime.Now.ToString() %>' />
                                                </FooterTemplate>--%>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="LastName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("Last_name") %>' />
                                                </ItemTemplate>
                                                <%--<EditItemTemplate>
                                                    <asp:TextBox ID="txtEditNoticeText" runat="server" TextMode="MultiLine" Rows="4" Text='<%# Eval("NoticeText") %>' CssClass="form-control" />
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNoticeText" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" />
                                                </FooterTemplate>--%>
                                            </asp:TemplateField>

                                           <asp:TemplateField HeaderText="Present">
                                                <ItemTemplate>
                                                    <asp:RadioButton ID="rowselector" runat="server" GroupName="attendance" />
                                                </ItemTemplate>
                                                <%--<EditItemTemplate>
                                                    <asp:CheckBox ID="EditAllFlag" runat="server" Checked='<%# Eval("AllFlag") %>' CssClass="enabled" />
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:CheckBox ID="AllFlag" runat="server" CssClass="enabled" />
                                                </FooterTemplate>--%>
                                            </asp:TemplateField>

                                           <asp:TemplateField HeaderText="Absent">
                                                <ItemTemplate>
                                                    <asp:RadioButton ID="rowselector" runat="server" GroupName="attendance"  />
                                                </ItemTemplate>
                                                <%-- %><EditItemTemplate>
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

                                            <asp:TemplateField HeaderText="Parent">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="PFlag" runat="server" Checked='<%# Eval("PFlag") %>' CssClass="disabled" Enabled="false" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CheckBox ID="EditPFlag" runat="server" Checked='<%# Eval("PFlag") %>' CssClass="enabled" />
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:CheckBox ID="PFlag" runat="server" CssClass="enabled" />
                                                </FooterTemplate>
                                            </asp:TemplateField>--%>

                                           <%-- <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnDelete" runat="server" OnClientClick="return confirm('Do you want to delete this notice?')"
                                                        Text="Delete" OnClick="DeleteNotice" CommandArgument='<%# Eval("NoticeID") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Button ID="btnAdd" runat="server" OnClick="AddNotice" Text="Add" />
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField ShowEditButton="true" ButtonType="Button" />--%>
                                        </Columns>

                                    </asp:GridView>
                                   <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID = "Attendance" />
                                   </Triggers>
                                </ContentTemplate>
                                
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </asp:PlaceHolder>
        </div>
    </div>
</asp:Content>
