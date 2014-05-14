using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace PetPalBook
{
  public partial class addPet : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      bool errorsonpage = false;
      string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

      if (Page.IsPostBack)
      {
        if (errorsonpage == true) return;

        MySqlConnection myConnection = new MySqlConnection();
        myConnection.ConnectionString = connectionString;

        string sqlstring = @"

              insert into tblpets(userID, name, speciesID, breedID) values (
                                  1, @name, 1, 1)
      ";

        MySqlCommand cmd = new MySqlCommand(sqlstring, myConnection);
        cmd.Parameters.AddWithValue("@name", txtName.Text);

        cmd.Connection.Open();
        cmd.ExecuteNonQuery();

        myConnection.Close();
        myConnection.Dispose();


      }




    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }
  }
}