using beatz.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace beatz.admin
{
    public partial class artist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();
            StringBuilder html = new StringBuilder();

            string query = "select * from artist where deleted_at IS NULL";
            SqlDataReader rd = con.ExecuteDQL(query);
            while (rd.Read())
            {
                html.Append("<tr>");
                html.Append("<td><span class='mr-4'><span class='status'>" + rd["artist_id"] + "</span></span></td>");
                html.Append("<th scope='row'><div class='media align-items-center'><a href = '#' class='avatar rounded-circle mr-3'><img alt = 'Image placeholder' src='../uploads/" + rd["artist_image"] + "'></a><div class='media-body'><span class='name mb-0 text-sm'>" + rd["artist_name"] + "</span></div></div></th>");
                html.Append("<td> <span class='badge badge-dot mr-4'><span class='status'> " + rd["artist_gender"] + " </span></span></td>");
                html.Append("<td class='avatar-group'> <span class='name mb-0 text-sm' style='display: block;'>" + rd["artist_description"] + "</span> </td>");
                html.Append("<td><a href='edit_artist.aspx?id=" + rd["artist_id"] + "' class='btn btn-sm btn-success'><i class='fa fa-pencil-alt'></i></a> <a href='delete_artist.aspx?id=" + rd["artist_id"] + "' class='btn btn-sm btn-danger'><i class='fa fa-trash-alt'></i></a></td>");
                html.Append("</tr>");
            }
            table.InnerHtml = html.ToString();
            con.Close();
        }
    }
}