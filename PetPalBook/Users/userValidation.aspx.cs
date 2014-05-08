using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using MySql.Data.MySqlClient;
using System.Net.Mail;


//===================================================================================================================
//
//  TODO: - if the user tryies to validate their email address and it already has been validated should
//          cause an error.  So if the username and password match up then we still need to check 
//          to see if the user was already validated and give an error to that.
//
//===================================================================================================================


namespace PetPalBook.Users
{
  public partial class userValidation : System.Web.UI.Page
  {
    string currentUserID = "";
    string firstname = "";
    string lastname = "";

    //===================================================================================================================
    // if the 
    //===================================================================================================================
    protected void Page_Load(object sender, EventArgs e)
    {
      MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

      try{
        currentUserID = Request.QueryString["id"].ToString(); 
      } catch (Exception ex){
        // looks like no id was passed so somehow they got to this page without neededing to be here
        txtPassword.Text = ex.Message;  
        currentUserID = "";
      }

      // if there is no current user id then we must exit as there is no point being here
      if (currentUserID == ""){
        return;
      } else {
        try{
          MySqlDataAdapter da = new MySqlDataAdapter("select firstname, lastname from tblUser where id = " + currentUserID, conn);
          DataSet ds = new DataSet();
          da.Fill(ds, "tblUser");

          if (ds.Tables[0].Rows.Count > 0){
            lblWelcome.Text = "Welcome <b>" + ds.Tables[0].Rows[0]["firstname"].ToString() + " " + ds.Tables[0].Rows[0]["lastname"].ToString() + "</b>!";
            firstname = ds.Tables[0].Rows[0]["firstname"].ToString();
            lastname = ds.Tables[0].Rows[0]["lastname"].ToString();
          } else {
          }
          conn.Close();
        } catch (MySqlException ex){ 
          conn.Close();
          //********************************** we had an error and should return...
        }      
      }
      conn.Dispose();


      // if we got this far we should be checking the password is correct
      validatePassword();


//        da.Fill(ds, "tanklist");

//        if (ds.Tables[0].Rows.Count > 0)
//        {
//          foreach (DataRow theRow in ds.Tables["tanklist"].Rows)
//          {
//            ListViewItem lstItem = new ListViewItem(theRow["CustomerID"].ToString());

 //           lstItem.SubItems.Add(theRow["ID"].ToString());
 //           lstItem.SubItems.Add(theRow["TankName"].ToString());
 //           lstItem.SubItems.Add(theRow["FuelType"].ToString());
 //           lstItem.SubItems.Add(theRow["TankSize"].ToString());
 //           lstItem.SubItems.Add(theRow["AccessNumber"].ToString());
  //          lstItem.SubItems.Add(theRow["ECNumber"].ToString());
  //          stTanks.Items.Add(lstItem);
  //        }
  //      }

//        conn.Close();
 //       conn.Dispose();
        //currentTankID = "";

        // lets see if the password matches with the user id
                                                      
     // } else {
        // the get value is = 

     // }
    }

    //===================================================================================================================
    // check to see if the password is correct, if it is then enter a validate date
    // error trapping on this...
    //===================================================================================================================
    private void validatePassword(){
      MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
      MySqlDataAdapter da = new MySqlDataAdapter("select count(*) as thecount from tbluser where id = " + currentUserID + " and password = '" + txtPassword.Text + "'", conn);
      DataSet ds = new DataSet();
      da.Fill(ds, "tblUser");

      if (ds.Tables[0].Rows.Count > 0)
      {
        int tempcount = 0;
        tempcount = Int16.Parse(ds.Tables[0].Rows[0]["thecount"].ToString());

        // if the counter return backed more than 0 so that means the name is email is already registered...
        txtTest.Text = "the count = " + tempcount;
        if (tempcount > 0){
          // if the count is greater than 0 we must validate the user by putting in today's date into the system...

          
          SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
          string sqlstring = "update tbluser set verifieddate = now() where id = " + currentUserID;
          SqlCommand cmd = new SqlCommand(sqlstring, conn2);
          conn2.Open();
          cmd.ExecuteNonQuery();
          conn2.Close();
          conn2.Dispose();
          
        }
      }
      else
      {
      }
      conn.Close();
      conn.Dispose();
    }

    //===================================================================================================================
    // fopr testing purpioses we want to send off an email....
    //===================================================================================================================
    protected void butFinishRegistration_Click(object sender, EventArgs e)
    {


/*
      try{
        SmtpClient client = new SmtpClient("smtpout.secureserver.net");

        client.Port = 80;
        client.EnableSsl = false;

        client.Credentials = new System.Net.NetworkCredential("david@yourpetcommunicty.com", "oilers1974");

        MailMessage mail = new MailMessage();
        mail.From = new MailAddress("registration@yourpetcommunity.com", "Your Pet Community Email Validation");
        mail.To.Add("david.carachelo@gmail.com");

       //     mail.From = new MailAddress(mailFrom, mailFromDisplayName);
//        MailMessage mail = new MailMessage("registration@yourpetcommunity.com", "Your Pet Community Email Validation");

  //          mail.To.Add(to);

    //        if (cc != null)
     //       {
      //          mail.CC.Add(cc);
       //     }

            mail.Subject = "this is to tell you about registration";
            mail.Body = "this is a body";
            mail.IsBodyHtml = true;

            client.Send(mail);

          } catch (Exception ex){
            txtPassword.Text = ex.Message;
          }
     // try{//

       
//      MailMessage mail = new MailMessage();
//      mail.From = new MailAddress("registration@yourpetcommunity.com");
//      mail.To.Add(new MailAddress("david.caracelo@gmail.com"));
 //     mail.Subject = "ABC - Registration Comfirmation";
  //    mail.Body = "test";
   //   SmtpClient smtp = new SmtpClient("smtpout.secureserver.net");
  //    smtp.Credentials = new System.Net.NetworkCredential("registration", "Babysusy2");
   //   smtp.Port = 25;
   //   smtp.Send(mail);
   //   } catch (SmtpException ex){
    //    
      //}
    }*/
}
  }
}