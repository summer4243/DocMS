using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DocMS.Models.DataSetTableAdapters;
using System.Data;

namespace DocMS.admin
{
    public partial class adminlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Admin admin = (Admin)Session["Admin"];
            if (Session["Admin"] == null)
                Response.Redirect("adminlogin.aspx");
            else if (admin.type == 2)
                div_main.InnerHtml = "<br><div class='alert alert-danger' role='alert'>非创建者类型管理员无法对管理员进行操作，请联系网站Admin。</div>";
            else if (!IsPostBack)
                ValueInit();
        }

        private void ValueInit()
        {
            AdminTableAdapter ta_admin = new AdminTableAdapter();
            DataTable dt_admin = ta_admin.GetAdmin();
            rep_adminlist.DataSource = dt_admin;
            rep_adminlist.DataBind();
        }

        protected void rep_adminlist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("delete"))
            {
                AdminTableAdapter ta_admin = new AdminTableAdapter();
                ta_admin.DeleteAdminById(Convert.ToInt32(e.CommandArgument));
                ValueInit();
            }
            if (e.CommandName.Equals("update"))
            {
                Response.Redirect("admininfo.aspx?id=" + e.CommandArgument);
            }
        }
    }
}