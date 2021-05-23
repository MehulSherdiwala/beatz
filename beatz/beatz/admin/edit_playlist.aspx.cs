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
    public partial class edit_playlist : System.Web.UI.Page
    {

        string[] arr = new string[20];
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (!IsPostBack && id != null)
            {
                Connection con = new Connection();
                con.Open();
                string query = "select * from playlist where playlist_id=" + id;

                SqlDataReader rd = con.ExecuteDQL(query);

                rd.Read();

                txt_id.Value = rd["playlist_id"].ToString();
                txt_name.Text = rd["playlist_name"].ToString();
                playlist_img.ImageUrl = "~/uploads/" + rd["playlist_image"].ToString();
                rd.Close();

                query = "select * from playlist_musics where playlist_id = " + id;

                SqlDataReader rd1 = con.ExecuteDQL(query);
                int i = 0;
                while (rd1.Read())
                {
                    arr[i] = rd1["music_id"].ToString();
                    i++;
                }
                rd1.Close();
                StringBuilder html = new StringBuilder();

                query = @"select music_id,image, music_name, created_at, (select genre_name from genre where genre_id=convert(int,CONVERT(VARCHAR(MAX),m.genre_id))) as genre, (SUBSTRING( ( 
                                 SELECT ',' + artist_name AS 'data()'
                                     FROM artist where artist_id in (select value from STRING_SPLIT(CONVERT(VARCHAR(MAX),m.artist_id), ',')) FOR XML PATH('') 
                            ), 2 , 9999)) as artist, (select album_name from album where album_id=convert(int,CONVERT(VARCHAR(MAX),m.album_id))) as album from music m where deleted_at IS NULL;";
                
                SqlDataReader rd2 = con.ExecuteDQL(query);

                while (rd2.Read())
                {
                    html.Append("<tr>");
                    html.Append("<th> <input type='checkbox' name='music_id' value='" + rd2["music_id"] + "'  " + ((Array.Exists(arr, element => element == rd2["music_id"].ToString())) ? "Checked" : " ") + "/></th>");
                    html.Append("<th scope='row'><div class='media align-items-center'><a href = '#' class='avatar rounded-circle mr-3'><img alt = 'Image placeholder' src='../uploads/" + rd2["image"] + "'></a><div class='media-body'><span class='name mb-0 text-sm'>" + rd2["music_name"] + "</span></div></div></th>");
                    html.Append("<td> " + rd2["genre"] + " </td>");
                    html.Append("<td>" + rd2["artist"] + "</td>");
                    html.Append("</tr>");
                }
                table.InnerHtml = html.ToString();


                con.Close();
            }
        }

        protected void editPlaylist_Click(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();

            string playlist_name = txt_name.Text;
            string playlist_id = txt_id.Value;
            DateTime date = DateTime.Now;
            string format = "yyyy-MM-dd";

            string query = "select * from playlist_musics where playlist_id = " + playlist_id;

            SqlDataReader rd1 = con.ExecuteDQL(query);
            int j = 0;
            while (rd1.Read())
            {
                arr[j] = rd1["music_id"].ToString();
                Response.Write(arr[j]+ "<br>");
                j++;
            }
            rd1.Close();

            if (fu_image.HasFile)
            {
                string img_name = fu_image.FileName;
                fu_image.PostedFile.SaveAs(Server.MapPath("~/uploads/" + img_name));
                string q = "update playlist set playlist_image = '" + img_name + "' where playlist_id=" + playlist_id + "";
                con.ExecuteDML(q);
            }


            query = "update playlist set playlist_name = '" + playlist_name + "', updated_at ='" + date.ToString(format) + "' where playlist_id=" + playlist_id + "";

            int x = con.ExecuteDML(query);

            string[] music_id = Request.Form["music_id"].Split(',');
            for (int i = 0; i < music_id.Length; i++)
            {
                if (!Array.Exists(arr, element => element == music_id[i])){
                    int pm_id = con.pkInc("playlist_music_id", "playlist_musics");
                    query = "insert into playlist_musics(playlist_music_id, music_id, music_index, playlist_id) values(" + pm_id + ", " + music_id[i] + ", " + (i + 1) + ", " + playlist_id + " )";
                    con.ExecuteDML(query);
                }
                arr = arr.Where(v => v != music_id[i]).ToArray();
                j--;
            }

            for (int i = 0;i< j; i++)
            {
                query = "delete from playlist_musics where music_id = " + arr[i] + " and playlist_id=" + playlist_id;
                con.ExecuteDML(query);
            }

            if (x > 0)
            {
                Response.Redirect("playlist.aspx");
            }
            else
            {
                msg.Text = "Can't add Playlist";
            }
        }
    }
}