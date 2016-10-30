using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DocMS.Models.DataSetTableAdapters;
using DocMS.Models.DataSet_AddTableAdapters;

namespace DocMS.user
{
    public partial class recommend : System.Web.UI.Page
    {
        public string bookname;
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["user"];
            Connect connect = new Connect();

            if (Session["user"] == null)
                Response.Redirect("../index.aspx");
            else
            {
                AdminBook adminbook = (AdminBook)Session["adminbook"];
                bookname = adminbook.name;
                if (!IsPostBack)
                {
                    string sql = "SELECT distinct dbo.[Group].id,dbo.[Group].boss_name,dbo.[Group].name FROM dbo.[Group] INNER JOIN dbo.UG ON dbo.UG.gid = dbo.[Group].id " +
                        "INNER JOIN dbo.[User] ON dbo.UG.user_id = dbo.[User].id " +
                        "WHERE dbo.[Group].boss_name='" + user.name + "' OR dbo.[User].name='" + user.name + "'";
                    DataSet dsGroup = new DataSet();
                    connect.FillDataSet(dsGroup, sql, "[Group]");
                    rbl_group.DataSource = dsGroup;
                    rbl_group.DataTextField = "name";
                    rbl_group.DataValueField = "id";
                    rbl_group.DataBind();
                }
            }
        }

        protected void btn_confirm_Click(object sender, EventArgs e)
        {
            if (rbl_group.SelectedItem == null)
            {
                Response.Write("<script language='javascript'>alert('推荐失败，未选中任何想要推荐的小组');</script>");
                lab_tip.Text = "未选中任何想要分享推荐的小组";
            }
            else
            {
                int group_id = Convert.ToInt32(rbl_group.SelectedItem.Value);
                User user = (User)Session["user"];
                AdminBook adminbook = (AdminBook)Session["adminbook"];
                RecommendTableAdapter ta_recommend = new RecommendTableAdapter();
                DataTable dt_recommend = ta_recommend.GetRecoByNameGroup(adminbook.name, group_id);
                if (dt_recommend.Rows.Count > 0)
                {
                    Response.Write("<script language='javascript'>alert('推荐失败，要推荐的内容在想推荐的组中已存在');</script>");
                    lab_tip.Text = "要推荐的内容在想推荐的组中已存在";
                }
                else
                {
                    ta_recommend.InsertRecommend(adminbook.name, adminbook.url, adminbook.star, adminbook.author, adminbook.keyword, adminbook.score, adminbook.filetype,
                        group_id, user.name);
                    Response.Write("<script language='javascript'>alert('推荐成功');</script>");
                    lab_tip.Text = "推荐成功";
                }
            }
        }
    }
}