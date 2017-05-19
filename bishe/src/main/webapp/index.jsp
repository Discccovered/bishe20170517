<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getRequestURI();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>

<base href="<%=basePath%>">
<head>

<meta charset="utf-8">
<title>在线养生咨询平台</title>

<!-- <link rel="shortcut icon" href="favicon.ico">-->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<style type="text/css">
body {
	margin: 0;
}

#foottitle{
	line-height: 1.5;
    color: #e26228;
    margin: 5px 0 10px 0;
    font-size: 1.53077em;
}

#logo {
	width: 100%;
	height: 260px;
}
/* .btn-link{
        	height:50px;
        	color:#333;
        	font-size: 13px;
        } */
label.error {
	background-repeat: no-repeat;
	padding-left: 18px;
	color: red;
}
</style>


<script src="js/jquery/jquery-1.11.1.min.js"></script>
<!-- bootstrap -->
<script src="js/bootstrap.min.js"></script>
<!-- end bootstrap -->


<!-- Modules -->
<script src="js/modules/color-themes.js"></script>
<script type="text/javascript" src="js/login/jquery.validate.min.js"></script>



<script src="js/cookie.js"></script>
<script src="js/main/main.js"></script>

<!-- Bootstrap css -->
<link type="text/css" rel='stylesheet' href="css/bootstrap.min.css">
<!-- <link type="text/css" rel='stylesheet' href="css/font-awesome.min.css">
 -->
<!-- End Bootstrap css -->


<link
	href='css/css[1].css'
	rel='stylesheet' type='text/css'>
<link
	href='css/css[2].css'
	rel='stylesheet' type='text/css'>

<link type="text/css" data-themecolor="default" rel='stylesheet'
	href="css/main-default.css">


<link rel="stylesheet"
	href="css/font-awesome.min.css">
