﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DocMS.Models.DataSetTableAdapters;
using System.Diagnostics;
using Word = Microsoft.Office.Interop.Word;
using Excel = Microsoft.Office.Interop.Excel;
using PowerPoint = Microsoft.Office.Interop.PowerPoint;
using Microsoft.Office.Core;
using System.IO;

namespace DocMS.admin
{
    public partial class readbook : System.Web.UI.Page
    {
        string name;
        protected void Page_Load(object sender, EventArgs e)
        {
            Admin admin = (Admin)Session["admin"];
           
            if (Session["admin"] == null)
                Response.Redirect("adminlogin.aspx");
            else
            {
                if (admin.type == 2)
                {
                    div_main.InnerHtml = "<br><div class='alert alert-danger' role='alert'>非创建者类型管理员无法对管理员进行操作，请联系网站Admin。</div>";
                }
                else
                {
                    if (!IsPostBack)
                    {
                        AddTree(0, null);
                    }
                }
            }
        }

        protected void Select_Change(Object sender, EventArgs e)
        {

            lbl_selectednode.Text = this.tree.SelectedNode.Text;
        }

        private void AddTree(int Pid, TreeNode PNode)
        {
            AdminBooktypeTableAdapter ta_fatype = new AdminBooktypeTableAdapter();
            AdminBookTableAdapter ta_book = new AdminBookTableAdapter();
            DataTable dt_fa = ta_fatype.GetAdminMenuBooktype();
            DataTable dt_book = ta_book.GetMenuBook();

            dt_fa.Merge(dt_book);
            if (dt_fa.Rows.Count > 0)
            {
                DataView dv = new DataView(dt_fa);
                //过滤ParentID,得到当前的所有子节点 ParentID为父节点ID
                dv.RowFilter = "[parent_id] = " + Pid;
                //循环递归
                foreach (DataRowView Row in dv)
                {
                    //声明节点
                    TreeNode Node = new TreeNode();
                    //绑定超级链接
                    //Node.NavigateUrl = String.Format("javascript:show('{0}')", Row["name"].ToString());
                    //开始递归
                    if (PNode == null)
                    {
                        //添加根节点
                        Node.Text = Row["name"].ToString();
                        Node.Value = Row["id"].ToString();
                        name = Node.Text;
                        tree.Nodes.Add(Node);
                        Node.Expanded = false; //节点状态收缩
                        AddTree(Int32.Parse(Row["id"].ToString()), Node);    //再次递归
                    }
                    else
                    {
                        //添加当前节点的子节点
                        Node.Text = Row["name"].ToString();
                        Node.Value = Row["id"].ToString();
                        name = Node.Text;
                        PNode.ChildNodes.Add(Node);
                        Node.Expanded = false; //节点状态收缩
                        AddTree(Int32.Parse(Row["id"].ToString()), Node);     //再次递归
                    }
                }
            }
        }

        protected void btn_read_Click(object sender, EventArgs e)
        {
            if (this.tree.SelectedNode == null)
            {
                lab_tip.Text = "<script>alert('没有选中目录项'); window.location.href='addbook.aspx'</script>";
            }
            if (true)
            {
                string fileName = lbl_selectednode.Text.ToString();
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
                { "doc", "ppt", "xls", "docx","html","dwg" }; //允许上传的文件格式
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
                    string admin_bookpath = HttpContext.Current.Server.MapPath("~/admin/upload/bookfile\\") + fileName;
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

                    string admin_bookpath = HttpContext.Current.Server.MapPath("~/admin/upload/bookfile\\") + fileName;
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

                Response.Redirect("../viewer.aspx?id=" + HttpUtility.HtmlEncode(fileName.Substring(0, fileName.LastIndexOf(".")) + ".swf"));
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
