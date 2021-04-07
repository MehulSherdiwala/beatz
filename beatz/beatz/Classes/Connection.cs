using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;

namespace beatz.Classes
{
    public class Connection
    {
        SqlConnection con;
        public Connection()
        {
            con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\ASP.Net\beatz\beatz\beatz\App_Data\beatz.mdf;Integrated Security=True");
        }

        public void Open()
        {
            con.Open();
        }

        public int ExecuteDML(string query)
        {
            SqlCommand cmd = new SqlCommand(query, con);

            return cmd.ExecuteNonQuery();
        }

        public SqlDataReader ExecuteDQL(string query)
        {
            
            SqlCommand cmd = new SqlCommand(query, con);
            return cmd.ExecuteReader();
        }

        public void Close()
        {
            con.Close();
        }

        public int pkInc(string field, string table)
        {
            string query = "select max(" + field + ") as cnt from " + table;
            
            SqlDataReader rd = ExecuteDQL(query);
            int cnt = 0;
            while (rd.Read())
            {
                cnt = Convert.ToInt32(rd["cnt"]);
            }

            rd.Close();
            return ++cnt;
        }
    }
}