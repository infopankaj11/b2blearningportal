using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Configuration;
using JMD.Data.Common;

namespace JMDCMS.Web.Lib
{
    public class SqlServer
    {
        string SqlConnectionString = string.Empty;

        /* 
         * SITE
        */
        string SqlJMD_SITE_SELECT =
            "Exec JMD_SITE_SELECT '{0}'";

        string SqlJMD_MAIN_MENU =
            "Exec JMD_MAIN_MENU '{0}'";
        string SqlJMD_LOAD_MODS =
            "Exec JMD_LOAD_MODS '{0}', '{1}'";

        string SqlJMD_MOD_HTML_LEFT_MENU =
            "Exec JMD_MOD_HTML_LEFT_MENU '{0}', '{1}'";
        string SqlJMD_MOD_HTML_Select =
            "Exec JMD_MOD_HTML_Select {0}";

        string SqlJMD_PAGE_SAVE =
            "Exec JMD_PAGE_SAVE {0},'{1}','{2}','{3}'," +
            "'{4}','{5}','{6}','{7}',{8},{9},{10},'{11}','{12}','{13}'," +
            "'{14}','{15}','{16}',{17},{18}, {19}, {20}  ";

        /* 
         * USERS 
         */
        string SqlJMD_USER_INSERT =
            "Exec JMD_USER_INSERT {0},'{1}','{2}','{3}','{4}','{5}','{6}'";

        string SqlJMD_USER_AUTH =
            "Exec JMD_USER_AUTH '{0}', '{1}'";
        string SqlJMD_USER_SELECT =
            "Exec JMD_USER_SELECT '{0}', {1}";

        string SqlJMD_USER_DELETE =
            "Exec JMD_USER_DELETE '{0}', {1}";

        /* 
         * ROLES 
         */
        string SqlJMD_ROLE_SAVE =
            "Exec JMD_ROLE_SAVE {0}, '{1}', '{2}'";
        string SqlJMD_ROLE_DELETE =
            "Exec JMD_ROLE_DELETE '{0}', {1}";

        string SqlJMD_USER_ROLE_SAVE =
            "Exec JMD_USER_ROLE_SAVE {0}, '{1}'";

        string SqlJMD_PAGE_AUTH =
            "Exec JMD_PAGE_AUTH '{0}', '{1}'";
        string SqlJMD_MOD_SELECT =
           "Exec JMD_MOD_SELECT '{0}', {1}";
        string SqlJMD_DIV_SELECT =
           "Exec JMD_DIV_SELECT '{0}'";
        string SqlJMD_ROLE_SELECT =
           "Exec JMD_ROLE_SELECT '{0}', {1}";
        string SqlJMD_PAGE_MOD_SAVE =
            "Exec JMD_PAGE_MOD_SAVE {0},'{1}','{2}',{3},'{4}',{5},{6},{7}," +
            "'{8}','{9}','{10}','{11}','{12}', {13}  ";
        string SqlJMD_MOD_HTML_SAVE =
            "Exec JMD_MOD_HTML_SAVE {0}, '{1}', '{2}'";

        string SqlJMD_PAGE_SELECT =
            "Exec JMD_PAGE_SELECT '{0}','{1}'";

        // [WI:651] Page Manager - Page Browse Filter
        string SqlJMD_PAGE_SELECT_FILTER =
            "Exec JMD_PAGE_SELECT '{0}','{1}', '{2}'";


        string SqlJMD_OBJ_SELECT_TABLES =
            "Exec JMD_OBJ_SELECT_TABLES '{0}'";
        string SqlJMD_OBJ_SAVE =
              "Exec JMD_OBJ_SAVE {0},'{1}','{2}',{3},'{4}',{5},{6} ";
        string SqlJMD_OBJ_SELECT =
              "Exec JMD_OBJ_SELECT {0} ";
        string SqlJMD_COL_TYPE_SELECT =
              "Exec JMD_COL_TYPE_SELECT '{0}' ";
        string SqlJMD_COL_SELECT_COLUMNS =
              "Exec JMD_COL_SELECT_COLUMNS {0} ";
        string SqlJMD_COL_SELECT_COL =
               "Exec JMD_COL_SELECT_COL {0} ";
        string SqlJMD_COL_SAVE =
              "Exec JMD_COL_SAVE {0}, {1},'{2}','{3}','{4}',{5},'{6}' ";
        string SqlJMD_GET_TABLE_NAME =
               "Select Table_Name = dbo.JMD_GET_TABLE_NAME('{0}',{1}) ";
        string SqlExecuteSql =
            "{0}";
        string SqlDynamicTableSelect =
            "Select {0} From {1}";
        string SqlJMD_PAGE_MOD_SELECT_Sp =
            "Exec JMD_PAGE_MOD_SELECT_Sp {0}";
        string SqlJMD_PAGE_DELETE =
            "Exec JMD_PAGE_DELETE '{0}', '{1}'";

