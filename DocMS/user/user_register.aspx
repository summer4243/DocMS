<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_register.aspx.cs" Inherits="DocMS.user.user_register" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>注册普通用户</title>
    <link rel="shortcut icon" href="../image/favicon.ico"/>
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../libs/bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="../css/regist.css">
</head>

<body>
<form runat="server">
<div class="container">
	<div id="main" class="row">
		<div id="regbg" class="col-xs-6">
			<img src="../image/bookbg.jpg" alt="文档管理"/>
		</div>
		<div id="regbox" class="col-xs-6">
			<div class="form-inline">
				<asp:TextBox ID="txt_name" runat="server" class="form-control" placeholder="用户名（不超过15字）"
				oninput="$('#lab_tip_name').html('');" ></asp:TextBox>
				<asp:Label ID="lab_tip_name" runat="server" ForeColor="Red"></asp:Label>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator_name" runat="server" ErrorMessage="请输入用户名"
				 ControlToValidate="txt_name" ForeColor="Red"></asp:RequiredFieldValidator>			 
			 </div>
            <div class="form-inline">
				<asp:TextBox ID="txt_corporation" runat="server" class="form-control" placeholder="所属企业名（不超过15字）"
				oninput="$('#lab_tip_name').html('');" ></asp:TextBox>
				<asp:Label ID="lab_tip_corporation" runat="server" ForeColor="Red"></asp:Label>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator_corporation" runat="server" ErrorMessage="请输入企业名"
				 ControlToValidate="txt_corporation" ForeColor="Red"></asp:RequiredFieldValidator>			 
			 </div>
			<div class="form-inline">
				<asp:TextBox ID="txt_psw" runat="server" class="form-control" placeholder="输入密码" type="password"
				oninput="$('#lab_tip_psw').html('');"></asp:TextBox>
				<asp:Label ID="lab_tip_psw" runat="server" ForeColor="Red"></asp:Label>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator_psw" runat="server" ErrorMessage="请输入密码"
				 ControlToValidate="txt_psw" ForeColor="Red"></asp:RequiredFieldValidator>
			</div>
			<div class="form-inline">
				<asp:TextBox ID="txt_psw2" runat="server" class="form-control" placeholder="确认密码" type="password"
				oninput="$('#lab_tip_psw2').html('');" ></asp:TextBox>
				<asp:Label ID="lab_tip_psw2" runat="server" ForeColor="Red"></asp:Label>
				<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次输入密码不相同"
				 ControlToCompare="txt_psw" ControlToValidate="txt_psw2" ForeColor="Red"></asp:CompareValidator>
			</div>
			<div class="form-inline">
				<asp:TextBox ID="txt_email" runat="server" class="form-control" placeholder="常用邮箱" type="email"
				oninput="$('#lab_tip_email').html('');" ></asp:TextBox>
				<asp:Label ID="lab_tip_email" runat="server" ForeColor="Red"></asp:Label>
				<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email"
				ErrorMessage="请输入正确格式邮箱"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
			</div>
			<asp:Button ID="btn_reg" runat="server" Text="注册新用户" class="btn btn-info" onclick="btn_reg_Click" />
			<div id="link">
				<a href="../index.aspx">返回主页</a>			
			</div>
		</div>
	</div>
</div>
</form>
<script type="text/javascript" src="../libs/jquery/jquery.js"></script>
<script type="text/javascript" src="../libs/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>