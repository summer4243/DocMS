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
    public partial class admininfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Admin admin = (Admin)Session["admin"];
            if (admin == null)
                Response.Redirect("adminlogin.aspx");
            else if (admin.type == 2)
                div_main.InnerHtml = "<br><div class='alert alert-danger' role='alert'>非创建者类型管理员无法对管理员进行操作，请联系网站Admin。</div>";
            if (Request["id"] != null)
            {
                AdminTableAdapter ta_admin = new AdminTableAdapter();
                DataTable dt_admin = ta_admin.GetAdminById(Convert.ToInt32(Request["id"]));
                if (dt_admin.Rows.Count > 0 && !IsPostBack)
                {
                    txt_name.Text = dt_admin.Rows[0]["name"].ToString();
                    txt_psw.Focus();
                }
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            AdminTableAdapter ta_admin = new AdminTableAdapter();
            DataTable dt_admin = ta_admin.GetAdminByName(txt_name.Text);         
            if (dt_admin.Rows.Count <= 0)
                lab_tip.Text = "不存在的管理员帐户";
            else
            {
                int id = Convert.ToInt32(ta_admin.GetAdminByName(txt_name.Text).Rows[0]["id"]);
                int type = Convert.ToInt32(ta_admin.GetAdminByName(txt_name.Text).Rows[0]["type"]);
                ta_admin.UpdateAdmin(txt_name.Text, txt_psw.Text, type, id);
                lab_tip.Text = "修改密码成功<script>alert('修改密码成功');</script>";
            }
        }
    }
}