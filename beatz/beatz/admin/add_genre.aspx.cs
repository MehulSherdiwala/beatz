using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using beatz.Classes;
namespace beatz.admin
{
    public partial class add_genre : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addGenre_Click(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();

            string name = txt_name.Text;
            string desc = txt_desc.Text;

            int id = con.pkInc("genre_id", "genre");
            
            string query = "insert into genre values(" + id + ",'" + name + "','" + desc + "')";
            int x = con.ExecuteDML(query);
            if (x > 0)
            {
                Response.Redirect("genre.aspx");
            } else
            {
                msg.Text = "Can't add Genre";
            }
            con.Close();
        }
    }
}