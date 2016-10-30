using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DocMS.corporation
{
    public partial class dwgviewer : System.Web.UI.Page
    {
        public string dwg_path;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["corporation"] == null)
            {
                Response.Redirect("../index.aspx");
            }
            else
            {
                Corporation corporation = (Corporation)Session["corporation"];
                dwg_path = Request["name"].ToString();
                dwg_path = "~/corporation/upload/" + corporation.name + "/" + dwg_path;
            }
        }
    }
}