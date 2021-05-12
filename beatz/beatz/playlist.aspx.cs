using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using beatz.Classes;
namespace beatz
{
    public partial class playlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static List<Playlist> getPlaylist()
        {
            List<Playlist> playlist = new List<Playlist>();
            Connection con = new Connection();
            con.Open();

            string query = "select * from playlist where deleted_at IS NULL";


            SqlDataReader rd = con.ExecuteDQL(query);

            while (rd.Read())
            {
                playlist.Add(
                    new Playlist
                    {
                        id = rd["system_playlist_id"].ToString(),
                        name = rd["system_playlist_name"].ToString(),
                        image = rd["system_playlist_image"].ToString()
                    }
                );
            }
            return playlist;
        }
    }
}