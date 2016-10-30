<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cloud_firstboss.aspx.cs" Inherits="DocMS.user.cloud_firstboss" %>

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
                        <li class="active"><a>群组一</a></li>
                        <li><a href="cloud_secondboss.aspx">群组二</a></li>
                        <li><a href="cloud_thirdboss.aspx">群组三</a></li>
                        <li><a href="news.aspx">消息</a></li>
                        <li style="float: right"><asp:Button ID="btn_create" class="btn btn-info" runat="server" Text="创建小组" onClick="btn_create_Click"/></li>
                        <li style="float:right;margin-left:20px;"><a href="user_index.aspx">回到首页</a></li>
                    </ul>
                </div>
            </div>
            <div id="div_main" class="row" runat="server" style="margin: 0 auto; margin-top: 10px;">
                <div id="leftnav" class="col-xs-2" runat="server">
                    <ul class="nav nav-list">
                        <li><a href="cloud_firstboss.aspx">组长推荐</a></li>
                        <li><a href="cloud_firstcommon.aspx">组员推荐</a></li>
                    </ul>
                </div>

                <div id="boss_recommend" runat="server" class="col-xs-7">
                    <p style="text-align:left;font-size:18px;" class="text-danger">组长推荐</p>
                    <asp:Repeater ID="rep_booklist" runat="server" OnItemCommand="rep_booklist_ItemCommand">
                        <ItemTemplate>
                            <div class="bookdiv thumbnail">
                                <div>
                                    <h5><%#Eval("name")%> </h5>
                                    <p>
                                        作者：<%#Eval("author") %><br>
                                        关键词：<%#Eval("keyword") %><br>
                                        积分：<%#Eval("score") %>积分<br>
                                        评分：<%#Eval("star") %>星<br>
                                        推荐人：<span style="color:#d9534f;"><%#Eval("reference_name") %></span>
                                        <asp:LinkButton ID="btn_read" class="button_read" runat="server" Text="阅览" CommandArgument='<%#Eval("name") %>' CommandName="read" />
                                        
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div id="group_item" class="col-xs-3" style="float:right;">
                    <div class="row" id="group_introduction">
                        <div class="col-xs-12">
                            <span style="font-size: 17px; margin-top: 8px; color: #3c763d;">当前组:<%=group[0] %></span>
                            <h3>小组介绍</h3>
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>第一组</td>
                                        <td><%=group[0] %></td>
                                    </tr>
                                    <tr>
                                        <td>第二组</td>
                                        <td><%=group[1] %></td>
                                    </tr>
                                    <tr>
                                        <td>第三组</td>
                                        <td><%=group[2] %></td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:Button ID="btn_call" class="btn btn-success" runat="server" Text="召集新成员" onClick="btn_call_Click"  Style="margin-right:30px;"/>
                            <asp:Button ID="btn_out" class="btn btn-danger" runat="server" Text="退出当前组" onClick="btn_out_Click"/>
                        </div>
                    </div>
                    <div class="row" id="member_introduction">
                        <div class="col-xs-12">
                            <h3>组成员介绍</h3>
                            <table class="table table-bordered table-hover">
                                <tr class="info">
                                    <th>组长</th>
                                </tr>
                                <tr>
                                    <td><%=bossname %></td>
                                    </tr>
                            </table>
                            <table class="table table-bordered table-hover">
                                <tr class="info">
                                    <th>普通成员</th>
                                </tr>
                                <asp:Repeater ID="rep_memberlist" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%#Eval("name")%></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </div>
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
