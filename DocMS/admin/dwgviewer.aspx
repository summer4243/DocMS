<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dwgviewer.aspx.cs" Inherits="DocMS.admin.dwgviewer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>梦想绘图控件</title>
    <meta http-equiv="X-UA-Compatible" content="ie-comp|ie-stand">
    <meta content="always" name="referrer">
    <link rel="stylesheet" href="libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="libs/bootstrap/css/bootstrap-theme.min.css">
    <link href="../css/dwgviewer.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript" src="../scripts/mx.js"></script>
</head>

<!--在最新IE8中,在控件窗口中点击鼠标右键，会出右键弹出菜单，会引起IE没有响应，所以这里禁用右键弹出菜单-->
<!-- 在傲游，和360浏览器没有这样的问题，或老版的IE没有问题-->
<script language="JavaScript">
    document.oncontextmenu = new Function('event.returnValue=false;'); //禁用右键
</script>

<body onload="PageInit();">
    <div id="editmain" class="editmain">
        <p style="margin-top: 20px;">
            <a href="readbook.aspx">管理员页面</a>
            请切换至ie模式
        </p>

        <div id="editmain_middle" class="editmain_middle">
            <div id="editmain_right" class="editmain_right">
                <input type="hidden" id="file" value='<%=dwg_path %>' />
                <script type="text/javascript">LoadMxDrawX();</script>
            </div>
            <!-- -->
            <script type="text/javascript" language="javascript" for="MxDrawXCtrl" event="ImplementCommandEvent(iCmd);">			                			MxDrawX_ImplementCommandEvent(iCmd);
            </script>
            <script language="javascript">
                function DoCommand(iCmd) {
                    document.getElementById("MxDrawXCtrl").DoCommand(iCmd);
                }
                function DoCustomEventEventFun(sEventName) {
                    if (sEventName == "ObjectGripEdit") {
                        alert(sEventName);
                        var MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");

                        var ret = MxDrawXCtrl_Obj.CustomEventParam();

                        ret = MxDrawXCtrl_Obj.Call("WisdeemsoftGetTableData", ret.AtLong(0));

                        if (ret.Count > 1) {

                            alert("夹点编辑了表格名为:" + ret.AtString(1) + "坐标X:" + ret.AtDouble(2) + "坐标Y:" + ret.AtDouble(3));
                        }
                    }
                    else if (sEventName == "MxDrawXInitComplete") {
                        //alert("控件加载完成，可以做一些初始绘制操作");
                    }
                }

                function DoMouseEventFun(dX, dY, iType) {

                    if (iType == 2) {
                        var MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");

                        var ret = MxDrawXCtrl_Obj.Call("WisdeemsoftGetTable", "(" + dX + "," + dY + ")");

                        if (ret.Count > 1) {
                            // 点击了表格.

                            // 设置鼠标事件，不再处理。
                            // MxDrawXCtrl_Obj.Call("ClearMouseEvent", "");

                            //alert("点击的表格名为:" + ret.AtString(1));
                        }
                        else {

                            // 设置鼠标事件，不再处理。

                            // alert("没有点击到表格");
                        }
                    }
                    else if (iType == 3) {

                        // 屏蔽右键
                        var MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
                        MxDrawXCtrl_Obj.Call("ClearMouseEvent", "");

                    }
                }

                function DoCommandEventFunc(iCmd) {
                    if (iCmd == 7) {
                        OpenDwgFile();
                    }
                }

                function PageInit() {
                    // 在这里可以禁区用控件的一些工具条。
                    // document.getElementById("MxDrawXCtrl").EnableToolBarButton("保存dwg文件", false);
                    if (DetectActiveX())
                        MxDrawXCtrl_Obj = document.all.item("MxDrawXCtrl");
                }

                if (DetectActiveX()) {
                    document.getElementById("MxDrawXCtrl").ImplementCommandEventFun = DoCommandEventFunc;
                    document.getElementById("MxDrawXCtrl").ImplementMouseEventFun = DoMouseEventFun;
                    document.getElementById("MxDrawXCtrl").ImplementCustomEvent = DoCustomEventEventFun;
                }

                //初始化 
                function InitMxDrawX() {
                    var mxOcx = document.getElementById("MxDrawXCtrl");
                    //if (mxOcx) {
                    //if (!mxOcx.IsIniting()) {
                    clearInterval(mxtime);

                    /*var port = window.location.port;
                    var path = "http://localhost:" + port;
                    alert(path + "/1.dwg");

                    var sDwgFile = path + "/1.dwg";
                    alert(sDwgFile);
                    mxOcx.OpenWebDwgFile(sDwgFile);
                    */

                    var sDwgFile = document.getElementById("file").value;
                    alert(sDwgFile);
                    mxOcx.OpenWebDwgFile(sDwgFile);

                    var mxOcx = document.all.item("MxDrawXCtrl");
                    mxOcx.LoadModule("~/PropertyEditor#3.0");

                    mxOcx.LoadToolBar("~/My-MxDraw-ToolBar.txt", true);
                    //}
                    //}
                }
                mxtime = setInterval(InitMxDrawX, 100);
            </script>
        </div>
    </div>
</body>
</html>
