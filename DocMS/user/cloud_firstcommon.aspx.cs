using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DocMS.Models.DataSet_AddTableAdapters;
using System.Diagnostics;
using Word = Microsoft.Office.Interop.Word;
using Excel = Microsoft.Office.Interop.Excel;
using PowerPoint = Microsoft.Office.Interop.PowerPoint;
using Microsoft.Office.Core;
using System.IO;

namespace DocMS.user
{
    public partial class cloud_firstcommon : System.Web.UI.Page
    {
        public string bossname = "暂空";
        public string[] group = new string[3] { "暂空", "暂空", "暂空" };
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["user"];
            Form1.Target = "_blank";

            if (Session["user"] == null)
                Response.Redirect("../index.aspx");

            else
            {
                //sql出所有组
                string sql_group = "SELECT distinct dbo.[Group].id,dbo.[Group].boss_name,dbo.[Group].name FROM dbo.[Group] INNER JOIN dbo.UG ON dbo.UG.gid = dbo.[Group].id " +
                    "INNER JOIN dbo.[User] ON dbo.UG.user_id = dbo.[User].id " +
                    "WHERE dbo.[Group].boss_name='" + user.name + "' OR dbo.[User].name='" + user.name + "' ORDER BY dbo.[Group].id ASC";
                DataTable dt_groupitems = connect.GetDataTable(sql_group);

                //当此组为空时，显示的是空或者是去创组
                if (dt_groupitems.Rows.Count <= 0)
                {
                    if (user.authority == 0)
                    {
                        btn_create.Visible = false;
                        btn_call.Visible = false;
                        btn_out.Visible = false;
                        leftnav.Visible = false;
                        boss_recommend.InnerHtml = "<br><div class='alert alert-danger' role='alert' style='width:800px;'>当前用户尚未进入任何组</div>";
                    }
                    if (user.authority == 1)
                    {
                        btn_call.Visible = false;
                        btn_out.Visible = false;
                        leftnav.Visible = false;
                        boss_recommend.InnerHtml = "<br><div class='alert alert-danger' role='alert' style='width:800px;'>当前小组尚未创建</div>";
                    }
                }
                else
                {
                    btn_create.Visible = false;
                    if (!IsPostBack)
                    {
                        //控制btn_call是否显示
                        if (user.authority == 0)
                        {
                            btn_call.Visible = false;
                        }
                        if (user.authority == 1)
                        {
                            btn_call.Visible = true;
                        }


                        //显示三个组的名称   显示当前组的所有成员
                        for (int i = 0; i < dt_groupitems.Rows.Count; i++)
                        {
                            group[i] = dt_groupitems.Rows[i]["name"].ToString();
                        }
                        if (dt_groupitems.Rows.Count >= 1)
                        {
                            //对应的是单独组
                            bossname = dt_groupitems.Rows[0]["boss_name"].ToString();
                            string sql_member = "SELECT dbo.[User].name, dbo.[User].password,dbo.[User].email,dbo.[User].authority,dbo.[User].corporation_id,dbo.UG.gid " +
                                "FROM dbo.UG INNER JOIN dbo.[User] ON dbo.UG.user_id = dbo.[User].id " +
                                "WHERE dbo.UG.gid=" + dt_groupitems.Rows[0]["id"];
                            DataTable dt_member = connect.GetDataTable(sql_member);
                            rep_memberlist.DataSource = dt_member;
                            rep_memberlist.DataBind();

                            //开始绑定rep_booklist  1.对应的是单独组  2.同时common也需要改
                            string sql_book = "SELECT dbo.Recommend.id,dbo.Recommend.url,dbo.Recommend.star,dbo.Recommend.author,dbo.Recommend.keyword,dbo.Recommend.score,dbo.Recommend.filetype,dbo.Recommend.group_id," +
                                "dbo.Recommend.reference_name,dbo.Recommend.name FROM[dbo].[Recommend] " +
                                "WHERE(dbo.Recommend.group_id= " + Convert.ToInt32(dt_groupitems.Rows[0]["id"]) + ") AND(dbo.Recommend.reference_name!= '" + dt_groupitems.Rows[0]["boss_name"].ToString() + "') ORDER BY id DESC";
                            DataTable dt_recommend = connect.GetDataTable(sql_book);
                            rep_booklist.DataSource = dt_recommend;
                            rep_booklist.DataBind();
                        }
                    }
                }
            }
        }

        protected void btn_out_Click(object sender, EventArgs e)
        {
            Response.Write("<script language='javascript'>alert('先把这个功能放着，后面再看做不做');</script>");
        }

