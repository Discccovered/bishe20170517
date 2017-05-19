<%@ page language="java" pageEncoding="UTF-8" import="com.ibcio.WebSocketMessageServlet"%>
<%
	/* String user = (String)session.getAttribute("user");*//*
	if(user == null){
		//为用户生成昵称
		user = "游客" + WebSocketMessageServlet.ONLINE_USER_COUNT;
		WebSocketMessageServlet.ONLINE_USER_COUNT ++;
		session.setAttribute("user", user);
	}
	pageContext.setAttribute("user", user); */
%>
<html>
<head>
	<title>WebSocket 聊天室</title>
	<!-- 引入CSS文件 -->
	<link rel="stylesheet" type="text/css" href="ext4/resources/css/ext-all.css">
	<link rel="stylesheet" type="text/css" href="ext4/shared/example.css" />
	<link rel="stylesheet" type="text/css" href="css/websocket.css" />
	
	<!-- 映入Ext的JS开发包，及自己实现的webscoket. -->
	<script type="text/javascript" src="ext4/ext-all-debug.js"></script>
	<script type="text/javascript" src="js/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="websocket.js"></script>
	<script type="text/javascript">
		var user = "${user.username}";
		/* $(function(){
			alert("1111111");
			console.log($(".x-grid-cell-inner "));
		$(".x-grid-cell-inner ").click(function(){
			alert("111");
		})
		}
		) */
	</script>
</head>

<body>
<h1>在线咨询聊天室</h1>
<p>本群成员须知，应遵守国家有关法律，网络礼仪，遵守爱聊网站的规定，使用恰当的语言文明聊天。<br>任何人不得在聊天室中发布含有下列内容之一的文字，声音，视频信息：<br></p>
<ol class="feature-list" style="padding-left: 10px; color:red;">
	<li>不得传播违反宪法所确定的基本原则的信息;</li>
	<li>不得传播危害国家安全、泄露国家秘密、损害国家荣誉和利益、颠覆国家政权、破坏国家统一的信息;</li>
	<li>不得传播散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的的信息;</li>
	<li>不得传播扰乱社会秩序、破坏社会稳定的谣言、言论;</li>
	<li>不得传播宣扬种族歧视、煽动民族仇恨、破坏民族团结的言论;</li>
	<li>不得传播破坏国家宗教政策，宣扬邪教和封建迷信的言论;</li>
	<li>不得发表漫骂、辱骂、对他人进行人身攻击、人格侮辱、侵害他人隐私、侵害他人合法权益的言论;</li>
	<li>不得传播含有法律禁止的其他内容的的言论;</li>
</ol>
<!-- 本群成员须知，应遵守国家有关法律，网络礼仪，遵守爱聊网站的规定，使用恰当的语言文明聊天。
一、任何人不得在聊天室中发布含有下列内容之一的文字，声音，视频信息：
(1).不得传播违反宪法所确定的基本原则的信息；
(2).不得传播危害国家安全、泄露国家秘密、损害国家荣誉和利益、颠覆国家政权、破坏国家统一的信息；
(3).不得传播散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的的信息；
(4).不得传播扰乱社会秩序、破坏社会稳定的谣言、言论；
(5).不得传播宣扬种族歧视、煽动民族仇恨、破坏民族团结的言论；
(6).不得传播破坏国家宗教政策，宣扬邪教和封建迷信的言论；
(7).不得发表漫骂、辱骂、对他人进行人身攻击、人格侮辱、侵害他人隐私、侵害他人合法权益的言论；
(8).不得传播含有法律禁止的其他内容的的言论。 -->
<div hidden="hidden">
	<h1>WebSocket聊天室</h1>
	<p>通过HTML5标准提供的API与Ext富客户端框架相结合起来，实现聊天室，有以下特点：</p>
	<ul class="feature-list" style="padding-left: 10px;">
		<li>实时获取数据，由服务器推送，实现即时通讯</li>
		<li>利用WebSocket完成数据通讯，区别于轮询，长连接等技术，节省服务器资源</li>
		<li>结合Ext进行页面展示</li>
		<li>用户上线下线通知</li>
	</ul>
	<div id="websocket_button"></div>
</div>
</body>
</html>
