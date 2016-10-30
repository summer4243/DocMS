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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_login_Click(object sender, EventArgs e)
        {
            UserTableAdapter ta_user = new UserTableAdapter();
            DataTable dt_user = ta_user.GetUserByName(txt_name.Text);

            if (dt_user.Rows.Count > 0)
            {
                User user = new User();
                user.id = Convert.ToInt32(dt_user.Rows[0]["id"]);
                user.name = (dt_user.Rows[0]["name"]).ToString();
                user.password = dt_user.Rows[0]["password"].ToString();
                user.authority = Convert.ToInt32(dt_user.Rows[0]["authority"]);
                user.email = dt_user.Rows[0]["email"].ToString();
                user.corporation_id = Convert.ToInt32(dt_user.Rows[0]["corporation_id"]);
                user.corporation_name = dt_user.Rows[0]["corporation_name"].ToString();

                if (user.password.Equals(txt_psw.Text) && user.corporation_name.Equals(txt_corporation.Text))
                {
                    Session["user"] = user;
                    Response.Redirect("user/user_index.aspx");
                }
                else
                    lab_tip.Text = "用户账户名或企业名称或密码错误";
            }
            else
                lab_tip.Text = "用户账户名或企业名称或密码错误";
        }
    }
}