        protected void btn_call_Click(object sender, EventArgs e)
        {
            User user = (User)Session["user"];
            string sql_group = "SELECT distinct dbo.[Group].id,dbo.[Group].boss_name,dbo.[Group].name FROM dbo.[Group] INNER JOIN dbo.UG ON dbo.UG.gid = dbo.[Group].id " +
                        "INNER JOIN dbo.[User] ON dbo.UG.user_id = dbo.[User].id " +
                        "WHERE dbo.[Group].boss_name='" + user.name + "' OR dbo.[User].name='" + user.name + "' ORDER BY dbo.[Group].id ASC";
            DataTable dt_groupitems = connect.GetDataTable(sql_group);
            if (dt_groupitems.Rows.Count >= 1)
            {
                //需要改组
                Response.Redirect("call_member.aspx?group_id=" + dt_groupitems.Rows[0]["id"].ToString());
            }
        }

        protected void btn_create_Click(object sender, EventArgs e)
        {
            Response.Redirect("create_group.aspx");
        }

        protected void rep_booklist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("read"))
            {
                if (Session["user"] == null)
                {
                    Response.Redirect("index.aspx");
                }
                else
                {
                    User user = (User)Session["user"];
                    string cbook_path;
                    string bookName = e.CommandArgument.ToString();
                    string FileURL;

                    string addpath = HttpContext.Current.Server.MapPath("~/swf\\") + bookName.Substring(0, bookName.LastIndexOf(".")) + ".swf";

                    if (!File.Exists(addpath))
                    {
                        cbook_path = "~/corporation/upload/" + user.corporation_name + "\\";
                        string fileName = e.CommandArgument.ToString();
                        string fileExtention = fileName.Substring(fileName.LastIndexOf(".") + 1);
                        string pdfFileName;

                        //添加dwg文件的个例
                        if (fileExtention == "dwg")
                        {
                            Response.Redirect("dwgviewer.aspx?name=" + fileName);
                        }

                        //判断文件名
                        bool fileOK = false;
                        String[] allowedExtensions =
                        { "doc", "ppt", "xls", "docx","html" }; //允许上传的文件格式
                        for (int i = 0; i < allowedExtensions.Length; i++)
                        {
                            if (fileExtention == allowedExtensions[i])
                            {
                                fileOK = true;
                                break;
                            }
                        }
                        if (fileOK == true)
                        {
                            string filePath = HttpContext.Current.Server.MapPath("~/attachment\\") + fileName;
                            //上传选中文件到attachment文件夹
                            string admin_bookpath = HttpContext.Current.Server.MapPath(cbook_path) + fileName;
                            if (!File.Exists(filePath))
                            {
                                FileInfo adminway = new FileInfo(admin_bookpath);
                                adminway.CopyTo(filePath);
                            }
                            //将office文件转换成PDF,保存到PDF文件夹下
                            pdfFileName = fileName.Substring(0, fileName.LastIndexOf(".")) + ".pdf";
                            string fileOutPath = HttpContext.Current.Server.MapPath("~/pdf\\") + pdfFileName;
                            ExportPdf(filePath, fileOutPath);

                        }

                        else
                        {
                            string filePath = HttpContext.Current.Server.MapPath("~/pdf\\") + fileName;

                            string admin_bookpath = HttpContext.Current.Server.MapPath(cbook_path) + fileName;
                            if (!File.Exists(filePath))
                            {
                                FileInfo adminway = new FileInfo(admin_bookpath);
                                adminway.CopyTo(filePath);
                            }

                            pdfFileName = fileName.Substring(0, fileName.LastIndexOf(".")) + ".pdf";

                        }
                        //切记，使用pdf2swf.exe 打开的文件名之间不能有空格，否则会失败
                        string cmdStr = HttpContext.Current.Server.MapPath("~/SWFTools/pdf2swf.exe");
                        string savePath = HttpContext.Current.Server.MapPath("~/pdf/");
                        string saveSWFPath = HttpContext.Current.Server.MapPath("~/SWF/");
                        //将PDF文件转换成SWF格式文件
                        //要转换的pdf文件路径
                        string sourcePath = @"""" + savePath + pdfFileName + @"""";

                        //转换之后swf文件存放的目标路径
                        string targetPath = @"""" + saveSWFPath + pdfFileName.Substring(0, pdfFileName.LastIndexOf(".")) + ".swf" + @"""";
                        //@"""" 四个双引号得到一个双引号，如果你所存放的文件所在文件夹名有空格的话，要在文件名的路径前后加上双引号，才能够成功
                        // -t 源文件的路径
                        // -s 参数化（也就是为pdf2swf.exe 执行添加一些窗外的参数(可省略)）
                        string argsStr = "  -t " + sourcePath + " -s flashversion=9 -o " + targetPath;

                        //执行pdf到swf的转换
                        ExcutedCmd(cmdStr, argsStr);
                        FileURL = fileName.Substring(0, fileName.LastIndexOf(".")) + ".swf";
                    }
                    else
                    {
                        FileURL = bookName.Substring(0, bookName.LastIndexOf(".")) + ".swf";
                    }

                    Response.Redirect("user_viewer.aspx?id=" + HttpUtility.HtmlEncode(FileURL));
                }
            }
        }

        private static void ExcutedCmd(string cmd, string args)
        {
            using (Process p = new Process())
            {
                ProcessStartInfo psi = new ProcessStartInfo(cmd, args);
                psi.WindowStyle = ProcessWindowStyle.Hidden;
                p.StartInfo = psi;
                p.Start();
                p.WaitForExit();
            }
        }

        public static bool ExportPdf(string fileName, string outputFileName)
        {
            if (string.IsNullOrEmpty(fileName) || string.IsNullOrEmpty(outputFileName))
                return false;

            if (!File.Exists(fileName))
                return false;
            string extension = Path.GetExtension(fileName);
            string formatExtension = Path.GetExtension(outputFileName);
            if (string.IsNullOrEmpty(extension) || string.IsNullOrEmpty(formatExtension))
                return false;
            if (formatExtension != ".pdf")
                return false;
            switch (extension)
            {
                case ".doc":
                    return WordExportAsPdf(fileName, outputFileName);
                case ".docx":
                    return WordExportAsPdf(fileName, outputFileName);
                case ".mht":
                    return WordExportAsPdf(fileName, outputFileName);
                case ".htm":
                    return WordExportAsPdf(fileName, outputFileName);
                case ".html":
                    return WordExportAsPdf(fileName, outputFileName);
                case ".xls":
                    return ExcelExportAsPdf(fileName, outputFileName);
                case ".xlsx":
                    return ExcelExportAsPdf(fileName, outputFileName);
                case ".ppt":
                    return PowerPointExportAsPdf(fileName, outputFileName);
                case ".pptx":
                    return PowerPointExportAsPdf(fileName, outputFileName);
                default:
                    return false;
            }
        }


        /// <summary>
        /// 转换为pdf文件，适合（.doc、.docx、.mht、.htm文件类型）
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="outputFileName"></param>
        /// <returns></returns>
        private static bool WordExportAsPdf(string fileName, string outputFileName)
        {
            bool isSucceed = false;
            Word.WdExportFormat fileFormat = Microsoft.Office.Interop.Word.WdExportFormat.wdExportFormatPDF;
            Word._Application wordApp = null;
            if (wordApp == null) wordApp = new Word.Application();
            Word._Document wordDoc = null;

            try
            {
                wordDoc = wordApp.Documents.Open(fileName);
                wordDoc.ExportAsFixedFormat(outputFileName, fileFormat);
                isSucceed = true;
            }

            finally
            {
                if (wordDoc != null)
                {
                    wordDoc.Close();
                    wordDoc = null;
                }
                if (wordApp != null)
                {
                    wordApp.Quit();
                    wordApp = null;
                }
                GC.Collect();
                GC.WaitForPendingFinalizers();
            }
            return isSucceed;
        }


        /// <summary>
        /// 转换为pdf文件，适合（.xls、.xlsx文件类型）
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="outputFileName"></param>
        /// <returns></returns>
        private static bool ExcelExportAsPdf(string fileName, string outputFileName)
        {
            bool isSucceed = false;
            Excel.XlFixedFormatType fileFormat = Microsoft.Office.Interop.Excel.XlFixedFormatType.xlTypePDF;
            Excel.Application excelApp = null;
            if (excelApp == null) excelApp = new Excel.Application();
            Excel.Workbook workBook = null;

            try
            {
                workBook = excelApp.Workbooks.Open(fileName);
                workBook.ExportAsFixedFormat(fileFormat, outputFileName);
                isSucceed = true;
            }

            finally
            {
                if (workBook != null)
                {
                    workBook.Close();
                    workBook = null;
                }
                if (excelApp != null)
                {
                    excelApp.Quit();
                    excelApp = null;
                }
                GC.Collect();
                GC.WaitForPendingFinalizers();
            }
            return isSucceed;
        }


        /// <summary>
        /// 转换为pdf文件，适合（.ppt、pptx文件类型）
        /// </summary>
        /// <param name="fileName"></param>
        /// <param name="outputFileName"></param>
        /// <returns></returns>
        private static bool PowerPointExportAsPdf(string fileName, string outputFileName)
        {
            bool isSucceed = false;
            PowerPoint.PpFixedFormatType fileFormat = PowerPoint.PpFixedFormatType.ppFixedFormatTypePDF;

            PowerPoint.Application pptxApp = null;
            if (pptxApp == null) pptxApp = new PowerPoint.Application();
            PowerPoint.Presentation presentation = null;

            try
            {
                presentation = pptxApp.Presentations.Open(fileName, MsoTriState.msoTrue, MsoTriState.msoFalse, MsoTriState.msoFalse);
                presentation.ExportAsFixedFormat(outputFileName, fileFormat);
                isSucceed = true;
            }

            finally
            {
                if (presentation != null)
                {
                    presentation.Close();
                    presentation = null;
                }
                if (pptxApp != null)
                {
                    pptxApp.Quit();
                    pptxApp = null;
                }
                GC.Collect();
                GC.WaitForPendingFinalizers();
            }
            return isSucceed;
        }
    }
}