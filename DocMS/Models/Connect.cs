using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace DocMS
{
    public class Connect
    {
        //全局静态数据库链接
        private static SqlConnection sqlConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DocMSConnectionString"].ConnectionString);

        private static int state = 0;

        //调用数据库时时打开连接
        public Connect()
        {
            if (state == 0)
            {
                sqlConnection.Open();
                state = 1;
            }
        }

        //执行SQL语句，返回受影响行数
        public int ExecuteSql(string sql)
        {
            SqlCommand cmd = new SqlCommand(sql, sqlConnection);
            return cmd.ExecuteNonQuery();
        }

        //执行执行SQL语句,返回SqlDataReader格式结果集
        public SqlDataReader CreateReader(string sql)
        {
            SqlCommand cmd = new SqlCommand(sql, sqlConnection);
            return cmd.ExecuteReader();
        }

        //执行执行SQL语句,返回SqlDataAdapter格式结果集
        public SqlDataAdapter CreateAdapter(string sql)
        {
            return new SqlDataAdapter(sql, sqlConnection);
        }

        //执行执行SQL语句,填充DataSet格式结果集,返回行数
        public int FillDataSet(DataSet dataset, string sql, string tablename)
        {
            SqlDataAdapter da = new SqlDataAdapter(sql, sqlConnection);
            return da.Fill(dataset, tablename);
        }

        public DataTable GetDataTable(string sql)
        {
            SqlDataAdapter sda = new SqlDataAdapter(sql, sqlConnection);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            dt.Dispose();
            return dt;
        }
    }
}