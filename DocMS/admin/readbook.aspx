<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="readbook.aspx.cs" Inherits="DocMS.admin.readbook" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>管理员管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="always" name="referrer">
    <link rel="shortcut icon" href="../image/favicon.ico" />
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>
    <form id="Form1" runat="server">
        <div class="container">
            <div id="header" class="row">
                <div id="topnav" class="col-xs-12">
                    <img id="backlogo" src="../image/backlogo.jpg" alt="logo" class="img-responsive" />
                    <ul class="nav nav-tabs">
                        <li><a href="adminlist.aspx">管理员管理</a></li>
                        <li><a href="addfabooktype.aspx">添加主目录</a></li>
                        <li><a href="addsonbooktype.aspx">添加子目录</a></li>
                        <li><a href="addbook.aspx">添加书籍</a></li>
                        <li class="active"><a>查看书籍</a></li>
                        <li style="float: right"><a href="outlogin.aspx" onclick="return confirm('确认退出');">退出管理</a></li>
                        <li style="float: right"><a href="../libs/ckfinder/ckfinder.html" target="_blank">文件管理系统</a></li>
                    </ul>
                </div>
            </div>
            <div id="div_main" class="row" runat="server" style="margin: 0 auto; margin-top: 10px;">
                <div id="bookinfo" class="col-xs-4">
                    <br>
                    <asp:TreeView ID="tree" runat="server" ExpandDepth="1" ImageSet="XPFileExplorer" LineImagesFolder="~/TreeLineImages" OnSelectedNodeChanged="Select_Change" NodeIndent="15">
                        <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                        <NodeStyle Font-Names="Tahoma" Font-Size="14px" ForeColor="Black" HorizontalPadding="2px" NodeSpacing="2px" VerticalPadding="2px" />
                        <ParentNodeStyle Font-Bold="False" />
                        <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px" VerticalPadding="0px" />
                    </asp:TreeView>
                </div>
                <div id="addinfo" class="col-xs-8">
                    <br>
                    <h4>目前选中的目标：<asp:Label ID="lbl_selectednode" runat="server" Text=""></asp:Label></h4>
                    <br>

                    <asp:Button ID="btn_read" runat="server" Text="查看此书籍" class="btn btn-info" OnClick="btn_read_Click" />
                    &nbsp;&nbsp;<asp:Label ID="lab_tip" runat="server" Text="" Style="color: Red;"></asp:Label>
                </div>
            </div>
        </div>
        <div class="row" id="footer">
            后台管理系统 &nbsp;&nbsp;&nbsp;&nbsp;<a href="../index.aspx" target="_blank">查看主页</a>
        </div>
        <script type="text/javascript" src="../libs/jquery/jquery.js"></script>
        <script type="text/javascript" src="../libs/bootstrap/js/bootstrap.min.js"></script>
    </form>
</body>
</html>

