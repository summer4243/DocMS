using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DocMS.Models.DataSetTableAdapters;
using DocMS.Models;

namespace DocMS.corporation
{
    public partial class addbook : System.Web.UI.Page
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

        protected void Select_Change(Object sender, EventArgs e)
        {

            lbl_selectednode.Text = this.tree.SelectedNode.Text;
        }

        private void AddTree(int Pid, TreeNode PNode)
        {
            Corporation corporation = (Corporation)Session["corporation"];
            CorSelfBooktypeTableAdapter ta_fatype = new CorSelfBooktypeTableAdapter();
            CorSelfBookTableAdapter ta_book = new CorSelfBookTableAdapter();
            DataTable dt_fa = ta_fatype.GetSelfMenu(corporation.id);
            DataTable dt_book = ta_book.GetMenuBook(corporation.id);

            dt_fa.Merge(dt_book);
            if (dt_fa.Rows.Count > 0)
            {
                DataView dv = new DataView(dt_fa);
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
                        Node.Value = Row["id"].ToString();
                        name = Node.Text;
                        tree.Nodes.Add(Node);
                        Node.Expanded = false; //节点状态收缩
                        AddTree(Int32.Parse(Row["id"].ToString()), Node);    //再次递归
                    }
                    else
                    {
                        //添加当前节点的子节点
                        Node.Text = Row["name"].ToString();
                        Node.Value = Row["id"].ToString();
                        name = Node.Text;
                        PNode.ChildNodes.Add(Node);
                        Node.Expanded = false; //节点状态收缩
                        AddTree(Int32.Parse(Row["id"].ToString()), Node);     //再次递归
                    }
                }
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            string book_path;
            Corporation corporation = (Corporation)Session["corporation"];
            if (this.tree.SelectedNode == null)
            {
                lab_tip.Text = "<script>alert('没有选中目录项'); window.location.href='addbook.aspx'</script>";
            }
            else
            {
                Boolean b1 = lbl_selectednode.Text.EndsWith(".doc");
                Boolean b2 = lbl_selectednode.Text.EndsWith(".pdf");
                Boolean b3 = lbl_selectednode.Text.EndsWith(".txt");
                Boolean b4 = lbl_selectednode.Text.EndsWith(".ppt");
                Boolean b5 = lbl_selectednode.Text.EndsWith(".cad");

                if (b1 || b2 || b3 || b4 || b5)
                {
                    lab_tip.Text = "<script>alert('不能在书籍下面添加书籍'); window.location.href='addbook.aspx'</script>";
                }
                else
                {

                    CorSelfBookTableAdapter ta_corselfbook = new CorSelfBookTableAdapter();
                    CorSelfBook book = new CorSelfBook();
                    book.name = txt_name.Text;
                    book.author = txt_author.Text;
                    book.keyword = txt_keyword.Text;
                    book.score = Convert.ToInt32(txt_score.Text);
                    book.star = Convert.ToInt32(ddl_star.SelectedItem.Value);
                    book.filetype = ddl_type.SelectedItem.Value;
                    book.name = book.name + "." + book.filetype;
                    book_path = "~/corporation/upload/" + corporation.name + "/";
                    if (file_book.HasFile)
                    {
                        string filename = file_book.FileName.ToLower();
                        file_book.SaveAs(Server.MapPath(book_path) + filename);
                        book.url = "corporation/upload/" + corporation.name + "/" + filename;
                        /*if (filename.EndsWith(".doc"))
                        {
                            file_book.SaveAs(Server.MapPath("~/upload/bookfile/") + filename + ".doc" );
                            book.Bookway = "/upload/bookfile/" + filename + ".doc";
                        }
                        if (filename.EndsWith(".pdf"))
                        {
                            file_book.SaveAs(Server.MapPath("~/upload/bookfile/") + filename + ".pdf");
                            book.Bookway = "/upload/bookfile/" + filename + ".pdf";
                        }
                        if (filename.EndsWith(".epub"))
                        {
                            file_book.SaveAs(Server.MapPath("~/upload/bookfile/") + book.Id.ToString() + ".epub");
                            book.Bookway = "/upload/bookfile/" + book.Id.ToString() + ".epub";
                        }*/
                    }
                    ta_corselfbook.InsertSelfBook(book.name, book.url, book.star, book.author, book.keyword, book.score, book.filetype, corporation.id);
                    DataTable dt_adminBook = ta_corselfbook.GetSelfBookByName(book.name, corporation.id);
                    int book_id = Convert.ToInt32(dt_adminBook.Rows[0]["id"]);
                    int booktype_id = Convert.ToInt32(this.tree.SelectedNode.Value);
                    CorSelfBTTableAdapter ta_adminBT = new CorSelfBTTableAdapter();
                    ta_adminBT.InsertCorSelfBT(book_id, booktype_id, corporation.id);
                    lab_tip.Text = "<script>alert('添加成功'); window.location.href='addbook.aspx'</script>";
                }
            }
        }
    }
}