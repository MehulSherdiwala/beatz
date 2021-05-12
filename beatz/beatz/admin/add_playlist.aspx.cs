using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using beatz.Classes;
namespace beatz.admin
{
    public partial class add_playlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["aid"] == null)
            {
                Response.Redirect("login.aspx");
            }

            Connection con = new Connection();
            con.Open();
            StringBuilder html = new StringBuilder();

            string query = @"select music_id,image, music_name, created_at, (select genre_name from genre where genre_id=convert(int,CONVERT(VARCHAR(MAX),m.genre_id))) as genre, (SUBSTRING( ( 
                                 SELECT ',' + artist_name AS 'data()'
                                     FROM artist where artist_id in (select value from STRING_SPLIT(CONVERT(VARCHAR(MAX),m.artist_id), ',')) FOR XML PATH('') 
                            ), 2 , 9999)) as artist, (select album_name from album where album_id=convert(int,CONVERT(VARCHAR(MAX),m.album_id))) as album from music m where deleted_at IS NULL;";
            SqlDataReader rd = con.ExecuteDQL(query);
            while (rd.Read())
            {
                html.Append("<tr>");
                html.Append("<th>" + rd["music_id"] + "</th>");
                html.Append("<th scope='row'><div class='media align-items-center'><a href = '#' class='avatar rounded-circle mr-3'><img alt = 'Image placeholder' src='../uploads/" + rd["image"] + "'></a><div class='media-body'><span class='name mb-0 text-sm'>" + rd["music_name"] + "</span></div></div></th>");
                html.Append("<td> " + rd["genre"] + " </td>");
                html.Append("<td>" + rd["artist"] + "</td>");
                html.Append("</tr>");
            }
            table.InnerHtml = html.ToString();
            con.Close();
        }

        protected void addPlaylist_Click(object sender, EventArgs e)
        {
            if (fu_image.HasFile)
            {
                string img_name = fu_image.FileName;
                fu_image.PostedFile.SaveAs(Server.MapPath("~/uploads/" + img_name));

                Connection con = new Connection();
                con.Open();

                string playlist_name = txt_name.Text;
                int id = con.pkInc("playlist_id", "playlist");
                DateTime date = DateTime.Now;
                string format = "yyyy-MM-dd";

                string query = "insert into playlist(playlist_id, playlist_name, playlist_image, created_at) values(" + id + ", '" + playlist_name + "', '" + img_name + "', '" + date.ToString(format) + "' )";
                Response.Write(query);
                int x = con.ExecuteDML(query);
                if (x > 0)
                {
                    Response.Redirect("playlist.aspx");
                }
                else
                {
                    msg.Text = "Can't add Playlist!";
                }
            }
        }
    }
}

