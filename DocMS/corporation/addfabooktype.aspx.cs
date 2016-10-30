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
    public partial class addfabooktype : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Corporation corporation = (Corporation)Session["corporation"];
            if (Session["corporation"] == null)
                Response.Redirect("../corporation_login.aspx");
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            Corporation corporation = (Corporation)Session["corporation"];
            CorSelfBooktypeTableAdapter ta_fabooktype = new CorSelfBooktypeTableAdapter();
            DataTable dt_fabooktype = ta_fabooktype.GetSelfBooktypeByName(txt_name.Text, corporation.id);
            if (dt_fabooktype.Rows.Count != 0)
                lab_tip.Text = "目录名已存在";
            else
            {
                ta_fabooktype.InsertSelfFBooktype(txt_name.Text, Convert.ToInt32(txt_price.Text), 0, corporation.id);
                lab_tip.Text = "添加成功";
            }
        }
    }
}