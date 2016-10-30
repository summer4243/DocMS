using System;
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

namespace DocMS.user
{
    public partial class corporation_selfbook : System.Web.UI.Page
    {
        string name;
        int[] book_parent = new int[1000];
        int parent_num = 0;
        public string url;
        public AdminBook adminbook = new AdminBook();

        public string FileURL
        {
            get;
            set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["user"];

            if (Session["user"] == null)
                Response.Redirect("../index.aspx");
            else
            {
                url = "corporation/upload/" + user.corporation_name + "/";
                if (!IsPostBack)
                {
                    AddTree(0, null);
                    content.Visible = false;
                    selectbook.Visible = true;
                    addinfo.Visible = false;
                }
                if (this.tree.SelectedNode != null)
                {
                    lbl_selectednode.Text = this.tree.SelectedNode.Text;
                    Boolean b1 = lbl_selectednode.Text.EndsWith(".doc");
                    Boolean b2 = lbl_selectednode.Text.EndsWith(".pdf");
                    Boolean b3 = lbl_selectednode.Text.EndsWith(".txt");
                    Boolean b4 = lbl_selectednode.Text.EndsWith(".ppt");
                    Boolean b5 = lbl_selectednode.Text.EndsWith(".cad");

                    if (b1 || b2 || b3 || b4 || b5)
                    {

                    }
                    else
                    {
                        content.Visible = false;
                        selectbook.Visible = true;
                        addinfo.Visible = false;

                        DataTable dt_allbook = null;
                        DataTable dt_branchbook = null;

                        //开始控制selectbook中的显示
                        int tree_id = Convert.ToInt32(this.tree.SelectedNode.Value);
                        CorSelfBooktypeTableAdapter ta_corSelf = new CorSelfBooktypeTableAdapter();
                        DataTable dt_corpo = ta_corSelf.GetSelfBooktypeByTwoId(tree_id, user.corporation_id);
                        int tree_parentid = Convert.ToInt32(dt_corpo.Rows[0]["parent_id"]);
                        if (tree_parentid > 0)
                        {
                            //由此在book_parent[]中获得选定的目录下面有书籍的目录id
                            getson(Convert.ToInt32(dt_corpo.Rows[0]["id"]), user.corporation_id);

                            Connect connect = new Connect();
                            for (int m = 0; m < parent_num; m++)
                            {
                                string sql_temp = "SELECT dbo.CorSelfBook.id, dbo.CorSelfBook.name, dbo.CorSelfBT.booktype_id AS parent_id,dbo.CorSelfBook.star,dbo.CorSelfBook.url," +
                                    "dbo.CorSelfBook.author,dbo.CorSelfBook.corporation_id,dbo.CorSelfBook.keyword,dbo.CorSelfBook.score,dbo.CorSelfBook.filetype " +
                                    "FROM CorSelfBook INNER JOIN CorSelfBT ON CorSelfBT.book_id = CorSelfBook.id " +
                                    "INNER JOIN CorSelfBooktype ON CorSelfBT.booktype_id = CorSelfBooktype.id AND CorSelfBooktype.corporation_id = CorSelfBook.corporation_id " +
                                    "WHERE (CorSelfBook.corporation_id = " + user.corporation_id + ") AND (CorSelfBT.booktype_id = " + book_parent[m] + ")";
                                if (m == 0)
                                {
                                    dt_allbook = connect.GetDataTable(sql_temp);
                                }
                                else
                                {
                                    dt_branchbook = connect.GetDataTable(sql_temp);
                                    dt_allbook.Merge(dt_branchbook);
                                }
                            }
                            if (rbl_score.SelectedItem == null)
                            {
                                dt_allbook.DefaultView.Sort = "name Asc";
                            }
                            else
                            {
                                if (Convert.ToInt32(rbl_score.SelectedItem.Value) == 0)
                                {
                                    dt_allbook.DefaultView.Sort = "star Desc";
                                }
                                if (Convert.ToInt32(rbl_score.SelectedItem.Value) == 1)
                                {
                                    dt_allbook.DefaultView.Sort = "score Asc";
                                }
                                if (Convert.ToInt32(rbl_score.SelectedItem.Value) == 2)
                                {
                                    dt_allbook.DefaultView.Sort = "name Asc";
                                }
                            }

                            lab_count.Text = dt_allbook.Rows.Count.ToString();
                            rep_booklist.DataSource = dt_allbook;
                            rep_booklist.DataBind();
                        }
                    }
                }
            }
        }

