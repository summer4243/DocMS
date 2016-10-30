<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alterinfo.aspx.cs" Inherits="DocMS.user.alterinfo" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>企业管理</title>
    <link rel="shortcut icon" href="../image/favicon.ico" />
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>
    <form id="Form1" runat="server">
        <div class="container">
            <div id="header" class="row">
            </div>
            <div id="div_main" class="row" runat="server" style="margin: 0 auto; margin-top: 10px;">
                <div id="addinfo" class="col-xs-3">
                    <br>
                    <label>绑定邮件</label>
                    <asp:TextBox ID="txt_email" runat="server" class="form-control" placeholder="邮件"></asp:TextBox><br>
                    <label>密码</label><br>
                    <asp:TextBox ID="txt_oldpassword" runat="server" class="form-control" placeholder="密码"></asp:TextBox><br>
                    <label>新的密码</label>
                    <asp:TextBox ID="txt_newpassword" runat="server" class="form-control" placeholder="新的密码"></asp:TextBox><br>
                    <br>
                    <asp:Button ID="btn_update" runat="server" Text="更新" class="btn btn-info" OnClick="btn_update_Click" />
                    &nbsp;&nbsp;<asp:Label ID="lab_tip" runat="server" Text="" Style="color: Red;"></asp:Label>
                </div>
            </div>
            <div class="row" id="footer">
                个人修改信息 &nbsp;&nbsp;&nbsp;&nbsp;<a href="user_index.aspx">查看主页</a>
            </div>
        </div>
        <script type="text/javascript" src="../libs/jquery/jquery.js"></script>
        <script type="text/javascript" src="../libs/bootstrap/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
