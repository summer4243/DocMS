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
    public partial class historylist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Corporation corporation = (Corporation)Session["corporation"];

            if (Session["corporation"] == null)
                Response.Redirect("../corporation_login.aspx");
            else if (!IsPostBack)
            {
                DataInit();

            }
        }

        private void DataInit()
        {
            AdminBookTableAdapter ta_adminbook = new AdminBookTableAdapter();

            Corporation corporation = (Corporation)Session["corporation"];
            CorVisitRecordTableAdapter ta_visit = new CorVisitRecordTableAdapter();
            DataTable dt_visit = ta_visit.GetCorVisitRecordByCorId(corporation.id, 1);
            rep_historylist.DataSource = dt_visit;
            rep_historylist.DataBind();
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            Corporation corporation = (Corporation)Session["corporation"];
            CorVisitRecordTableAdapter ta_visit = new CorVisitRecordTableAdapter();
            ta_visit.DeleteHistorylistByCorId(corporation.id, 1);
            DataInit();
        }
    }
}