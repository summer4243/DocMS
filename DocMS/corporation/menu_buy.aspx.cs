using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DocMS.Models.DataSetTableAdapters;
using System.IO;
using Microsoft.VisualBasic.FileIO;

namespace DocMS.corporation
{
    public partial class menu_buy : System.Web.UI.Page
    {
        //目录的id存储在a数组中(转移目录)
        int[] a = new int[1000];
        int i = 0;

        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            Corporation corporation = (Corporation)Session["corporation"];
            if (Session["corporation"] == null)
                Response.Redirect("corporation_login.aspx");
            else
            {
                if (!IsPostBack)
                {
                    DataSet ds_menu = new DataSet();
                    connect.FillDataSet(ds_menu, "SELECT id,name,price,parent_id FROM AdminBooktype WHERE parent_id = '0'", "AdminBooktype");
                    rbl_menu.DataSource = ds_menu;
                    rbl_menu.DataTextField = "name";
                    rbl_menu.DataValueField = "id";
                    rbl_menu.DataBind();
                }
            }
        }

        protected void btn_allmoney_click(object sender, EventArgs e)
        {
            string name;
            int price;
            if (rbl_menu.SelectedItem != null)
            {
                name = rbl_menu.SelectedItem.Text.ToString();
                AdminBooktypeTableAdapter ta_book = new AdminBooktypeTableAdapter();
                DataTable dt_book = ta_book.GetAdminBooktypeByName(name);
                price = Convert.ToInt32(dt_book.Rows[0]["price"]);
                int buycount = Convert.ToInt32(txtBuycount.Value);
                int allprice = price * buycount;
                lbl_allprice.Text = allprice.ToString();
            }
        }

        protected void btn_confirm_click(object sender, EventArgs e)
        {
            Connect connect = new Connect();
            string sql;

            //为了将bookpath完整的表现出来，目前差一个后缀
            string[] book = new string[200];
            string[] cbook = new string[200];

            Corporation corporation = (Corporation)Session["corporation"];
            int corporationid = corporation.id;
            CorpoBooktypeTableAdapter ta_corpo = new CorpoBooktypeTableAdapter();
            DataTable dt_corpo = ta_corpo.GetCBookTypeByTwo(Convert.ToInt32(rbl_menu.SelectedItem.Value), corporationid);

            if (dt_corpo.Rows.Count > 0)
            {
                //避免目录的重复购买
                Response.Write("<script language='javascript'>alert('您已经购买过此目录，不能继续进行购买');</script>");
            }
            else
            {
                if (Convert.ToInt32(lbl_allprice.Text) > 0)
                {
                    string name;
                    int price;
                    if (rbl_menu.SelectedItem != null)
                    {
                        name = rbl_menu.SelectedItem.Text.ToString();
                        AdminBooktypeTableAdapter ta_book = new AdminBooktypeTableAdapter();
                        DataTable dt_book = ta_book.GetAdminBooktypeByName(name);
                        price = Convert.ToInt32(dt_book.Rows[0]["price"]);
                        int buycount = Convert.ToInt32(txtBuycount.Value);
                        int allprice = price * buycount;
                        lbl_allprice.Text = allprice.ToString();
                        int day = buycount;
                        int book_type = Convert.ToInt32(rbl_menu.SelectedItem.Value);

                        //通过insertbill数据来表明账单已经产生
                        BillTableAdapter ta_bill = new BillTableAdapter();
                        ta_bill.InsertBill(DateTime.Now.ToString(), day, allprice, 1, corporationid);
                        DataTable dt_bill = ta_bill.GetCurrentBill();
                        //bill_id是在企业中显示他们买了哪些目录，以便显示出他们拥有的目录
                        int bill_id = Convert.ToInt32(dt_bill.Rows[0]["id"]);
                        sql = "insert into Billtype (bill_id,abooktype_id) values (" + bill_id + "," + book_type + ")";
                        connect.ExecuteSql(sql);

                        string book_path = "corporation/upload/" + corporation.name;
                        /*购买了目录，那么目录就会全部移植到cbooktype和cbook，cbt中*/

                        //开始进行booktype表的转移
                        a[i] = Convert.ToInt32(rbl_menu.SelectedItem.Value);
                        //递归来进行booktype的转移
                        MoveMenu(a[i]);
                        //得到a数组中保存的booktype的id，全部insert到子公司目录中
                        int j = 0;
                        while (j <= i)
                        {
                            sql = "insert into CorpoBooktype (abooktype_id,name,price,parent_id,corporation_id) select id,name,price,parent_id," + corporationid + " as corporation_id from AdminBooktype where id=" + a[j];
                            connect.ExecuteSql(sql);
                            j++;
                        }

                        //开始进行book表的转移
                        int k = 0;
                        int n = -1;
                        int q = 0;
                        while (k <= i)
                        {
                            AdminBookTableAdapter ta_admin = new AdminBookTableAdapter();
                            DataTable dt_admin = ta_admin.GetBookByBooktypeId(a[k]);
                            if (dt_admin.Rows.Count > 0)
                            {
                                for (q = 0; q < dt_admin.Rows.Count; q++)
                                {
                                    ++n;
                                    book[n] = dt_admin.Rows[q]["url"].ToString();
                                    string[] split = book[n].Split(new[] { "/" }, StringSplitOptions.RemoveEmptyEntries);
                                    cbook[n] = book_path + "/" + split[3];
                                }
                            }
                            ++k;
                        }

                        k = 0;
                        while (k <= n)
                        {
                            sql = "insert into CorpoBook (abook_id,corporation_id,name,url,star,author,keyword,score,filetype) "
                                + "select id," + corporationid + " as corporation_id,name,'" + cbook[k] + "' as book_path,star,author,keyword,score,filetype FROM AdminBook inner join AdminBT on AdminBT.abook_id = AdminBook.id "
                                + " where AdminBook.url='" + book[k] + "'";
                            connect.ExecuteSql(sql);
                            ++k;
                        }

                        //开始进行bt表的转移
                        int m = 0;
                        while (m <= i)
                        {
                            sql = "insert into CorpoBT (cbook_id,cbooktype_id,corporation_id) select abook_id,abooktype_id," + corporationid + " as corporation_id from AdminBT where abooktype_id = "
                                + a[m];
                            connect.ExecuteSql(sql);
                            m++;
                        }

                        Response.Write("<script language='javascript'>alert('购买成功,可进入订单列表查看');</script>");
                    }
                    else
                    {
                        Response.Write("<script language='javascript'>alert('未选定目录');</script>");
                    }
                }
            }
        }

        protected void MoveMenu(int parent_id)
        {
            AdminBooktypeTableAdapter ta_booktype = new AdminBooktypeTableAdapter();
            DataTable dt_booktype = ta_booktype.GetTypeByParentId(parent_id);

            int j = 0;
            while (dt_booktype.Rows.Count > j)
            {
                ++i;
                a[i] = Convert.ToInt32(dt_booktype.Rows[j]["id"]);

                ++j;
                MoveMenu(a[i]);
            }
        }

    }
}