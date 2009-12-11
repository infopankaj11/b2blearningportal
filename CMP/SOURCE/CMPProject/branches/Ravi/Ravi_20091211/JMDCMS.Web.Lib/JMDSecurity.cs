using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Principal;
using System.Web;
using System.Data;

namespace JMDCMS.Web.Lib
{

    public class JMDSecurity 
    {
        private bool isAdmin = false;

        // PAGE SECURITY FLAGS...
        private bool pageView = false;
        private bool pageAdd = false;
        private bool pageEdit = false;
        private bool pageDelete = false;
        private bool pageMove = false;
        private bool pageAddModules = false;

        // MODULE SECURITY FLAGS...
        private bool modView = false;
        private bool modEdit = false;
        private bool modDelete = false;
        private bool modMove = false;
        private bool modEditContent = false;

        public JMDSecurity()
        {
            // Constructor
        }
        public bool IsAdmin
        {
            get { return isAdmin; }
        }
        public bool PageView
        {
            get { return pageView; }
        }
        public bool PageAdd
        {
            get { return pageAdd; }
        }
        public bool PageEdit
        {
            get { return pageEdit; }
        }
        public bool PageDelete
        {
            get { return pageDelete; }
        }
        public bool PageMove
        {
            get { return pageMove; }
        }

        public bool PageAddModules
        {
            get { return pageAddModules; }
        }

        public void CheckPageAuth(string SqlConnectionString, string Site_Url,
            string Page_Name)
        {
            
            //IPrincipal p = HttpContext.Current.User;
            IPrincipal p = HttpContext.Current.User;
            
            if (p.IsInRole("Admin"))
            {
                isAdmin = true;
                pageView = true;
                pageAdd = true;
                pageEdit = true;
                pageDelete = true;
                pageMove = true;
                pageAddModules = true;
            }
            else
            {
                SqlServer sqlServer = new SqlServer(SqlConnectionString);
                DataTable dt = sqlServer.JMD_PAGE_AUTH(Site_Url, Page_Name);
                if (dt.Rows.Count > 0)
                {
                    //string[] roles = authTicket.UserData.Split(new char[] { ';' });
                    string[] ViewRoles = dt.Rows[0]["VIEW_ROLES"].ToString().Split(new char[] { ';' });
                    string[] AddRoles = dt.Rows[0]["ADD_ROLES"].ToString().Split(new char[] { ';' });
                    string[] EditRoles = dt.Rows[0]["EDIT_ROLES"].ToString().Split(new char[] { ';' });
                    string[] MoveRoles = dt.Rows[0]["MOVE_ROLES"].ToString().Split(new char[] { ';' });
                    string[] DeleteRoles = dt.Rows[0]["DELETE_ROLES"].ToString().Split(new char[] { ';' });
                    string[] AddModuleRoles = dt.Rows[0]["ADD_MODULE_ROLES"].ToString().Split(new char[] { ';' });
                    foreach (string Role in ViewRoles)
                    {
                        if ((p.IsInRole(Role) && (string.Compare(Role.Trim(), string.Empty) != 0)) ||
                            (String.Compare(Role, "Guests", true) == 0))
                        {
                            pageView = true;
                            break;
                        }
                        else if ((p.Identity.IsAuthenticated) && (String.Compare(Role, "Registered", true) == 0))
                        {
                            pageView = true;
                            break;
                        }
                    }
                    foreach (string Role in AddRoles)
                    {
                        if (p.IsInRole(Role) && (string.Compare(Role.Trim(), string.Empty) != 0))
                        {
                            pageAdd = true;
                            break;
                        }
                        else if ((p.Identity.IsAuthenticated) && (String.Compare(Role, "Registered", true) == 0))
                        {
                            pageAdd = true;
                            break;
                        }
                    }

                    foreach (string Role in EditRoles)
                    {
                        if (p.IsInRole(Role) && (string.Compare(Role.Trim(), string.Empty) != 0))
                        {
                            pageEdit = true;
                            break;
                        }
                        else if ((p.Identity.IsAuthenticated) && (String.Compare(Role, "Registered", true) == 0))
                        {
                            pageEdit = true;
                            break;
                        }
                    }
                    foreach (string Role in DeleteRoles)
                    {
                        if (p.IsInRole(Role) && (string.Compare(Role.Trim(), string.Empty) != 0))
                        {
                            pageDelete = true;
                            break;
                        }

                        else if ((p.Identity.IsAuthenticated) && (String.Compare(Role, "Registered", true) == 0))
                        {
                            pageDelete = true;
                            break;
                        }
                    }
                    foreach (string Role in MoveRoles)
                    {
                        if (p.IsInRole(Role) && (string.Compare(Role.Trim(), string.Empty) != 0))
                        {
                            pageMove = true;
                            break;
                        }

                        else if ((p.Identity.IsAuthenticated) && (String.Compare(Role, "Registered", true) == 0))
                        {
                            pageMove = true;
                            break;
                        }
                    }
                    foreach (string Role in AddModuleRoles)
                    {
                        if (p.IsInRole(Role) && (string.Compare(Role.Trim(), string.Empty) != 0))
                        {
                            pageAddModules = true;
                            break;
                        }
                        else if ((p.Identity.IsAuthenticated) && (String.Compare(Role, "Registered", true) == 0))
                        {
                            pageAddModules = true;
                            break;
                        }
                    }
                }
                dt.Dispose();
                sqlServer = null;
            }
        }
    }
}
