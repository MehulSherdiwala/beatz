using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using beatz.Classes;
using System.Data;

namespace beatz.admin
{
    public partial class add_music : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Connection con = new Connection();
                con.Open();

                string query = "select genre_id, genre_name from genre";
                SqlDataReader rd = con.ExecuteDQL(query);
                ddl_genre.DataSource = rd;
                ddl_genre.DataTextField = "genre_name";
                ddl_genre.DataValueField = "genre_id";
                ddl_genre.DataBind();
                ddl_genre.Items.Insert(0, "Select");
                rd.Close();

                query = "select album_id, album_name from album";
                rd = con.ExecuteDQL(query);
                ddl_album.DataSource = rd;
                ddl_album.DataTextField = "album_name";
                ddl_album.DataValueField = "album_id";
                ddl_album.DataBind();
                ddl_album.Items.Insert(0, "Select");
                rd.Close();
                query = "select artist_id, artist_name from artist";
                SqlCommand c = con.cmd(query);
                artist_box.DataSource = c.ExecuteReader();
                artist_box.DataTextField = "artist_name";
                artist_box.DataValueField = "artist_id";
                artist_box.DataBind();
                con.Close();
            }
        }

        protected void addMusic_Click(object sender, EventArgs e)
        {
            string img_name = "";
            string src = "";
            if (image.HasFile)
            {
                img_name = image.FileName;
                image.PostedFile.SaveAs(Server.MapPath("~/uploads/" + img_name));
                
            }
            if (music.HasFile)
            {
                src = music.FileName;
                music.PostedFile.SaveAs(Server.MapPath("~/media/" + src));

            }
            Connection con = new Connection();
            con.Open();

            var listOfStrings = new List<string>();
            
            foreach (ListItem i in artist_box.Items)
            {
                if (i.Selected == true)
                {
                    listOfStrings.Add(i.Value.ToString());
                }
            }
            int id = con.pkInc("music_id", "music");
            DateTime date = DateTime.Now;
            string format = "yyyy-MM-dd";
            string name = music_name.Text;
            string artist = string.Join(",", listOfStrings.ToArray());
            string genre = ddl_genre.SelectedValue.ToString();
            string album = ddl_album.SelectedValue.ToString();
            Session["aid"] = 1;

            string query = "insert into music(music_id, music_name, src, image, genre_id, artist_id, album_id, created_at, created_by) values(" + id + ", '" + name + "', '" + src + "', '" + img_name + "', '" + genre + "', '" + artist + "', '" + album + "', '" + date.ToString(format) + "', '" + Session["aid"].ToString() + "')";

            int x = con.ExecuteDML(query);
            if (x > 0)
            {
                Response.Redirect("music.aspx");
            }
            con.Close();
        }
    }
}