        private void getson(int parent_id, int corporation_id)
        {
            Connect connect = new Connect();
            string sql = "SELECT CorSelfBooktype.id,CorSelfBooktype.name,CorSelfBooktype.parent_id FROM CorSelfBooktype " +
               " WHERE (dbo.CorSelfBooktype.corporation_id =" + corporation_id + ") AND (dbo.CorSelfBooktype.parent_id =" + parent_id + ")";
            DataTable dt_menu = connect.GetDataTable(sql);
            string sql_book = "SELECT dbo.CorSelfBT.booktype_id,dbo.CorSelfBT.corporation_id,dbo.CorSelfBT.book_id " +
                    "FROM dbo.CorSelfBT WHERE booktype_id = " + parent_id + " AND corporation_id = " + corporation_id;
            DataTable dt_book = connect.GetDataTable(sql_book);

            if ((dt_book.Rows.Count > 0))
            {
                book_parent[parent_num] = parent_id;
                ++parent_num;
                //这里我们得加一个判断，如果这个东西下面还有目录还有书籍，我们就再处理

                if (dt_menu.Rows.Count > 0)
                {
                    for (int i = 0; i < dt_menu.Rows.Count; i++)
                    {
                        getson(Convert.ToInt32(dt_menu.Rows[i]["id"]), corporation_id);
                    }
                }
            }
            else
            {
                for (int i = 0; i < dt_menu.Rows.Count; i++)
                {
                    getson(Convert.ToInt32(dt_menu.Rows[i]["id"]), corporation_id);
                }
            }
        }

        protected void rep_booklist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("read"))
            {
                lbl_selectednode.Text = e.CommandArgument.ToString();

                url = url + lbl_selectednode.Text;
                User user = (User)Session["user"];
                if (lbl_selectednode.Text != null)
                {
                    Boolean b1 = lbl_selectednode.Text.EndsWith(".doc");
                    Boolean b2 = lbl_selectednode.Text.EndsWith(".pdf");
                    Boolean b3 = lbl_selectednode.Text.EndsWith(".txt");
                    Boolean b4 = lbl_selectednode.Text.EndsWith(".ppt");
                    Boolean b5 = lbl_selectednode.Text.EndsWith(".cad");

                    if (b1 || b2 || b3 || b4 || b5)
                    {
                        //在此控制两个div是否显示
                        selectbook.Visible = false;
                        content.Visible = true;
                        addinfo.Visible = true;

                        string bookName = lbl_selectednode.Text;
                        adminbook.name = bookName;
                        CorSelfBookTableAdapter ta_adminbook = new CorSelfBookTableAdapter();
                        DataTable dt_adminbook = ta_adminbook.GetSelfBookByNameCorId(bookName, user.corporation_id);
                        adminbook.id = Convert.ToInt32(dt_adminbook.Rows[0]["id"]);
                        adminbook.author = dt_adminbook.Rows[0]["author"].ToString();
                        adminbook.keyword = dt_adminbook.Rows[0]["keyword"].ToString();
                        adminbook.score = Convert.ToInt32(dt_adminbook.Rows[0]["score"].ToString());
                        adminbook.star = Convert.ToInt32(dt_adminbook.Rows[0]["star"].ToString());
                        adminbook.booktype = dt_adminbook.Rows[0]["booktype"].ToString();
                        lab_tip.Text = "";

                        /*因为数据库不想设计得太复杂，我就不记录自家书籍的浏览记录了*/
                        //添加历史阅读记录
                        //CorVisitRecordTableAdapter ta_record = new CorVisitRecordTableAdapter();
                        //ta_record.InsertCorVisitRecord(DateTime.Now, 1, null, corporation.id, adminbook.id);

                        //实现阅读书籍功能
                        string addpath = HttpContext.Current.Server.MapPath("~/swf\\") + bookName.Substring(0, bookName.LastIndexOf(".")) + ".swf";
                        if (!File.Exists(addpath))
                        {
                            string cbook_path;
                            cbook_path = "~/corporation/upload/" + user.corporation_name + "\\";
                            string fileName = lbl_selectednode.Text.ToString();
                            string fileExtention = fileName.Substring(fileName.LastIndexOf(".") + 1);
                            string pdfFileName;
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
                    }
                }
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            if (ddl_test.SelectedValue == "企业购买")
            {
                Response.Redirect("result_corporation.aspx?search=" + txt_search.Text);
            }
            if (ddl_test.SelectedValue == "企业自建")
            {
                Response.Redirect("result_selfcorporation.aspx?search=" + txt_search.Text);
            }
        }

        protected void btn_alterinfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("alterinfo.aspx");
        }

