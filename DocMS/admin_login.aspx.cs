using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DocMS.Models.DataSetTableAdapters;

namespace DocMS
{
    public partial class admin_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            AdminTableAdapter ta_admin = new AdminTableAdapter();
            DataTable dt_admin = ta_admin.GetAdminByName(txt_name.Text);

            if (dt_admin.Rows.Count > 0)
            {
                Admin admin = new Admin();
                admin.id = Convert.ToInt32(dt_admin.Rows[0]["id"]);
                admin.name = (dt_admin.Rows[0]["name"]).ToString();
                admin.password = dt_admin.Rows[0]["password"].ToString();
                admin.type = Convert.ToInt32(dt_admin.Rows[0]["type"]);
                if (admin.password.Equals(txt_psw.Text))
                {
                    Session["admin"] = admin;
                    Response.Redirect("admin/adminlist.aspx");
                }
                else
                    lab_tip.Text = "管理员账户名或密码错误";
            }
            else
                lab_tip.Text = "管理员账户名或密码错误";
        }
    }
}