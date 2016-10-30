<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminlist.aspx.cs" Inherits="DocMS.admin.adminlist" %>

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
                        <li class="active"><a>管理员管理</a></li>
                        <li><a href="addfabooktype.aspx">添加主目录</a></li>
                        <li><a href="addsonbooktype.aspx">添加子目录</a></li>
                        <li><a href="addbook.aspx">添加书籍</a></li>
                        <li><a href="readbook.aspx">查看书籍</a></li>
                        <li style="float: right"><a href="outlogin.aspx" onclick="return confirm('确认退出');">退出管理</a></li>
                        <li style="float: right"><a href="../libs/ckfinder/ckfinder.html" target="_blank">文件管理系统</a></li>
                    </ul>
                </div>
            </div>
            <div id="div_main" class="row" runat="server" style="margin: 0 auto; margin-top: 10px;">
                <div id="leftnav" class="col-xs-2">
                    <ul class="nav nav-list">
                        <li><a href="adminlist.aspx">管理员列表</a></li>
                        <li><a href="addadmin.aspx">添加管理员</a></li>
                        <li><a href="admininfo.aspx">密码修改</a></li>
                    </ul>
                </div>
                <div id="adminlist" class="col-xs-6">
                    <h3>管理员列表</h3>
                    <br />
                    <table class="table table-bordered table-hover">
                        <tr class="info">
                            <th>账户名</th>
                            <th>密码</th>
                            <th>修改密码</th>
                            <th>删除账户</th>
                        </tr>
                        <asp:Repeater ID="rep_adminlist" runat="server" OnItemCommand="rep_adminlist_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("name")%></td>
                                    <td><%#Eval("password") %></td>
                                    <td>
                                        <asp:Button ID="btn_update" runat="server" Text="修改" class="btn btn-info btn-xs"
                                            Style="width: 60%" CommandArgument='<%#Eval("id") %>' CommandName="update" /></td>
                                    <td>
                                        <asp:Button ID="btn_delete" runat="server" Text="删除" class="btn btn-danger btn-xs"
                                            Style="width: 60%" CommandArgument='<%#Eval("id") %>' CommandName="delete" /></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
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
