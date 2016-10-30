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
    public partial class corporation_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            CorporationTableAdapter ta_corporation = new CorporationTableAdapter();
            DataTable dt_corporation = ta_corporation.GetUserByName(txt_name.Text);

            if (dt_corporation.Rows.Count > 0)
            {
                Corporation corporation = new Corporation();
                corporation.id = Convert.ToInt32(dt_corporation.Rows[0]["id"]);
                corporation.name = (dt_corporation.Rows[0]["name"]).ToString();
                corporation.password = dt_corporation.Rows[0]["password"].ToString();
                if (corporation.password.Equals(txt_psw.Text))
                {
                    Session["corporation"] = corporation;
                    Response.Redirect("corporation/corporation_index.aspx");
                }
                else
                    lab_tip.Text = "用户账户名或密码错误";
            }
            else
                lab_tip.Text = "用户账户名或密码错误";
        }
    }
}