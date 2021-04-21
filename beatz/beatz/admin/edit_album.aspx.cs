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
    public partial class edit_album : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (!IsPostBack && id != null)
            {
                Connection con = new Connection();
                con.Open();
                string query = "select * from album where album_id=" + id;

                SqlDataReader rd = con.ExecuteDQL(query);

                rd.Read();

                txt_id.Value = rd["album_id"].ToString();
                txt_name.Text = rd["album_name"].ToString();
                album_img.ImageUrl = "~/uploads/" + rd["album_image"].ToString();

                con.Close();
            }
        }

        protected void editAlbum_Click(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();

            string album_name = txt_name.Text;
            string album_id = txt_id.Value;
            DateTime date = DateTime.Now;
            string format = "yyyy-MM-dd";

            if (fu_image.HasFile)
            {
                string img_name = fu_image.FileName;
                fu_image.PostedFile.SaveAs(Server.MapPath("~/uploads/" + img_name));
                string q = "update album set album_image = '" + img_name + "' where album_id=" + album_id + "";
                con.ExecuteDML(q);
            }


            string query = "update album set album_name = '" + album_name + "', updated_at ='" + date.ToString(format) + "' where album_id=" + album_id + "";
            
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