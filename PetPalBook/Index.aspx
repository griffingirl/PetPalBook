<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PetPalBook.header" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Pet Community</title>
      
  <link rel="stylesheet" type="text/css" href="/CSS/Main.css"/> 
         
  <script>

    var bounceStep = 0;
    var hasEmail = false;

    function highlite() {
      alert("here");
    }

    function inflate(icon) {
      if (icon === "marketplace") {
      } else if (icon === "bios") {
        event.srcElement.style.width = "80px";
        event.srcElement.style.height = "100px";
        event.srcElement.style.backgroundColor = "blue"
        event.srcElement.innerHTML = "it worked";
      }
    }


    function deflate(icon) {
        if (icon === "marketplace") {
        } else if (icon === "bios") {
          event.srcElement.style.width = "65px";
          event.srcElement.style.height = "65px";
          event.srcElement.style.backgroundColor = "#0094ff"
          event.srcElement.innerHTML = "";
        }
      }

      function afterload() {
        var myVar = setInterval(function () { bounceEmail() }, 300);
        var myVar = setInterval(function () { bounceEmail2() }, 300);
      }

      function bounceEmail() {
        document.getElementById("testvalues").value = "test value = " + bounceStep++;
      }

      function bounceEmail2() {
        document.getElementById("testvalues").value = "test value = " + bounceStep++;
      }

    </script>

    </head>
<body onload="afterload()">
<!-- #Include virtual="header.aspx" -->
    
    <!--content-->

    <div id="Div1" style="width: 100%; height: 20px; float: none; overflow: hidden; background-color:black"></div>

    <div id="pagecontentheader" style="width:100%;float:left;overflow:hidden;background-color:black">
        <div id="Div2" style="width:4%;height:10px;float:left;overflow:hidden; background-color:black"></div>

        <div id="petprofile" class="subsiteboxlink" onclick="javascript:location.href='petprofile.html'">
            <div id="titlebox1" style="float:left;width:100%;background-color:#0094ff">Pet Profile</div>
            <a href="petprofile.html"> 
            <img src="/Images/pet.gif" style=" height:200px"/></a>          
        </div>
        <div id="spacer0" style="width:4%;height:10px;float:left; overflow:hidden;background-color:black;">&nbsp</div>
        <div id="petmeetup" class="subsiteboxlink"; style="background-color:#00ff21"; onclick="javascript:location.href='petprofile.html'">
            <div id="titlebox2" style="float:left;width:100%;background-color:#00ff21">Pet Meetup</div>
            <a href="petMeetup.html"> 
            <img src="/Images/pet.gif" style=" height:200px; width: 201px;"/></a> 
            </div>
        <div id="spacer2" style="width:4%;height:10px;float:left; overflow:hidden;background-color:black">&nbsp</div>
        <div id="petmarketplace" class="subsiteboxlink" style="background-color:yellow;onclick="javascript:location.href='petprofile.html'">
            <div id="titlebox3" style="float:left;width:100%;background-color:yellow">Pet Marketplace</div>
            <a href="petMarketplace.html"> 
            <img src="/Images/pet.gif" style=" height:200px"/></a> 
            </div>
        <div id="spacer3" style="width:4%;height:10px;float:left; overflow:hidden;background-color:black">&nbsp</div>
         <div id="Div3" class = "subsiteboxlink" style="background-color:#f62f02;onclick="javascript:location.href='petprofile.html'">
            <div id="titlebox4" style="float:left;width:100%;background-color:#f62f02">Pet Tube</div>
             <a href="petTube.html"> 
            <img src="/Images/pet.gif" style=" height:200px; width: 201px;"/></a> 
            </div>
        <div id="spacer4" style="width:4%;height:10px;float:left; overflow:hidden;background-color:black">&nbsp</div>
        
    </div>

    
   <input type='text' id='testvalues' style='height:100px;width:200px' value="2"/>
<!-- #Include virtual="footer.aspx" -->
</body>
</html>
