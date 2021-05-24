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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["aid"] == null)
            {
                Response.Redirect("login.aspx");
            }

            Connection conn = new Connection();
            conn.Open();

            string query = "select count(*) as cnt from genre";

            SqlDataReader rd = conn.ExecuteDQL(query);
            rd.Read();
            lbl_genre.Text = rd["cnt"].ToString();
            rd.Close();

            query = "select count(*) as cnt from album where deleted_at is null";

            SqlDataReader rd2 = conn.ExecuteDQL(query);
            rd2.Read();
            lbl_album.Text = rd2["cnt"].ToString();
            rd2.Close();

            query = "select count(*) as cnt from playlist where deleted_at is null";

            SqlDataReader rd3 = conn.ExecuteDQL(query);
            rd3.Read();
            lbl_playlist.Text = rd3["cnt"].ToString();
            rd3.Close();

            query = "select count(*) as cnt from music where deleted_at is null";

            SqlDataReader rd4 = conn.ExecuteDQL(query);
            rd4.Read();
            lbl_music.Text = rd4["cnt"].ToString();
            rd4.Close();

            query = "select count(*) as cnt from artist where deleted_at is null";

            SqlDataReader rd5 = conn.ExecuteDQL(query);
            rd5.Read();
            lbl_artist.Text = rd5["cnt"].ToString();
            rd5.Close();

            conn.Close();
        }
    }
}