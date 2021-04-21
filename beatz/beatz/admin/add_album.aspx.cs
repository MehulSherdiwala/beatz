using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using beatz.Classes;
namespace beatz.admin
{
    public partial class add_album : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["aid"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void addAlbum_Click(object sender, EventArgs e)
        {
            if (fu_image.HasFile)
            {
                string img_name = fu_image.FileName;
                fu_image.PostedFile.SaveAs(Server.MapPath("~/uploads/" + img_name));

                Connection con = new Connection();
                con.Open();

                string album_name = txt_name.Text;
                int id = con.pkInc("album_id", "album");
                DateTime date = DateTime.Now;
                string format = "yyyy-MM-dd";

                string query = "insert into album(album_id, album_name, album_image, created_at, created_by) values(" + id + ", '" + album_name + "', '" + img_name + "', '" + date.ToString(format) + "', '" + Session["aid"].ToString() + "' )";
                Response.Write(query);
                int x = con.ExecuteDML(query);
                if (x > 0)
                {
                    Response.Redirect("album.aspx");
                }
                else
                {
                    msg.Text = "Can't add Album";
                }
            }
        }
    }
}