<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_login.aspx.cs" Inherits="DocMS.admin_login" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>登录</title>
    <link rel="shortcut icon" href="image/favicon.ico" />
    <link rel="stylesheet" href="libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <form id="Form1" runat="server">
        <div class="container">
            <div id="header" class="row">
                <div id="topnav" class="col-xs-12">
                    <h3 style="text-align: center;">书籍管理系统登录</h3>
                    <ul class="nav nav-tabs">
                        <li><a href="index.aspx">用户登录</a></li>
                        <li><a href="corporation_login.aspx">企业登录</a></li>
                        <li class="active"><a>管理员登录</a></li>
                    </ul>
                </div>
            </div>
            <div id="div_main" class="row" runat="server" style="margin: 0 auto; margin-top: 10px;">
                <div id="loginbox">
                    <asp:TextBox ID="txt_name" runat="server" class="form-control" placeholder="用户帐户"></asp:TextBox>
                    <asp:TextBox ID="txt_psw" runat="server" class="form-control" placeholder="账户密码" TextMode="Password"></asp:TextBox>
                    <asp:Button ID="btn_login" runat="server" Text="登录" class="btn btn-info btn-block" OnClick="btn_login_Click" />
                    <asp:Label ID="lab_tip" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row" id="footer">
                <p>文档管理系统</p>
            </div>
        </div>
        <script type="text/javascript" src="libs/jquery/jquery.js"></script>
        <script type="text/javascript" src="libs/bootstrap/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
