<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="PetPalBook.Users.userProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
<link rel="stylesheet" type="text/css" href="/CSS/Main.css"/>
    
</head>
<body onload="afterload()" style="background-color:black">
 <form id="form1" runat="server">
<!-- #Include virtual="/header.aspx" -->

<div id="content" style="overflow:auto; width:90%;padding-left:20px">
  <div id="profile" style="width:100%; text-align:center;background-color:#0094ff"><h1>Profile</h1></div>
  <div id="leftColumn" style="width:100%; text-align:left; background-color:#d1e3f1;float:none;">
    <table>
      <tr>
        <td class="auto-style2"><img src="~/Images/owner.jpg" style="height: 440px; width: 317px" /><br />
          <asp:Button ID="editPic" runat="server" Text="Edit Profile Pic" />
        </td>
        <td class="auto-style1"><table id="Basic Information">
      <tr>
        <th colspan="2"><h2>Basic information </h2></th>
      </tr>
      <tr>
        <td>Birthdate</td> <td>birthday information </td>
      </tr>
      <tr>
        <td>Phone</td> <td>phone information</td>
      </tr>
      <tr>
        <td>Country</td> <td>Country information</td>
      </tr>
      <tr>
        <td>City</td> <td>City information</td>
      </tr>
      <tr>
        <td>
        <asp:Button ID="editInfo" runat="server" Text="Edit information" /></td> <td></td>
      </tr>
    </table></td>
      </tr>
        <td colspan="2" class="auto-style3">Biography<br />
          <br />
          <br />
        <asp:Button ID="editBiography" runat="server" Text="Edit Biography" />
        </td>
    </table>
   
  </div> 
  
    
  </div>
  
  
  <div id="pets" style="width:90%; text-align:left; background-color:#d1e3f1;float:none;">

    <div id="petBtns">
      <h1 style="background-color:#0094ff">Pet Family</h1>
      <table>
        <tr>
          <td><img src="/Images/charly.jpg" style="height: 157px; width: 244px" /></td><td>Charly</td><td class="auto-style4">Biography <br />interests</td><td>
          <asp:Button ID="Button2" runat="server" Text="Edit [Charly]" /></td>
          
        </tr>
        <tr>
          <td><img src="/Images/babysusy.jpg" style="height: 160px; width: 243px" /></td><td>Baby Susy</td><td class="auto-style4">Biography <br />interests</td>
          <td>
          <asp:Button ID="Button3" runat="server" Text="Edit Pet" /></td>
        </tr>
        <tr>
          <td><img src="/Images/jonny1.jpg" style="height: 153px; width: 241px" /></td><td>Jonny</td><td class="auto-style4">Biography <br />interests</td>
          <td>
          <asp:Button ID="Button4" runat="server" Text="Edit Pet" /></td>
        </tr>
      </table>
      <input type ="button" value="add pet" onclick="javascript: location.href = '/addPet.aspx'"/> <asp:Button ID="editPet" runat="server" Text="Edit all Pets" />
    </div>
  </div>
</div>

 

<!-- #Include virtual="/footer.aspx" -->
</form>
</body>
</html>
