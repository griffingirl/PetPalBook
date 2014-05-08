using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

//=====================================================================================================
// TODO: - extra security to ensure we do not allow for sql injections...
//=====================================================================================================

namespace PetPalBook
{
  public partial class Login : System.Web.UI.Page
  {
    //=====================================================================================================
    // if post back we are trying to login...
    //=====================================================================================================
    protected void Page_Load(object sender, EventArgs e)
    {
      Boolean loginSuccesfull = false;

      if (Page.IsPostBack){
        string sqlstring = "select firstname, lastname, id from tblUser where email = '" + txtUsername.Text + "' and password = '" + txtPassword.Text + "' ";
        MySqlConnection myConnection = new MySqlConnection();
        myConnection.ConnectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

        txtTest.Text = sqlstring;

        MySqlDataAdapter da = new MySqlDataAdapter(sqlstring, myConnection);
        DataSet ds = new DataSet();

        da.Fill(ds, "passwordcheck");

        if (ds.Tables[0].Rows.Count > 0){
          loginSuccesfull = true;
          Session["firstname"] = ds.Tables[0].Rows[0]["firstname"].ToString();
          Session["lastname"] = ds.Tables[0].Rows[0]["lastname"].ToString();
          Session["userid"] = ds.Tables[0].Rows[0]["id"].ToString();
        } else {
          lblErrorMessages.Text = "Sorry your uername or password was wrong.  Please try again!";
          lblErrorMessages.Visible = true;
          loginSuccesfull = false;
        }

        myConnection.Close();
        myConnection.Dispose();
      } else {
      }

      if (loginSuccesfull == true) Response.Redirect("/users/userProfile.aspx");
    }

    //=====================================================================================================
    //=====================================================================================================
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
  }
}