using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace JMD.Data.Common
{
    public enum TSql
    {
        Search,
        TablePaging,
        UI_Select_Sp,
        UI_Command_Select_Sp,
        UI_Save,
        GetNextNumber
    };

    public class DbSql
    {
        #region Array of SQL Strings

        string[] ASql = new string[] 
		{
            "Execute Search '{0}', '{1}', '{2}', '{3}' ",
            "WITH Table_Paging As (Select Row_Number() OVER ( Order By {0} ) as RowNumber, * From {1} )"+
            " Select {2} From Table_Paging Where RowNumber between {3} and {4} {5} ",
            "Execute UI_Select_Sp '{0}', '{1}', {2}",
			"Execute UI_Command_Select_Sp '{0}'",
            "Execute UI_Save {0}, '{1}',{2},'{3}'",
            "Execute GetNextNumber '{0}'"
        };
        #endregion Array of SQL Strings
        DbProvider dbProvider = new DbProvider();
        public DbSql()
        {
        }
        public DbSql(string Server, string Database, string User, string Password)
        {
            dbProvider.Connect(Server, Database, User, Password);
        }
        public DbSql(string connectionString)
        {
            dbProvider.Connect(connectionString);
        }

        public DataSet TablePaging(string PagingID, string PagingTable, string PagingFields,
            string RowStart, string RowEnd, string WhereConditionExt)
        {
            return dbProvider.Open(string.Format(ASql[(int)TSql.TablePaging], PagingID, PagingTable, PagingFields, RowStart, RowEnd, WhereConditionExt));
        }
        public DataSet Open(TSql Sql, string[] param)
        {
            return dbProvider.Open(string.Format(ASql[(int)Sql], param));
        }
        public DataSet Open(string Sql)
        {
            return dbProvider.Open(Sql);
        }
        public DataTable OpenTable(TSql Sql, string[] param)
        {
            return dbProvider.OpenTable(string.Format(ASql[(int)Sql], param));
        }
        public DataTable OpenTable(string Sql)
        {
            return dbProvider.OpenTable(Sql);
        }
        public void Execute(string Sql)
        {
            dbProvider.Execute(Sql);
        }

        public string ToDbNull(string str)
        {
            if ((str == null) || (string.Compare(str, string.Empty) == 0))
            {
                return "NULL";
            }
            {
                return str;
            }
        }
    }
}
