using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using beatz.Classes;
namespace beatz.admin
{
    public partial class genre : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();
            StringBuilder html = new StringBuilder();

            string query = "select * from genre";
            SqlDataReader rd = con.ExecuteDQL(query);

            while (rd.Read())
            {
                html.Append("<tr>");
                html.Append("<td>" + rd["genre_id"] + "</td>");
                html.Append("<td>" + rd["genre_name"] + "</td>");
                html.Append("<td>" + rd["genre_description"] + "</td>");
                html.Append("<td> 0 </td>");
                html.Append("<td><a href='edit_genre.aspx?id=" + rd["genre_id"] + "' class='btn btn-sm btn-success'><i class='fa fa-pencil-alt'></i></a> <a href='delete_genre.aspx?id=" + rd["genre_id"] + "' class='btn btn-sm btn-danger'><i class='fa fa-trash-alt'></i></a></td>");
                html.Append("</tr>");
            }
            table.InnerHtml = html.ToString();
            con.Close();
        }
    }
}