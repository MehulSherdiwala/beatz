using beatz.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace beatz.admin
{
    public partial class delete_music : System.Web.UI.Page
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
                string query = "update music set deleted_at='" + date.ToString(format) + "' where music_id=" + id;
                int x = con.ExecuteDML(query);

                con.Close();
            }
            Response.Redirect("music.aspx");
        }
    }
}