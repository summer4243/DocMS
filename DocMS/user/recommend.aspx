<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="recommend.aspx.cs" Inherits="DocMS.user.recommend" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>云推荐</title>
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/recommend.css">
</head>
<body>
    <form id="Form1" runat="server">
        <div class="container">
            <div id="header" class="row">
                <div id="topnav" class="col-xs-12">
                    <h3 style="text-align: center;">书籍推荐分组</h3>
                </div>
            </div>
            <div id="div_main" class="row" runat="server" style="margin: 0 auto; margin-top: 15px; min-height: 420px;">
                <div id="recommend_data">
                    <table class="table">
                        <tr>
                            <td style="width: 366px; padding-top: 20px;"><span style="font-size: 16px;">将&nbsp;</span><span style="text-decoration: underline; color: #3c763d; padding: 0px; margin: 0px; font-size: 16px;"><%=bookname %></span>
                                <span style="font-size: 16px;">&nbsp;推荐分类至小组</span></td>
                            <td id="td_grouptype" style="width: 350px; padding-top: 20px;">
                                <asp:RadioButtonList ID="rbl_group" runat="server" Style="font-family: 'Microsoft YaHei',Verdana, Helvetica, Arial, sans-serif; font-size: 15px;">
                                </asp:RadioButtonList>
                            </td>
                            <td style="padding-top:20px;">
                                <asp:Button ID="btn_confirm" class="btn btn-info" runat="server" Text="确认推荐" OnClick="btn_confirm_Click" />
                                &nbsp;&nbsp;
                                <asp:Label ID="lab_tip" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row" id="footer">
                文档管理系统 &nbsp;&nbsp;&nbsp;&nbsp;<a href="user_index.aspx">回到个人主页</a>
            </div>
        </div>
        <script type="text/javascript" src="../libs/jquery/jquery.js"></script>
        <script type="text/javascript" src="../libs/bootstrap/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
