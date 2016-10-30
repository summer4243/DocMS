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
    public partial class user_alterpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Corporation corporation = (Corporation)Session["corporation"];
            if (corporation == null)
                Response.Redirect("../corporation_login.aspx");
            if (Request["id"] != null)
            {
                UserTableAdapter ta_user = new UserTableAdapter();
                DataTable dt_user = ta_user.GetUserById(Convert.ToInt32(Request["id"]));
                if (dt_user.Rows.Count > 0 && !IsPostBack)
                {
                    txt_name.Text = dt_user.Rows[0]["name"].ToString();
                    txt_psw.Focus();
                }
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            UserTableAdapter ta_user = new UserTableAdapter();
            DataTable dt_user = ta_user.GetUserByName(txt_name.Text);
            if (dt_user.Rows.Count <= 0)
                lab_tip.Text = "不存在的管理员帐户";
            else
            {
                int id = Convert.ToInt32(ta_user.GetUserByName(txt_name.Text).Rows[0]["id"]);
                int type = Convert.ToInt32(ta_user.GetUserByName(txt_name.Text).Rows[0]["type"]);
                ta_user.UpdateUser(txt_name.Text, txt_psw.Text, id);
                lab_tip.Text = "修改密码成功<script>alert('修改密码成功');</script>";
            }
        }
    }
}