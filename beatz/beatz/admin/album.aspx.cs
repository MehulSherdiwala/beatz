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
    public partial class album : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();
            StringBuilder html = new StringBuilder();

            string query = "select * from album where deleted_at IS NULL";
            SqlDataReader rd = con.ExecuteDQL(query);
            while (rd.Read())
            {
                html.Append("<tr>");
                html.Append("<td><span class='mr-4'><span class='status'>" + rd["album_id"] + "</span></span></td>");
                html.Append("<th scope='row'><div class='media align-items-center'><a href = '#' class='avatar rounded-circle mr-3'><img alt = 'Image placeholder' src='../uploads/" + rd["album_image"] + "'></a><div class='media-body'><span class='name mb-0 text-sm'>" + rd["album_name"] + "</span></div></div></th>");
                html.Append("<td class='budget'> " + DateTime.ParseExact(rd["created_at"].ToString(), "dd-MM-yyyy hh.mm.ss tt", null).ToString("dd-MM-yyyy") + " </td>");
                html.Append("<td><a href='edit_album.aspx?id=" + rd["album_id"] + "' class='btn btn-sm btn-success'><i class='fa fa-pencil-alt'></i></a> <a href='delete_album.aspx?id=" + rd["album_id"] + "' class='btn btn-sm btn-danger'><i class='fa fa-trash-alt'></i></a></td>");
                html.Append("</tr>");
            }
            table.InnerHtml = html.ToString();
            con.Close();
        }
    }
}