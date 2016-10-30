using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DocMS.user
{
    public partial class dwgviewer : System.Web.UI.Page
    {
        public string dwg_path;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("../index.aspx");
            }
            else
            {
                User user = (User)Session["user"];
                dwg_path = Request["name"].ToString();
                dwg_path = "~/corporation/upload/" + user.corporation_name + "/" + dwg_path;
            }
        }
    }
}