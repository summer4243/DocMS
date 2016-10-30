using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DocMS.Models.DataSet_AddTableAdapters;
using DocMS.Models.DataSetTableAdapters;

namespace DocMS.user
{
    public partial class call_member : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["user"];
            if (Session["user"] == null)
                Response.Redirect("../index.aspx");
        }

        protected void btn_call_Click(object sender, EventArgs e)
        {
            if (Request["group_id"] == null)
            {
                Response.Write("<script language='javascript'>没有传来request</script>");
            }
            else
            {
                InviteTableAdapter ta_invite = new InviteTableAdapter();
                UserTableAdapter ta_user = new UserTableAdapter();
                DataTable dt_user = ta_user.GetUserByName(txt_name.Text);


                if (dt_user.Rows.Count <= 0)
                {
                    Response.Write("<script language='javascript'>alert('输入的用户名不存在本系统中')</script>");
                    lab_tip.Text = "输入的用户名不存在本系统中";
                }
                else
                {
                    User user = (User)Session["user"];
                    int group_id = Convert.ToInt32(Request["group_id"]);
                    DataTable dt_invite = ta_invite.GetInviteByUserGroup(Convert.ToInt32(dt_user.Rows[0]["id"]), group_id);

                    if (dt_invite.Rows.Count != 0)
                    {
                        Response.Write("<script language='javascript'>alert('用户已存在于想要邀请进入的群组中')</script>");
                        lab_tip.Text = "用户已存在于想要邀请进入的群组中或已邀请过不能重复邀请";
                    }
                    else
                    {
                        ta_invite.InsertInvite(user.name, 0, Convert.ToInt32(dt_user.Rows[0]["id"]), group_id);
                        Response.Write("<script language='javascript'>alert('邀请已发出');</script>");
                        lab_tip.Text = "邀请已发出";
                    }
                }
            }
        }
    }
}