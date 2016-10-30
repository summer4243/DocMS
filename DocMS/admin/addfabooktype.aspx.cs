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
    public partial class addfabooktype : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Admin admin = (Admin)Session["admin"];
            if (Session["admin"] == null)
                Response.Redirect("adminlogin.aspx");
            else if (admin.type == 2)
                div_main.InnerHtml = "<br><div class='alert alert-danger' role='alert'>非创建者类型管理员无法对管理员进行操作，请联系网站Admin。</div>";
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            AdminBooktypeTableAdapter ta_fabooktype = new AdminBooktypeTableAdapter();
            DataTable dt_fabooktype = ta_fabooktype.GetAdminBooktypeByName(txt_name.Text);
            if (dt_fabooktype.Rows.Count != 0)
                lab_tip.Text = "目录名已存在";
            else
            {
                ta_fabooktype.InsertAdminFBooktype(txt_name.Text, Convert.ToDouble(txt_price.Text), 0);
                lab_tip.Text = "添加成功";
            }
        }
    }
}