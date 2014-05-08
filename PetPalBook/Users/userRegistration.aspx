<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userRegistration.aspx.cs" Inherits="PetPalBook.userRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script>
  
  function thisisatest(){ 
  }

  function submitRegistration() {
    document.getElementById("theForm").style.display = "none";
    document.getElementById("divWaiting").style.display = "block";

    document.all.formRegistration.submit();
  }

  function successRegistration() {
  }

  function failRegistration() {
  }

  //------------------------------------------------------------------------------------------------
  function handleServerErrors() {
    if (registrationError){
    }

    // if there was some db errors handle them
    if (dbErrors) {

    }

    // if there are dplicate email addresses
    if (duplicateEmailAddresses) {
      document.getElementById("theForm").style.display = "none";
      document.getElementById("divWaiting").style.display = "block";
      document.getElementById("successRegistering").style.display = "block";
    }
  }

  // call this function if there is success registering...
  function successRegistering() {
    document.getElementById("theForm").style.display = "none";
    document.getElementById("divWaiting").style.display = "none";
    document.getElementById("successRegistering").style.display = "block";
  }

</script>

</head>
<body id="pagebody" runat="server">

<div style="text-align:center;display:block">
  <div id='theForm' style='width:700px;border:dashed 2px black;display:block;margin:auto;padding-left:10px;padding-right:10px;padding-top:10px;padding-bottom:10px; background-color:lightgoldenrodyellow'>

    <form id="formRegistration" runat="server" autocomplete="off">
      <asp:Label ID="Label1" runat="server" Text="Registration:"></asp:Label>
      <br />

      <!-- The first name --------------------------------------------------------------------------------------------------------->
      <table cellpadding=0 cellspacing=0 align='center'>
      <tr>
        <td align='left'><asp:Label ID="lblFirstName" runat="server" Text="First Name:" Width="130px"></asp:Label></td>
        <td align='left'><asp:TextBox ID="txtFirstName" runat="server" AutoCompleteType="None" Width="150px"></asp:TextBox>*</td>
        <td>
          <asp:RequiredFieldValidator ID="lblWarningFName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td align='left'><asp:Label ID="lblLastName" runat="server" Text="Last Name:" Width="130px"></asp:Label></td>
        <td align='left'><asp:TextBox ID="txtLastName" runat="server" Width="150px"></asp:TextBox>*</td>
        <td align='left'>
          <asp:RequiredFieldValidator ID="lblWarningLName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td align='left'><asp:Label ID="lblEmail" runat="server" Text="Email:" Width="130px"></asp:Label></td>
        <td align='left'><asp:TextBox ID="txtEmail" runat="server" Width="150px"></asp:TextBox>*</td>
        <td align='left'>
          <asp:RequiredFieldValidator ID="lblWarningEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td align='left'><asp:Label ID="lblVerifyEmail" runat="server" Text="Verify Email:" Width="130px"></asp:Label></td>
        <td align='left'><asp:TextBox ID="txtVerifyEmail" runat="server" Width="150px"></asp:TextBox>*</td>
        <td align='left'>
          <asp:RequiredFieldValidator ID="lblWarningEmailVerification" runat="server" ControlToValidate="txtVerifyEmail" ErrorMessage="Required" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td align='left'><asp:Label ID="lblFirstName3" runat="server" Text="Province:" Width="130px"></asp:Label></td>
        <td align='left'><asp:DropDownList ID="lstProv" runat="server" Width="130px">
          <asp:ListItem>BC</asp:ListItem>
          <asp:ListItem>AB</asp:ListItem>
          <asp:ListItem>SK</asp:ListItem>
          <asp:ListItem>MT</asp:ListItem>
          <asp:ListItem>QC</asp:ListItem>
        </asp:DropDownList>
        </td>
        <td></td> 
      </tr><tr>
        <td align='left'><asp:Label ID="lblCity" runat="server" Text="City:" Width="130px"></asp:Label></td>
        <td align='left'><asp:TextBox ID="txtCity" runat="server"></asp:TextBox>&nbsp;</td>
        <td></td>
      </tr><tr>
        <td align='left'><asp:Label ID="lblPostalCode" runat="server" Text="Postal Code:" Width="130px"></asp:Label></td>
        <td align='left'><asp:TextBox ID="txtPostalCode" runat="server" Width="150px" Wrap="False"></asp:TextBox></td>
        <td> </td>
      </tr><tr>
        <td align='left'><asp:Label ID="lblPassword" runat="server" Text="Password:" Width="130px"></asp:Label></td>
        <td align='left'><asp:TextBox ID="txtPassword" runat="server" Width="150px"></asp:TextBox>*</td>
        <td align='left'>
          <asp:RequiredFieldValidator ID="lblWarningPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Required" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
      </tr><tr>
        <td align='left'><asp:Label ID="lblVerifyPassword" runat="server" Text="Verify Password:" Width="130px"></asp:Label></td>
        <td align='left'><asp:TextBox ID="txtverifyPassword2" runat="server" Width="150px" Wrap="False"></asp:TextBox>*</td>
        <td align='left'>
          <asp:RequiredFieldValidator ID="lblWarningPasswordValidator" runat="server" ControlToValidate="txtverifyPassword2" ErrorMessage="Required" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
      </tr>
      </table>

      <br/><br/>
        <asp:Label ID="lblErrorMessage" runat="server" Text="This is an error message" Visible="False"></asp:Label></td>
      <br/>
      <br/>
      <input type='button' value='Submit Registration' onclick='submitRegistration()'/>
      </form>
  </div>

  <!-- this is our image for waiting -->
  <div id="divWaiting" style='text-align:center;margin:auto;display:none;width:400px;height:300px;border:solid black 1px'> 
    <asp:Image ID="imgLoadingCat" runat="server" style='width:400px;height:300px' ImageUrl="~/Images/Misc/loading-page.gif"/>
    <br/>
    Please wait while we register your information...
  </div>

  <div id="successRegistering" style='text-align:center;margin:auto;display:none;width:400px;height:30px;padding-top:10px;padding-bottom:10px;border:solid black 1px'>
  Registration successful.<br><br>
  An message has been sent to your email address.  Finalize your registration by verifying your email address.You may then login here after you have validate your email address.<br><br>
  <a href="~/Login.aspx">Click here to try logging in!</a>
  </div>

</div>
</body>
</html>
