<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetAll.aspx.cs" Inherits="WebForms_6V.GetAll" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">


<div>
    <asp:GridView ID="GridView1" runat="server" BackColor="#CC99FF" BorderColor="White" ForeColor="White" Width="1356px" AutoGenerateColumns="False">
        <HeaderStyle BackColor="#FF66FF" />
        <Columns>
            <asp:BoundField DataField="StudentId" HeaderText="Student ID" SortExpression="StudentId" Visible="true" />
            <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" Visible="true" />
            <asp:BoundField DataField="Student_Address" HeaderText="Student Address" SortExpression="Student_Address" Visible="true" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" Visible="true" />
            <asp:BoundField DataField="Branch" HeaderText="Branch" SortExpression="Branch" Visible="true" />
            <asp:BoundField DataField="Reg_Date" HeaderText="Registration Date" SortExpression="Reg_Date" Visible="true" />

            <asp:TemplateField HeaderText="Student Image" Visible="true">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("St_Image") %>' Width="100" Height="100" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>




        <p>
            <asp:Button ID="Button6" runat="server" BackColor="#66FF66" OnClick="Button6_Click" Text="Back" Width="238px" />
        </p>
    </form>
</body>
</html>
