using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using beatz.Classes;
using System.Text;

namespace beatz
{
    public partial class create_playlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if( Session["user_id"] == null){
                Response.Redirect("/login.aspx");
            }

            Connection con = new Connection();
            con.Open();
            StringBuilder html = new StringBuilder();

            string query = @"select music_id, music_name,  (SUBSTRING( ( 
                                 SELECT ',' + artist_name AS 'data()'
                                     FROM artist where artist_id in (select value from STRING_SPLIT(CONVERT(VARCHAR(MAX),m.artist_id), ',')) FOR XML PATH('') 
                            ), 2 , 9999)) as artist from music m where deleted_at IS NULL;";
            SqlDataReader rd = con.ExecuteDQL(query);
            while (rd.Read())
            {
                html.Append("<tr>");
                html.Append("<th> <input type='checkbox' name='music_id' class='music' value='" + rd["music_id"] + "' /></th>");
                html.Append("<th>" + rd["music_name"] + "</th>");
                html.Append("<td>" + rd["artist"] + "</td>");
                html.Append("</tr>");
            }
            table.InnerHtml = html.ToString();
            con.Close();
        }
        [System.Web.Services.WebMethod]
        public static void savePlaylist(string name, string id, int user_id)
        {
            Connection con = new Connection();
            con.Open();
            int i = con.pkInc("user_playlist_id", "user_playlist");
            DateTime date = DateTime.Now;
            string format = "yyyy-MM-dd";

            string query = "insert into user_playlist(user_playlist_id, user_playlist_name, created_at, user_id) values(" + i + ", '" + name +"', '" + date.ToString(format) + "', " + user_id + ")";

            con.ExecuteDML(query);
            string[] music_id = id.Split('-');
            for (int j = 0; j < music_id.Length; j++)
            {
                int pm_id = con.pkInc("user_playlist_music_id", "user_playlist_musics");
                query = "insert into user_playlist_musics(user_playlist_music_id, music_id, music_index, user_playlist_id) values(" + pm_id + ", " + music_id[j] + ", " + (j + 1) + ", " + i + " )";
                con.ExecuteDML(query);
            }
        }
    }
}