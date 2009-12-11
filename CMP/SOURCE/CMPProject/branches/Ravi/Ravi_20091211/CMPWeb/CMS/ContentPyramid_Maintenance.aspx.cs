using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Xml;
using System.Text;
using WorkLayers.DataLayer;

namespace Web.CMS
{
    public partial class ContentPyramid_Maintenance : System.Web.UI.Page
    {
        int[] index = null;
        string url = "http://localhost/SITEXXXX/Default.aspx?Pg=http://localhost/SITEXXXX/";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hdnSiteName.Value = Request.QueryString["siteName"].ToString();
                hdnSiteID.Value = Request.QueryString["siteID"].ToString();
                loadPage();
            }
        }

        private void loadPage()
        {
            CMSDL cmsdl = new CMSDL();

            DataTable dtPage = cmsdl.GetAllPageName(hdnSiteID.Value);
            
            foreach (DataRow dr in dtPage.Rows)
            {
                lbContentPage.Items.Add(dr[0].ToString());
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            try
            {
                TreeNodeCollection coll = tv.CheckedNodes;
                TreeNode newNode = new TreeNode();
                newNode.Text = txt.Text;
                newNode.Target = "_blank";
                //newNode.Selected = true;
                newNode.ShowCheckBox = true;

                if (coll.Count > 0)
                {
                    foreach (TreeNode node in coll)
                    {
                        getValues(node.ValuePath);
                        fillChild(node.Depth, "CREATE", newNode);
                    }
                }
                else
                {

                    int count = tv.Nodes.Count;
                    tv.Nodes.AddAt(count, newNode);
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void up_Click(object sender, EventArgs e)
        {
            try
            {
                TreeNodeCollection coll = tv.CheckedNodes;
                foreach (TreeNode node in coll)
                {
                    getValues(node.ValuePath);
                    fillChild(node.Depth, "UP", node);
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void down_Click(object sender, EventArgs e)
        {
            try
            {
                TreeNodeCollection coll = tv.CheckedNodes;
                foreach (TreeNode node in coll)
                {
                    getValues(node.ValuePath);
                    fillChild(node.Depth, "DOWN", node);
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void gr_Click(object sender, EventArgs e)
        {
            try
            {
                TreeNodeCollection coll = tv.CheckedNodes;
                foreach (TreeNode node in coll)
                {
                    getValues(node.ValuePath);
                    fillChild(node.Depth, "RIGHT", node);
                }

            }
            catch (Exception ex)
            {

            }

        }
        protected void lt_Click(object sender, EventArgs e)
        {
            try
            {
                TreeNodeCollection coll = tv.CheckedNodes;
                foreach (TreeNode node in coll)
                {
                    getValues(node.ValuePath);
                    fillChild(node.Depth, "LEFT", node);
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void getValues(string nodePath)
        {
            try
            {
                int i = 0;
                char[] c = { '/' };
                string[] paths = nodePath.Split(c, StringSplitOptions.None);

                index = new int[paths.Length];

                string path = "";
                foreach (string s in paths)
                {
                    path = path + s;
                    TreeNode node = tv.FindNode(path);
                    index[i] = getIndex(i, node);
                    path += "/";
                    i++;
                }
            }
            catch (Exception ex)
            {

            }
        }

        private int getIndex(int i, TreeNode node)
        {
            int idx = -1;

            switch (i)
            {
                case 0:
                    idx = tv.Nodes.IndexOf(node);
                    break;
                case 1:
                    idx = tv.Nodes[index[0]].ChildNodes.IndexOf(node);
                    break;
                case 2:
                    idx = tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes.IndexOf(node);
                    break;
                case 3:
                    idx = tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes.IndexOf(node);
                    break;
                case 4:
                    idx = tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes.IndexOf(node);
                    break;
                case 5:
                    idx = tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes.IndexOf(node);
                    break;
            }

            return idx;
        }

        private void fillChild(int depth, string type, TreeNode selectedNode)
        {
            try
            {
                /*string newUrl = url.Replace("SITEXXXX", hdnSiteName.Value);
                newUrl = newUrl + lbContentPage.SelectedValue.ToString() + ".aspx";*/
                string newUrl = lbContentPage.SelectedValue.ToString();
                switch (depth)
                {
                    case 0:
                        if (type == "CREATE")
                        {
                            tv.Nodes.AddAt(index[0] + 1, selectedNode);
                        }
                        else if (type == "UP")
                        {
                            tv.Nodes.RemoveAt(index[0]);
                            tv.Nodes.AddAt(index[0] - 1, selectedNode);
                        }
                        else if (type == "DOWN")
                        {
                            tv.Nodes.RemoveAt(index[0]);
                            tv.Nodes.AddAt(index[0] + 1, selectedNode);
                        }
                        else if (type == "RIGHT")
                        {
                            tv.Nodes.RemoveAt(index[0]);
                            tv.Nodes[index[0] - 1].ChildNodes.Add(selectedNode);
                        }
                        else if (type == "URL")
                        {
                            tv.Nodes[index[0]].NavigateUrl = newUrl;
                        }
                        break;
                    case 1:
                        if (type == "CREATE")
                        {
                            tv.Nodes[index[0]].ChildNodes.AddAt(index[1] + 1, selectedNode);
                        }
                        else if (type == "UP")
                        {
                            tv.Nodes[index[0]].ChildNodes.RemoveAt(index[1]);
                            tv.Nodes[index[0]].ChildNodes.AddAt(index[1] - 1, selectedNode);
                        }
                        else if (type == "DOWN")
                        {
                            tv.Nodes[index[0]].ChildNodes.RemoveAt(index[1]);
                            tv.Nodes[index[0]].ChildNodes.AddAt(index[1] + 1, selectedNode);
                        }
                        else if (type == "LEFT")
                        {
                            tv.Nodes[index[0]].ChildNodes.RemoveAt(index[1]);
                            tv.Nodes.AddAt(index[0] + 1, selectedNode);
                        }
                        else if (type == "RIGHT")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1] - 1].ChildNodes.Add(selectedNode);
                            tv.Nodes[index[0]].ChildNodes.RemoveAt(index[1]);
                        }
                        break;
                    case 2:
                        if (type == "CREATE")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes.AddAt(index[2] + 1, selectedNode);
                        }
                        else if (type == "UP")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes.RemoveAt(index[2]);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes.AddAt(index[2] - 1, selectedNode);
                        }
                        else if (type == "DOWN")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes.RemoveAt(index[2]);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes.AddAt(index[2] + 1, selectedNode);
                        }
                        else if (type == "LEFT")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes.RemoveAt(index[2]);
                            tv.Nodes[index[0]].ChildNodes.AddAt(index[1] + 1, selectedNode);
                        }
                        else if (type == "RIGHT")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2] - 1].ChildNodes.Add(selectedNode);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes.RemoveAt(index[2]);
                        }
                        break;
                    case 3:
                        if (type == "CREATE")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes.AddAt(index[3] + 1, selectedNode);
                        }
                        else if (type == "UP")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes.RemoveAt(index[3]);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes.AddAt(index[3] - 1, selectedNode);
                        }
                        else if (type == "DOWN")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes.RemoveAt(index[3]);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes.AddAt(index[3] + 1, selectedNode);
                        }
                        else if (type == "LEFT")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes.RemoveAt(index[3]);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes.AddAt(index[2] + 1, selectedNode);
                        }
                        else if (type == "RIGHT")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3] - 1].ChildNodes.Add(selectedNode);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes.RemoveAt(index[3]);
                        }
                        break;
                    case 4:
                        if (type == "CREATE")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes.AddAt(index[4] + 1, selectedNode);
                        }
                        else if (type == "UP")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes.RemoveAt(index[4]);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes.AddAt(index[4] - 1, selectedNode);
                        }
                        else if (type == "DOWN")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes.RemoveAt(index[4]);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes.AddAt(index[4] + 1, selectedNode);
                        }
                        else if (type == "LEFT")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes.RemoveAt(index[4]);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes.AddAt(index[3] + 1, selectedNode);
                        }
                        else if (type == "RIGHT")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4] - 1].ChildNodes.Add(selectedNode);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes.RemoveAt(index[4]);
                        }
                        break;
                    case 5:
                        if (type == "CREATE")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes.AddAt(index[5] + 1, selectedNode);
                        }
                        else if (type == "UP")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes.RemoveAt(index[5]);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes.AddAt(index[5] - 1, selectedNode);
                        }
                        else if (type == "DOWN")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes.RemoveAt(index[5]);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes.AddAt(index[5] + 1, selectedNode);
                        }
                        else if (type == "LEFT")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes.RemoveAt(index[5]);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes.AddAt(index[4] + 1, selectedNode);
                        }
                        else if (type == "RIGHT")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes[index[5] - 1].ChildNodes.Add(selectedNode);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes.RemoveAt(index[5]);
                        }
                        break;
                    case 6:
                        if (type == "CREATE")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes[index[5]].ChildNodes.AddAt(index[6] + 1, selectedNode);
                        }
                        else if (type == "UP")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes[index[5]].ChildNodes.RemoveAt(index[6]);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes[index[5]].ChildNodes.AddAt(index[6] - 1, selectedNode);
                        }
                        else if (type == "DOWN")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes[index[5]].ChildNodes.RemoveAt(index[6]);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes[index[5]].ChildNodes.AddAt(index[6] + 1, selectedNode);
                        }
                        else if (type == "LEFT")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes[index[5]].ChildNodes.RemoveAt(index[6]);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes.AddAt(index[5] + 1, selectedNode);
                        }
                        else if (type == "RIGHT")
                        {
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes[index[5]].ChildNodes[index[6] - 1].ChildNodes.Add(selectedNode);
                            tv.Nodes[index[0]].ChildNodes[index[1]].ChildNodes[index[2]].ChildNodes[index[3]].ChildNodes[index[4]].ChildNodes[index[5]].ChildNodes.RemoveAt(index[6]);
                        }
                        break;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void tv_TreeNodeCheckChanged(object sender, TreeNodeEventArgs e)
        {
            try
            {
                TreeNode node = e.Node;
                TreeNodeCollection nodeColl = tv.CheckedNodes;
                TreeNode[] uncheckNode = new TreeNode[nodeColl.Count - 1];
                int i = 0;
                foreach (TreeNode checkedNode in nodeColl)
                {
                    if (node != checkedNode)
                    {
                        uncheckNode[i] = checkedNode;
                        i++;
                    }
                }

                for (int j = 0; j < i; j++)
                {
                    uncheckNode[j].Checked = false;
                }
                txt.Text = node.Text;
                nodeValue.Value = node.Text;
            }
            catch (Exception ex)
            {

            }
        }
        protected void chg_Click(object sender, EventArgs e)
        {
            try
            {
                TreeNodeCollection coll = tv.CheckedNodes;
                foreach (TreeNode node in coll)
                {
                    node.Text = nodeValue.Value;
                }
            }
            catch (Exception ex)
            {

            }
        }
        string strxml = "";
        protected void save_Click(object sender, EventArgs e)
        {

            //XmlTextWriter xmlWriter = new XmlTextWriter("C:\\Inetpub\\" + hdnSiteName.Value + "\\ContentPyramid.xml", Encoding.UTF8);
            XmlTextWriter xmlWriter = new XmlTextWriter(@"C:\CMP\Web\CMSClient\" + hdnSiteName.Value + "_ContentPyramid.xml", Encoding.UTF8);
            xmlWriter.Formatting = Formatting.Indented; xmlWriter.Indentation = 3; xmlWriter.WriteStartDocument();
            // Opens <TreeView>, the root node.  
            xmlWriter.WriteStartElement("ContentPyramid");
            // Go through child nodes.  
            ProcessNodes(tv.Nodes, xmlWriter);
            // </TreeView>, the root node.  
            xmlWriter.WriteEndElement();
            xmlWriter.WriteEndDocument();
            // Closes the object and saves the document to disk.  
            xmlWriter.Close();

        }

        protected void ProcessNodes(TreeNodeCollection myTreeNodes, XmlTextWriter myWriter)
        {
            foreach (TreeNode thisNode in myTreeNodes)
            {
                myWriter.WriteStartElement("Category");
                // <TreeNode>.    
                // Go through each property and set it as an attribute if it exists.  
                if (!String.IsNullOrEmpty(thisNode.Text))
                    myWriter.WriteAttributeString("name", thisNode.Text);
                /*if (!String.IsNullOrEmpty(thisNode.ImageToolTip))
                    myWriter.WriteAttributeString("ImageToolTip", thisNode.ImageToolTip);
                if (!String.IsNullOrEmpty(thisNode.ImageUrl))
                    myWriter.WriteAttributeString("ImageUrl", thisNode.ImageUrl);*/
                if (!String.IsNullOrEmpty(thisNode.NavigateUrl))
                    myWriter.WriteAttributeString("url", thisNode.NavigateUrl);
                /*if (!String.IsNullOrEmpty(thisNode.SelectAction.ToString()))
                    myWriter.WriteAttributeString("SelectAction", thisNode.SelectAction.ToString());
                if (!String.IsNullOrEmpty(thisNode.Target))
                    myWriter.WriteAttributeString("Target", thisNode.Target);
                if (!String.IsNullOrEmpty(thisNode.ToolTip))
                    myWriter.WriteAttributeString("ToolTip", thisNode.ToolTip);
                if (!String.IsNullOrEmpty(thisNode.Value))
                    myWriter.WriteAttributeString("Value", thisNode.Value);
                if (!String.IsNullOrEmpty(thisNode.ValuePath))
                    myWriter.WriteAttributeString("ValuePath", thisNode.ValuePath);
                if (thisNode.ShowCheckBox.HasValue)
                    myWriter.WriteAttributeString("ShowCheckBox", thisNode.ShowCheckBox.ToString());
                if (thisNode.Expanded.HasValue)
                    myWriter.WriteAttributeString("Expanded", thisNode.Expanded.ToString());
                myWriter.WriteAttributeString("Selected", thisNode.Selected.ToString());
                myWriter.WriteAttributeString("Checked", thisNode.Checked.ToString());*/
                // Recurse through any child nodes.  
                if (thisNode.ChildNodes.Count > 0)
                    ProcessNodes(thisNode.ChildNodes, myWriter);
                myWriter.WriteEndElement();
                // </TreeNode>. 
            }
        }

        protected void btnTag_Click(object sender, EventArgs e)
        {
            if (lbContentPage.SelectedIndex > -1)
            {
                TreeNodeCollection coll = tv.CheckedNodes;
                foreach (TreeNode node in coll)
                {
                    getValues(node.ValuePath);
                    fillChild(node.Depth, "URL", node);
                }
            }
        }
    }
}
