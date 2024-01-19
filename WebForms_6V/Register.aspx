<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebForms_6V.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 31%;
        }
        .auto-style4 {
            height: 26px;
            width: 364px;
        }
        .auto-style5 {
            width: 364px;
        }
    
select {
  word-wrap: normal;
}

button,
select {
  text-transform: none;
}

*,
*::before,
*::after {
  box-sizing: border-box;
}

        .auto-style10 {
            height: 18px;
            }
        .auto-style11 {
            width: 121px;
        }
        .auto-style12 {
            height: 26px;
            width: 121px;
        }
        .auto-style13 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style10" style="font-family: Arial, Helvetica, sans-serif; font-size: x-large; text-decoration: underline; font-style: italic; font-weight: bolder" colspan="2">Register New User</td>
        </tr>
        <tr>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>


             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Style="top: 64px;
            left: 350px; position: absolute; height: 10px; width: 200px;color:red" ErrorMessage="RequiredFieldValidator"
            ControlToValidate="TextBox2">StudentId Is Mandarory..!</asp:RequiredFieldValidator>
            <%-- Custom validation --%>
             <asp:CustomValidator ID="CustomValidator2" runat="server" Style="top: 64px;
             left: 350px; position: absolute; height: 22px; width: 221px;color:red"
             OnServerValidate="UserCustomValidate"
             ControlToValidate="TextBox2"
             ClientValidationFunction="validateUserId"
             ErrorMessage="ID should be greater than 0..!">

             </asp:CustomValidator>

             <script type="text/javascript">
                 function validateUserId(sender, args) {
                     var userId = document.getElementById('<%= TextBox2.ClientID %>').value;

                     if (parseInt(userId) > 0) {
                         args.IsValid = true;
                     } else {
                         args.IsValid = false;
                     }
                 }
             </script>
            <td class="auto-style11">Student ID</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox2" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Style="top: 92px;
                 left: 350px; position: absolute; height: 10px; width: 400px;color:red" ErrorMessage="RequiredFieldValidator"
                 ControlToValidate="TextBox3">StudentName Is Mandarory..!</asp:RequiredFieldValidator>


            <td class="auto-style11">Student Name</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox3" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style12">Address</td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox4" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>



            <%-- Adding input controll  regex --%>

              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Style="top: 152px;
                left: 353px; position: absolute; height: 22px; width: 400px;color:red"
                ErrorMessage="RegularExpressionValidator" ControlToValidate="TextBox5"
              ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$">Email is Not Valid</asp:RegularExpressionValidator>


            <td class="auto-style12">Email</td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox5" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>

             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Style="top: 179px;
             left: 353px; position: absolute; height: 10px; width: 400px;color:red" ErrorMessage="RequiredFieldValidator"
             ControlToValidate="TextBox3">Branch Is Mandarory..!</asp:RequiredFieldValidator>

            <td class="auto-style11">Branch</td>
            <td class="auto-style5">
                <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="Medium"  Width="200px">
                    <asp:ListItem>CSE</asp:ListItem>
                    <asp:ListItem>ECE</asp:ListItem>
                    <asp:ListItem>MECHANICAL</asp:ListItem>
                    <asp:ListItem>Civil</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">Date</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox6" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">Image</td>
            <td class="auto-style5"><asp:FileUpload ID="FileUpload1" runat="server" Width="300px" />
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" BackColor="#333399" Font-Size="Medium" ForeColor="White" OnClick="Button1_Click" Text="Register" CssClass="auto-style13" Height="36px" Width="150px" />
            &nbsp;
            </td>
        </tr>
        <tr>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
    </table>
        <div>
        </div>
    </form>
</body>
</html>
