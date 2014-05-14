<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addPet.aspx.cs" Inherits="PetPalBook.addPet" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
<link rel="stylesheet" type="text/css" href="/CSS/Main.css"/> 
<!-- #Include virtual="/header.aspx" -->
</head>
<body>
    <form id="form1" runat="server">
   
<div style="background-color:black;height:20px"></div>
<div id="content" style="width:80%; margin-left:100px;padding-left:100px">
  
  <div id="profileForm" style="margin:auto">
    Add a pet to your family:<br />
    <br />
    Name of pet:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="btnPetName" runat="server" Text="Add Pet Name" />
    <br />
    <br />
    Select species:&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="ddlSpecies" runat="server">
    </asp:DropDownList>
    <br />
    <br />
    Select breed:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ddlBreed" runat="server">
    </asp:DropDownList>
    <br />
    <br />
    Upload a photo of your pet:<br />
    <asp:Image ID="Image1" runat="server" Height="46px" Visible="False" Width="49px" />
    <br />
    <asp:Button ID="btnUploadPic" runat="server" Text="Upload Profile Photo" />
    <br />
    <br />
    Biography of [pet name]:<br />
    <asp:TextBox ID="TextBox1" runat="server" Height="130px" Width="412px"></asp:TextBox>
    <br />
    <br />
    Pet Interests:&nbsp;&nbsp;
    <br />
    <asp:TextBox ID="interestSearch" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblInterestResult" runat="server" BorderStyle="Inset" Text="search results"></asp:Label>
    <br />
    <br />
    <asp:Button ID="btnInterest" runat="server" Text="Add interest" />
    <br />
    <br />
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit Profile" OnClick="btnSubmit_Click" />
  </div>  
  <div id="rightColumn" style="width:20%; float:left"></div>
</div>
    </form>
</body>
</html>
