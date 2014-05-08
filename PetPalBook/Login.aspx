<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PetPalBook.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
  <form id="form1" runat="server" autocomplete="off">

  <div id="loginBorder" style="border:dashed #777777 1px" align='center'>
  Login:
  <br/><br/>  
  <table>
    <tr>
      <td><asp:Label ID="lblUsername" runat="server" Text="Username:" Width="100px"></asp:Label></td>
      <td><asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></td>
    </tr><tr>
      <td><asp:Label ID="Label1" runat="server" Text="Password:" Width="100px"></asp:Label></td>
      <td><asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></td>
    </tr>
    </table>
    <br/>
    
    <asp:Button ID="butLogin" runat="server" Text="Login" Width="88px" OnClick="Button1_Click" />

    <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>

    <br />
    <br />
    <asp:Label ID="lblErrorMessages" runat="server" Text="Label"></asp:Label>

    </div>

  </div>
  </form>
</body>
</html>
