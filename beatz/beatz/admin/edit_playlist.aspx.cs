//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace beatz.admin
//{
//    public partial class edit_playlist : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {

//        }
//    }
//}

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
    public partial class edit_playlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (!IsPostBack && id != null)
            {
                Connection con = new Connection();
                con.Open();
                string query = "select * from playlist where playlist_id=" + id;

                SqlDataReader rd = con.ExecuteDQL(query);

                rd.Read();

                txt_id.Value = rd["playlist_id"].ToString();
                txt_name.Text = rd["playlist_name"].ToString();
                playlist_img.ImageUrl = "~/uploads/" + rd["playlist_image"].ToString();

                con.Close();
            }
        }

        protected void editPlaylist_Click(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();

            string playlist_name = txt_name.Text;
            string playlist_id = txt_id.Value;
            DateTime date = DateTime.Now;
            string format = "yyyy-MM-dd";

            if (fu_image.HasFile)
            {
                string img_name = fu_image.FileName;
                fu_image.PostedFile.SaveAs(Server.MapPath("~/uploads/" + img_name));
                string q = "update playlist set playlist_image = '" + img_name + "' where playlist_id=" + playlist_id + "";
                con.ExecuteDML(q);
            }


            string query = "update playlist set playlist_name = '" + playlist_name + "', updated_at ='" + date.ToString(format) + "' where playlist_id=" + playlist_id + "";

            int x = con.ExecuteDML(query);
            if (x > 0)
            {
                Response.Redirect("playlist.aspx");
            }
            else
            {
                msg.Text = "Can't add Playlist";
            }
        }
    }
}