using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace JMD.Data.Common
{
    class DbProvider
    {
        private SqlConnection sqlConnection = new SqlConnection();
        private string ConnectionString = "Data Source={0};Initial Catalog={1};User Id={2};Password={3};";
        public DbProvider()
        {
        }
        public bool Connect(string Server, string Database, string User, string Password)
        {
            ConnectionString = string.Format(ConnectionString, Server, Database, User, Password);
            sqlConnection.ConnectionString = ConnectionString;
            sqlConnection.Open();
            return true;
        }
        public bool Connect(string connectionString)
        {
            sqlConnection.ConnectionString = connectionString;
            sqlConnection.Open();
            return true;
        }

        public DataSet Open(string Sql)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter FSqlDataAdapter = new SqlDataAdapter();
            FSqlDataAdapter.SelectCommand = new SqlCommand(Sql, sqlConnection);
            FSqlDataAdapter.Fill(ds);
            FSqlDataAdapter.Dispose();
            sqlConnection.Close();
            return ds;
        }
        public DataTable OpenTable(string Sql)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter FSqlDataAdapter = new SqlDataAdapter();
            FSqlDataAdapter.SelectCommand = new SqlCommand(Sql, sqlConnection);
            FSqlDataAdapter.Fill(dt);
            FSqlDataAdapter.Dispose();
            sqlConnection.Close();
            return dt;

        }
        public void Execute(string Sql)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = Sql;
            command.CommandType = CommandType.Text;
            command.Connection = sqlConnection;
            command.ExecuteNonQuery();
            command.Dispose();
            sqlConnection.Close();
        }
    }
}
