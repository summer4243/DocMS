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
    public partial class user_viewer : System.Web.UI.Page
    {
        public string FileURL
        {
            get;
            set;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                FileURL = Request.QueryString["id"].ToString();
            }
            if (Session["user"] != null)
            {

            }
        }
    }
}