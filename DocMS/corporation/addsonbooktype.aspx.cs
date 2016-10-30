using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DocMS.Models.DataSetTableAdapters;

namespace DocMS.corporation
{
    public partial class addsonbooktype : System.Web.UI.Page
    {
        string name;
        protected void Page_Load(object sender, EventArgs e)
        {
            Corporation corporation = (Corporation)Session["corporation"];
            if (Session["corporation"] == null)
                Response.Redirect("../corporation_login.aspx");
            else
            {
                if (!IsPostBack)
                {
                    AddTree(0, null);
                }
            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            Corporation corporation = (Corporation)Session["corporation"];
            CorSelfBooktypeTableAdapter ta_booktype = new CorSelfBooktypeTableAdapter();
            //查询选择的节点，得到选择节点的id  
            if (this.tree.SelectedNode == null)
            {
                lab_tip.Text = "没有选中目录";
            }
            else
            {
                DataTable dt_booktype = ta_booktype.GetSelfBooktypeByName(this.tree.SelectedNode.Value, corporation.id);
                int parent_id = Convert.ToInt32(dt_booktype.Rows[0]["id"]);
                dt_booktype = ta_booktype.GetSelfBooktypeByName(txt_name.Text, corporation.id);
                if (dt_booktype.Rows.Count != 0)
                    lab_tip.Text = "账户名已存在";
                else
                {
                    if (txt_name.Text == "")
                    {
                        lab_tip.Text = "输入不能为空";
                    }
                    else
                    {
                        ta_booktype.InsertSSelfBooktype(txt_name.Text, 0, parent_id, corporation.id);
                        lab_tip.Text = "添加成功";
                    }
                }
            }
        }

        protected void Select_Change(Object sender, EventArgs e)
        {

            lbl_selectednode.Text = this.tree.SelectedNode.Value;
        }

        private void AddTree(int Pid, TreeNode PNode)
        {
            Corporation corporation = (Corporation)Session["corporation"];
            CorSelfBooktypeTableAdapter ta_fatype = new CorSelfBooktypeTableAdapter();
            DataTable dt = ta_fatype.GetSelfMenu(corporation.id);
            if (dt.Rows.Count > 0)
            {
                DataView dv = new DataView(dt);
                //过滤ParentID,得到当前的所有子节点 ParentID为父节点ID
                dv.RowFilter = "[parent_id] = " + Pid;
                //循环递归
                foreach (DataRowView Row in dv)
                {
                    //声明节点
                    TreeNode Node = new TreeNode();
                    //绑定超级链接
                    //Node.NavigateUrl = String.Format("javascript:show('{0}')", Row["name"].ToString());
                    //开始递归
                    if (PNode == null)
                    {
                        //添加根节点
                        Node.Text = Row["name"].ToString();
                        Node.Value = Row["name"].ToString();
                        name = Node.Text;
                        tree.Nodes.Add(Node);
                        Node.Expanded = false; //节点状态展开
                        AddTree(Int32.Parse(Row["id"].ToString()), Node);    //再次递归
                    }
                    else
                    {
                        //添加当前节点的子节点
                        Node.Text = Row["name"].ToString();
                        Node.Value = Row["name"].ToString();
                        name = Node.Text;
                        PNode.ChildNodes.Add(Node);
                        Node.Expanded = false; //节点状态展开
                        AddTree(Int32.Parse(Row["id"].ToString()), Node);     //再次递归
                    }
                }
            }
        }

    }
}