        string SqlJMD_PAGE_MOD_DELETE =
            "Exec JMD_PAGE_MOD_DELETE {0}, {1}";

        string SqlJMD_MOD_BreadCrumbs =
            "Exec JMD_MOD_BreadCrumbs '{0}', '{1}'";

        string SqlJMD_MOD_CJ_Category_Save =
            "Exec JMD_MOD_CJ_Category_Save {0}, '{1}'";


        /*
          @JMD_COL_ID INT,
          @JMD_OBJ_ID INT,
          @JMD_COL_NAME NVARCHAR(50),
          @JMD_COL_CAPTION NVARCHAR(50),
          @JMD_COL_DESC NVARCHAR(1000),
          @JMD_COL_TYPE_ID INT,
          @COL_EXT_DATA Text
        */
        public SqlServer()
        {
        }
        public SqlServer(string sqlConnectionString)
        {
            SqlConnectionString = sqlConnectionString;
        }

        public string Test()
        {
            DbSql dbSql = new DbSql(SqlConnectionString);
            return "Success....";
        }

        public DataTable JMD_MAIN_MENU(string Site_URL)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_MAIN_MENU, Site_URL));
            dbSql = null;
            return dt;
        }

        public DataSet JMD_LOAD_MODS(string Site_URL, string Page_Name)
        {
            DataSet ds;
            DbSql dbSql = new DbSql(SqlConnectionString);
            ds = dbSql.Open(String.Format(SqlJMD_LOAD_MODS, Site_URL, Page_Name));
            dbSql = null;
            return ds;
        }

        public DataSet JMD_MOD_HTML_LEFT_MENU(string Site_URL, string Page_Name)
        {
            DataSet ds;
            DbSql dbSql = new DbSql(SqlConnectionString);
            ds = dbSql.Open(String.Format(SqlJMD_MOD_HTML_LEFT_MENU, Site_URL, Page_Name));
            dbSql = null;
            return ds;
        }

        public DataTable JMD_MOD_HTML_Select(string Page_Mod_Id)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_MOD_HTML_Select, Page_Mod_Id));
            dbSql = null;
            return dt;
        }

        /*
         * version: 0.0.1.2000
         * Procedure or Function 'JMD_PAGE_SAVE' expects parameter 
         * '@Load_Shared_Modules', which was not supplied.
         */
        public DataTable JMD_PAGE_SAVE(string Page_Id, string Site_URL, string Page_Name,
            string Page_Caption, string Meta_Title, string Meta_Desc,
            string Meta_Keywords, string Parent_Page_Name, string Is_Published,
            string Is_Root, string Is_Menu_Item,
            string View_Roles, string Add_Roles, string Edit_Roles, string Delete_Roles,
            string Move_Roles, string Add_Module_Roles, string Is_Internal,
            string Load_Shared_Modules, string Page_Sort, string Is_ViewState_Enabled
            )
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_PAGE_SAVE,
                Page_Id,
                Site_URL,
                Page_Name,
                Page_Caption,
                Meta_Title,
                Meta_Desc,
                Meta_Keywords,
                Parent_Page_Name,
                Is_Published,
                Is_Root,
                Is_Menu_Item,
                View_Roles,
                Add_Roles,
                Edit_Roles,
                Delete_Roles,
                Move_Roles,
                Add_Module_Roles,
                Is_Internal,
                Load_Shared_Modules,
                Page_Sort,
                Is_ViewState_Enabled));
            dbSql = null;
            return dt;
        }

        public void JMD_USER_INSERT(string User_Id, string Site_URL,
            string User_Name, string User_Display_Name,
            string Password_Hash, string Salt, string Email)
        {
            DbSql dbSql = new DbSql(SqlConnectionString);
            dbSql.Execute(String.Format(SqlJMD_USER_INSERT,
                User_Id,
                Site_URL,
                User_Name,
                User_Display_Name,
                Password_Hash,
                Salt,
                Email
                ));
            dbSql = null;
        }

        public DataSet JMD_USER_AUTH(string Site_URL, string User_Name)
        {
            DataSet dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.Open(String.Format(SqlJMD_USER_AUTH,
                Site_URL,
                User_Name
                ));
            dbSql = null;
            return dt;
        }

        public DataTable JMD_PAGE_AUTH(string Site_URL,
            string Page_Name)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_PAGE_AUTH,
                Site_URL,
                Page_Name
                ));
            dbSql = null;
            return dt;
        }
        public DataTable JMD_MOD_SELECT(string Site_URL,
            string Show_Admin)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_MOD_SELECT,
                Site_URL,
                Show_Admin
                ));
            dbSql = null;
            return dt;
        }

        public DataTable JMD_DIV_SELECT(string Site_URL)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_DIV_SELECT,
                Site_URL
                ));
            dbSql = null;
            return dt;
        }

        public DataTable JMD_ROLE_SELECT(string Site_URL)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_ROLE_SELECT,
                Site_URL, "0"
                ));
            dbSql = null;
            return dt;
        }

        public DataTable JMD_ROLE_SELECT(string Site_URL, string Role_Id)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_ROLE_SELECT,
                Site_URL, Role_Id
                ));
            dbSql = null;
            return dt;
        }

        public void JMD_PAGE_MOD_SAVE(string Page_Mod_Id, string Site_URL,
            string Page_Name, string Mod_Id, string Mod_Title, string Div_Id,
            string Is_Published, string Show_On_All_Pages, string View_Role,
            string Edit_Role, string Delete_Role, string Move_Role,
            string Edit_Contents_Role, string Mod_Sort)
        {
            DbSql dbSql = new DbSql(SqlConnectionString);
            dbSql.Execute(String.Format(SqlJMD_PAGE_MOD_SAVE,
                Page_Mod_Id, Site_URL, Page_Name, Mod_Id, Mod_Title, Div_Id,
                Is_Published, Show_On_All_Pages, View_Role, Edit_Role, Delete_Role,
                Move_Role, Edit_Contents_Role, Mod_Sort));
            dbSql = null;
        }
        public void JMD_MOD_HTML_SAVE(string Page_Mod_Id, string Title, string Html_Text)
        {
            DbSql dbSql = new DbSql(SqlConnectionString);
            dbSql.Execute(String.Format(SqlJMD_MOD_HTML_SAVE,
                Page_Mod_Id, Title, Html_Text));
            dbSql = null;
        }
        public DataTable JMD_PAGE_SELECT(string Site_URL, string Page_Name)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_PAGE_SELECT,
                Site_URL, Page_Name
                ));
            dbSql = null;
            return dt;
        }
        /// <summary>
        /// Returns Pages Resultset with filtered criteria.
        /// Page_Name parameter can be left blank.
        /// </summary>
        /// <Work Item="651"></param>
        /// <param name="Site_URL"></param>
        /// <param name="Page_Name"></param>
        /// <param name="Filter"></param>
        /// <returns></returns>
        public DataTable JMD_PAGE_SELECT(string Site_URL, string Page_Name,
            string Filter)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_PAGE_SELECT_FILTER,
                Site_URL, Page_Name, Filter
                ));
            dbSql = null;
            return dt;
        }

        public DataTable JMD_OBJ_SELECT_TABLES(string Site_URL)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_OBJ_SELECT_TABLES,
                Site_URL
                ));
            dbSql = null;
            return dt;
        }
        public void JMD_OBJ_SAVE(string JMD_OBJ_ID, string SITE_URL,
            string OBJ_NAME, string OBJ_TYPE, string OBJ_DESC,
            string PARENT_OBJ_ID, string IS_INTERNAL)
        {
            DbSql dbSql = new DbSql(SqlConnectionString);
            dbSql.Execute(String.Format(SqlJMD_OBJ_SAVE,
                JMD_OBJ_ID, SITE_URL, OBJ_NAME, OBJ_TYPE, OBJ_DESC,
                PARENT_OBJ_ID, IS_INTERNAL));
            dbSql = null;
        }
        public DataTable JMD_OBJ_SELECT(string JMD_OBJ_ID)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_OBJ_SELECT,
                JMD_OBJ_ID
                ));
            dbSql = null;
            return dt;
        }

        public DataTable JMD_COL_TYPE_SELECT(string SITE_URL)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_COL_TYPE_SELECT,
                SITE_URL
                ));
            dbSql = null;
            return dt;
        }

        public DataTable JMD_COL_SELECT_COLUMNS(string JMD_OBJ_ID)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_COL_SELECT_COLUMNS,
                JMD_OBJ_ID
                ));
            dbSql = null;
            return dt;
        }
        public DataTable JMD_COL_SELECT_COL(string JMD_COL_ID)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_COL_SELECT_COL,
                JMD_COL_ID
                ));
            dbSql = null;
            return dt;
        }

        public void JMD_COL_SAVE(string JMD_COL_ID, string JMD_OBJ_ID, string JMD_COL_NAME,
            string JMD_COL_CAPTION, string JMD_COL_DESC, string JMD_COL_TYPE_ID, string COL_EXT_DATA)
        {
            DbSql dbSql = new DbSql(SqlConnectionString);
            dbSql.Execute(String.Format(SqlJMD_COL_SAVE,
                JMD_COL_ID,
                JMD_OBJ_ID,
                JMD_COL_NAME,
                JMD_COL_CAPTION,
                JMD_COL_DESC,
                JMD_COL_TYPE_ID,
                COL_EXT_DATA));
            dbSql = null;
        }

        public DataTable JMD_GET_TABLE_NAME(string Site_URL, string Jmd_Obj_Id)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_GET_TABLE_NAME,
                Site_URL,
                Jmd_Obj_Id
                ));
            dbSql = null;
            return dt;
        }

        public void ExecuteSql(string SQL)
        {
            DbSql dbSql = new DbSql(SqlConnectionString);
            dbSql.Execute(String.Format(SqlExecuteSql,
                SQL));
            dbSql = null;
        }

        public DataTable DynamicTableSelect(string TableName,
            string FieldNames)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlDynamicTableSelect,
                FieldNames, TableName
                ));
            dbSql = null;
            return dt;
        }

        public DataTable JMD_PAGE_MOD_SELECT_Sp(string PageModId)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_PAGE_MOD_SELECT_Sp,
                PageModId
                ));
            dbSql = null;
            return dt;
        }

        public void JMD_PAGE_DELETE(string Site_URL, string Page_Name)
        {
            DbSql dbSql = new DbSql(SqlConnectionString);
            dbSql.Execute(String.Format(SqlJMD_PAGE_DELETE,
                Site_URL, Page_Name
                ));
            dbSql = null;
        }
        public void JMD_PAGE_MOD_DELETE(string Page_Mod_Id, string Action)
        {
            DbSql dbSql = new DbSql(SqlConnectionString);
            dbSql.Execute(String.Format(SqlJMD_PAGE_MOD_DELETE,
                Page_Mod_Id, Action
                ));
            dbSql = null;
        }
        public DataTable JMD_USER_SELECT(string Site_URL)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_USER_SELECT,
                Site_URL, "0"
                ));
            dbSql = null;
            return dt;
        }
        public DataTable JMD_USER_SELECT(string Site_URL, string User_Id)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_USER_SELECT,
                Site_URL,
                User_Id
                ));
            dbSql = null;
            return dt;
        }

        public void JMD_ROLE_SAVE(string Role_Id,
            string Site_URL, string Role_Name)
        {
            DbSql dbSql = new DbSql(SqlConnectionString);
            dbSql.Execute(String.Format(SqlJMD_ROLE_SAVE,
                Role_Id,
                Site_URL,
                Role_Name
                ));
            dbSql = null;
        }
        public void JMD_ROLE_DELETE(string Site_URL, string Role_Id)
        {
            DbSql dbSql = new DbSql(SqlConnectionString);
            dbSql.Execute(String.Format(SqlJMD_ROLE_DELETE,
                Site_URL,
                 Role_Id
                ));
            dbSql = null;
        }

        public void JMD_USER_ROLE_SAVE(string User_Id,
            string User_Roles)
        {
            DbSql dbSql = new DbSql(SqlConnectionString);
            dbSql.Execute(String.Format(SqlJMD_USER_ROLE_SAVE,
                User_Id,
                User_Roles
                ));
            dbSql = null;
        }

        public void JMD_USER_DELETE(string Site_URL, string User_Id)
        {
            DbSql dbSql = new DbSql(SqlConnectionString);
            dbSql.Execute(String.Format(SqlJMD_USER_DELETE,
                Site_URL,
                 User_Id
                ));
            dbSql = null;
        }

        public DataTable JMD_SITE_SELECT(string Site_URL)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_SITE_SELECT,
                Site_URL
                ));
            dbSql = null;
            return dt;
        }
        public DataTable JMD_MOD_BreadCrumbs(string Site_URL, string Page_Name)
        {
            DataTable dt;
            DbSql dbSql = new DbSql(SqlConnectionString);
            dt = dbSql.OpenTable(String.Format(SqlJMD_MOD_BreadCrumbs,
                Site_URL,
                Page_Name
                ));
            dbSql = null;
            return dt;
        }

        public void JMD_MOD_CJ_CATEGORY_SAVE(string Category_Id,
            string Category)
        {
            DbSql dbSql = new DbSql(SqlConnectionString);
            dbSql.Execute(String.Format(SqlJMD_MOD_CJ_Category_Save,
                Category_Id,
                Category
                ));
            dbSql = null;
        }
    }
}
