<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="result_selfcorporation.aspx.cs" Inherits="DocMS.corporation.result_selfcorporation" %>

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
                    <div class="navbar-header">
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-left" runat="server" style="margin-top: 10px; margin-left: 20px;">
                            <li>
                                <asp:DropDownList ID="ddl_test" runat="server" onchange=" $('#txt_search').attr('placeholder','在'+this.value+'中搜索');">
                                    <asp:ListItem>企业购买</asp:ListItem>
                                    <asp:ListItem>企业自建</asp:ListItem>
                                    <asp:ListItem>总部文档</asp:ListItem>
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
                    </div>
                </div>
            </nav>
        </div>
        <div id="middel">
            <div class="container">
                <div id="div_main" class="row" runat="server" style="margin: 0 auto; margin-top: 10px;">
                    <h3>搜索结果如下:</h3>
                    <br />
                    <table class="table table-bordered table-hover">
                        <tr class="info">
                            <th>书名</th>
                            <th>所属目录</th>
                            <th>评价</th>
                            <th>积分</th>
                            <th>作者</th>
                            <th>查看文档</th>
                        </tr>
                        <asp:Repeater ID="rep_booklist" runat="server" OnItemCommand="rep_adminlist_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("name")%></td>
                                    <td><%#Eval("booktype") %></td>
                                    <td><%#Eval("star") %></td>
                                    <td><%#Eval("score") %></td>
                                    <td><%#Eval("author") %></td>
                                    <td>
                                        <asp:Button ID="btn_read" runat="server" Text="查看" class="btn btn-info btn-xs"
                                            Style="width: 60%" CommandArgument='<%#Eval("id") %>' CommandName="read" /></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
        </div>
        <div id="footer">
            文档管理系统 &nbsp;&nbsp;&nbsp;&nbsp;<a href="corporation_index.aspx" target="_blank">回到首页</a>
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


