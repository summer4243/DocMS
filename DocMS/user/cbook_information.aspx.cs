using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DocMS.Models.DataSetTableAdapters;

namespace DocMS.user
{
    public partial class cbook_information : System.Web.UI.Page
    {
        public AdminBook adminbook = new AdminBook();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["bookName"] != null)
            {
                string bookName = Request.QueryString["bookName"].ToString();
                User user = (User)Session["user"];
                adminbook.name = bookName;
                CorSelfBookTableAdapter ta_adminbook = new CorSelfBookTableAdapter();
                DataTable dt_adminbook = ta_adminbook.GetSelfBookByNameCorId(bookName, user.corporation_id);
                adminbook.author = dt_adminbook.Rows[0]["author"].ToString();
                adminbook.keyword = dt_adminbook.Rows[0]["keyword"].ToString();
                adminbook.score = Convert.ToInt32(dt_adminbook.Rows[0]["score"].ToString());
                adminbook.star = Convert.ToInt32(dt_adminbook.Rows[0]["star"].ToString());
                adminbook.booktype = dt_adminbook.Rows[0]["booktype"].ToString();
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            if (ddl_test.SelectedValue == "企业购买")
            {
                Response.Redirect("result_corporation.aspx?search=" + txt_search.Text);
            }
            if (ddl_test.SelectedValue == "企业自建")
            {
                Response.Redirect("result_selfcorporation.aspx?search=" + txt_search.Text);
            }
        }

        protected void btn_alterinfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("alterinfo.aspx");
        }
    }
}