</head>
<body>
	<div class="mask-l"
		style="background-color: #fff; width: 100%; height: 100%; position: fixed; top: 0; left: 0; z-index: 9999999;"></div>
	<!--removed by integration-->
	<header>
		<input type="hidden" id="usercontainer" value="${sessionScope.user}">
		<div id="head">
			<div id="headimg">
				<img src="img/ttt3.jpg" id="logo" class="img-responsive">
			</div>
			<div id="navigation">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="#">养生咨询平台</a>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li class="active"><button type="button"
										class="btn btn-link  navbar-btn" id="shouye">
										<i class="fa fa-home"></i>首页<span class="sr-only">(current)</span>
									</button></li>
								<li><button type="button" class="btn btn-link  navbar-btn"
										id="guanyuyangsheng"><i class="fa fa-bars"></i>关于养生</button></li>
								<li><button type="button" class="btn btn-link  navbar-btn"	id="yangshengxinde" onclick="seachArticleWithType(this.value)" value="1"><i class="fa fa-coffee"></i>养生心得</button></li>
								<li><button type="button" class="btn btn-link  navbar-btn"	onclick="createNewsPage(this.value)" value="7"><i class="fa fa-info"></i>新闻动态</button></li>
								<li><button type="button" class="btn btn-link  navbar-btn"	 onclick="seachArticleWithType(this.value)" value="2"><i class="fa fa-cutlery"></i>养生保健</button></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"><i class="fa fa-sun-o"></i>四季养生 <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><button type="button" class="btn btn-link  navbar-btn"	 onclick="seachArticleWithType(this.value)" value="3">春节养生</button></li>
										<li><button type="button" class="btn btn-link  navbar-btn"	 onclick="seachArticleWithType(this.value)" value="4">夏季养生</button></li>
										<li><button type="button" class="btn btn-link  navbar-btn"	 onclick="seachArticleWithType(this.value)" value="5">秋季养生</button></li>
										<li><button type="button" class="btn btn-link  navbar-btn"	 onclick="seachArticleWithType(this.value)" value="6">冬季养生</button></li>
									</ul></li>
									<li></li>
								<li><button type="button" class="btn btn-link  navbar-btn"	id="chatting" onclick="chatting()" ><i class="fa fa-wechat "></i>在线咨询</button></li>
							</ul>

							<ul class="nav navbar-nav navbar-right">
								<!-- <li><button type="button" class="btn btn-link  navbar-btn" id="register" >注册</button></li> -->
								<li><button type="button" class="btn btn-link  navbar-btn"	id="login"><i class="fa fa-sign-in"></i>登录</button></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" id="user" role="button"
									aria-haspopup="true" aria-expanded="false"> <s:if test="#session.user!=null"><i class="fa fa-user"></i>${sessionScope.user.username}</s:if>
										<s:else><i class="fa fa-smile-o"></i>请先登录</s:else> <span class="caret"></span><input
										type="hidden" value="${sessionScope.user.username}"
										id="storeusername"></a>
									<ul class="dropdown-menu">
										<li class="text-center"><a
												onclick="writearticle()"
												id="writearticle"><i class="fa fa-pencil"></i>写文章</a></li>
										<li class="text-center"><button
												style="background-color: #FFF" class="btn navbar-btn" onclick="loginout()"
												id="loginout"><i class="fa fa-sign-out"></i>注销</button></li>
									</ul></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid -->
				</nav>
			</div>
		</div>
	</header>
	<div class="j-menu-container"></div>

	
	<div class="l-main-container">

		

		<div class="l-inner-page-container">
			<div class="container">
				<div class="row">
					<div class="col-md-9 col-md-push-3" id="right_page">
					</div>
					<div class="visible-xs-block visible-sm-block b-hr"></div>
					<div class="col-md-3 col-md-pull-9">
						<div class="row">
							<div class="col-md-12">
								<div class="b-form-row b-input-search">
									<input class="form-control" type="text" id="keyword"
										placeholder="Enter your keywords" /> <span
										class="b-btn b-btn-search f-btn-search fa fa-search fa-2x"
										onclick="searchArctile()"></span>
								</div>
							</div>
						</div>
						<div class="row b-col-default-indent">
							<div class="col-md-12">
								<div class="b-categories-filter">
									<h4
										class="f-primary-b b-h4-special f-h4-special--gray f-h4-special">当前在线</h4>
									<ul id="onlinelist">
									</ul>
								</div>
							</div>
							<div class="col-md-12">
								<h4
									class="f-primary-b b-h4-special  f-h4-special--gray f-h4-special">热门文章</h4>

								<div 
									class="b-blog-short-post b-blog-short-post--img-hover-bordered b-blog-short-post--w-img f-blog-short-post--w-img row">
									<div id="hotarticle"
										class="b-blog-short-post b-blog-short-post--img-hover-bordered b-blog-short-post--w-img f-blog-short-post--w-img row">
										<div 
											class="b-blog-short-post--popular col-md-12  col-xs-12 f-primary-b">
											<div class="b-blog-short-post__item_img">
												<a href="#"><img data-retina
													src="img/gallery/sm/gallery_1.jpg" alt="" /></a>
											</div>
											<div class="b-remaining">
												<div
													class="b-blog-short-post__item_text f-blog-short-post__item_text">
													<a href="#">Phasellus id mattis dolorunc et erat
														hendrerit, tincidunt</a>
												</div>
												<div
													class="b-blog-short-post__item_date f-blog-short-post__item_date f-primary-it">
													10, January, 2014</div>
											</div>
										</div>
										<!--    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>-->
										<div
											class="b-blog-short-post--popular col-md-12  col-xs-12 f-primary-b">
											<div class="b-blog-short-post__item_img">
												<a href="#"><img data-retina
													src="img/gallery/sm/gallery_2.jpg" alt="" /></a>
											</div>
											<div class="b-remaining">
												<div
													class="b-blog-short-post__item_text f-blog-short-post__item_text">
													<a href="#">Vel eleifend id ullamcorper eu velit</a>
												</div>
												<div
													class="b-blog-short-post__item_date f-blog-short-post__item_date f-primary-it">
													14, January, 2014</div>
											</div>
										</div>
										<div
											class="b-blog-short-post--popular col-md-12  col-xs-12 f-primary-b">
											<div class="b-blog-short-post__item_img">
												<a href="#"><img data-retina
													src="img/gallery/sm/gallery_2.jpg" alt="" /></a>
											</div>
											<div class="b-remaining">
												<div
													class="b-blog-short-post__item_text f-blog-short-post__item_text">
													<a href="#">Lorem ipsum dolor sit amet purus vitae
														magna rhoncus</a>
												</div>
												<div
													class="b-blog-short-post__item_date f-blog-short-post__item_date f-primary-it">
													10, January, 2014</div>
											</div>
										</div>
										<div
											class="b-blog-short-post--popular col-md-12  col-xs-12 f-primary-b">
											<div class="b-blog-short-post__item_img">
												<a href="#"><img data-retina
													src="img/gallery/sm/gallery_3.jpg" alt="" /></a>
											</div>
											<div class="b-remaining">
												<div
													class="b-blog-short-post__item_text f-blog-short-post__item_text">
													<a href="#">Fusce vitae dui sit amet lacus rutrum
														convallis</a>
												</div>
												<div
													class="b-blog-short-post__item_date f-blog-short-post__item_date f-primary-it">
													10, January, 2014</div>
											</div>
										</div>
										<div
											class="b-blog-short-post--popular col-md-12  col-xs-12 f-primary-b @@hidden">
											<div class="b-blog-short-post__item_img">
												<a href="#"><img data-retina
													src="img/gallery/sm/gallery_1.jpg" alt="" /></a>
											</div>
											<div class="b-remaining">
												<div
													class="b-blog-short-post__item_text f-blog-short-post__item_text">
													<a href="#">Fusce vitae dui sit amet lacus rutrum
														convallis</a>
												</div>
												<div
													class="b-blog-short-post__item_date f-blog-short-post__item_date f-primary-it">
													10, January, 2014</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



	</div>

	<footer>
		
		<div class="container">
			<div class="b-footer-secondary row">
				<div class="col-md-12 col-sm-12 col-xs-12 f-center b-footer-logo-containter">
					<div class="b-footer-logo-text f-footer-logo-text">
						<h2 class="f-primary-b" id="foottitle">联系方式</h2>
					</div>
				</div>
				<div
					class="col-md-4 col-sm-12 col-xs-12 f-center b-footer-logo-containter">

					<div class="b-footer-logo-text f-footer-logo-text">
					<h4 class="f-primary-b">Address</h4>
						<div class="b-contacts-short-item col-md-12 col-sm-4 col-xs-12">
							<div class="b-contacts-short-item__icon f-contacts-short-item__icon f-contacts-short-item__icon_lg b-left">
								<i class="fa fa-map-marker"></i>
							</div>
							<div class="b-remaining f-contacts-short-item__text">
								中国安徽省淮南市安徽理工大学
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-12 col-xs-12 f-center">
					<h4 class="f-primary-b">Phone</h4>
					<div class="b-contacts-short-item col-md-12 col-sm-4 col-xs-12">
							<div class="b-contacts-short-item__icon f-contacts-short-item__icon b-left f-contacts-short-item__icon_md">
								<i class="fa fa-phone"></i>
							</div>
							<div class="b-remaining f-contacts-short-item__text f-contacts-short-item__text_phone">
								0554-1234567</div>
						</div>
				</div>
				<div class="col-md-4 col-sm-12 col-xs-12 f-center">
					<h4 class="f-primary-b">EMAIL</h4>
						<div class="b-contacts-short-item col-md-12 col-sm-4 col-xs-12">
							<div
								class="b-contacts-short-item__icon f-contacts-short-item__icon b-left f-contacts-short-item__icon_xs">
								<i class="fa fa-envelope"></i>
							</div>
							<div
								class="b-remaining f-contacts-short-item__text f-contacts-short-item__text_email">
								<a href="mailto:frexystudio@gmail.com">mail@example.com</a>
							</div>
						</div>
				</div>
			</div>
		</div>
	</footer>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="myModalLabel">文章</h3>
				</div>
				<div class="modal-body">
					<form action="" method="post" id="insertarticleform"
						name="insertarticleform">
						<div style="margin-top: 20px;">
							<label for="articletitle">文章标题：</label><input name="articletitle"
								type="text" id="articletitle" />
						</div>
						<div style="margin-top: 20px;">
							<label for="articletype">文章类型:</label><select id="articletype">
								<option value="1">个人心得</option>
								<option value="2">养生保健</option>
								<option value="3">春季养生</option>
								<option value="4">夏季养生</option>
								<option value="5">秋季养生</option>
								<option value="5">冬季养生</option>
							</select>
						</div>
						<div style="margin-top: 20px;">
							<label for="articleparagraph" class="pull-left">文章内容：</label>
							<textarea name="articleparagraph" id="articleparagraph" rows="20"
								class="col-md-10"></textarea>
						</div>

						<div class="clearfix"></div>
					</form>
				</div>
				<div class="modal-footer center-block">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="clearmodal()">取消</button>
					<button type="button" class="btn btn-primary" id="updatebutton"
						onclick="insertArticle()">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->


	</div>
</body>


</html>