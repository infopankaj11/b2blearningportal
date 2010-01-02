/*
 * Author: Thiyagarajan Ravikumar
 * Version: 1.0
 * Remarks: This class handles all the transactions regarding CMS.
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace WorkLayers.DataLayer
{
    public class CMSDL
    {
        private DBAccessManager dbAccessManager;

        #region "Site Maintenance Query"

        string SqlGet_AllSites = "SELECT JMD_SITE.COMPANYID COMPANYID,ID SITE_ID,SITE_URL SITE_NAME,STYLE_SHEET,SITE_FOLDER,COMPANYNAME " +
                                 "FROM JMD_SITE,COMPANY_MASTER WHERE JMD_SITE.DELETE_FLAG=0 AND COMPANY_MASTER.DELETE_FLAG=0 AND " +
                                 "JMD_SITE.COMPANYID=COMPANY_MASTER.COMPANYID ORDER BY SITE_NAME";
        string SqlGet_AllCompany = "SELECT COMPANYID,COMPANYNAME FROM COMPANY_MASTER WHERE VALIDPERIOD_TO>'{0}' and DELETE_FLAG=0 ORDER BY COMPANYNAME";
        string SqlGet_Site = "SELECT JMD_SITE.COMPANYID COMPANYID,ID SITE_ID, SITE_URL SITE_NAME, STYLE_SHEET,SITE_FOLDER FROM JMD_SITE WHERE COMPANYID='{0}' AND ID={1}";
        string SqlGet_DuplicateSite = "SELECT ID SITE_ID,SITE_URL SITE_NAME FROM JMD_SITE WHERE SITE_URL='{0}' AND COMPANYID='{1}'";
        string SqlGet_DuplicateFolder = "SELECT ID SITE_ID,SITE_URL SITE_NAME FROM JMD_SITE WHERE SITE_FOLDER='{0}'";
        string SqlCreate_Site = "UPDATE JMD_SITE SET COMPANYID='{0}',STYLE_SHEET='{1}',SITE_FOLDER='{2}', DELETE_FLAG='0'," +
                                "CREATED_BY='{3}',CREATED_DATE='{4}',MODIFIED_BY='{3}',MODIFIED_DATE='{4}' WHERE SITE_URL='{5}'";
        string SqlUpdate_Site = "UPDATE JMD_SITE SET STYLE_SHEET='{0}',SITE_FOLDER='{1}', MODIFIED_BY='{2}',MODIFIED_DATE='{3}' WHERE COMPANYID='{4}' AND SITE_URL='{5}'";
        string SqlDelete_Site = "UPDATE JMD_SITE SET DELETE_FLAG=1,MODIFIED_BY='{0}',MODIFIED_DATE='{1}' WHERE COMPANYID='{2}' AND ID={3}";
        string SqlInsert_ModuleMaster = "INSERT INTO MODULE_MASTER VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}')";
        string SqlDelete_ModuleMaster = "UPDATE MODULE_MASTER SET DELETE_FLAG=1,MODIFIED_BY='{0}',MODIFIED_DATE='{1}' WHERE MODULE_ID='{2}' AND MODULE_TYPE='CONTENT'";

        #endregion

        #region "Page Maintenance Query"

        string SqlGet_AllPages = "SELECT JMD_PAGE.ID CHILD_PAGE_ID, PAGE_NAME, PAGE_CAPTION, META_TITLE,META_KEYWORDS, IS_PUBLISHED,CHILD_SORT_PAGE_NUM FROM JMD_PAGE,CMS_SITE_TREEVIEW WHERE JMD_PAGE.SITE_ID={0} AND PAGE_ID={1} AND IS_INTERNAL=0 AND IS_DELETED=0 AND ID = CHILD_PAGE_ID ORDER BY CHILD_SORT_PAGE_NUM";
        string SqlGet_Page = "SELECT JMD_PAGE.ID CHILD_PAGE_ID, PAGE_NAME, PAGE_CAPTION, META_TITLE,META_KEYWORDS,META_DESC,IS_PUBLISHED,CHILD_SORT_PAGE_NUM FROM JMD_PAGE,CMS_SITE_TREEVIEW WHERE JMD_PAGE.SITE_ID={0} AND ID={1} AND IS_INTERNAL=0 AND IS_DELETED=0 AND ID = CHILD_PAGE_ID";
        string SqlGet_DuplicatePageName = "SELECT PAGE_NAME FROM JMD_PAGE WHERE JMD_PAGE.SITE_ID={0} AND PAGE_NAME='{1}' AND IS_INTERNAL=0 AND IS_DELETED=0";
        string SqlGet_DuplicatePageSortNum = "SELECT * FROM CMS_SITE_TREEVIEW WHERE SITE_ID={0} AND PAGE_ID={1} AND CHILD_SORT_PAGE_NUM={2}";
        string SqlDelete_Page = "UPDATE JMD_PAGE SET IS_DELETED=1 WHERE ID={0} AND SITE_ID={1}";
        string SqlDelete_TreeView = "DELETE FROM CMS_SITE_TREEVIEW WHERE SITE_ID={0} AND PAGE_ID={1} AND CHILD_PAGE_ID={2}";
        string SqlCreate_TreeView = "INSERT INTO CMS_SITE_TREEVIEW VALUES({0},{1},{2},{3},'{4}','{5}','{4}','{5}');";
        string SqlUpdate_TreeView = "UPDATE CMS_SITE_TREEVIEW SET CHILD_SORT_PAGE_NUM={0}, MODIFIED_BY='{1}', MODIFIED_DATE='{2}' WHERE SITE_ID={3} AND PAGE_ID={4} AND CHILD_PAGE_ID={5}";

        #endregion

        #region "Additional Page Maintenance Query"

        string SqlGet_AllAdditionalPages = "SELECT JMD_PAGE.ID CHILD_PAGE_ID, PAGE_NAME, PAGE_CAPTION, META_TITLE,META_KEYWORDS FROM JMD_PAGE WHERE SITE_ID={0} AND IS_INTERNAL=0 AND IS_DELETED=0 AND ID NOT IN (" +
                                           "SELECT CHILD_PAGE_ID FROM CMS_SITE_TREEVIEW WHERE SITE_ID={0}) ORDER BY PAGE_NAME";
        string SqlGet_AdditionalPage = "SELECT JMD_PAGE.ID CHILD_PAGE_ID, PAGE_NAME, PAGE_CAPTION, META_TITLE,META_KEYWORDS FROM JMD_PAGE,CMS_SITE_TREEVIEW WHERE " +
                                       "JMD_PAGE.SITE_ID={0} AND ID={1} AND IS_INTERNAL=0 AND IS_DELETED=0 AND ID = CHILD_PAGE_ID";
        string SqlDelete_AdditionalPage = "UPDATE JMD_PAGE SET IS_DELETED=1 WHERE ID={0} AND SITE_ID={1}";


        #endregion

        #region "Pyramid Maintenance Query"

        string SqlGet_ClientPages = "";
        string SqlGet_PageName = "SELECT PAGE_NAME FROM JMD_PAGE WHERE IS_INTERNAL=0 AND IS_PUBLISHED=1 AND SITE_ID={0} ORDER BY PAGE_NAME";

        #endregion

        #region "CMS Client Query"

        string SqlGet_HtmlContent = "SELECT HTML_TEXT FROM JMD_PAGE_MOD_SELECT, JMD_MOD_HTML WHERE SITE_ID={0} AND JMD_PAGE_MOD_SELECT.PAGE_NAME='{1}' AND JMD_PAGE_MOD_SELECT.PAGE_MOD_ID=JMD_MOD_HTML.PAGE_MOD_ID ";
        string SqlGet_TreeView = "SELECT PAGE_ID,CHILD_PAGE_ID,PAGE_NAME,CHILD_SORT_PAGE_NUM FROM CMS_SITE_TREEVIEW, JMD_PAGE WHERE JMD_PAGE.SITE_ID={0} AND IS_INTERNAL=0 AND IS_PUBLISHED=1 AND " +
                                 "JMD_PAGE.SITE_ID=CMS_SITE_TREEVIEW.SITE_ID AND ID=CHILD_PAGE_ID ORDER BY PAGE_ID,CHILD_SORT_PAGE_NUM";
        string SqlGet_ClientOutline = "SELECT PAGE_ID,PAGE_NAME,SORT_NUMBER FROM CMS_SITE_OUTLINE WHERE SITE_ID='{0}' AND IS_OUTLINE='Y' ORDER BY SORT_NUMBER";
        string SqlSelect_UsageTime = "SELECT DURATION_SPEND FROM CMS_USER_CONTENT_USAGE WHERE USER_ID={0} AND SITE_ID={1} AND CMS_PAGE_ID={2}";
        string SqlInsert_UsageTime = "INSERT INTO CMS_USER_CONTENT_USAGE VALUES({0},{1},{2},{3},'{4}',{5},'{4}',{5},{6})";
        string SqlUpdate_UsageTime = "UPDATE CMS_USER_CONTENT_USAGE SET duration_spend={0},MODIFIED_BY='{1}', MODIFIED_DATE='{2}' WHERE USER_ID={3} AND SITE_ID={4} AND CMS_PAGE_ID={5}";

        #endregion

        #region "Outline Maintenance Query"

        string SqlGet_AllOutlines = "SELECT * FROM CMS_SITE_OUTLINE WHERE SITE_ID='{0}' AND IS_OUTLINE='Y' ORDER BY SORT_NUMBER";
        string SqlGet_Outline = "SELECT * FROM CMS_SITE_OUTLINE WHERE SITE_ID='{0}' AND PAGE_ID='{1}' AND IS_OUTLINE='Y'";
        string SqlGet_DuplicateOutline = "SELECT * FROM CMS_SITE_OUTLINE WHERE SITE_ID='{0}' AND PAGE_NAME='{1}'";
        string SqlGet_DuplicateOutlineSortNum = "SELECT * FROM CMS_SITE_OUTLINE WHERE SITE_ID='{0}' AND SORT_NUMBER={1} AND IS_OUTLINE='Y'";
        string SqlCreate_Outline = "INSERT INTO CMS_SITE_OUTLINE (SITE_ID,PAGE_NAME,PAGE_REMARK,SORT_NUMBER,IS_OUTLINE,CREATED_BY,CREATED_DATE,MODIFIED_BY,MODIFIED_DATE) VALUES({0},'{1}','{2}','{3}','{4}','{5}','{6}','{7}','{6}')";
        string SqlUpdate_Outline = "UPDATE CMS_SITE_OUTLINE SET PAGE_NAME='{0}',PAGE_REMARK='{1}', SORT_NUMBER={2}, MODIFIED_BY='{3}',MODIFIED_DATE='{4}' WHERE SITE_ID='{5}' AND PAGE_ID='{6}'";
        string SqlDelete_Outline = "DELETE FROM CMS_SITE_OUTLINE WHERE SITE_ID='{0}' AND PAGE_ID='{1}'";

        #endregion

        public CMSDL()
        {
            dbAccessManager = new DBAccessManager();
        }

        #region "Site Maintenance
        public DataTable GetAllSites()
        {
            DataTable dtSites = null;
            try
            {
                dtSites = new DataTable();
                dtSites = dbAccessManager.GetDataTable(SqlGet_AllSites);
            }
            catch (Exception ex)
            {

            }

            return dtSites;
        }

        public DataTable GetSite(string companyID, string siteID)
        {
            DataTable dtSite = null;
            try
            {
                dtSite = new DataTable();
                dtSite = dbAccessManager.GetDataTable(string.Format(SqlGet_Site, companyID, siteID));
            }
            catch (Exception ex)
            {

            }

            return dtSite;
        }

        public DataTable GetAllCompany()
        {
            DataTable dtCompany = null;
            try
            {
                dtCompany = new DataTable();
                dtCompany = dbAccessManager.GetDataTable(string.Format(SqlGet_AllCompany, DateTime.Now.ToString("dd-MMM-yyyy")));
            }
            catch (Exception ex)
            {

            }

            return dtCompany;
        }

        public int GetDuplicateSite(string siteName, string companyID)
        {
            DataTable dtSite = null;
            int returnNumber = 0;
            try
            {
                dtSite = new DataTable();
                dtSite = dbAccessManager.GetDataTable(string.Format(SqlGet_DuplicateSite, siteName, companyID));
                if (dtSite.Rows.Count > 1)
                    returnNumber = 10;
                else
                    returnNumber = 0;
            }
            catch (Exception ex)
            {
                returnNumber = -1;
            }

            return returnNumber;
        }

        public int GetDuplicateFolder(string folderName)
        {
            DataTable dtFolder = null;
            int returnNumber = 0;
            try
            {
                dtFolder = new DataTable();
                dtFolder = dbAccessManager.GetDataTable(string.Format(SqlGet_DuplicateFolder, folderName));
                if (dtFolder.Rows.Count > 1)
                    returnNumber = 11;
                else
                    returnNumber = 0;
            }
            catch (Exception ex)
            {
                returnNumber = -1;
            }

            return returnNumber;
        }

        public int CreateSite(string companyId, string siteName, string aliasSiteId,
                                string styleSheet, string siteVersion, string siteFolder, string userName)
        {
            int returnValue = 0;
            /*string tempSql = string.Format(SqlCreate_Site, companyId, siteId, siteURL, aliasSiteId, styleSheet, siteVersion, siteFolder, userName, DateTime.Now, userName, DateTime.Now, "0");
            returnValue = dbAccessManager.GetCommand(tempSql);*/
            DBConnManager dbConn = new DBConnManager();
            SqlConnection myConn = dbConn.GetDBConnection();
            try
            {
                SqlCommand command = new SqlCommand();
                command.CommandText = "EXEC JMD_SITE_CREATE '" + siteName + "','admin@jmdcms.com'";
                command.CommandType = CommandType.Text;
                command.Connection = myConn;
                command.ExecuteNonQuery();
                command.Dispose();

                returnValue = dbAccessManager.GetCommand(string.Format(SqlCreate_Site, companyId, styleSheet, siteFolder, userName, DateTime.Now, siteName));
            }
            catch (Exception ex)
            {
                returnValue = -1;
            }
            finally
            {
                dbConn.CloseDBConnection(myConn);
            }
            return returnValue;
        }

        public int UpdateModuleMaster(string companyName, string siteName, string userName)
        {
            int returnValue = 0;
            try
            {
                DataTable dtSite = new DataTable();
                dtSite = dbAccessManager.GetDataTable(string.Format(SqlGet_DuplicateSite, siteName, companyName));

                string tempSql = string.Format(SqlInsert_ModuleMaster, dtSite.Rows[0]["SITE_ID"].ToString(), siteName, "CONTENT", "", userName, DateTime.Now, userName, DateTime.Now, "0");
                dbAccessManager.GetCommand(tempSql);

            }
            catch (Exception ex)
            {
                returnValue = -1;
            }
            return returnValue;
        }

        public int UpdateSite(string companyId, string siteId, string aliasSiteId,
                                string styleSheet, string siteVersion, string siteFolder, string userName)
        {
            int returnValue = 0;
            try
            {
                string tempSql = string.Format(SqlUpdate_Site, styleSheet, siteFolder, userName, DateTime.Now, companyId, siteId);
                returnValue = dbAccessManager.GetCommand(tempSql);

            }
            catch (Exception ex)
            {
                returnValue = -1;
            }
            return returnValue;
        }

        public int DeleteSite(string companyId, string siteId, string userName)
        {
            int returnValue = 0;
            try
            {
                string tempSql = string.Format(SqlDelete_Site, userName, DateTime.Now, companyId, siteId);
                returnValue = dbAccessManager.GetCommand(tempSql);
                if (returnValue == 1)
                {
                    tempSql = string.Format(SqlDelete_ModuleMaster, userName, DateTime.Now, siteId);
                    dbAccessManager.GetCommand(tempSql);
                }
            }
            catch (Exception ex)
            {
                returnValue = -1;
            }
            return returnValue;
        }

        #endregion

        #region "Outline Maintenance"

        public DataTable GetAllOutlines(string siteID)
        {
            DataTable dtOutlines = null;
            try
            {
                dtOutlines = new DataTable();
                dtOutlines = dbAccessManager.GetDataTable(string.Format(SqlGet_AllOutlines, siteID));
            }
            catch (Exception ex)
            {

            }
            return dtOutlines;
        }

        public DataTable GetOutline(string siteID, string pageID)
        {
            DataTable dtOutline = null;
            try
            {
                dtOutline = new DataTable();
                dtOutline = dbAccessManager.GetDataTable(string.Format(SqlGet_Outline, siteID, pageID));
            }
            catch (Exception ex)
            {

            }

            return dtOutline;
        }

        public int GetDuplicateOutline(string siteID, string pageName)
        {
            DataTable dtOutline = null;
            int returnNumber = 0;
            try
            {
                dtOutline = new DataTable();
                dtOutline = dbAccessManager.GetDataTable(string.Format(SqlGet_DuplicateOutline, siteID, pageName));
                if (dtOutline.Rows.Count > 1)
                    returnNumber = 10;
                else
                    returnNumber = 0;
            }
            catch (Exception ex)
            {
                returnNumber = -1;
            }

            return returnNumber;
        }

        public int GetDuplicateOutlineSort(string siteID, string sortNum)
        {
            DataTable dtOutline = null;
            int returnNumber = 0;
            try
            {
                dtOutline = new DataTable();
                dtOutline = dbAccessManager.GetDataTable(string.Format(SqlGet_DuplicateOutlineSortNum, siteID, sortNum));
                if (dtOutline.Rows.Count > 0)
                    returnNumber = 10;
                else
                    returnNumber = 0;
            }
            catch (Exception ex)
            {
                returnNumber = -1;
            }

            return returnNumber;
        }

        public int CreateOutline(string siteID, string pageName, string remark, string sortNum, string isOutline, string userName)
        {
            int returnValue = 0;
            try
            {
                string tempSql = string.Format(SqlCreate_Outline, siteID, pageName, remark, sortNum, isOutline, userName, DateTime.Now, userName);
                returnValue = dbAccessManager.GetCommand(tempSql);
            }
            catch (Exception ex)
            {
                returnValue = -1;
            }
            return returnValue;
        }

        public int UpdateOutline(string siteID, string pageID, string pageName, string remark, string sortNum, string userName)
        {
            int returnValue = 0;
            try
            {
                string tempSql = string.Format(SqlUpdate_Outline, pageName, remark, sortNum, userName, DateTime.Now, siteID, pageID);
                returnValue = dbAccessManager.GetCommand(tempSql);

            }
            catch (Exception ex)
            {
                returnValue = -1;
            }
            return returnValue;
        }

        public int DeleteOutline(string siteID, string pageID)
        {
            int returnValue = 0;
            try
            {
                string tempSql = string.Format(SqlDelete_Outline, siteID, pageID);
                returnValue = dbAccessManager.GetCommand(tempSql);

            }
            catch (Exception ex)
            {
                returnValue = -1;
            }
            return returnValue;
        }

        #endregion

        #region "Page Maintenance"

        public DataTable GetAllPages(string siteID, string pageID)
        {
            DataTable dtSites = null;
            try
            {
                dtSites = new DataTable();
                dtSites = dbAccessManager.GetDataTable(string.Format(SqlGet_AllPages, siteID, pageID));
            }
            catch (Exception ex)
            {

            }

            return dtSites;
        }

        public DataTable GetPage(string siteID, string childPageID)
        {
            DataTable dtPage = null;
            try
            {
                dtPage = new DataTable();
                dtPage = dbAccessManager.GetDataTable(string.Format(SqlGet_Page, siteID, childPageID));
            }
            catch (Exception ex)
            {

            }

            return dtPage;
        }

        public int GetDuplicatePageSort(string siteID, string outlineID, string sortNum)
        {
            DataTable dtPage = null;
            int returnNumber = 0;
            try
            {
                dtPage = new DataTable();
                dtPage = dbAccessManager.GetDataTable(string.Format(SqlGet_DuplicatePageSortNum, siteID, outlineID, sortNum));
                if (dtPage.Rows.Count > 0)
                    returnNumber = 10;
                else
                    returnNumber = 0;
            }
            catch (Exception ex)
            {
                returnNumber = -1;
            }

            return returnNumber;
        }

        public int DeletePage(string siteId, string pageID, string childPageID)
        {
            int returnValue = 0;
            try
            {
                string tempSql = string.Format(SqlDelete_Page, childPageID, siteId);
                returnValue = dbAccessManager.GetCommand(tempSql);
                tempSql = string.Format(SqlDelete_TreeView, siteId, pageID, childPageID);
                returnValue = dbAccessManager.GetCommand(tempSql);

            }
            catch (Exception ex)
            {
                returnValue = -1;
            }
            return returnValue;
        }

        public int CreateTreeview(string siteID, string pageID, string childPageID, string childSortNum, string userName)
        {
            int returnValue = 0;
            try
            {
                string tempSql = string.Format(SqlCreate_TreeView, siteID, pageID, childPageID, childSortNum, userName, DateTime.Now);
                returnValue = dbAccessManager.GetCommand(tempSql);
            }
            catch (Exception ex)
            {
                returnValue = -1;
            }
            return returnValue;
        }

        public int UpdateTreeview(string siteID, string pageID, string childPageID, string childSortNum, string userName)
        {
            int returnValue = 0;
            try
            {
                string tempSql = string.Format(SqlUpdate_TreeView, childSortNum, userName, DateTime.Now, siteID, pageID, childPageID);
                returnValue = dbAccessManager.GetCommand(tempSql);
            }
            catch (Exception ex)
            {
                returnValue = -1;
            }
            return returnValue;
        }

        public int UpdatePage(string siteID, string pageID, string pageName, string remark, string sortNum, string userName)
        {
            int returnValue = 0;
            try
            {
                string tempSql = string.Format(SqlUpdate_Outline, pageName, remark, sortNum, userName, DateTime.Now, siteID, pageID);
                returnValue = dbAccessManager.GetCommand(tempSql);

            }
            catch (Exception ex)
            {
                returnValue = -1;
            }
            return returnValue;
        }

        public bool DuplicatePageName(string siteID, string pageName)
        {
            bool returnValue = false;
            try
            {
                DataTable duplicatePage = dbAccessManager.GetDataTable(string.Format(SqlGet_DuplicatePageName, siteID, pageName));
                if (duplicatePage.Rows.Count > 0)
                    returnValue = true;
            }
            catch (Exception ex)
            {
                returnValue = true;
            }
            return returnValue;
        }

        public int JMD_PAGE_SAVE(string pageId, string siteURL, string pageName,
            string pageCaption, string metaTitle, string metaDesc,
            string metaKeywords, string parentPageName, string isPublished,
            string isRoot, string isMenuItem,
            string viewRoles, string addRoles, string editRoles, string deleteRoles,
            string moveRoles, string addModuleRoles, string isInternal,
            string loadShared_Modules, string pageSort, string isViewStateEnabled)
        {
            int returnValue = 0;
            DBConnManager dbConn = new DBConnManager();
            SqlConnection myConn = dbConn.GetDBConnection();
            try
            {
                SqlCommand command = new SqlCommand("JMD_PAGE_SAVE");
                command.Connection = myConn;
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@Page_Id", SqlDbType.Int));
                command.Parameters["@Page_Id"].Value = pageId;
                command.Parameters.Add(new SqlParameter("@Site_URL", SqlDbType.NVarChar, 255));
                command.Parameters["@Site_URL"].Value = siteURL;
                command.Parameters.Add(new SqlParameter("@PAGE_NAME", SqlDbType.NVarChar, 255));
                command.Parameters["@PAGE_NAME"].Value = pageName;
                command.Parameters.Add(new SqlParameter("@PAGE_CAPTION", SqlDbType.NVarChar, 255));
                command.Parameters["@PAGE_CAPTION"].Value = pageCaption;
                command.Parameters.Add(new SqlParameter("@META_TITLE", SqlDbType.NVarChar, 255));
                command.Parameters["@META_TITLE"].Value = metaTitle;
                command.Parameters.Add(new SqlParameter("@META_DESC", SqlDbType.NVarChar, 1000));
                command.Parameters["@META_DESC"].Value = metaDesc;
                command.Parameters.Add(new SqlParameter("@META_KEYWORDS", SqlDbType.NVarChar, 1000));
                command.Parameters["@META_KEYWORDS"].Value = metaKeywords;
                command.Parameters.Add(new SqlParameter("@PARENT_PAGE_NAME", SqlDbType.NVarChar, 255));
                command.Parameters["@PARENT_PAGE_NAME"].Value = parentPageName;
                command.Parameters.Add(new SqlParameter("@IS_PUBLISHED", SqlDbType.Int));
                command.Parameters["@IS_PUBLISHED"].Value = isPublished;
                command.Parameters.Add(new SqlParameter("@IS_ROOT", SqlDbType.Int));
                command.Parameters["@IS_ROOT"].Value = isRoot;
                command.Parameters.Add(new SqlParameter("@IS_MENU_ITEM", SqlDbType.Int));
                command.Parameters["@IS_MENU_ITEM"].Value = isMenuItem;
                command.Parameters.Add(new SqlParameter("@VIEW_ROLES", SqlDbType.NVarChar, 1000));
                command.Parameters["@VIEW_ROLES"].Value = viewRoles;
                command.Parameters.Add(new SqlParameter("@ADD_ROLES", SqlDbType.NVarChar, 1000));
                command.Parameters["@ADD_ROLES"].Value = addRoles;
                command.Parameters.Add(new SqlParameter("@EDIT_ROLES", SqlDbType.NVarChar, 1000));
                command.Parameters["@EDIT_ROLES"].Value = editRoles;
                command.Parameters.Add(new SqlParameter("@DELETE_ROLES", SqlDbType.NVarChar, 1000));
                command.Parameters["@DELETE_ROLES"].Value = deleteRoles;
                command.Parameters.Add(new SqlParameter("@MOVE_ROLES", SqlDbType.NVarChar, 1000));
                command.Parameters["@MOVE_ROLES"].Value = moveRoles;
                command.Parameters.Add(new SqlParameter("@ADD_MODULE_ROLES", SqlDbType.NVarChar, 1000));
                command.Parameters["@ADD_MODULE_ROLES"].Value = addModuleRoles;
                command.Parameters.Add(new SqlParameter("@IS_INTERNAL", SqlDbType.Int));
                command.Parameters["@IS_INTERNAL"].Value = isInternal;
                command.Parameters.Add(new SqlParameter("@Load_Shared_Modules", SqlDbType.Int));
                command.Parameters["@Load_Shared_Modules"].Value = loadShared_Modules;
                command.Parameters.Add(new SqlParameter("@iPage_Sort", SqlDbType.Int));
                command.Parameters["@iPage_Sort"].Value = pageSort;
                command.Parameters.Add(new SqlParameter("@Is_ViewState_Enabled", SqlDbType.Int));
                command.Parameters["@Is_ViewState_Enabled"].Value = isViewStateEnabled;
                command.Parameters.Add(new SqlParameter("@Return_Page_Id", SqlDbType.Int));
                command.Parameters["@Return_Page_Id"].Direction = ParameterDirection.Output;
                command.ExecuteNonQuery();
                command.Dispose();

                returnValue = (int)command.Parameters["@Return_Page_Id"].Value;
            }
            catch (Exception ex)
            {
                returnValue = -1;
            }
            finally
            {
                dbConn.CloseDBConnection(myConn);
            }
            return returnValue;
        }


        #endregion

        #region "Additional Page Maintenance"

        public DataTable GetAllAdditionalPages(string siteID)
        {
            DataTable dtSites = null;
            try
            {
                dtSites = new DataTable();
                dtSites = dbAccessManager.GetDataTable(string.Format(SqlGet_AllAdditionalPages, siteID));
            }
            catch (Exception ex)
            {

            }

            return dtSites;
        }

        public DataTable GetAdditionalPage(string siteID, string childPageID)
        {
            DataTable dtPage = null;
            try
            {
                dtPage = new DataTable();
                dtPage = dbAccessManager.GetDataTable(string.Format(SqlGet_AdditionalPage, siteID, childPageID));
            }
            catch (Exception ex)
            {

            }

            return dtPage;
        }

        public int DeleteAdditionalPage(string siteId, string pageID)
        {
            int returnValue = 0;
            try
            {
                string tempSql = string.Format(SqlDelete_Page, pageID, siteId);
                returnValue = dbAccessManager.GetCommand(tempSql);

            }
            catch (Exception ex)
            {
                returnValue = -1;
            }
            return returnValue;
        }



        #endregion

        #region "Pyramid Maintenance"

        public DataTable GetAllPageName(string siteID)
        {
            DataTable dtPage = null;
            try
            {
                dtPage = new DataTable();
                dtPage = dbAccessManager.GetDataTable(string.Format(SqlGet_PageName, siteID));
            }
            catch (Exception ex)
            {

            }

            return dtPage;
        }

        #endregion

        #region "CMS Client"

        public DataTable GetHtmlContent(string siteID, string pageName)
        {
            DataTable dtHtmlContent = null;
            try
            {
                dtHtmlContent = new DataTable();
                dtHtmlContent = dbAccessManager.GetDataTable(string.Format(SqlGet_HtmlContent, siteID, pageName));
            }
            catch (Exception ex)
            {

            }

            return dtHtmlContent;
        }

        public DataSet GetClientTreeview(string siteID)
        {
            DataSet dsClientTreeView = null;
            try
            {
                dsClientTreeView = new DataSet();
                DataTable dtClientOutline = dbAccessManager.GetDataTable(string.Format(SqlGet_ClientOutline, siteID));
                DataTable dtTreeView = dbAccessManager.GetDataTable(string.Format(SqlGet_TreeView, siteID));
                dsClientTreeView.Tables.Add(dtClientOutline);
                dsClientTreeView.Tables.Add(dtTreeView);
            }
            catch (Exception ex)
            {

            }

            return dsClientTreeView;
        }

        public void CaptureContentUsage(string userID, string siteID, string pageID, string duration, string userName)
        {
            DataTable dtContent = null;
            try
            {
                string tempSql = "";
                dtContent = dbAccessManager.GetDataTable(string.Format(SqlSelect_UsageTime, userID, siteID, pageID));
                if (dtContent.Rows.Count == 0)
                    tempSql = string.Format(SqlInsert_UsageTime, userID, siteID, pageID, duration, userName, DateTime.Now, 0);
                else
                    tempSql = string.Format(SqlUpdate_UsageTime, duration, userName, DateTime.Now, userID, siteID, pageID);

                dbAccessManager.GetCommand(tempSql);

            }
            catch (Exception ex)
            {

            }
        }

        #endregion


    }
}
