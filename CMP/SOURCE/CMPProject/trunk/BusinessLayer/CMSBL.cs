using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using WorkLayers.DataLayer;

namespace WorkLayers.BusinessLayer
{
    public class CMSBL
    {
        private CMSDL cmsDL;

        public CMSBL()
        {
            cmsDL = new CMSDL();
        }

        #region "Site Maintenance"

        public DataTable GetAllSites()
        {
            DataTable dtSites = cmsDL.GetAllSites();
            return dtSites;
        }

        public DataTable GetSite(string companyID, string siteID)
        {
            DataTable dtSite = cmsDL.GetSite(companyID, siteID);
            return dtSite;
        }

        public DataTable GetAllCompany()
        {
            DataTable dtCompany = cmsDL.GetAllCompany();
            return dtCompany;
        }

        public int GetDuplicateSite(string siteName, string companyID)
        {
            int returnNumber = cmsDL.GetDuplicateSite(siteName, companyID);
            return returnNumber;
        }

        public int GetDuplicateFolder(string folderName)
        {
            int returnNumber = cmsDL.GetDuplicateFolder(folderName);
            return returnNumber;
        }

        public int CreateSite(string companyId, string siteName, string aliasSiteId,
                                string styleSheet, string siteVersion, string siteFolder, string userName)
        {
            int returnValue = cmsDL.CreateSite(companyId, siteName, aliasSiteId, styleSheet, siteVersion, siteFolder, userName);
            return returnValue;
        }

        public int UpdateModuleMaster(string companyName, string siteName, string userName)
        {
            int returnValue = cmsDL.UpdateModuleMaster(companyName, siteName, userName);
            return returnValue;
        }

        public int UpdateSite(string companyId, string siteId, string aliasSiteId,
                                string styleSheet, string siteVersion, string siteFolder, string userName)
        {
            int returnValue = cmsDL.UpdateSite(companyId, siteId, aliasSiteId, styleSheet, siteVersion, siteFolder, userName);
            return returnValue;
        }


        public int DeleteSite(string companyId, string siteId, string userName)
        {
            int returnValue = cmsDL.DeleteSite(companyId, siteId, userName);
            return returnValue;
        }

        #endregion

        #region "Outline Maintenance"

        public DataTable GetAllOutlines(string siteID)
        {
            DataTable dtOutlines = cmsDL.GetAllOutlines(siteID);
            return dtOutlines;
        }

        public DataTable GetOutline(string siteID, string pageID)
        {
            DataTable dtOutline = cmsDL.GetOutline(siteID, pageID);
            return dtOutline;
        }

        public int GetDuplicateOutline(string siteID, string pageName)
        {
            int returnNumber = cmsDL.GetDuplicateOutline(siteID, pageName);
            return returnNumber;
        }

        public int GetDuplicateOutlineSort(string siteID, string sortNum)
        {
            int returnNumber = cmsDL.GetDuplicateOutlineSort(siteID, sortNum);
            return returnNumber;
        }

        public int CreateOutline(string siteID, string pageName, string remark, string sortNum, string isOutline, string userName)
        {
            int returnValue = cmsDL.CreateOutline(siteID, pageName, remark, sortNum, isOutline, userName);
            return returnValue;
        }

        public int UpdateOutline(string siteID, string pageID, string pageName, string remark, string sortNum, string userName)
        {
            int returnValue = cmsDL.UpdateOutline(siteID, pageID, pageName, remark, sortNum, userName);
            return returnValue;
        }

        public int DeleteOutline(string siteID, string pageID)
        {
            int returnValue = cmsDL.DeleteOutline(siteID, pageID);
            return returnValue;
        }

        #endregion

        #region "Page Maintenance"

        public DataTable GetAllPages(string siteID, string pageID)
        {
            DataTable dtSites = cmsDL.GetAllPages(siteID, pageID);
            return dtSites;
        }

        public DataTable GetPage(string siteID, string childPageID)
        {
            DataTable dtPage = cmsDL.GetPage(siteID, childPageID);
            return dtPage;
        }

        public int DeletePage(string siteId, string pageID, string childPageID)
        {
            int returnValue = cmsDL.DeletePage(siteId, pageID, childPageID);
            return returnValue;
        }

        public int CreateTreeview(string siteID, string pageID, string childPageID, string childSortNum, string userName)
        {
            int returnValue = cmsDL.CreateTreeview(siteID, pageID, childPageID, childSortNum, userName);
            return returnValue;
        }

        public int UpdateTreeview(string siteID, string pageID, string childPageID, string childSortNum, string userName)
        {
            int returnValue = cmsDL.UpdateTreeview(siteID, pageID, childPageID, childSortNum, userName);
            return returnValue;
        }

        public int UpdatePage(string siteID, string pageID, string pageName, string remark, string sortNum, string userName)
        {
            int returnValue = cmsDL.UpdatePage(siteID, pageID, pageName, remark, sortNum, userName);
            return returnValue;
        }

        public bool DuplicatePageName(string siteID, string pageName)
        {
            bool returnValue = cmsDL.DuplicatePageName(siteID, pageName);
            return returnValue;
        }

        public int GetDuplicatePageSort(string siteID, string outlineID, string sortNum)
        {
            int returnNumber = cmsDL.GetDuplicatePageSort(siteID, outlineID, sortNum);
            return returnNumber;
        }


        public int JMD_PAGE_SAVE(string pageId, string siteURL, string pageName,
            string pageCaption, string metaTitle, string metaDesc,
            string metaKeywords, string parentPageName, string isPublished,
            string isRoot, string isMenuItem,
            string viewRoles, string addRoles, string editRoles, string deleteRoles,
            string moveRoles, string addModuleRoles, string isInternal,
            string loadShared_Modules, string pageSort, string isViewStateEnabled)
        {
            int returnValue = cmsDL.JMD_PAGE_SAVE(pageId, siteURL, pageName, pageCaption, metaTitle, metaDesc, metaKeywords,
                parentPageName, isPublished, isRoot, isMenuItem, viewRoles, addRoles, editRoles, deleteRoles, moveRoles,
                addModuleRoles, isInternal, loadShared_Modules, pageSort, isViewStateEnabled);
            return returnValue;
        }


        #endregion

        #region "Additional Page Maintenance"

        public DataTable GetAllAdditionalPages(string siteID)
        {
            DataTable dtSites = new DataTable();
            dtSites = cmsDL.GetAllAdditionalPages(siteID);
            return dtSites;
        }

        public DataTable GetAdditionalPage(string siteID, string childPageID)
        {
            DataTable dtPage = new DataTable();
            dtPage = cmsDL.GetAdditionalPage(siteID, childPageID);
            return dtPage;
        }

        public int DeleteAdditionalPage(string siteId, string pageID)
        {
            int returnValue = cmsDL.DeleteAdditionalPage(siteId, pageID);
            return returnValue;
        }


        #endregion


        #region "CMS Client"

        public DataTable GetHtmlContent(string siteID, string pageID)
        {
            DataTable dtHtmlContent = new DataTable();
            dtHtmlContent = cmsDL.GetHtmlContent(siteID, pageID);
            return dtHtmlContent;
        }

        public DataSet GetClientTreeview(string siteID)
        {
            DataSet dsClientTreeView = new DataSet();
            dsClientTreeView = cmsDL.GetClientTreeview(siteID);
            return dsClientTreeView;
        }

        public void CaptureContentUsage(string userID, string siteID, string pageID, string duration, string userName)
        {
            cmsDL.CaptureContentUsage(userID, siteID, pageID, duration, userName);
        }

        #endregion


    }
}
