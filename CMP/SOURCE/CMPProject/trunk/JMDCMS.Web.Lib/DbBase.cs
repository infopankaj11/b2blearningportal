using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Xml;

namespace JMD.Data.Common
{
    public class DbBase
    {
        #region FIELDS
        private DbSql m_dbSql;
        private DataSet dsUI = new DataSet();
        private string m_TableName;
        #endregion FIELDS

        #region CONSTRUCTOR
        public DbBase()
        {
        }
        #endregion CONSTRUCTOR

        #region PROPERTIES
        /// dbSql
        /// <summary>
        /// Database Access Library
        /// </summary>
        public DbSql dbSql
        {
            get { return m_dbSql; }
            set { m_dbSql = value; }
        }
        public void Init(string TableName)
        {
            m_TableName = TableName;
        }

        #endregion PROPERTIES

        #region METHODS
        /// OpenUI(string Code, string ReturnDefault,
        ///    string OrderBy, string WhereCondition)
        /// <summary>
        /// 
        /// </summary>
        /// <param name="Code"></param>
        /// <param name="ReturnDefault"></param>
        /// <param name="OrderBy"></param>
        /// <param name="WhereCondition"></param>
        /// <returns></returns>
        public DataSet OpenUI(string Code, string ReturnDefault,
            string OrderBy, string WhereCondition)
        {
            if ((string.Compare(OrderBy, string.Empty) != 0) && (string.Compare(WhereCondition, string.Empty)) != 0)
            {
                return OpenUI(new string[] { "ID", m_TableName, "*", "1", "20", string.Format(" And {0} ", WhereCondition), string.Format(" Order By {0} ", OrderBy) }, Code, ReturnDefault);
            }
            else if (string.Compare(OrderBy, string.Empty) != 0)
            {
                return OpenUI(new string[] { "ID", m_TableName, "*", "1", "20", " ", string.Format(" Order By {0} ", OrderBy) }, Code, ReturnDefault);
            }
            else if (string.Compare(WhereCondition, string.Empty) != 0)
            {
                return OpenUI(new string[] { "ID", m_TableName, "*", "1", "20", string.Format(" And {0} ", WhereCondition), " " }, Code, ReturnDefault);
            }
            else
            {
                return OpenUI(new string[] { "ID", m_TableName, "*", "1", "20", " ", " " }, Code, ReturnDefault);
            }
        }
        /// OpenUI(string[] Sql,
        ///    string Code, string ReturnDefault)
        /// <summary>
        /// 
        /// </summary>
        /// <param name="Sql"></param>
        /// <param name="Code"></param>
        /// <param name="ReturnDefault"></param>
        /// <returns></returns>
        private DataSet OpenUI(string[] Sql,
            string Code, string ReturnDefault)
        {
            dsUI.Dispose();
            dsUI = new DataSet();
            dsUI = dbSql.Open(TSql.UI_Select_Sp, new string[] { m_TableName, Code, ReturnDefault });
            dsUI.Tables[0].TableName = "UI";
            dsUI.Tables[1].TableName = "UI_VIEW";
            dsUI.Tables[2].TableName = "UI_DISPLAY";
            dsUI.Tables[3].TableName = "UI_SORT";
            dsUI.Tables[4].TableName = "UI_FILTER";
            dsUI.Tables[5].TableName = "UI_COMMAND";
            DataTable dt;
            dt = dbSql.OpenTable(TSql.TablePaging, Sql);
            dt.TableName = "TblRecords";
            dsUI.Tables.Add(dt);
            return dsUI;
        }
        /// SaveUI(string UI_ID,
        ///    string Code, string Is_Default, string XML)
        /// <summary>
        /// 
        /// </summary>
        /// <param name="UI_ID"></param>
        /// <param name="Code"></param>
        /// <param name="Is_Default"></param>
        /// <param name="XML"></param>
        /// <returns></returns>
        public bool SaveUI(string UI_ID,
            string Code, string Is_Default, string XML)
        {
            dbSql.Open(TSql.UI_Save, new string[] { UI_ID, Code, Is_Default, XML });
            return true;
        }
        /// ToXML(DataTable Table)
        /// <summary>
        /// 
        /// </summary>
        /// <param name="Table"></param>
        /// <returns></returns>
        public string ToXML(DataTable Table)
        {
            foreach (DataColumn dc in Table.Columns)
            {
                dc.ColumnMapping = MappingType.Attribute;
            }
            StringBuilder sb = new StringBuilder();
            XmlWriter xmlWriter = XmlWriter.Create(sb);
            Table.WriteXml(xmlWriter);
            return sb.ToString();
        }
        /// ToXML(DataSet dataSet)
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dataSet"></param>
        /// <returns></returns>
        public string ToXML(DataSet dataSet)
        {
            foreach (DataTable Table in dataSet.Tables)
            {
                foreach (DataColumn dc in Table.Columns)
                {
                    dc.ColumnMapping = MappingType.Attribute;
                }
            }
            StringBuilder sb = new StringBuilder();
            XmlWriter xmlWriter = XmlWriter.Create(sb);
            dataSet.WriteXml(xmlWriter);
            return sb.ToString();
        }
        /// GetNextNumber
        /// <summary>
        /// Return Next Maximum available number for the given table
        /// Always provide real table name and not view or sp name
        /// </summary>
        /// <param name="TableName">For which the number is required</param>
        /// <returns>Next Available Maximum Number</returns>
        public string GetNextNumber(string TableName)
        {
            DataTable dt;
            dt = dbSql.OpenTable(TSql.GetNextNumber, new string[] { TableName });
            return dt.Rows[0][0].ToString();
        }
        public string AssignValue(DataColumn dc, string Value)
        {
            return dc.DataType.FullName;
        }

        #endregion METHODS
    }
}
