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
    public partial class user_playlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user_id"] == null)
            {
                Response.Redirect("/login.aspx");
            }
            Connection conn = new Connection();
            conn.Open();
            int songs = 0;

            string query = "select *, (select count(*) from user_playlist_musics pm where pm.user_playlist_id = p.user_playlist_id) as songs from user_playlist p ";
            
            SqlDataReader rd = conn.ExecuteDQL(query);

            StringBuilder html = new StringBuilder();
            while (rd.Read())
            {
                songs++;
                html.Append(@"<div class='col-lg-4 col-md-4 col-sm-6 col-xs-6'>
							<a href='#/user_playlist/" + rd["user_playlist_id"].ToString() + @"'>
								<div class='pod-series'>
									<div class='pod-thumbnail'>
										<img class='img - thumbnail' style='height: 20vh; ' src='https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bXVzaWN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'>

                                    </div>
									<div class='pod-info'>
										<h3>" + rd["user_playlist_name"].ToString() + @"</h3>
										<h4>" + rd["songs"].ToString() + @" songs</h4>
										</div>
								</div>
							</a>
						</div>");
            }
            
            user_list.InnerHtml = html.ToString();

            conn.Close();
        }
    }
}