<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userEditProfile.aspx.cs" Inherits="PetPalBook.Users.userEditProfile" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
 <link rel="stylesheet" type="text/css" href="/CSS/Main.css"/> 
<!-- #Include virtual="/header.aspx" -->
</head>
<body onload="afterload()">
  <form id="form1" runat="server">

  <div id="content" style="overflow:auto; width:90%;">
    <div style="background-color:black"></div>
      <div id="profileForm" style="width:100%;margin:auto">
  
      About you:
      <br />
      <br />
      Start by uploading a photo of you and your pet(s) or just of you!
      <br />
      <br />
      <asp:FileUpload ID="FileUpload1" runat="server" />
      <asp:Image ID="Image1" runat="server" Height="63px" Visible="False" Width="81px" BorderStyle="Inset" />
      <br />
      <br />
    Phone Number:&nbsp;&nbsp;
    <asp:TextBox ID="txtPhone" runat="server" Height="22px"></asp:TextBox>
&nbsp;<br />
    <br />
    Please tell Pet Pal Book a little about yourself and why you love pets!<br />
    <asp:TextBox ID="txtBio" runat="server" Height="130px" Width="412px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Search interest"></asp:Label>
    :&nbsp;&nbsp;
    <br />
    <asp:TextBox ID="txtInterest" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblInterestResult" runat="server" BorderStyle="Inset" Text="search results"></asp:Label>
    <br />
    <asp:Button ID="btnInterest" runat="server" Text="Add interest" />
    <br />
    <asp:Label ID="Label2" runat="server" BorderStyle="Inset" Text="Interests added" Width="284px"></asp:Label>
    <br />
    <br />

    Add a pet to your family!<br />
    <br />
<div id="addPet" onclick="javascript:location.href='/addPet.aspx'">
  <a href="/addPet.aspx"> 
    <input type="button" value="Add Pet" />
  </a>
</div>
    <br />
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit Profile" OnClick="btnSubmit_Click" />
  </div>  
  <div id="rightColumn" style="width:20%; float:left"></div>
</div>

  </form>
<footer>PetPal Book &copy  &reg 2014 </footer>

</body>
</html>
