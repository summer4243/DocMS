using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DocMS.admin
{
    public partial class dwgviewer : System.Web.UI.Page
    {
        public string dwg_path;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../index.aspx");
            }
            else
            {
                dwg_path = Request["name"].ToString();
                dwg_path = "~/admin/upload/bookfile/" + dwg_path;
            }
        }
    }
}