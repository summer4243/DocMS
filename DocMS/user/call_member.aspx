<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="call_member.aspx.cs" Inherits="DocMS.user.call_member" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>云推荐-召唤队员</title>
    <link rel="shortcut icon" href="../image/favicon.ico" />
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/call.css" />
</head>
<body>
    <form id="Form1" runat="server">
        <div class="container">
            <div id="header" class="row" style="margin-top: 5px; ">
                <div id="topnav" class="col-xs-12" style="padding-bottom: 15px;">
                    <h2 style="margin-bottom: 15px; color: #3c763d; text-align: center;">云推荐-召唤队员</h2>
                </div>
            </div>
            <div id="div_main" class="row" runat="server" style="margin: 0 auto; margin-top: 10px;">
                <div id="bread" class="col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="cloud_firstboss.aspx">云推荐首页</a></li>
                        <li class="active">召唤队员</li>
                    </ol>
                </div>
                <div id="call_member" class="col-xs-3">
                    <asp:TextBox ID="txt_name" runat="server" class="form-control" placeholder="想要邀请的队员用户名"></asp:TextBox>
                    <asp:Button ID="btn_call" runat="server" Text="邀请" class="btn btn-info" OnClick="btn_call_Click" />
                    &nbsp;&nbsp;<asp:Label ID="lab_tip" runat="server" Text="" Style="color: Red;"></asp:Label>
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

