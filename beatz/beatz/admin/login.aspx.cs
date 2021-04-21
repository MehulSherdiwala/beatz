using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using beatz.Classes;
using System.Data.SqlClient;
namespace beatz.admin
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();

            string email = txt_email.Text;
            string password = txt_password.Text;

            string query = "select * from admin where email='" + email + "' and password='" + password + "'";

            SqlDataReader rd = con.ExecuteDQL(query);
            if (rd.HasRows)
            {
                rd.Read();
                Session["username"] = rd["username"];
                Session["aid"] = rd["aid"];
                Response.Redirect("index.aspx");
            }
            else
            {
                error.Text = "Invalid Email or Password";
            }

            rd.Close();
        }
    }
}