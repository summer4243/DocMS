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
    public partial class user_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Corporation corporation = (Corporation)Session["corporation"];
            if (Session["corporation"] == null)
                Response.Redirect("../corporation_login.aspx");
            else if (!IsPostBack)
            {
                ValueInit();
            }
        }

        protected void ValueInit()
        {
            Corporation corporation = (Corporation)Session["corporation"];
            UserTableAdapter ta_user = new UserTableAdapter();
            DataTable dt_user = ta_user.GetUserByCorId(corporation.id);
            rep_userlist.DataSource = dt_user;
            rep_userlist.DataBind();
        }

        protected void rep_userlist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("delete"))
            {
                UserTableAdapter ta_user = new UserTableAdapter();
                ta_user.DeleteUserById(Convert.ToInt32(e.CommandArgument));
                ValueInit();
            }
            if (e.CommandName.Equals("update"))
            {
                Response.Redirect("user_alterpassword.aspx?id=" + e.CommandArgument);
            }
        }
    }
}