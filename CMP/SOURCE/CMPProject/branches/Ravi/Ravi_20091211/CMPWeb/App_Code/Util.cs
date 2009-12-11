using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace CMPWeb
{
    public class Util
    {
        public Util()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static string SiteURL(string URI)
        {

            string[] parts = URI.Split(new char[] { '/' });
            string Site_URL = string.Empty;
            if (parts.Length == 7 || parts.Length == 5)
            {
                //Virtual Directory
                //Literal1.Text += "Virtual Directory..." + "<BR />";
                Site_URL = parts[3].ToString();

            }
            else if (parts.Length == 4 || parts.Length == 6)
            {
                // Domain or SubDomain
                //Literal1.Text += "Domain or Sub Domain" + "<BR />";
                Site_URL = parts[2].ToString();
            }
            return Site_URL;
        }
        public static string PageName(string URI)
        {
            string[] Site = URI.Split(new char[] { '?' });
            //string[] parts = URI.Split(new char[] { '/' });
            string[] parts = Site[0].Split(new char[] { '/' });
            string FullPageName = parts[parts.Length - 1].ToString();
            string[] PageName = FullPageName.Split(new char[] { '.' });

            return PageName[0];
        }
        public static string PageParams(string URI)
        {
            string[] Site = URI.Split(new char[] { '?' });

            //string[] parts = URI.Split(new char[] { '/' });
            if (Site.Length > 1)
            {
                return Site[1].ToString();

                /*            
                            //string[] parts = Site[1].Split(new char[] { '/' });
                            //string FullPageName = parts[parts.Length - 1].ToString();
                            //string[] PageParam = FullPageName.Split(new char[] { '?' });
                            if (PageParam.Length > 1)
                            {
                                return Site[1].ToString();
                            }
                            else
                            {
                                return String.Empty;
                            }
  
                 */
            }
            else
            {
                return String.Empty;
            }
        }
        public static string CreateSalt(int size)
        {
            // Generate a cryptographic random number using the cryptographic
            // service provider
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] buff = new byte[size];
            rng.GetBytes(buff);
            // Return a Base64 string representation of the random number
            return Convert.ToBase64String(buff);
        }
        public static string CreatePasswordHash(string pwd, string salt)
        {
            string saltAndPwd = String.Concat(pwd, salt);
            string hashedPwd =
                   FormsAuthentication.HashPasswordForStoringInConfigFile(
                                                        saltAndPwd, "SHA1");
            return hashedPwd;
        }
        public static string SqlConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["CMPConnString"].ConnectionString;
        }
        public static string SingleLineOptionsToDb(bool SLRequired,
            string SLMaxLength)
        {
            string Options = string.Empty;
            string Required = "Required={0}";
            string MaxLength = "|MaxLength={0}";

            if (SLRequired == true)
            {
                Options = String.Format(Required, "true");
            }
            else
            {
                Options = String.Format(Required, "false");
            }
            Options += string.Format(MaxLength, SLMaxLength);
            return Options;
        }
        public static string MultiLineOptionsToDb(bool MLRequired,
            string MLTotalLines)
        {
            string Options = string.Empty;
            string Required = "Required={0}";
            string TotalLines = "|TotalLines={0}";

            if (MLRequired == true)
            {
                Options = String.Format(Required, "true");
            }
            else
            {
                Options = String.Format(Required, "false");
            }
            Options += string.Format(TotalLines, MLTotalLines);
            return Options;
        }
        public static string CheckBoxOptionsToDb(string DefaultValue)
        {
            string Options = string.Empty;
            string Default = "Default={0}";

            if (DefaultValue == "True")
            {
                Options = String.Format(Default, "True");
            }
            else
            {
                Options = String.Format(Default, "False");
            }
            return Options;
        }
        public static string LookupOptionsToDb(bool LookupRequired, string FormId,
            string FieldId)
        {
            string Options = string.Empty;
            string Required = "Required={0}";
            string Obj_Id = "|Obj_Id={0}";
            string Col_Id = "|Col_Id={0}";
            if (LookupRequired == true)
            {
                Options = String.Format(Required, "true");
            }
            else
            {
                Options = String.Format(Required, "false");
            }

            Options += String.Format(Obj_Id, FormId);
            Options += String.Format(Col_Id, FieldId);
            return Options;
        }
        public static string ListOptionsToDb(bool ListRequired,
            string ListItems, string ListDefaultValue)
        {
            string Options = string.Empty;
            string Required = "Required={0}";
            string Items = "|Items={0}";
            string Default = "|Default={0}";
            if (ListRequired == true)
            {
                Options = String.Format(Required, "true");
            }
            else
            {
                Options = String.Format(Required, "false");
            }

            Options += string.Format(Items, ListItems);
            Options += string.Format(Default, ListDefaultValue);
            return Options;

        }
        public static bool IsRequired(string Options)
        {
            string[] OptionParts = Options.Split(new char[] { '|' });
            bool Required = false;

            if (OptionParts.Length > 0)
            {
                foreach (string str in OptionParts)
                {
                    string[] strParts = str.Split(new char[] { '=' });
                    if (strParts.Length > 1)
                    {
                        if (strParts[0] == "Required")
                        {
                            if (strParts[1] == "true")
                            {
                                Required = true;
                            }
                            else
                            {
                                Required = false;
                            }
                        }
                    }
                }
            }
            return Required;
        }
        public static string TextMaxLength(string Options)
        {
            string[] OptionParts = Options.Split(new char[] { '|' });
            string MaxLength = "0";

            if (OptionParts.Length > 0)
            {
                foreach (string str in OptionParts)
                {
                    string[] strParts = str.Split(new char[] { '=' });
                    if (strParts.Length > 1)
                    {
                        if (strParts[0] == "MaxLength")
                        {
                            MaxLength = strParts[1];
                        }
                    }
                }
            }
            return MaxLength;
        }
        public static string TextTotalLines(string Options)
        {
            string[] OptionParts = Options.Split(new char[] { '|' });
            string TotalLines = "0";

            if (OptionParts.Length > 0)
            {
                foreach (string str in OptionParts)
                {
                    string[] strParts = str.Split(new char[] { '=' });
                    if (strParts.Length > 1)
                    {
                        if (strParts[0] == "TotalLines")
                        {
                            TotalLines = strParts[1];
                        }
                    }
                }
            }
            return TotalLines;
        }
        public static string CheckBoxDefault(string Options)
        {
            string[] OptionParts = Options.Split(new char[] { '|' });
            string Default = "False";

            if (OptionParts.Length > 0)
            {
                foreach (string str in OptionParts)
                {
                    string[] strParts = str.Split(new char[] { '=' });
                    if (strParts.Length > 1)
                    {
                        if (strParts[0] == "Default")
                        {
                            Default = strParts[1];
                        }
                    }
                }
            }
            return Default;

        }
        public static string ListItems(string Options)
        {
            string[] OptionParts = Options.Split(new char[] { '|' });
            string Items = string.Empty;

            if (OptionParts.Length > 0)
            {
                foreach (string str in OptionParts)
                {
                    string[] strParts = str.Split(new char[] { '=' });
                    if (strParts.Length > 1)
                    {
                        if (strParts[0] == "Items")
                        {
                            Items = strParts[1];
                        }
                    }
                }
            }
            return Items;
        }
        public static string ListDefault(string Options)
        {
            string[] OptionParts = Options.Split(new char[] { '|' });
            string Default = string.Empty;

            if (OptionParts.Length > 0)
            {
                foreach (string str in OptionParts)
                {
                    string[] strParts = str.Split(new char[] { '=' });
                    if (strParts.Length > 1)
                    {
                        if (strParts[0] == "Default")
                        {
                            Default = strParts[1];
                        }
                    }
                }
            }
            return Default;
        }
        public static string LookupSource(string Options)
        {
            string[] OptionParts = Options.Split(new char[] { '|' });
            string Source = string.Empty;

            if (OptionParts.Length > 0)
            {
                foreach (string str in OptionParts)
                {
                    string[] strParts = str.Split(new char[] { '=' });
                    if (strParts.Length > 1)
                    {
                        if (strParts[0] == "Obj_Id")
                        {
                            Source = strParts[1];
                        }
                    }
                }
            }
            return Source;
        }
        public static string LookupField(string Options)
        {
            string[] OptionParts = Options.Split(new char[] { '|' });
            string Field = string.Empty;

            if (OptionParts.Length > 0)
            {
                foreach (string str in OptionParts)
                {
                    string[] strParts = str.Split(new char[] { '=' });
                    if (strParts.Length > 1)
                    {
                        if (strParts[0] == "Col_Id")
                        {
                            Field = strParts[1];
                        }
                    }
                }
            }
            return Field;
        }

        public static TextBox TextBoxCtl(string Name, string DefaultValue,
            string CSSClass)
        {
            TextBox tx = new TextBox();
            tx.ID = string.Format("{0}", Name);
            tx.Text = DefaultValue;
            tx.Attributes.Add("name", Name);
            tx.Attributes.Add("runat", "Server");
            tx.Attributes.Add("class", CSSClass);
            return tx;
        }
        public static Button ButtonCtl(string Name, string Caption, string CSSClass)
        {
            Button btn = new Button();
            btn.ID = string.Format("{0}", Name);
            btn.Text = Caption;
            btn.Attributes.Add("name", Name);
            btn.Attributes.Add("runat", "Server");
            btn.Attributes.Add("class", CSSClass);
            return btn;
        }
        public static HtmlTableCell HtmlTableCellCtl(string tag, string CSSClass)
        {
            HtmlTableCell htc = new HtmlTableCell(tag);
            htc.Attributes.Add("runat", "Server");
            htc.Attributes.Add("class", "TableFormTdLeft");
            return htc;
        }
        public static Literal LiteralCtl(string Caption)
        {
            Literal lt = new Literal();
            lt.Text = Caption;
            return lt;
        }

        // TODO: WI-1150 Returns a string of ; delimited file names in the 
        // given directory and given extensions.
        /// <summary>
        /// WI-1150 Returns a string of ; delimited file names in the 
        /// given directory and given extensions.
        /// </summary>
        /// <param name="dir">Directory to scan</param>
        /// <param name="Ext">; delimited file extensions</param>
        /// <returns></returns>
        public static string GetFileNames(string dir, string[] GetExt,
            string SearchText)
        {
            StringBuilder sb = new StringBuilder();
            DirectoryInfo mainDir = new DirectoryInfo(dir);
            FileSystemInfo[] items;
            if (SearchText.Trim() == string.Empty)
            {
                items = mainDir.GetFileSystemInfos();
            }
            else
            {
                items = mainDir.GetFileSystemInfos(string.Format("*{0}*", SearchText));
            }

            foreach (FileSystemInfo item in items)
            {
                if (item is FileInfo)
                {
                    FileInfo fileInfo = item as FileInfo;
                    for (int i = 0; i < GetExt.Length; i++)
                    {
                        if (fileInfo.Extension.ToUpper().CompareTo(GetExt[i].ToUpper()) == 0)
                        {
                            sb.Append(fileInfo.Name + ";");
                        }
                    }
                }
            }
            return sb.ToString();
        }

        public static string GetGUID()
        {
            return System.Guid.NewGuid().ToString();
        }
    }
}
