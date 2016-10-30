using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DocMS.Models.DataSetTableAdapters;

namespace DocMS.user
{
    public partial class alterinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["user"];
            if (Session["user"] == null)
                Response.Redirect("../index.aspx");
            else if (!IsPostBack)
            {
                UserTableAdapter ta_user = new UserTableAdapter();

                ((TextBox)FindControl("txt_email")).Text = user.email;
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            User user = (User)Session["user"];
            UserTableAdapter ta_user = new UserTableAdapter();
            CorporationTableAdapter ta_corporation = new CorporationTableAdapter();

            if (txt_oldpassword.Text != user.password)
            {
                lab_tip.Text = "旧密码输入错误";
                txt_oldpassword.Focus();
            }
            else if (txt_newpassword.Text.Length < 6)
            {
                lab_tip.Text = "密码长度不小于六位";
                txt_newpassword.Focus();
            }
            else if (txt_email.Text.Equals(""))
            {
                lab_tip.Text = "请输入邮箱";
                txt_email.Focus();
            }
            else
            {
                ta_user.UpdateUserByEmail(user.name, txt_newpassword.Text, txt_email.Text, user.id);
                Response.Write("<script>alert('更新成功,请前往主页登录。'); window,location.href='../index.aspx';</script>");
            }
        }
    }
}