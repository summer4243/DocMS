<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewer.aspx.cs" Inherits="DocMS.viewer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="css/viewer.css" />
    <script src="FlexPaper/js/jquery.js" type="text/javascript"></script>
    <script src="FlexPaper/js/flexpaper_flash_debug.js" type="text/javascript"></script>
    <script src="FlexPaper/js/flexpaper_flash.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div id="div_main" class="row" runat="server" style="margin: 0 auto; margin-top: 10px;">
                <div id="bread" class="col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="admin/readbook.aspx">管理员页面</a></li>
                        <li class="active">阅览</li>
                    </ol>
                </div>
                <div style="margin-left: 18px;">
                    <a id="viewerPlaceHolder" style="width: 740px; height: 580px; display: block;"></a>
                    <!--设置一个隐蔽控件来得到要显示的文件的名字-->
                    <input type="hidden" id="file" value='<%=FileURL %>' />
                    <script type="text/javascript">

                        var fileURL = $("#file").val();
                        var fp = new FlexPaperViewer(
                    'FlexPaper/FlexPaperViewer',
                    'viewerPlaceHolder',
                    {
                        config: {
                            SwfFile: escape('SWF/' + fileURL),
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
            </div>
            <div class="row" id="footer">
                云推荐 &nbsp;&nbsp;&nbsp;&nbsp;<a href="admin/readbook.aspx">前往个人主页</a>
            </div>
        </div>

    </form>
    <script type="text/javascript" src="libs/jquery/jquery.js"></script>
    <script type="text/javascript" src="libs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

