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
    public partial class music : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();
            StringBuilder html = new StringBuilder();

            string query = @"select music_id,image, music_name, created_at, (select genre_name from genre where genre_id=convert(int,CONVERT(VARCHAR(MAX),m.genre_id))) as genre, (SUBSTRING( ( 
                                 SELECT ',' + artist_name AS 'data()'
                                     FROM artist where artist_id in (select value from STRING_SPLIT(CONVERT(VARCHAR(MAX),m.artist_id), ',')) FOR XML PATH('') 
                            ), 2 , 9999)) as artist, (select album_name from album where album_id=convert(int,CONVERT(VARCHAR(MAX),m.album_id))) as album from music m where deleted_at IS NULL;";
            SqlDataReader rd = con.ExecuteDQL(query);
            while (rd.Read())
            {
                html.Append("<tr>");
                html.Append("<th>" + rd["music_id"] + "</th>");
                html.Append("<th scope='row'><div class='media align-items-center'><a href = '#' class='avatar rounded-circle mr-3'><img alt = 'Image placeholder' src='../uploads/" + rd["image"] + "'></a><div class='media-body'><span class='name mb-0 text-sm'>" + rd["music_name"] + "</span></div></div></th>");
                html.Append("<td> " + rd["genre"] + " </td>");
                html.Append("<td>" + rd["artist"] + "</td>");
                html.Append("<td>" + rd["album"] + "</td>");
                html.Append("<td>" + DateTime.ParseExact(rd["created_at"].ToString(), "dd-MM-yyyy hh.mm.ss tt", null).ToString("dd-MM-yyyy") + "</td>");
                html.Append("<td><a href='edit_music.aspx?id=" + rd["music_id"] + "' class='btn btn-sm btn-success'><i class='fa fa-pencil-alt'></i></a> <a href='delete_music.aspx?id=" + rd["music_id"] + "' class='btn btn-sm btn-danger'><i class='fa fa-trash-alt'></i></a></td>");
                html.Append("</tr>");
            }
            table.InnerHtml = html.ToString();
            con.Close();
        }
    }
}