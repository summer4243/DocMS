<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_index.aspx.cs" Inherits="DocMS.user.user_index" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>文档管理系统</title>
    <link rel="shortcut icon" href="../image/favicon.ico" />
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../libs/bootstrap-select/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="../css/corporation_index.css">
    <script src="/FlexPaper/js/jquery.js" type="text/javascript"></script>
    <script src="/FlexPaper/js/flexpaper_flash_debug.js" type="text/javascript"></script>
    <script src="/FlexPaper/js/flexpaper_flash.js" type="text/javascript"></script>
    <script type="text/javascript">
        //加载下拉框样式 加载可视化编辑器
        $(function () {
            $('#ddl_test').selectpicker({ style: 'btn-info', width: '100px' });
        });
    </script>
</head>
<body>
    <form runat="server">
        <div id="container">
            <div id="header">
                <nav class="navbar navbar-default" role="navigation">
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
                            <li style="margin-left:20px;">
                                <asp:Button ID="btn_cloudrecommend" runat="server" Text="云推荐" class="btn btn-success" OnClick="btn_cloudrecommend_Click" Style="width:100px;"/> 
                            </li>
                            <li style="margin-left: 20px;">
                                <asp:Button ID="btn_alterinfo" runat="server" Text="信息修改" class="btn btn-info" OnClick="btn_alterinfo_Click" Style="width: 100px;" />
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div id="menu">
                <div id="div_main" runat="server" style="margin: 0 auto; margin-top: 0px; margin-bottom: 0px; margin-left: 10px;">
                    <div id="topnav" class="topmenu">
                        <ul class="nav nav-tabs">
                            <li class="active"><a>企业购买书籍</a></li>
                            <li><a href="corporation_selfbook.aspx">企业自身书籍</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="bookinfo" class="bookinfo">
                <br>
                <asp:TreeView ID="tree" runat="server" ExpandDepth="1" ImageSet="XPFileExplorer" LineImagesFolder="~/TreeLineImages" OnSelectedNodeChanged="Select_Change" NodeIndent="15">
                    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                    <NodeStyle Font-Names="Tahoma" Font-Size="14px" ForeColor="Black" HorizontalPadding="2px" NodeSpacing="2px" VerticalPadding="2px" />
                    <ParentNodeStyle Font-Bold="False" />
                    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px" VerticalPadding="0px" />
                </asp:TreeView>
            </div>
            <div id="addinfo" runat="server" class="addinfo" style="margin: 0 auto; margin-top: 10px; margin-left: 10px; margin-bottom: 20px;">
                <asp:Label ID="lbl_selectednode" runat="server" Text="" Style="display: none;"></asp:Label>
                <h4 style="color: #00CCCC">>>书籍信息</h4>
                <br />
                <h4 style="color: #0099CC"><%=adminbook.name %></h4>
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
                <p style="margin-top: 10px;">
                    <label>参考评分</label>&nbsp&nbsp&nbsp;<strong class="price"><%=adminbook.star %>星</strong>
                </p>
                <a target="_blank" href="../<%=url %>"><strong>书籍电子版下载链接</strong></a>
                <br/>
                <br/>
                <asp:Button ID="btn_view" runat="server" Text="查看此书籍" class="btn btn-info" OnClick="btn_view_Click" />
                <br/>
                <br/>
                <asp:Button ID="btn_recommend" class="btn btn-info" runat="server" Text="推荐一下" OnClick="btn_recommend_Click"/>
                <br/>
                &nbsp;&nbsp;<asp:Label ID="lab_tip" runat="server" Text="" Style="color: Red; font-size: 120%;"></asp:Label>
            </div>
            <div id="content" style="margin-left: 0px; margin-top: 10px;" runat="server">
                <a id="viewerPlaceHolder" style="width: 670px; height: 590px; display: block; float: left;"></a>
                <!--设置一个隐蔽控件来得到要显示的文件的名字-->
                <input type="hidden" id="file" value='<%=FileURL %>' />
                <script type="text/javascript">

                    var fileURL = $("#file").val();
                    var fp = new FlexPaperViewer(
                '../FlexPaper/FlexPaperViewer',
                'viewerPlaceHolder',
                {
                    config: {
                        SwfFile: escape('../SWF/' + fileURL),
                        Scale: 1.0,
                        ZoomTransition: 'easeOut',
                        ZoomTime: 0.5,
                        ZoomInterval: 0.2,
                        FitPageOnLoad: true,
                        FitWidthOnLoad: true,
                        PrintEnabled: true,
                        FullScreenAsMaxWindow: true,
                        ProgressiveLoading: true,
                        MinZoomSize: 0.2,
                        MaxZoomSize: 5,
                        SearchMatchAll: true,
                        InitViewMode: 'Portrait',
                        ViewModeToolsVisible: true,
                        ZoomToolsVisible: true,
                        NavToolsVisible: true,
                        CursorToolsVisible: true,
                        SearchToolsVisible: true,
                        localeChain: 'en_US'
                    }
                }
                );
                </script>
            </div>
            <div id="selectbook" runat="server" class="row">
                <div id="bookitems" class="col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <strong>结果筛选</strong>&nbsp&nbsp&nbsp&nbsp
						<strong style="color: Green">Tip：不勾选即以书名第一个字进行字典排序</strong>
                        </div>
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td id="td_booktype">
                                        <asp:RadioButtonList ID="rbl_score" RepeatDirection="Horizontal" AutoPostBack="True" runat="server">
                                            <asp:ListItem Value="0">评分由高到低</asp:ListItem>
                                            <asp:ListItem Value="1">下载积分由低到高</asp:ListItem>
                                            <asp:ListItem Value="2">字典排序</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                            <strong style="color: Red;">一共找到 <em>
                                <asp:Label ID="lab_count" runat="server" Style="color: Red;"></asp:Label></em> 本书				
                            </strong>
                        </div>
                    </div>
                </div>
                <div id="booklist" class="col-xs-12">
                    <asp:Repeater ID="rep_booklist" runat="server" OnItemCommand="rep_booklist_ItemCommand">
                        <ItemTemplate>
                            <div class="bookdiv thumbnail">
                                <div>
                                    <h5><%#Eval("name")%> </h5>
                                    <p>
                                        作者：<%#Eval("author") %><br>
                                        关键词：<%#Eval("keyword") %><br>
                                        积分：<%#Eval("score") %>积分<br>
                                        评分：<%#Eval("star") %>星
                                        <asp:LinkButton ID="btn_read" class="button_read" runat="server" Text="阅览" CommandArgument='<%#Eval("name") %>' CommandName="read" />
                                        <br>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div id="footer">
                文档管理系统 &nbsp;&nbsp;&nbsp;&nbsp;<a href="user_index.aspx">回到首页</a>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="../libs/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="../libs/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../libs/bootstrap-select/js/bootstrap-select.min.js"></script>
</body>
</html>
