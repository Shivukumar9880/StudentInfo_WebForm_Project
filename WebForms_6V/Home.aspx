<%@ Page Title="" Language="C#"  MasterPageFile="~/Master/Test.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebForms_6V.Master.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
    .center-container {
        margin: auto;
        text-align: center;
        padding-top: 20px; /* Adjust the top padding as needed */
    }

    table {
        border: 2px solid blue;
        border-radius: 10px;
        width: 300px; /* Adjust the width as needed */
        max-width: 500px; /* Set a max width if needed */
        margin: auto;
    }

   /* .auto-style1 {
        width: 27%;
        height: 193px;
    }*/

    .auto-style2 {
        height: 29px;
        width: 292px;
    }

    .auto-style3 {
        width: 4%;
        text-align: left;
        padding-left: 30px;
    }

    .auto-style4 {
        height: 29px;
        width: 4%;
        padding-left:30px;
    }

    /* The rest of your existing styles */
    .auto-style6 {
        text-align: left;
        height: 26px;
    }
    .auto-style8 {
        width: 4%;
        text-align: left;
        height: 33px;
    }
    .auto-style9 {
        height: 33px;
        width: 292px;
    }
    .auto-style10 {
        width: 292px;
    }
    .TextBox2{
        padding-right:30px;

    }
    .TextBox1{
        padding-right:30px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <table class="auto-style1"  >
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4"><asp:Label ID="Label1" runat="server" Text="StudentID      " Font-Size="Medium" Width="119px"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label2" runat="server" Text="StudentName   "></asp:Label>
            </td>
            <td class="auto-style10">
                <asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
              <td class="auto-style3">
                  <asp:Label ID="Label3" runat="server" Text="Remind Me  "></asp:Label>
              </td>
            <td>
                <asp:CheckBox ID="CheckBox1" runat="server" /> 

            </td>

        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style9">
                <asp:Button ID="Button1" runat="server" Text="Login" BackColor="#99FF66" Width="100px" Font-Size="Large" OnClick="Button1_Click1" />
            &nbsp;
                <asp:Button ID="Button2" runat="server" BorderColor="#3399FF" Font-Size="Medium" OnClick="Button2_Click" Text="Register" Width="86px" BackColor="#6666FF" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style10">
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Button" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
    </table>

    
</asp:Content>
