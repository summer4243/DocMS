using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DocMS.Models.DataSet_AddTableAdapters;

namespace DocMS.user
{
    public partial class news : System.Web.UI.Page
    {
        public string user_name;
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["user"];
            if (Session["user"] == null)
                Response.Redirect("../index.aspx");
            else
            {
                if (!IsPostBack)
                {
                    user_name = user.name;
                    ValueInit();
                }
            }
        }

        private void ValueInit()
        {
            User user = (User)Session["user"];
            Connect connect = new Connect();
            string sql_invite = "SELECT dbo.Invite.id,dbo.Invite.inviter,dbo.Invite.type,dbo.Invite.user_id,dbo.Invite.group_id,dbo.[Group].name AS group_name,dbo.[Group].boss_name " +
                    "FROM dbo.Invite INNER JOIN dbo.[Group] ON dbo.Invite.group_id = dbo.[Group].id WHERE (dbo.Invite.type=0) AND (dbo.Invite.user_id=" + user.id + ") Order By id Desc";
            DataTable dt_invite = connect.GetDataTable(sql_invite);
            rep_invitelist.DataSource = dt_invite;
            rep_invitelist.DataBind();
        }

        protected void rep_invitelist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("agree"))
            {
                //当同意的时候，我们要让这个人加入组，在group和UG两个页面添加数据，在invite中删除数据
                User user = (User)Session["user"];

                InviteTableAdapter ta_invite = new InviteTableAdapter();
                DataTable dt_invite = ta_invite.GetInviteById(Convert.ToInt32(e.CommandArgument));
                int group_id = Convert.ToInt32(dt_invite.Rows[0]["group_id"]);
                string sql_insertUG = "INSERT INTO dbo.UG VALUES (" + user.id + "," + group_id + ")";

                ta_invite.DeleteInviteById(Convert.ToInt32(e.CommandArgument));
                ValueInit();
            }
            if (e.CommandName.Equals("ignore"))
            {
                InviteTableAdapter ta_invite = new InviteTableAdapter();
                ta_invite.UpdateInviteByTypeId(-1, Convert.ToInt32(e.CommandArgument));
                ValueInit();
            }
        }
    }
}