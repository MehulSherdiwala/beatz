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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user_id"] != null)
            {
                Response.Redirect("/index.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();

            string email = log_email.Text;
            string password = log_password.Text;

            string query = "select * from tbl_user where email='" + email + "' and password='" + password + "'";

            SqlDataReader rd = con.ExecuteDQL(query);
            query = "select max(user_id) as cnt from tbl_user";

            if (rd.HasRows)
            {
                rd.Read();
                Session["user_id"] = rd["user_id"];
                Session["username"] = rd["username"];
                Response.Redirect("/index.aspx");
            } else
            {
                Response.Write("Login Failed");
            }

            rd.Close(); 
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Connection con = new Connection();
            con.Open();

            string username = reg_name.Text;
            string email = reg_email.Text;
            string phone = reg_phone.Text;
            string password = reg_password.Text;
            DateTime date = DateTime.Now;              
            string format = "yyyy-MM-dd";

            int i = con.pkInc("user_id", "tbl_user");
            string query = "insert into tbl_user values(" + i + ",'" + username + "', '" + email + "', '" + password + "', '" + phone + "', '" + date.ToString(format) + "')";

            Console.WriteLine(query);

            int x = con.ExecuteDML(query);
            if (x > 0)
            {
                Session["user_id"] = i;
                Session["username"] = username;
                Response.Redirect("/index.aspx");
            } else
            {
                Response.Write("Register Denied");
            }
        }
    }
}