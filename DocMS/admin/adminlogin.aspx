<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="DocMS.admin.adminlogin" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>管理员登陆</title>
    <link rel="shortcut icon" href="../image/favicon.ico"/>
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="../css/admin.css">
</head>
<body>
<form id="Form1" runat="server">
<div class="container">
   	<div id="loginbox">
		<asp:TextBox ID="txt_name" runat="server" class="form-control" placeholder="管理员帐户"></asp:TextBox>
		<asp:TextBox ID="txt_psw" runat="server" class="form-control" placeholder="管理员密码" TextMode="Password"></asp:TextBox>
		<asp:Button ID="btn_login" runat="server" Text="登录" class="btn btn-info btn-block" onclick="btn_login_Click"/>
		<asp:Label ID="lab_tip" runat="server" Text=""></asp:Label>
	</div>
</div>
</form>
<script type="text/javascript" src="../libs/jquery/jquery.js"></script> 
<script type="text/javascript" src="../libs/bootstrap/js/bootstrap.min.js"></script> 
</body>
</html>