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
    public partial class genre_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["genre"];
            if (id != null){
                Connection conn = new Connection();
                conn.Open();
                int songs = 0;
                string query = @"select *, (SUBSTRING( ( 
                                 SELECT ',' + artist_name AS 'data()'
                                     FROM artist where artist_id in (select value from STRING_SPLIT(CONVERT(VARCHAR(MAX), m.artist_id), ',')) FOR XML PATH('')
                            ), 2 , 9999)) as artist from music m where deleted_at is null and CONVERT(VARCHAR(MAX), genre_id)=" + id;

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
                query = "select genre_name from genre where genre_id=" + id;
                SqlDataReader rd2 = conn.ExecuteDQL(query);
                rd2.Read();
                song_count.Text = songs.ToString() + " Songs";
                playlist_name.Text = rd2["genre_name"].ToString();
                song_list.InnerHtml = html.ToString();
                thumbnail.ImageUrl = "/images/resources/blog1.jpg";

                conn.Close();
            }
        }
    }
}