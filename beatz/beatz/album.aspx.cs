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
    public partial class album : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Connection conn = new Connection();
            conn.Open();

            string query = "select *, (select count(*) from album m where  deleted_at is null and CONVERT(VARCHAR(MAX),m.album_id)=CONVERT(VARCHAR(MAX),g.album_id)) as songs from album g where deleted_at is null";

            SqlDataReader rd = conn.ExecuteDQL(query);

            StringBuilder html = new StringBuilder();
            while (rd.Read())
            {
                html.Append(@"<div class='col-lg-4 col-md-4 col-sm-6 col-xs-6'>
							<a href='#/album/" + rd["album_id"].ToString() + @"'>
								<div class='pod-series'>
									<div class='pod-thumbnail'>
										<img src='/uploads/" + rd["album_image"].ToString() + @"' alt='' class='w-100'>
									</div>
									<div class='pod-info'>
										<h3>" + rd["album_name"].ToString() + @"</h3>
										<h4>" + rd["songs"].ToString() + @" songs</h4>
										</div>
								</div>
							</a>
						</div>");
            }

            album_list.InnerHtml = html.ToString();

        }
    }
}