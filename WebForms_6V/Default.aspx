<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebForms_6V._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <table class="w-100" style="height: 226px">
        <tr>
            <td colspan="2" style="font-weight: bold; font-size: x-large">Complete Crud Operation Asp.Net Web Forms </td>
        </tr>
        <tr>
            <td style="width: 238px">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>

      <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Style="top: 135px;
        left: 700px; position: absolute; height: 10px; width: 200px;color:red" ErrorMessage="RequiredFieldValidator"
        ControlToValidate="TextBox2">StudentId Is Mandarory..!</asp:RequiredFieldValidator>--%>



            <asp:CustomValidator ID="CustomValidator2" runat="server" Style="top: 135px;
            left: 900px; position: absolute; height: 22px; width: 221px;color:red"
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
                    } else
                    {
                        args.IsValid = false;
                    }
                }
            </script>





            <td style="font-weight: normal; font-size: medium; height: 32px; width: 238px;">
                <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="Student ID"></asp:Label>
            </td>
            <td style="height: 32px">
                <asp:TextBox ID="TextBox2" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" BackColor="#00CC99" Font-Size="Medium" ForeColor="#FF0066" OnClick="Button4_Click" Text="Search" Width="120px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>

           <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Style="top: 170px;
             left: 700px; position: absolute; height: 10px; width: 400px;color:red" ErrorMessage="RequiredFieldValidator"
             ControlToValidate="TextBox3">StudentName Is Mandarory..!</asp:RequiredFieldValidator>--%>

            <td style="height: 24px; width: 238px">
                <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="Student Name"></asp:Label>
            </td>
            <td style="height: 24px">
                <asp:TextBox ID="TextBox3" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button6" runat="server" BackColor="#00CC99" Font-Size="Medium" ForeColor="#FF0066" OnClick="Button6_Click" Text="Search" Width="120px" />
            </td>
        </tr>
        <tr>
            <td style="height: 24px; width: 238px">
                <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text="Address"></asp:Label>
            </td>
            <td style="height: 24px">
                <asp:TextBox ID="TextBox4" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>

        <%--    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Style="top: 230px;
                left: 550px; position: absolute; height: 22px; width: 400px;color:red"
                ErrorMessage="RegularExpressionValidator" ControlToValidate="TextBox5"
              ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$">Email is Not Valid</asp:RegularExpressionValidator>
--%>

          <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Style="top: 230px;
             left: 550px; position: absolute; height: 10px; width: 400px;color:red" ErrorMessage="RequiredFieldValidator"
             ControlToValidate="TextBox3">Email Is Mandarory..!</asp:RequiredFieldValidator>--%>

            <td style="width: 238px; height: 35px;">
                <asp:Label ID="Label4" runat="server" Font-Size="Medium" Text="Email ID"></asp:Label>
            </td>
            <td style="height: 35px">
                <asp:TextBox ID="TextBox5" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            &nbsp;</td>
        </tr>
        <tr>


            
       <%--      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Style="top: 260px;
             left: 550px; position: absolute; height: 10px; width: 400px;color:red" ErrorMessage="RequiredFieldValidator"
             ControlToValidate="TextBox3">Branch Is Mandarory..!</asp:RequiredFieldValidator>--%>
            <td style="width: 238px; height: 35px;">
                <asp:Label ID="Label5" runat="server" Font-Size="Medium" Text="Brach"></asp:Label>
            </td>
            <td style="height: 35px">
                <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="Medium"  Width="200px">
                    <asp:ListItem>CSE</asp:ListItem>
                    <asp:ListItem>ECE</asp:ListItem>
                    <asp:ListItem>MECHANICAL</asp:ListItem>
                    <asp:ListItem>Civil</asp:ListItem>
                </asp:DropDownList>
&nbsp; </td>
        </tr>
        <tr>

           <%-- <asp:CustomValidator ID="CustomValidator1" runat="server"  Style="top: 290px;
             left: 550px; position: absolute; height: 10px; width: 400px;color:red" OnServerValidate="UserCustomValidate"
            ControlToValidate="TextBox6"
            ErrorMessage="Date Is Not In Range"
            SetFocusOnError="True"></asp:CustomValidator>--%>


            <td style="width: 238px; height: 30px;">
                <asp:Label ID="Label6" runat="server" Font-Size="Medium" Text="Date"></asp:Label>
            </td>
            <td style="height: 30px">
                <asp:TextBox ID="TextBox6" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 238px; height: 24px">
                <asp:Label ID="Label7" runat="server" Font-Size="Medium" Text="Image"></asp:Label>
            </td>
            <td style="height: 24px"><asp:FileUpload ID="FileUpload1" runat="server" Width="300px" />
            </td>
        </tr>
        <tr>
            <td style="width: 238px; height: 24px">Search By Start Letter</td>
            <td style="height: 24px">
                <asp:TextBox ID="TextBox7" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button8" runat="server" BackColor="#00CC99" Font-Size="Medium" ForeColor="#FF0066" OnClick="GetName_Click" Text="Search" Width="120px" />
            </td>
        </tr>
        <tr>
            <td style="width: 238px; height: 24px">&nbsp;</td>
            <td style="height: 24px">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 238px">&nbsp;</td>
            <td>
                <asp:Button ID="Button2" runat="server" BackColor="#333399" Font-Size="Medium" ForeColor="White" OnClick="Button2_Click" Text="Update" />
            &nbsp;
                <asp:Button ID="Button3" runat="server" BackColor="#CC3300" Font-Size="Medium" ForeColor="White" OnClick="Button3_Click" Text="Delete" OnClientClick="return confirm('Are You Sure To Delete?');" />
            &nbsp;
                <asp:Button ID="Button5" runat="server" BackColor="#6699FF" Font-Size="Medium" ForeColor="White" OnClick="Button5_Click" Text="Load" Width="80px" />
            &nbsp;&nbsp;
                <asp:Button ID="Button7" runat="server" BackColor="#FF5050" Font-Size="Medium" ForeColor="White" OnClick="Button7_Click" Text="Logout" Width="80px" />
            </td>
        </tr>
        <tr>
<td colspan="2" style="height: 24px">
    <br />
    <asp:GridView ID="GridView1" runat="server" BackColor="#CC99FF" BorderColor="White" ForeColor="White" Width="1356px" AutoGenerateColumns="False">
        <HeaderStyle BackColor="#0099CC" />
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
</td>

        </tr>
        <tr>
            <td style="width: 238px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>



</asp:Content>
