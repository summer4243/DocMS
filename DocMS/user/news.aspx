<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="DocMS.user.news" EnableEventValidation="false" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>云推荐</title>
    <link rel="shortcut icon" href="../image/favicon.ico" />
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/cloud.css">
</head>
<body>
    <form id="Form1" runat="server">
        <div class="container">
            <div id="header" class="row" style="margin-top: 5px;">
                <div id="topnav" class="col-xs-12">
                    <h2 style="margin-bottom: 15px; color: #3c763d; text-align: center;">云推荐</h2>
                    <ul class="nav nav-tabs">
                        <li><a href="cloud_firstboss.aspx">群组一</a></li>
                        <li><a href="cloud_secondboss.aspx">群组二</a></li>
                        <li><a href="cloud_thirdboss.aspx">群组三</a></li>
                        <li class="active"><a>消息</a></li>
                        <li style="float: right; margin-left: 20px;"><a href="user_index.aspx">回到首页</a></li>
                    </ul>
                </div>
            </div>
            <div id="div_main" class="row" runat="server" style="margin: 0 auto; margin-top: 10px;">
                <div id="div_invite" runat="server" class="col-xs-7">
                    <h4 class="text-danger">当前登入用户名：<%=user_name %></h4>
                    <table class="table table-bordered table-hover">
                        <caption>
                            <h4 class="text-danger">接收到的邀请</h4>
                        </caption>
                        <tr class="info">
                            <th>邀请人</th>
                            <th>加入组名称</th>
                            <th>同意</th>
                            <th>忽略</th>
                        </tr>
                        <asp:Repeater ID="rep_invitelist" runat="server" OnItemCommand="rep_invitelist_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("inviter")%></td>
                                    <td><%#Eval("group_name") %></td>
                                    <td>
                                        <asp:Button ID="btn_agree" runat="server" Text="同意" class="btn btn-info btn-xs"
                                            Style="width: 60%" CommandArgument='<%#Eval("id") %>' CommandName="agree" /></td>
                                    <td>
                                        <asp:Button ID="btn_ignore" runat="server" Text="忽略" class="btn btn-danger btn-xs"
                                            Style="width: 60%" CommandArgument='<%#Eval("id") %>' CommandName="ignore" /></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
            <div class="row" id="footer">
                云推荐 &nbsp;&nbsp;&nbsp;&nbsp;<a href="user_index.aspx">前往个人主页</a>
            </div>
        </div>
        <script type="text/javascript" src="../libs/jquery/jquery.js"></script>
        <script type="text/javascript" src="../libs/bootstrap/js/bootstrap.min.js"></script>
    </form>
</body>
</html>


