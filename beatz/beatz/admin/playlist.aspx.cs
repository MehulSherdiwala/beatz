using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using beatz.Classes;
using System.Text;

namespace beatz.admin
{
    public partial class playlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();
            StringBuilder html = new StringBuilder();

            string query = "select * from playlist where deleted_at IS NULL";
            SqlDataReader rd = con.ExecuteDQL(query);
            while (rd.Read())
            {
                html.Append("<tr>");
                html.Append("<td><span class='mr-4'><span class='status'>" + rd["playlist_id"] + "</span></span></td>");
                html.Append("<th scope='row'><div class='media align-items-center'><a href = '#' class='avatar rounded-circle mr-3'><img alt = 'Image placeholder' src='../uploads/" + rd["playlist_image"] + "'></a><div class='media-body'><span class='name mb-0 text-sm'>" + rd["playlist_name"] + "</span></div></div></th>");
                html.Append("<td class='budget'> " + string.Format("{0:dd-MMM-yyyy}", DateTime.Parse(rd["created_at"].ToString())) + " </td>");
                html.Append("<td><a href='edit_playlist.aspx?id=" + rd["playlist_id"] + "' class='btn btn-sm btn-success'><i class='fa fa-pencil-alt'></i></a> <a href='delete_playlist.aspx?id=" + rd["playlist_id"] + "' class='btn btn-sm btn-danger'><i class='fa fa-trash-alt'></i></a></td>");
                html.Append("</tr>");
            }
            table.InnerHtml = html.ToString();
            con.Close();
        }
    }
}