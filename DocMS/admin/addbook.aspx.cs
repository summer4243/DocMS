using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DocMS.Models.DataSetTableAdapters;

namespace DocMS.admin
{
    public partial class addbook : System.Web.UI.Page
    {
        string name;
        protected void Page_Load(object sender, EventArgs e)
        {
            Admin admin = (Admin)Session["admin"];
            if (Session["admin"] == null)
                Response.Redirect("adminlogin.aspx");
            else
            {
                if (admin.type == 2)
                {
                    div_main.InnerHtml = "<br><div class='alert alert-danger' role='alert'>非创建者类型管理员无法对管理员进行操作，请联系网站Admin。</div>";
                }
                else
                {
                    if (!IsPostBack)
                    {
                        AddTree(0, null);
                    }
                }
            }

        }

        protected void Select_Change(Object sender, EventArgs e)
        {

            lbl_selectednode.Text = this.tree.SelectedNode.Text;
        }

        private void AddTree(int Pid, TreeNode PNode)
        {
            AdminBooktypeTableAdapter ta_fatype = new AdminBooktypeTableAdapter();
            AdminBookTableAdapter ta_book = new AdminBookTableAdapter();
            DataTable dt_fa = ta_fatype.GetAdminMenuBooktype();
            DataTable dt_book = ta_book.GetMenuBook();

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
                Boolean b5 = lbl_selectednode.Text.EndsWith(".dwg");

                if (b1 || b2 || b3 || b4 || b5)
                {
                    lab_tip.Text = "<script>alert('不能在书籍下面添加书籍'); window.location.href='addbook.aspx'</script>";
                }
                else
                {

                    AdminBookTableAdapter ta_adminbook = new AdminBookTableAdapter();
                    AdminBook book = new AdminBook();
                    book.name = txt_name.Text;
                    book.author = txt_author.Text;
                    book.keyword = txt_keyword.Text;
                    book.score = Convert.ToInt32(txt_score.Text);
                    book.star = Convert.ToInt32(ddl_star.SelectedItem.Value);
                    book.filetype = ddl_type.SelectedItem.Value;
                    book.name = book.name + "." + book.filetype;
                    if (file_book.HasFile)
                    {
                        string filename = file_book.FileName.ToLower();
                        file_book.SaveAs(Server.MapPath("~/admin/upload/bookfile/") + filename);
                        book.url = "admin/upload/bookfile/" + filename;
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
                    ta_adminbook.InsertAdminBook(book.name, book.url, book.star, book.author, book.keyword, book.score, book.filetype);
                    DataTable dt_adminBook = ta_adminbook.GetAdminBookByName(book.name);
                    int book_id = Convert.ToInt32(dt_adminBook.Rows[0]["id"]);
                    int booktype_id = Convert.ToInt32(this.tree.SelectedNode.Value);
                    AdminBTTableAdapter ta_adminBT = new AdminBTTableAdapter();
                    ta_adminBT.InsertAdminBT(book_id, booktype_id);
                    lab_tip.Text = "<script>alert('添加成功'); window.location.href='addbook.aspx'</script>";
                }
            }
        }
    }
}