using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DocMS.Models.DataSetTableAdapters;
using System.IO;
using Microsoft.VisualBasic.FileIO;

namespace DocMS.corporation
{
    public partial class corporation_register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
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
            else if (ta_corporation.GetUserByName(txt_name.Text).Rows.Count > 0)
            {
                lab_tip_name.Text = "该用户名已存在";
                txt_name.Focus();
            }
            else
            {
                ta_corporation.Insert(txt_name.Text, txt_psw.Text, txt_email.Text);

                //等会儿将这个转移到corporation形成的地方
                //创建企业书籍路径并且把所有的书都转移到企业路径下
                string corporation_name = txt_name.Text;
                string book_path = "~/corporation/upload/" + corporation_name + "/";
                if (!Directory.Exists(Server.MapPath(book_path)))
                {
                    Directory.CreateDirectory(Server.MapPath(book_path));
                }
                FileSystem.CopyDirectory(Server.MapPath("~/admin/upload/bookfile/"), Server.MapPath(book_path), UIOption.AllDialogs);

                Response.Write("<script>alert('注册成功,请前往主页登录。'); window,location.href='../index.aspx';</script>");
            }
        }
    }
}