        protected void Select_Change(Object sender, EventArgs e)
        {

            lbl_selectednode.Text = this.tree.SelectedNode.Text;
            url = url + lbl_selectednode.Text;
            if (lbl_selectednode.Text != null)
            {
                Boolean b1 = lbl_selectednode.Text.EndsWith(".doc");
                Boolean b2 = lbl_selectednode.Text.EndsWith(".pdf");
                Boolean b3 = lbl_selectednode.Text.EndsWith(".txt");
                Boolean b4 = lbl_selectednode.Text.EndsWith(".ppt");
                Boolean b5 = lbl_selectednode.Text.EndsWith(".cad");

                if (b1 || b2 || b3 || b4 || b5)
                {
                    //在此控制两个div是否显示
                    selectbook.Visible = false;
                    content.Visible = true;
                    addinfo.Visible = true;

                    User user = (User)Session["user"];
                    string bookName = lbl_selectednode.Text;
                    adminbook.name = bookName;
                    CorSelfBookTableAdapter ta_adminbook = new CorSelfBookTableAdapter();
                    DataTable dt_adminbook = ta_adminbook.GetSelfBookByNameCorId(bookName, user.corporation_id);
                    adminbook.id = Convert.ToInt32(dt_adminbook.Rows[0]["id"]);
                    adminbook.author = dt_adminbook.Rows[0]["author"].ToString();
                    adminbook.keyword = dt_adminbook.Rows[0]["keyword"].ToString();
                    adminbook.score = Convert.ToInt32(dt_adminbook.Rows[0]["score"].ToString());
                    adminbook.star = Convert.ToInt32(dt_adminbook.Rows[0]["star"].ToString());
                    adminbook.booktype = dt_adminbook.Rows[0]["booktype"].ToString();
                    lab_tip.Text = "";

                    /*因为数据库不想设计得太复杂，我就不记录自家书籍的浏览记录了*/
                    //添加历史阅读记录
                    //CorVisitRecordTableAdapter ta_record = new CorVisitRecordTableAdapter();
                    //ta_record.InsertCorVisitRecord(DateTime.Now, 1, null, corporation.id, adminbook.id);

                    //实现阅读书籍功能
                    string addpath = HttpContext.Current.Server.MapPath("~/swf\\") + bookName.Substring(0, bookName.LastIndexOf(".")) + ".swf";
                    if (!File.Exists(addpath))
                    {
                        string cbook_path;
                        cbook_path = "~/corporation/upload/" + user.corporation_name + "\\";
                        string fileName = lbl_selectednode.Text.ToString();
                        string fileExtention = fileName.Substring(fileName.LastIndexOf(".") + 1);
                        string pdfFileName;
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

                }
                else
                {
                    //本应该在这里进行如果是选中的是目录的话，我们就进行将目录下的书进行显示这一功能，但是我们在
                    //page_load那里已经实现了
                }
            }
            else
            {
                lab_tip.Text = "未选中书籍";
            }
        }

        private void AddTree(int Pid, TreeNode PNode)
        {
            User user = (User)Session["user"];
            CorSelfBooktypeTableAdapter ta_fatype = new CorSelfBooktypeTableAdapter();
            CorpoBookTableAdapter ta_book = new CorpoBookTableAdapter();


            Connect connect = new Connect();
            string sql = "SELECT CorSelfBooktype.id,CorSelfBooktype.name,CorSelfBooktype.parent_id FROM CorSelfBooktype " +
               " WHERE dbo.CorSelfBooktype.corporation_id =" + user.corporation_id;
            DataTable dt_fa = connect.GetDataTable(sql);
            dt_fa = connect.GetDataTable(sql);
            sql = "SELECT (CorSelfBook.id-100000) AS id,CorSelfBook.name,CorSelfBT.booktype_id AS parent_id " +
                   "FROM CorSelfBook INNER JOIN CorSelfBT ON CorSelfBT.book_id = CorSelfBook.id AND CorSelfBT.corporation_id=CorSelfBook.corporation_id " +
                    "INNER JOIN CorSelfBooktype ON CorSelfBT.booktype_id = CorSelfBooktype.id AND CorSelfBooktype.corporation_id=CorSelfBook.corporation_id " +
                    "WHERE CorSelfBook.corporation_id = " + user.corporation_id;
            DataTable dt_book = connect.GetDataTable(sql);

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