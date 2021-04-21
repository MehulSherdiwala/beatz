using beatz.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace beatz.admin
{
    public partial class edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (!IsPostBack && id != null)
            {
                Connection con = new Connection();
                con.Open();
                string query = "select * from artist where artist_id=" + id;

                SqlDataReader rd = con.ExecuteDQL(query);

                rd.Read();

                txt_id.Value = rd["artist_id"].ToString();
                txt_name.Text = rd["artist_name"].ToString();
                txt_desc.Text = rd["artist_description"].ToString();
                album_img.ImageUrl = "~/uploads/" + rd["artist_image"].ToString();
                if (rd["artist_gender"].ToString() == "Male")
                {
                    male.Checked = true;
                } else
                {
                    female.Checked = true;
                }
                con.Close();
            }
        }

        protected void editArtist_Click(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();
            string artist_name = txt_name.Text;
            string artist_desc = txt_desc.Text;
            string artist_id = txt_id.Value;
            string gender = "";
            if (male.Checked)
            {
                gender = male.Text;
            }
            else
            {
                gender = female.Text;
            }
            DateTime date = DateTime.Now;
            string format = "yyyy-MM-dd";

            if (fu_image.HasFile)
            {
                string img_name = fu_image.FileName;
                fu_image.PostedFile.SaveAs(Server.MapPath("~/uploads/" + img_name));
                string q = "update artist set artist_image = '" + img_name + "' where artist_id=" + artist_id + "";
                con.ExecuteDML(q);
            }


            string query = "update artist set artist_name = '" + artist_name + "', artist_description = '" + artist_desc + "', artist_gender = '" + gender + "', updated_at ='" + date.ToString(format) + "' where artist_id=" + artist_id + "";

            int x = con.ExecuteDML(query);
            if (x > 0)
            {
                Response.Redirect("artist.aspx");
            }
            else
            {
                msg.Text = "Can't add Album";
            }
        }
    }
}