using beatz.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace beatz
{
    public partial class playlist_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["playlist"];
            Connection conn = new Connection();
            conn.Open();
            int songs = 0;
            string query = @"select *, (SUBSTRING( ( 
                                 SELECT ',' + artist_name AS 'data()'
                                     FROM artist where artist_id in (select value from STRING_SPLIT(CONVERT(VARCHAR(MAX), m.artist_id), ',')) FOR XML PATH('')
                            ), 2 , 9999)) as artist from playlist_musics pm inner join music m on m.music_id=pm.music_id where pm.playlist_id=" + id;

            SqlDataReader rd = conn.ExecuteDQL(query);

            StringBuilder html = new StringBuilder();

            while (rd.Read())
            {
                songs++;
                html.Append(@"<li class='my-4'>
							<div class='d-flex justify-content-around'>
								<div class='mm-audio'>
									<span data-music='" + rd["music_id"].ToString() + @"' class='download play_music'><i class='fa fa-play'></i></span>
								</div>
								<div class='d-flex flex-column mx-2 align-items-center'>
									<p class='h4'>" + rd["music_name"].ToString() + @"</p>
									<p>" + rd["artist"].ToString() + @"</p>
								</div>
                                <p></p>
							</div>
						</li>");
            }

            rd.Close();
            query = "select playlist_name from playlist where playlist_id=" + id;
            SqlDataReader rd2 = conn.ExecuteDQL(query);
            rd2.Read();
            song_list.InnerHtml = html.ToString();
            song_count.Text = songs.ToString() + " Songs";
            playlist_name.Text = rd2["playlist_name"].ToString();

            conn.Close();
        }
    }
}