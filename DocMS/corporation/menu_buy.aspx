<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu_buy.aspx.cs" Inherits="DocMS.corporation.menu_buy" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>企业目录购买</title>
    <link rel="stylesheet" href="../css/menu_buy.css">
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../libs/bootstrap-select/css/bootstrap-select.min.css">
</head>
<body>
    <form runat="server">
        <div id="middle">
            <div id="menu" class="panel-body">
                <table class="table table-bordered">
                    <tr>
                        <td><strong>可购买目录</strong></td>
                        <td id="td_menu">
                            <asp:RadioButtonList ID="rbl_menu" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" RepeatLayout="Flow"></asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
                <br>
                <p>
                    <strong>使用年限:</strong>&nbsp&nbsp
                <input type="button" value="-" onclick="decreasecount();" />
                    <input type="text" style="width: 60px;" value="1" id="txtBuycount" runat="server" />
                    <input type="button" value="+" onclick="addcount();" />
                </p>
                总价:<asp:Label ID="lbl_allprice" runat="server" Text="0"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Button ID="btn_allmoney" runat="server" Text="显示总金额" class="btn btn-info btn-xs" Height="30px" OnClick="btn_allmoney_click" />
                &nbsp&nbsp;
            <asp:Button ID="btn_confirm" runat="server" Text="确认购买" class="btn btn-danger btn-xs" Height="30px" OnClick="btn_confirm_click" />
            </div>
        </div>
        <div id="footer">
            <br>
            <br>
            <br><br><br><br><br><br><br><br><br><br><br><br>
            <p style="text-align:center">文档管理系统 &nbsp;&nbsp;&nbsp;&nbsp;<a href="corporation_index.aspx">回到首页</a></p>
        </div>
    </form>
    <script type="text/javascript" src="../libs/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="../libs/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../libs/bootstrap-select/js/bootstrap-select.min.js"></script>
    <script type="text/javascript">
        var Buycount = parseInt(document.getElementById("txtBuycount").value);
        function decreasecount() {
            if (Buycount > 1) {
                --Buycount;
                document.getElementById("txtBuycount").value = Buycount;
            }
        }
        function addcount() {
            if (Buycount < 100) {
                ++Buycount;
                document.getElementById("txtBuycount").value = Buycount;
            }
        }
    </script>
</body>
</html>
