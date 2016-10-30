<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="historylist.aspx.cs" Inherits="DocMS.corporation.historylist" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>企业成员管理</title>
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
                        <li><a href="user_list.aspx">企业成员管理</a></li>
                        <li><a href="addfabooktype.aspx">添加主目录</a></li>
                        <li><a href="addsonbooktype.aspx">添加子目录</a></li>
                        <li><a href="addbook.aspx">添加书籍</a></li>
                        <li class="active"><a>浏览记录</a></li>
                        <li style="float: right"><a href="outlogin.aspx" onclick="return confirm('确认退出');">退出管理</a></li>
                        <li style="float: right"><a href="../libs/ckfinder/ckfinder.html" target="_blank">文件管理系统</a></li>
                    </ul>
                </div>
            </div>
            <div id="div_main" class="row" runat="server" style="margin: 0 auto; margin-top: 10px;">
                <div id="div_historylistgoods" class="col-xs-8" runat="server">
                    <table class="table table-bordered table-hover">
                        <tr class="info">
                            <th>时间</th>
                            <th>地址</th>
                        </tr>
                        <asp:Repeater ID="rep_historylist" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("time")%></td>
                                    <td><a href="result_corporation.aspx?search=<%#Eval("name") %>">&nbsp;书名：<%#Eval("name") %>&nbsp&nbsp&nbsp;评分：<%#Eval("star") %>星&nbsp;&nbsp;作者：<%#Eval("author") %>&nbsp;&nbsp;&nbsp;关键词：<%#Eval("keyword") %>&nbsp;&nbsp;&nbsp;积分：<%#Eval("score") %>……</a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
                <div class="col-xs-2" style="margin-left: 100px;">
                    <asp:Button ID="btn_delete" runat="server" Text="删 除 记 录" class="btn btn-danger btn-sm" OnClick="btn_delete_Click" />
                </div>
            </div>
        <div class="row" id="footer">
            企业后台管理系统 &nbsp;&nbsp;&nbsp;&nbsp;<a href="corporation_index.aspx" target="_blank">查看企业主页</a>
        </div>
        </div>
        <script type="text/javascript" src="../libs/jquery/jquery.js"></script>
        <script type="text/javascript" src="../libs/bootstrap/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
