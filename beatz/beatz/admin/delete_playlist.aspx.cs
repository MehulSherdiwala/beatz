using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using beatz.Classes;
namespace beatz.admin
{
    public partial class delete_playlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string id = Request.QueryString["id"];
            if (id != null)
            {

                Connection con = new Connection();
                con.Open();

                DateTime date = DateTime.Now;
                string format = "yyyy-MM-dd";
                string query = "update playlist set deleted_at='" + date.ToString(format) + "' where playlist_id=" + id;
                int x = con.ExecuteDML(query);

                con.Close();
            }
            Response.Redirect("playlist.aspx");
        }
    }
}