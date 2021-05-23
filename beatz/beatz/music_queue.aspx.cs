using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using beatz.Classes;
using System.Data.SqlClient;
namespace beatz
{
    public partial class music_queue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static List<Queue> getQueue()
        {
            List<Queue> queue = new List<Queue>();
            Connection con = new Connection();
            con.Open();

            string query = "select * from music where deleted_at IS NULL";


            SqlDataReader rd = con.ExecuteDQL(query);

            while (rd.Read())
            {
                queue.Add(
                    new Queue
                    {
                        title = rd["music_name"].ToString(),
                        mp3 = "media/" + rd["src"].ToString(),
                        oga = ""
                    }
                );
            }
            return queue;
        }
        [System.Web.Services.WebMethod]
        public static List<Queue> getPlaylistQueue(string playlist_id)
        {
            List<Queue> queue = new List<Queue>();
            Connection con = new Connection();
            con.Open();

            string query = "select m.* from music m inner join playlist_musics pm on pm.music_id=m.music_id where pm.playlist_id = " + playlist_id;


            SqlDataReader rd = con.ExecuteDQL(query);

            while (rd.Read())
            {
                queue.Add(
                    new Queue
                    {
                        title = rd["music_name"].ToString(),
                        mp3 = "media/" + rd["src"].ToString(),
                        oga = ""
                    }
                );
            }
            return queue;
        }
        [System.Web.Services.WebMethod]
        public static List<Queue> getUserPlaylistQueue(string playlist_id)
        {
            List<Queue> queue = new List<Queue>();
            Connection con = new Connection();
            con.Open();

            string query = "select m.* from music m inner join user_playlist_musics pm on pm.music_id=m.music_id where pm.user_playlist_id = " + playlist_id;


            SqlDataReader rd = con.ExecuteDQL(query);

            while (rd.Read())
            {
                queue.Add(
                    new Queue
                    {
                        title = rd["music_name"].ToString(),
                        mp3 = "media/" + rd["src"].ToString(),
                        oga = ""
                    }
                );
            }
            return queue;
        }
        [System.Web.Services.WebMethod]
        public static Queue getMusicQueue(string music_id)
        {
            Queue q = new Queue();
            Connection con = new Connection();
            con.Open();

            string query = "select m.* from music m where m.music_id = " + music_id;

            SqlDataReader rd = con.ExecuteDQL(query);

            rd.Read();
            q.title = rd["music_name"].ToString();
            q.mp3 = "media/" + rd["src"].ToString();
            q.oga = "";
            return q;
        }

        [System.Web.Services.WebMethod]
        public static List<Queue> getGenrePlaylistQueue(string genre_id)
        {
            List<Queue> queue = new List<Queue>();
            Connection con = new Connection();
            con.Open();

            string query = "select m.* from music m where delete_at is null CONVERT(VARCHAR(MAX), genre_id)= " + genre_id;

            SqlDataReader rd = con.ExecuteDQL(query);

            while (rd.Read())
            {
                queue.Add(
                    new Queue
                    {
                        title = rd["music_name"].ToString(),
                        mp3 = "media/" + rd["src"].ToString(),
                        oga = ""
                    }
                );
            }
            return queue;
        }

        [System.Web.Services.WebMethod]
        public static List<Queue> getAlbumPlaylistQueue(string album_id)
        {
            List<Queue> queue = new List<Queue>();
            Connection con = new Connection();
            con.Open();

            string query = "select m.* from music m where deleted_at is null and CONVERT(VARCHAR(MAX), album_id)= " + album_id;

            SqlDataReader rd = con.ExecuteDQL(query);

            while (rd.Read())
            {
                queue.Add(
                    new Queue
                    {
                        title = rd["music_name"].ToString(),
                        mp3 = "media/" + rd["src"].ToString(),
                        oga = ""
                    }
                );
            }
            return queue;
        }
        [System.Web.Services.WebMethod]
        public static List<Queue> getArtistPlaylistQueue(string artist_id)
        {
            List<Queue> queue = new List<Queue>();
            Connection con = new Connection();
            con.Open();

            string query = "select m.* from music m where deleted_at is null and CONVERT(VARCHAR(MAX), artist_id) like '%" + artist_id + "%'";

            SqlDataReader rd = con.ExecuteDQL(query);

            while (rd.Read())
            {
                queue.Add(
                    new Queue
                    {
                        title = rd["music_name"].ToString(),
                        mp3 = "media/" + rd["src"].ToString(),
                        oga = ""
                    }
                );
            }
            return queue;
        }
    }
}
