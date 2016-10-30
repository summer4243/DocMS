<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="abook_information.aspx.cs" Inherits="DocMS.user.abook_information" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>文档管理系统</title>
    <link rel="shortcut icon" href="../image/favicon.ico" />
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../libs/bootstrap-select/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="../css/result.css">
</head>
<body>
    <form runat="server">
        <div id="header">
            <nav class="navbar navbar-default" role="navigation">
                <div class="container">
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-left" runat="server" style="margin-top: 10px; margin-left: 20px;">
                            <li>
                                <asp:DropDownList ID="ddl_test" runat="server" onchange=" $('#txt_search').attr('placeholder','在'+this.value+'中搜索');">
                                    <asp:ListItem>企业购买</asp:ListItem>
                                    <asp:ListItem>企业自建</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                        </ul>
                        <ul id="Ul1" class="nav navbar-nav" runat="server" style="margin-top: 10px;">
                            <li style="margin-left: 10px; width: 400px;">
                                <asp:TextBox ID="txt_search" runat="server" class="form-control" placeholder="在企业购买中搜索"></asp:TextBox>
                            </li>
                            <li style="margin-left: 20px;">
                                <asp:Button ID="btn_search" runat="server" Text=" 搜 索 " class="btn btn-default" OnClick="btn_search_Click" Style="width: 100px;" />
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right" runat="server" id="div_navlik" style="margin-top: 10px; margin-right: 20px;">
                            <li style="margin-left: 20px;">
                                <asp:Button ID="btn_alterinfo" runat="server" Text="信息修改" class="btn btn-info" OnClick="btn_alterinfo_Click" Style="width: 100px;" />
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div id="middel">
            <div class="container">
                <div id="div_main" class="row" runat="server" style="margin: 0 auto; margin-top: 10px; margin-left:100px;">    
                    <div class="col-xs-7">
                        <h4 style="color:#00CCCC">>>书籍信息</h4><br/>
                        <h4 style="color:#0099CC"><%=adminbook.name %></h4>
                        <table>
                            <tr style="height: 30px;">
                                <td style="width: 60px;"><strong>作者</strong></td>
                                <td><%=adminbook.author %></td>
                            </tr>
                            <tr style="height: 40px;">
                                <td><strong>关键词</strong></td>
                                <td><%=adminbook.keyword %></td>
                            </tr>
                            <tr style="height: 40px;">
                                <td><strong>积分</strong></td>
                                <td><%=adminbook.score %>分</td>
                            </tr>
                            <tr style="height: 40px;">
                                <td><strong>所属目录</strong></td>
                                <td><%=adminbook.booktype %></td>
                            </tr>
                        </table>
                        <p style="margin-top:10px;">
                            <label>参考评分</label>&nbsp&nbsp&nbsp;<strong class="price"><%=adminbook.star %>星</strong>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer">
            文档管理系统 &nbsp;&nbsp;&nbsp;&nbsp;<a href="user_index.aspx" target="_blank">回到首页</a>
        </div>
    </form>
    <script type="text/javascript" src="../libs/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="../libs/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../libs/bootstrap-select/js/bootstrap-select.min.js"></script>
    <script type="text/javascript">
        //加载下拉框样式 加载可视化编辑器
        $(function () {
            $('#ddl_test').selectpicker({ style: 'btn-info', width: '100px' });
        });
    </script>
</body>
</html>

