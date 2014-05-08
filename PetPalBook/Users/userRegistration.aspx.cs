using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;

//=========================================================================================================
// TODO in the future:
//   - if email exists ask if they lost their password
//   - ensure no special characters or sql injetcion into fields
//   - error message around checking emails
//=========================================================================================================
namespace PetPalBook
{
  public partial class userRegistration : System.Web.UI.Page
  {
    static Regex ValidEmailRegex = CreateValidEmailRegex();
    long lastID = -1;


    //=========================================================================================================
    // TODO:  - Use more generic email address for credentials.  Might have screwed up registration email address
    //        - some more error trapping
    //=========================================================================================================
    protected void Page_Load(object sender, EventArgs e)
    {
      if (Page.IsPostBack)
      {     

        if (Request.QueryString["id]"] == ""){
        } else {
        }

        lblErrorMessage.Visible = false;  

        //---------------------------------------------------------------------------------------------------------
        // double check to ensure the email address is correct
        //---------------------------------------------------------------------------------------------------------
        if (ValidEmailRegex.IsMatch(txtEmail.Text) == false){
          lblErrorMessage.Text = "The email address is invalid.  Please correct";
          lblErrorMessage.Visible = true;
          return;
        }

        //---------------------------------------------------------------------------------------------------------
        //---------------------------------------------------------------------------------------------------------
        if (ValidEmailRegex.IsMatch(txtVerifyEmail.Text) == false){
          lblErrorMessage.Text = "The verify email address is invalid.  Please correct";
          lblErrorMessage.Visible = true;
          return;
        } else {
        }

        //---------------------------------------------------------------------------------------------------------
        // check to see if the emails match up
        //---------------------------------------------------------------------------------------------------------
        if (txtEmail.Text != txtVerifyEmail.Text){
          lblErrorMessage.Text = "The emails do not match.  Please correct";
          lblErrorMessage.Visible = true;   
          return;
        }

        //---------------------------------------------------------------------------------------------------------
        //---------------------------------------------------------------------------------------------------------
        if (txtPassword.Text != txtverifyPassword2.Text){
          lblErrorMessage.Text = "The passwords do not match.  Please correct";
          lblErrorMessage.Visible = true;
          return;
        }

        //---------------------------------------------------------------------------------------------------------
        // check to ensure the email is not already taken
        //---------------------------------------------------------------------------------------------------------
        if (validateRegistration() == true){
          registerUserIntoDatabase();
          sendConfirmationEmail();
        } else {
        }
      } else {
      }
    }

    //=========================================================================================================
    //=========================================================================================================
    private static Regex CreateValidEmailRegex(){
      string validEmailPattern = @"^(?!\.)(""([^""\r\\]|\\[""\r\\])*""|"
          + @"([-a-z0-9!#$%&'*+/=?^_`{|}~]|(?<!\.)\.)*)(?<!\.)"
          + @"@[a-z0-9][\w\.-]*[a-z0-9]\.[a-z][a-z\.]*[a-z]$";

      return new Regex(validEmailPattern, RegexOptions.IgnoreCase);
    }

    //=========================================================================================================
    //=========================================================================================================
    internal static bool EmailIsValid(string emailAddress){
      bool isValid = ValidEmailRegex.IsMatch(emailAddress);
      return isValid;
    }


    //========================================================================================================
    // check to see if there are some server side validations we must do, such as ensuring the email already 
    // has not ben validates
    //========================================================================================================
    private Boolean validateRegistration(){
      Boolean flip = true;

      MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
      MySqlDataAdapter da = new MySqlDataAdapter("select count(*) as thecounter from tblUser where id = '" + txtEmail.Text + "'", conn);
      DataSet ds = new DataSet();
      da.Fill(ds, "tblUser");

      // lets check teh count.  If the count is greater than 0 then we already have someone registered with 
      // that email address and we cannot take it
      // 
      if (ds.Tables[0].Rows.Count > 0){
        try{
          int emailcount = Int16.Parse(ds.Tables[0].Rows[0]["thecounter"].ToString());

          if (emailcount > 0){
            lblErrorMessage.Text = "The email already has been registered...";
            flip = false;
          }
        } catch(Exception ex){
        }
      }
      conn.Close();
      conn.Dispose();

      return flip;
    }

    //========================================================================================================
    // store the values in the database if everything ok
    //========================================================================================================
    private void registerUserIntoDatabase()
    {
      try
      {
        MySqlConnection myConnection = new MySqlConnection();
        myConnection.ConnectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

        String sqlstring = @"

                 insert into tblUser(firstname, lastname, email, city, province, postalcode, password) values (
                            @first, @last, @email, @city, @province, @postalcode, @password)

        ";

        MySqlCommand cmd = new MySqlCommand(sqlstring, myConnection);
        cmd.Parameters.Add("@first", MySqlDbType.VarChar, 32).Value = txtFirstName.Text;
        cmd.Parameters.Add("@last", MySqlDbType.VarChar, 32).Value = txtLastName.Text;
        cmd.Parameters.Add("@email", MySqlDbType.VarChar, 256).Value = txtEmail.Text;
        cmd.Parameters.Add("@city", MySqlDbType.VarChar, 20).Value = txtCity.Text;
        cmd.Parameters.Add("@province", MySqlDbType.VarChar, 2).Value = lstProv.Text;
        cmd.Parameters.Add("@postalcode", MySqlDbType.VarChar, 6).Value = txtPostalCode.Text;
        cmd.Parameters.Add("@password", MySqlDbType.VarChar, 32).Value = txtPassword.Text;

        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        lastID = cmd.LastInsertedId;

        myConnection.Close();
        myConnection.Dispose();
      }
      catch (MySqlException ex)
      {
        // send out message
      }
    }

    //========================================================================================================
    //========================================================================================================
    private Boolean checkEmailAlreadyExists(){

      return false;

    }

    //========================================================================================================
    // if we get this far on our poast back the we have the register button and everything is ok..,
    // since the register button is the only button that can do any submissions we can safely assume its a submit
    //========================================================================================================
    private void sendConfirmationEmail(){
      
      MailMessage mail = new MailMessage();
      mail.To.Add(txtEmail.Text);
      mail.From = new MailAddress("david@yourpetcommunity.com", "YourPetCommunity Registration");
      mail.Subject = "Your one step closer to validing your pet community account!";
      mail.Body += "<html>Welcome " + txtFirstName.Text + " " + txtLastName.Text + ",";
      mail.Body += @"
       <br><br>
        Your one step closer to enjoying all YourPetCommunity has to offer.  By clikcing on the link below we will
        be able to verify your email account with your account.  After this step is done you can now enter our
        wonderful site and check out all the awesome things a pet lover like yourself can do!.
        <br><br>
        Please click on the following link to verify your account:
        <br><br>
      ";

      // the ip address and posrt would change from 'http://127.0.0.1:12345' to 'www.yourpetcommunity.com'
      mail.Body += "<a href='http://localhost:12345/Users/userValidation.aspx?id=" + lastID + "'>Validate my email address please!</a>";
      mail.Body += @" 
         <br><br>
         We look forward to seeing you in our community soon!
         <br><br>
         Regards,
         <br><br>
         The Pet Community team!
         </html>
      ";

      mail.IsBodyHtml = true;
      SmtpClient smtpClient = new SmtpClient();
      smtpClient.Host = "smtpout.secureserver.net";
      smtpClient.Credentials = new System.Net.NetworkCredential("david@yourpetcommunity.com", "oilers1974");

      smtpClient.Send(mail);
      smtpClient.Dispose();

      pagebody.Attributes.Add("onload", "successRegistering()");
    }
  }
}