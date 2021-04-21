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
    public partial class edit_genre : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Connection con = new Connection();
                con.Open();

                string query = "select * from genre where genre_id=" + Request.QueryString["id"];
                SqlDataReader rd = con.ExecuteDQL(query);

                rd.Read();

                txt_id.Value = rd["genre_id"].ToString();
                txt_name.Text = rd["genre_name"].ToString();
                txt_desc.Text = rd["genre_description"].ToString();
                con.Close();
            }
        }

        protected void editGenre_Click(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();

            int genre_id = Convert.ToInt32(txt_id.Value);
            string name = txt_name.Text;
            string desc = txt_desc.Text;

            string query = "update genre set genre_name='" + name + "', genre_description='" + desc + "' where genre_id=" + genre_id;
            Response.Write(query);
            int x = con.ExecuteDML(query);
            if (x > 0)
            {
                Response.Redirect("genre.aspx");
            } else
            {
                msg.Text = "Can't update Genre";
            }
        }
    }
}