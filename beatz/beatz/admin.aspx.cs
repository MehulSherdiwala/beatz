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
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static Admin getAdmins(int aid)
        {
            Admin a = new Admin();
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\ASP.Net\beatz\beatz\beatz\App_Data\beatz.mdf;Integrated Security=True");

            con.Open();

            string query = "select * from admin where aid=" + aid;

            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataReader rd = cmd.ExecuteReader();

            while (rd.Read())
            {
                a.aid = Convert.ToInt32(rd["aid"]);
                a.username = rd["username"].ToString();
                a.email = rd["email"].ToString();
                a.password = rd["password"].ToString();
                a.phone = rd["phone"].ToString();
            }
            return a;
        }
    }
}