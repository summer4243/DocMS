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
    public partial class user_register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            UserTableAdapter ta_user = new UserTableAdapter();
            CorporationTableAdapter ta_corporation = new CorporationTableAdapter();

            if (txt_psw.Text.Length < 6)
            {
                lab_tip_psw.Text = "密码长度不小于六位";
            }
            else if (txt_psw2.Text.Equals(""))
            {
                lab_tip_psw2.Text = "请输入确认密码";
                txt_psw2.Focus();
            }
            else if (txt_email.Text.Equals(""))
            {
                lab_tip_email.Text = "请输入邮箱";
                txt_email.Focus();
            }
            else if (ta_user.GetUserByName(txt_name.Text).Rows.Count > 0)
            {
                lab_tip_name.Text = "该用户名已存在";
                txt_name.Focus();
            }
            else if (ta_corporation.GetUserByName(txt_corporation.Text).Rows.Count <= 0)
            {
                lab_tip_corporation.Text = "该企业不存在";
                txt_corporation.Focus();
            }
            else
            {
                int corporation_id = Convert.ToInt32(ta_corporation.GetUserByName(txt_corporation.Text).Rows[0]["id"]);
                ta_user.Insert(txt_name.Text, txt_psw.Text, txt_email.Text, 1, corporation_id);
                Response.Write("<script>alert('注册成功,请前往主页登录。'); window,location.href='../index.aspx';</script>");
            }
        }
    }
}