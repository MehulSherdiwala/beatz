using beatz.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace beatz.admin
{
    public partial class add_artist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["aid"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void addArtist_Click(object sender, EventArgs e)
        {
            if (fu_image.HasFile)
            {
                string img_name = fu_image.FileName;
                fu_image.PostedFile.SaveAs(Server.MapPath("~/uploads/" + img_name));

                Connection con = new Connection();
                con.Open();

                string artist_name = txt_name.Text;
                string artist_desc = txt_desc.Text;
                string gender = "";
                if (male.Checked)
                {
                    gender = male.Text;
                } else
                {
                    gender = female.Text;
                }
                int id = con.pkInc("artist_id", "artist");
                DateTime date = DateTime.Now;
                string format = "yyyy-MM-dd";

                string query = "insert into artist(artist_id, artist_name, artist_description, artist_gender, artist_image, created_at, created_by) values(" + id + ", '" + artist_name + "', '" + artist_desc + "', '" + gender + "', '" + img_name + "', '" + date.ToString(format) + "', '" + Session["aid"].ToString() + "' )";
                Response.Write(query);
                int x = con.ExecuteDML(query);
                if (x > 0)
                {
                    Response.Redirect("artist.aspx");
                }
                else
                {
                    msg.Text = "Can't add Album";
                }
            }
        }
    }
}