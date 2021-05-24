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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user_id"]!= null)
            {
                MultiView1.ActiveViewIndex = 1;
                lbl_username.Text = Session["username"].ToString();
            } else
            {
                MultiView1.ActiveViewIndex = 0;
            }

            Connection conn = new Connection();
            conn.Open();

            string query = "select *, (select count(*) from playlist_musics pm where pm.playlist_id=p.playlist_id) as songs from playlist p where deleted_at is null";

            SqlDataReader rd = conn.ExecuteDQL(query);

            StringBuilder html = new StringBuilder();
            int cnt = 0;
            while (rd.Read())
            {
                cnt++;
                html.Append(@"<div class='col-lg-4 col-md-4 col-sm-6 col-xs-6'>
							<a href='#/playlist/" + rd["playlist_id"].ToString() + @"'>
								<div class='pod-series'>
									<div class='pod-thumbnail'>
										<img src='/images/resources/blog" + cnt + @".jpg' alt='' class='w-100'>
									</div>
									<div class='pod-info'>
										<h3>" + rd["playlist_name"].ToString() + @"</h3>
										<h4>" + rd["songs"].ToString() + @" songs</h4>
										</div>
								</div>
							</a>
						</div>");
            }

            playlists.InnerHtml = html.ToString();

            conn.Close();
        }
    }
}