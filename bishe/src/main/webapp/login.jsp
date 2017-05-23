<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
    <%
	String path = request.getRequestURI();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=basePath%>">
	<head>
		<title>login</title>
		<!--用百度的静态资源库的cdn安装bootstrap环境-->
		<!-- Bootstrap 核心 CSS 文件 -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!--font-awesome 核心我CSS 文件-->
		<link href="css/font-awesome.min.css" rel="stylesheet">
		<!-- 在bootstrap.min.js 之前引入 -->
		<script src="admin/common/plugin/jquery-3.2.1.min.js"></script>
		<!-- Bootstrap 核心 JavaScript 文件 -->
		<script src="js/bootstrap.min.js"></script>
		<!--jquery.validate-->
		<script type="text/javascript" src="js/login/jquery.validate.min.js" ></script>
		<script type="text/javascript" src="js/message.js" ></script>
		<style type="text/css">
			body{background: url(img/4.jpg) no-repeat;background-size: cover;font-size: 16px;}
			.form{background: rgba(255,255,255,0.2);width:400px;margin:100px auto;}
			#login_form{display: block;}
			#register_form{display: none;}
			.fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
			input[type="text"],input[type="password"]{padding-left:26px;}
			.checkbox{padding-left:21px;}
		</style>
	</head>
	<body>
		<!--
			基础知识：
			网格系统:通过行和列布局
			行必须放在container内
			手机用col-xs-*
			平板用col-sm-*
			笔记本或普通台式电脑用col-md-*
			大型设备台式电脑用col-lg-*
			为了兼容多个设备，可以用多个col-*-*来控制；
		-->
		<!--
			从案例学知识，来做一个登录，注册页面
			用到font-awesome 4.3.0；bootstrap 3.3.0；jQuery Validate
		-->
	<div class="container">
		<div class="form row">
			<form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form">
				<h3 class="form-title">登录</h3>
				<div class="col-sm-9 col-md-9">
					<div class="form-group">
						<i class="fa fa-user fa-lg"></i>
						<input class="form-control required" type="text" id="loginusername" placeholder="请输入账号" name="username" autofocus="autofocus" maxlength="20"/>
					</div>
					<div class="form-group">
							<i class="fa fa-lock fa-lg"></i>
							<input class="form-control required" type="password" id="loginpassword" placeholder="请输入密码" name="password" maxlength="8"/>
					</div>
					<div class="form-group">
					
					<!-- 	<label class="checkbox">
							<input type="checkbox" name="remember" value="1"/> 
						</label> -->
						<hr />
						<a href="javascript:;" id="register_btn" style="color: black" class="">注册</a>
					</div>
					<s:fielderror fieldName="err_msg" theme="simple"></s:fielderror>
					<div id="prompt" hidden="hidden">用户名或密码错误</div>
					<div class="form-group">
						<input type="button" class="btn btn-success" id="loginbtn" value="登录"/>   
					</div>
				</div>
			</form>
		</div>

		<div class="form row">
			<form class="form-horizontal col-sm-offset-3 col-md-offset-3" action="/bishe/user/userAction_register.action" method="post" id="register_form" enctype="multipart/form-data">
				<h3 class="form-title">注册</h3>
				<div class="col-sm-9 col-md-9">
					<div class="form-group">
						<i class="fa fa-user fa-lg"></i>
						<input class="form-control required" type="text" placeholder="请输入用户名" id="register_username" name="user.username" autofocus="autofocus"/>
					</div>
					<div class="form-group">
							<i class="fa fa-lock fa-lg"></i>
							<input class="form-control required" type="password" placeholder="请输入密码" id="register_password" name="user.password"/>
					</div>
					<div class="form-group">
							<i class="fa fa-check fa-lg"></i>
							<input class="form-control required" type="password" placeholder="再次输入密码" name="rpassword"/>
					</div>
					<!-- <div class="form-group">
							<i class="fa fa-envelope fa-lg"></i> -->
							 <label class="col-md-5">
    <input type="radio" name="user.usertype" id="optionsRadios3" value="1" >养生专家
  </label>
  <label class="col-md-5">
    <input type="radio" name="user.usertype" id="optionsRadios4" value="2">养生爱好者
  </label>
  <div class="form-group" id="filediv">
							<input class="form-control" type="file" name="file"  placeholder="上传证书" id="postfile"/>
					</div>
				<!-- 	</div> -->
					<div class="form-group">
						<input type="submit" class="btn btn-success pull-right" value="注册 " id="registerbtn"/>
						<input type="submit" class="btn btn-info pull-left" id="back_btn" value="返回"/>
					</div>
				</div>
			</form>
		</div>
		</div>
	<script type="text/javascript" src="js/login/main.js" ></script>
	</body>
</html>
