<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowDetails.aspx.cs" Inherits="Info.Account.ShowDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <asp:DataGrid ID="Grid" runat="server"  DataKeyField="UserID"
AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnCancelCommand="Grid_CancelCommand"
OnDeleteCommand="Grid_DeleteCommand" OnEditCommand="Grid_EditCommand" OnUpdateCommand="Grid_UpdateCommand">
<Columns>
<asp:BoundColumn HeaderText="UserID" DataField="UserID">
</asp:BoundColumn>
<asp:BoundColumn HeaderText="FirstName" DataField="FirstName">
</asp:BoundColumn>
<asp:BoundColumn HeaderText="LastName" DataField="LastName">
</asp:BoundColumn>
<asp:BoundColumn DataField="Department" HeaderText="Department">
</asp:BoundColumn>
<asp:BoundColumn DataField="Contact" HeaderText="Contact">
</asp:BoundColumn>
<asp:BoundColumn DataField="Email" HeaderText="Email">
</asp:BoundColumn>
<asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" HeaderText="Edit">
</asp:EditCommandColumn>
<asp:ButtonColumn CommandName="Delete" HeaderText="Delete" Text="Delete">
</asp:ButtonColumn>
</Columns>
<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
<SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" Mode="NumericPages" />
<AlternatingItemStyle BackColor="White" />
<ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
</asp:DataGrid>
<div>
<asp:DataGrid ID="Grid1" runat="server" PageSize="5" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
<Columns>
<asp:BoundColumn HeaderText="EmpId" DataField="EmpId"></asp:BoundColumn>
<asp:BoundColumn HeaderText="F_Name" DataField="F_Name"></asp:BoundColumn>
<asp:BoundColumn HeaderText="L_Name" DataField="L_Name"></asp:BoundColumn>
<asp:BoundColumn DataField="City" HeaderText="City"></asp:BoundColumn>
<asp:BoundColumn DataField="EmailId" HeaderText="EmailId"></asp:BoundColumn>
<asp:BoundColumn DataField="EmpJoining" HeaderText="EmpJoining"> </asp:BoundColumn>
</Columns>
<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
<SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" Mode="NumericPages" />
<AlternatingItemStyle BackColor="White" />
<ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
</asp:DataGrid>
    </div>
</asp:Content>
