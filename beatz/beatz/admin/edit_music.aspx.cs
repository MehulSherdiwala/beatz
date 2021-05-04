using beatz.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace beatz.admin
{
    public partial class edit_musid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"].ToString();
            if (!IsPostBack && id != null)
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
                con.Open();

                query = "select * from music where music_id=" + id;
                SqlDataReader rd2 = con.ExecuteDQL(query);
                rd2.Read();
                music_name.Text = rd2["music_name"].ToString();
                music_id.Value = id;
                ddl_album.Items.FindByValue(rd2["album_id"].ToString()).Selected = true;
                ddl_genre.Items.FindByValue(rd2["genre_id"].ToString()).Selected = true;
                
                foreach (string i in rd2["artist_id"].ToString().Split(','))
                {
                    artist_box.Items.FindByValue(i).Selected = true;
                }
                rd2.Close();
                con.Close();
            }
        }

        protected void editMusic_Click(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();
            var listOfStrings = new List<string>();

            foreach (ListItem i in artist_box.Items)
            {
                if( i.Selected == true)
                {
                    listOfStrings.Add(i.Value.ToString());
                }
            }
            string name = music_name.Text;
            string id = music_id.Value;
            string artist = string.Join(",", listOfStrings.ToArray());
            string genre = ddl_genre.SelectedValue.ToString();
            string album = ddl_album.SelectedValue.ToString();
            DateTime date = DateTime.Now;
            string format = "yyyy-MM-dd";

            if (image.HasFile)
            {
                string img_name = image.FileName;
                image.PostedFile.SaveAs(Server.MapPath("~/uploads/" + img_name));
                string q = "update music set image = '" + img_name + "' where music_id=" + id + "";
                con.ExecuteDML(q);
            }
            if (music.HasFile)
            {
                string music_name = music.FileName;
                music.PostedFile.SaveAs(Server.MapPath("~/uploads/" + music_name));
                string q = "update music set src = '" + music_name + "' where music_id=" + id + "";
                con.ExecuteDML(q);
            }


            string query = "update music set music_name = '" + name + "', artist_id = '" + artist + "', album_id = '" + album + "', genre_id = '" + genre + "', updated_at ='" + date.ToString(format) + "' where music_id=" + id + "";

            int x = con.ExecuteDML(query);
            if (x > 0)
            {
                Response.Redirect("music.aspx");
            }
        }
    }
}