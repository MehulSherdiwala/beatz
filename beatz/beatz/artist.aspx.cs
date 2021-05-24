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
    public partial class artist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Connection conn = new Connection();
            conn.Open();

            string query = "select *, (select count(*) from music m where deleted_at is null and CONVERT(VARCHAR(MAX),m.artist_id) like '%' +CONVERT(VARCHAR(MAX),a.artist_id) +'%') as songs from artist a";

            SqlDataReader rd = conn.ExecuteDQL(query);

            StringBuilder html = new StringBuilder();
            int cnt = 0;
            while (rd.Read())
            {
                cnt++;
                html.Append(@"<div class='col-lg-4 col-md-4 col-sm-6 col-xs-6'>
							<a href='#/artist/" + rd["artist_id"].ToString() + @"'>
								<div class='pod-series'>
									<div class='pod-thumbnail'>
										<img src='/uploads/" + rd["artist_image"].ToString() + @"' alt='' class='w-100'>
									</div>
									<div class='pod-info'>
										<h3>" + rd["artist_name"].ToString() + @"</h3>
										<h4>" + rd["songs"].ToString() + @" songs</h4>
										</div>
								</div>
							</a>
						</div>");
            }

            genre_list.InnerHtml = html.ToString();

            conn.Close();
        }
    }
}