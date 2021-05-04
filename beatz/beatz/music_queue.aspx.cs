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
    }
}