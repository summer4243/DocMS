<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addfabooktype.aspx.cs" Inherits="DocMS.admin.addfabooktype" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>管理员管理</title>
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
                        <li class="active"><a>添加主目录</a></li>
                        <li><a href="addsonbooktype.aspx">添加子目录</a></li>
                        <li><a href="addbook.aspx">添加书籍</a></li>
                        <li><a href="readbook.aspx">查看书籍</a></li>
                        <li style="float: right"><a href="outlogin.aspx" onclick="return confirm('确认退出');">退出管理</a></li>
                        <li style="float: right"><a href="../libs/ckfinder/ckfinder.html" target="_blank">文件管理系统</a></li>
                    </ul>
                </div>
            </div>
            <div id="div_main" class="row" runat="server" style="margin: 0 auto; margin-top: 10px;">
                <div id="fabooktype" class="col-xs-3">
                    <h3>添加主目录</h3>
                    <br>
                    <asp:TextBox ID="txt_name" runat="server" class="form-control" placeholder="主目录名"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txt_price" runat="server" class="form-control" placeholder="价格"></asp:TextBox>
                    <br />
                    <asp:Button ID="btn_add" runat="server" Text="添加" class="btn btn-info" OnClick="btn_add_Click" />
                    &nbsp;&nbsp;<asp:Label ID="lab_tip" runat="server" Text="" Style="color: Red;"></asp:Label>
                    
                </div>
            </div>
            <div class="row" id="footer">
                后台管理系统 &nbsp;&nbsp;&nbsp;&nbsp;<a href="../index.aspx" target="_blank">查看主页</a>
            </div>
        </div>
        <script type="text/javascript" src="../libs/jquery/jquery.js"></script>
        <script type="text/javascript" src="../libs/bootstrap/js/bootstrap.min.js"></script>
    </form>
</body>
</html>

