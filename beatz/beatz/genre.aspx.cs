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
    public partial class genre : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Connection conn = new Connection();
            conn.Open();

            string query = "select *, (select count(*) from music m where CONVERT(VARCHAR(MAX),m.genre_id)=CONVERT(VARCHAR(MAX),g.genre_id)) as songs from genre g";

            SqlDataReader rd = conn.ExecuteDQL(query);

            StringBuilder html = new StringBuilder();
            int cnt = 0;
            while (rd.Read())
            {
                cnt++;
                html.Append(@"<div class='col-lg-4 col-md-4 col-sm-6 col-xs-6'>
							<a href='#/genre/" + rd["genre_id"].ToString() + @"'>
								<div class='pod-series'>
									<div class='pod-thumbnail'>
										<img src='/images/resources/blog" + cnt + @".jpg' alt='' class='w-100'>
									</div>
									<div class='pod-info'>
										<h3>" + rd["genre_name"].ToString() + @"</h3>
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