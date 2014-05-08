<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userValidation.aspx.cs" Inherits="PetPalBook.Users.userValidation" %>

<!DOCTYPE html>
<!--

  After the user receives the email there would be a link to this screen asking the user to login and then do the final
  verification.  

  Todo in the future:
    - a token to ensure the email matches the security token in the system
    - the secuity token shoudl expire after a specific amount of time
    - ensure when they come to this screen they have not already registered


-->

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
  <div style='text-align:center'>
    <div style='width:100%'>
    Your one step away from validating your account...
    </div>
    <br/>
    <form id="form1" runat="server" autocomplete="off">
    <div style='width:700px;border:solid #aaaaaa 1px;margin:auto;text-align:center;padding-top:10px'>
       
      <asp:Label ID="lblWelcome" runat="server" Text="Welcome [FIRST NAME][LAST NAME]"></asp:Label>      
      .&nbsp; Please login to complete your registration.<br />
      <br />
      <div style='width:500px;text-align:center;margin:auto;border:1px #777777 solid;padding-top:10px;padding-bottom:10px'>
        <asp:Label ID="Label2" runat="server" Text="Confirm Password:"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="txtPassword" runat="server" Width="168px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="butFinishRegistration" runat="server" Text="Finish Registration" OnClick="butFinishRegistration_Click" />
      </div>

      <br>
      <div id='generalErrorMessage' align='center'>
      <table>
      <tr>
        <td>This is an error message<asp:TextBox ID="txtTest" runat="server" Width="168px"></asp:TextBox>
        </td>
      </tr>
      </table>
      </div>

      <br />
       
    </div>
    </form>
  </div>
  <br>
  <br>
  <div id='validationSuccess' style='width:80%;margin:auto;border:dotted black 1px;text-align:center'>
  Congratulations!<br>
   <br>
    You have succusflully verified your email and password.  You may now proceed to login.
<br><br>

  <a href="">CLick here to goto login page</a>
<br>
<br>

  </div>
</body>
</html>
