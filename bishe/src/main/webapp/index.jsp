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
<!-- End Modules -->
<!-- Google services -->
<!--<script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1','packages':['corechart']}]}"></script>

&lt;!&ndash; end Google services &ndash;&gt;
&lt;!&ndash; Fancybox &ndash;&gt;
<script src="js/fancybox/jquery.fancybox.pack.js"></script>
<script src="js/fancybox/jquery.mousewheel.pack.js"></script>
<script src="js/fancybox/jquery.fancybox.custom.js"></script>-->
<!-- End Fancybox -->

<script src="js/cookie.js"></script>
<script src="js/main/main.js"></script>

<!-- Bootstrap css -->
<link type="text/css" rel='stylesheet' href="css/bootstrap.min.css">

<!-- End Bootstrap css -->


<!-- Fancybox -->
<!--<link type="text/css" rel='stylesheet' href="js/fancybox/jquery.fancybox.css">-->
<!-- End Fancybox -->

<!--<link type="text/css" rel='stylesheet' href="fonts/fonts.css">-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&amp;subset=latin,cyrillic-ext'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<link type="text/css" data-themecolor="default" rel='stylesheet'
	href="css/main-default.css">


<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<body>
	<div class="mask-l"
		style="background-color: #fff; width: 100%; height: 100%; position: fixed; top: 0; left: 0; z-index: 9999999;"></div>
	<!--removed by integration-->
	<header>

		<!-- <div class="container b-header__box b-relative">

    <div class="b-header-r b-right b-header-r&#45;&#45;icon">

      <div class="b-top-nav-show-slide f-top-nav-show-slide b-right j-top-nav-show-slide"><i class="fa fa-align-justify"></i></div>
      <nav class="b-top-nav f-top-nav b-right j-top-nav">
          <ul class="b-top-nav__1level_wrap">
    <li class="b-top-nav__1level f-top-nav__1level is-active-top-nav__1level f-primary-b"><a href="#"><i class="fa fa-home b-menu-1level-ico"></i>首页 <span class="b-ico-dropdown"><i class="fa fa-arrow-circle-down"></i></span></a>

    </li>

    <li class="b-top-nav__1level f-top-nav__1level f-primary-b">
        <a href="#"><i class="fa fa-picture-o b-menu-1level-ico"></i>Portfolio <span class="b-ico-dropdown"><i class="fa fa-arrow-circle-down"></i></span></a>

    </li>
    <li class="b-top-nav__1level f-top-nav__1level f-primary-b">
        <a href="#"><i class="fa fa-code b-menu-1level-ico"></i>Blog <span class="b-ico-dropdown"><i class="fa fa-arrow-circle-down"></i></span></a>

    </li>
    <li class="b-top-nav__1level f-top-nav__1level f-primary-b b-top-nav-big">
        <a href="#"><i class="fa fa-cloud-download b-menu-1level-ico"></i>Pages<span class="b-ico-dropdown"><i class="fa fa-arrow-circle-down"></i></span></a>

    </li>

    <li class="b-top-nav__1level f-top-nav__1level f-primary-b">
        <a href="#"><i class="fa fa-folder-open b-menu-1level-ico"></i>Contact us<span class="b-ico-dropdown"><i class="fa fa-arrow-circle-down"></i></span></a>
    </li>

</ul>

      </nav>
    </div>
  </div>-->
		<input type="hidden" id="usercontainer" value="${sessionScope.user}">
		<div id="head">
			<div id="headimg">
				<img src="img/首页.jpg" id="logo" class="img-responsive">
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
										首页<span class="sr-only">(current)</span>
									</button></li>
								<li><button type="button" class="btn btn-link  navbar-btn"
										id="guanyuyangsheng">关于养生</button></li>
								<li><button type="button" class="btn btn-link  navbar-btn"	id="yangshengxinde" onclick="seachArticleWithType(this.value)" value="1">养生心得</button></li>
								<li><button type="button" class="btn btn-link  navbar-btn"	onclick="seachArticleWithType(this.value)" value="7">新闻动态</button></li>
								<li><button type="button" class="btn btn-link  navbar-btn"	 onclick="seachArticleWithType(this.value)" value="2">养生保健</button></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">四季养生 <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="#">春季养生</a></li>
										<li><a href="#">夏季养生</a></li>
										<li><a href="#">秋季养生</a></li>
										<li><a href="#">冬季养生</a></li>
									</ul></li>
								<li><button type="button" class="btn btn-link  navbar-btn"	id="chatting" onclick="chatting()" >在线咨询</button></li>
							</ul>

							<ul class="nav navbar-nav navbar-right">
								<!-- <li><button type="button" class="btn btn-link  navbar-btn" id="register" >注册</button></li> -->
								<li><button type="button" class="btn btn-link  navbar-btn"	id="login">登录</button></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" id="user" role="button"
									aria-haspopup="true" aria-expanded="false"> <s:if test="#session.user!=null">${sessionScope.user.username}</s:if>
										<s:else>请先登录</s:else> <span class="caret"></span><input
										type="hidden" value="${sessionScope.user.username}"
										id="storeusername"></a>
									<ul class="dropdown-menu">
										<li class="text-center"><button
												style="background-color: #FFF" onclick="writearticle()"
												id="writearticle">写文章</button></li>
										<li class="text-center"><button
												style="background-color: #FFF" onclick="loginout()"
												id="loginout">注销</button></li>
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

	<!--div class="b-inner-page-header f-inner-page-header b-bg-header-inner-page">
  <div class="b-inner-page-header__content">
    <div class="container">
      <h1 class="f-primary-l c-default">Blog Listing Left Sidebar</h1>
    </div>
  </div>
</div>-->
	<div class="l-main-container">

		<!-- <div class="b-breadcrumbs f-breadcrumbs">
        <div class="container">
            <ul>
                <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                <li><i class="fa fa-angle-right"></i><a href="#">Blog</a></li>
                <li><i class="fa fa-angle-right"></i><span>Listing Left Sidebar</span></li>
            </ul>
        </div>
    </div> -->

		<div class="l-inner-page-container">
			<div class="container">
				<div class="row">
					<div class="col-md-9 col-md-push-3" id="right_page">
						<!--  <div class="b-blog-listing__block">
                        <div class="b-blog-listing__block-top">
                            <div class=" view view-sixth">
    <img data-retina="" src="img/blog/blog_listing.jpg" alt="">

</div>
                        </div>
                        <div class="b-infoblock-with-icon b-blog-listing__infoblock">
                            <a href="#" class="b-infoblock-with-icon__icon f-infoblock-with-icon__icon fade-in-animate hidden-xs">
                                <i class="fa fa-pencil"></i>
                            </a>
                            <div class="b-infoblock-with-icon__info f-infoblock-with-icon__info">
                                <a href="#" class="f-infoblock-with-icon__info_title b-infoblock-with-icon__info_title f-primary-l b-title-b-hr f-title-b-hr">
                                    Mauris ac risus neque, ut pulvinar risus
                                </a>
                                <div class="f-infoblock-with-icon__info_text b-infoblock-with-icon__info_text f-primary-b b-blog-listing__pretitle">
                                    By <a href="#" class="f-more">Stephen Brock</a> In <a href="#" class="f-more">Lifestyle</a>, <a href="#" class="f-more">Photography</a> Posted May 24th, 2013
                                    <a href="#" class="f-more b-blog-listing__additional-text f-primary"><i class="fa fa-comment"></i>12 Comments</a>
                                </div>
                                <div class="f-infoblock-with-icon__info_text b-infoblock-with-icon__info_text c-primary b-blog-listing__text">
                                    Pendisse blandit ligula turpis, ac convallis risus fermentum non. Duis vestibulum quis quam vel accumsan. Nunc a vulputate lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum. Vestibulum pretium blandit tellus, sodales volutpat sapien varius vel. Phasellus tristique cursus erat, a placerat tellus laoreet eget. Blandit ligula turpis, ac convallis risus fermentum non. Duis vestibulum quis.
                                </div>
                                <div class="f-infoblock-with-icon__info_text b-infoblock-with-icon__info_text">
                                    <a href="#" class="f-more f-primary-b">Read more</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="b-blog-listing__block">
                        <div class="b-video-player b-blog-listing__block-top">
                            <iframe src="http://player.vimeo.com/video/81801013?title=0&amp;byline=0&amp;portrait=0&amp;badge=0" width="870" height="460" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                        </div>
                        <div class="b-infoblock-with-icon b-blog-listing__infoblock">
                            <a href="#" class="b-infoblock-with-icon__icon f-infoblock-with-icon__icon fade-in-animate hidden-xs">
                                <i class="fa fa-video-camera"></i>
                            </a>
                            <div class="b-infoblock-with-icon__info f-infoblock-with-icon__info">
                                <a href="#" class="f-infoblock-with-icon__info_title b-infoblock-with-icon__info_title f-primary-l b-title-b-hr f-title-b-hr">
                                    This Is Vimeo video post
                                </a>
                                <div class="f-infoblock-with-icon__info_text b-infoblock-with-icon__info_text f-primary-b b-blog-listing__pretitle">
                                    By <a href="#" class="f-more">Stephen Brock</a> In <a href="#" class="f-more">Lifestyle</a>, <a href="#" class="f-more">Photography</a> Posted May 24th, 2013
                                    <a href="#" class="f-more b-blog-listing__additional-text f-primary"><i class="fa fa-comment"></i>12 Comments</a>
                                </div>
                                <div class="f-infoblock-with-icon__info_text b-infoblock-with-icon__info_text c-primary b-blog-listing__text">
                                    Pendisse blandit ligula turpis, ac convallis risus fermentum non. Duis vestibulum quis quam vel accumsan. Nunc a vulputate lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum. Vestibulum pretium blandit tellus, sodales volutpat sapien varius vel. Phasellus tristique cursus erat, a placerat tellus laoreet eget. Blandit ligula turpis, ac convallis risus fermentum non. Duis vestibulum quis.
                                </div>
                                <div class="f-infoblock-with-icon__info_text b-infoblock-with-icon__info_text">
                                    <a href="#" class="f-more f-primary-b">Read more</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="b-pagination f-pagination">
    <ul>
        <li><a href="#">First</a></li>
        <li><a class="prev" href="#"><i class="fa fa-angle-left"></i></a></li>
        <li class="is-active-pagination"><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a class="next" href="#"><i class="fa fa-angle-right"></i></a></li>
        <li><a href="#">Last</a></li>
    </ul>
</div> -->
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
									<ul>
										<li><a class="f-categories-filter_name" href="#"><i
												class="fa fa-plus"></i> Web Design</a> <span
											class="b-categories-filter_count f-categories-filter_count">12</span>
										</li>
										<li><a class="f-categories-filter_name" href="#"><i
												class="fa fa-plus"></i> Smart Phone</a> <span
											class="b-categories-filter_count f-categories-filter_count">23</span>
										</li>
										<li><a class="f-categories-filter_name" href="#"><i
												class="fa fa-plus"></i> Latop</a> <span
											class="b-categories-filter_count f-categories-filter_count">12</span>
										</li>
										<li><a class="f-categories-filter_name" href="#"><i
												class="fa fa-plus"></i> Apple Store</a> <span
											class="b-categories-filter_count f-categories-filter_count">23</span>
										</li>
										<li><a class="f-categories-filter_name" href="#"><i
												class="fa fa-plus"></i> Wordpress Theme</a> <span
											class="b-categories-filter_count f-categories-filter_count">12</span>
										</li>
										<li><a class="f-categories-filter_name" href="#"><i
												class="fa fa-plus"></i> Web Design</a> <span
											class="b-categories-filter_count f-categories-filter_count">23</span>
										</li>
										<li><a class="f-categories-filter_name" href="#"><i
												class="fa fa-plus"></i> Sport</a> <span
											class="b-categories-filter_count f-categories-filter_count">12</span>
										</li>
										<li><a class="f-categories-filter_name" href="#"><i
												class="fa fa-plus"></i> Fashion</a> <span
											class="b-categories-filter_count f-categories-filter_count">23</span>
										</li>
									</ul>
								</div>
							</div>
							<div class="col-md-12">
								<h4
									class="f-primary-b b-h4-special  f-h4-special--gray f-h4-special">热门文章</h4>

								<div
									class="b-blog-short-post b-blog-short-post--img-hover-bordered b-blog-short-post--w-img f-blog-short-post--w-img row">
									<div
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
							<!--<div class="col-md-12">
        <h4 class="f-primary-b b-h4-special f-h4-special&#45;&#45;gray f-h4-special">tags cloud</h4>
        <div>
    <a class="f-tag b-tag" href="#">Dress</a>
    <a class="f-tag b-tag" href="#">Mini</a>
    <a class="f-tag b-tag" href="#">Skate animal</a>
    <a class="f-tag b-tag" href="#">Lorem ipsum</a>
    <a class="f-tag b-tag" href="#">literature</a>
    <a class="f-tag b-tag" href="#">Baroque</a>
    <a class="f-tag b-tag" href="#">Dress</a>
    <a class="f-tag b-tag" href="#">Mini</a>
    <a class="f-tag b-tag" href="#">Skate animal</a>
    <a class="f-tag b-tag" href="#">Lorem ipsum</a>
    <a class="f-tag b-tag" href="#">literature</a>
    <a class="f-tag b-tag" href="#">Baroque</a>
</div>
    </div>-->
						</div>
					</div>
				</div>
			</div>
		</div>



	</div>

	<footer>
		<!--  <div class="b-footer-primary">
    <div class="container">
        <div class="row">
            <div class="col-sm-4 col-xs-12 f-copyright b-copyright">Copyright © 2014 - All Rights Reserved .More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></div>
            <div class="col-sm-8 col-xs-12">
                <div class="b-btn f-btn b-btn-default b-right b-footer__btn_up f-footer__btn_up j-footer__btn_up">
                    <i class="fa fa-chevron-up"></i>
                </div>
                <nav class="b-bottom-nav f-bottom-nav b-right hidden-xs">
                    <ul>
                        <li><a href="#">Homepage</a></li>
                        <li class="is-active-bottom-nav"><a href="#">Headers</a></li>
                        <li><a href="#">Portfolio</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Pages</a></li>
                        <li><a href="#">Shortcode</a></li>
                        <li><a href="#">Shop</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>-->
		<div class="container">
			<div class="b-footer-secondary row">
				<div
					class="col-md-3 col-sm-12 col-xs-12 f-center b-footer-logo-containter">

					<div class="b-footer-logo-text f-footer-logo-text">
						<p>Mauris rhoncus pretium porttitor. Cras scelerisque commodo
							odio.</p>
						<div class="b-btn-group-hor f-btn-group-hor">
							<a href="#" class="b-btn-group-hor__item f-btn-group-hor__item">
								<i class="fa fa-twitter"></i>
							</a> <a href="#" class="b-btn-group-hor__item f-btn-group-hor__item">
								<i class="fa fa-facebook"></i>
							</a> <a href="#" class="b-btn-group-hor__item f-btn-group-hor__item">
								<i class="fa fa-dribbble"></i>
							</a> <a href="#" class="b-btn-group-hor__item f-btn-group-hor__item">
								<i class="fa fa-behance"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-12 col-xs-12">
					<h4 class="f-primary-b">Latest blog posts</h4>
					<div class="b-blog-short-post row">
						<div
							class="b-blog-short-post__item col-md-12 col-sm-4 col-xs-12 f-primary-b">
							<div
								class="b-blog-short-post__item_text f-blog-short-post__item_text">
								<a href="#">Amazing post with all the goodies</a>
							</div>
							<div
								class="b-blog-short-post__item_date f-blog-short-post__item_date">
								March 23, 2013</div>
						</div>
						<div
							class="b-blog-short-post__item col-md-12 col-sm-4 col-xs-12 f-primary-b">
							<div
								class="b-blog-short-post__item_text f-blog-short-post__item_text">
								<a href="#">Amazing post with all the goodies</a>
							</div>
							<div
								class="b-blog-short-post__item_date f-blog-short-post__item_date">
								March 23, 2013</div>
						</div>
						<div
							class="b-blog-short-post__item col-md-12 col-sm-4 col-xs-12 f-primary-b">
							<div
								class="b-blog-short-post__item_text f-blog-short-post__item_text">
								<a href="#">Amazing post with all the goodies</a>
							</div>
							<div
								class="b-blog-short-post__item_date f-blog-short-post__item_date">
								March 23, 2013</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-12 col-xs-12">
					<h4 class="f-primary-b">contact info</h4>
					<div class="b-contacts-short-item-group">
						<div class="b-contacts-short-item col-md-12 col-sm-4 col-xs-12">
							<div
								class="b-contacts-short-item__icon f-contacts-short-item__icon f-contacts-short-item__icon_lg b-left">
								<i class="fa fa-map-marker"></i>
							</div>
							<div class="b-remaining f-contacts-short-item__text">
								Frexy Studio<br /> 1234 Street Name, City Name,<br /> United
								States.<br />
							</div>
						</div>
						<div class="b-contacts-short-item col-md-12 col-sm-4 col-xs-12">
							<div
								class="b-contacts-short-item__icon f-contacts-short-item__icon b-left f-contacts-short-item__icon_md">
								<i class="fa fa-skype"></i>
							</div>
							<div
								class="b-remaining f-contacts-short-item__text f-contacts-short-item__text_phone">
								Skype: ask.company</div>
						</div>
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
				<!--<div class="col-md-3 col-sm-12 col-xs-12 ">
        <h4 class="f-primary-b">photo stream</h4>
          <div class="b-short-photo-items-group">
    <div class="b-column">
        <a class="b-short-photo-item fancybox" href="img/gallery/sm/gallery_1.jpg" title="photo stream" rel="footer-group"><img width="62" height="62" data-retina src="img/gallery/sm/gallery_1.jpg" alt=""/></a>
    </div>
    <div class="b-column">
        <a class="b-short-photo-item fancybox" href="img/gallery/sm/gallery_2.jpg" title="photo stream" rel="footer-group"><img width="62" height="62" data-retina src="img/gallery/sm/gallery_2.jpg" alt=""/></a>
    </div>
    <div class="b-column">
        <a class="b-short-photo-item fancybox" href="img/gallery/sm/gallery_3.jpg" title="photo stream" rel="footer-group"><img width="62" height="62" data-retina src="img/gallery/sm/gallery_3.jpg" alt=""/></a>
    </div>
    <div class="b-column">
        <a class="b-short-photo-item fancybox" href="img/gallery/sm/gallery_4.jpg" title="photo stream" rel="footer-group"><img width="62" height="62" data-retina src="img/gallery/sm/gallery_4.jpg" alt=""/></a>
    </div>
    <div class="b-column">
        <a class="b-short-photo-item fancybox" href="img/gallery/sm/gallery_5.jpg" title="photo stream" rel="footer-group"><img width="62" height="62" data-retina src="img/gallery/sm/gallery_5.jpg" alt=""/></a>
    </div>
    <div class="b-column">
        <a class="b-short-photo-item fancybox" href="img/gallery/sm/gallery_6.jpg" title="photo stream" rel="footer-group"><img width="62" height="62" data-retina src="img/gallery/sm/gallery_6.jpg" alt=""/></a>
    </div>
    <div class="b-column">
        <a class="b-short-photo-item fancybox" href="img/gallery/sm/gallery_7.jpg" title="photo stream" rel="footer-group"><img width="62" height="62" data-retina src="img/gallery/sm/gallery_7.jpg" alt=""/></a>
    </div>
    <div class="b-column">
        <a class="b-short-photo-item fancybox" href="img/gallery/sm/gallery_8.jpg" title="photo stream" rel="footer-group"><img width="62" height="62" data-retina src="img/gallery/sm/gallery_8.jpg" alt=""/></a>
    </div>
    <div class="b-column hidden-xs">
        <a class="b-short-photo-item fancybox" href="img/gallery/sm/gallery_9.jpg" title="photo stream" rel="footer-group"><img width="62" height="62" data-retina src="img/gallery/sm/gallery_9.jpg" alt=""/></a>
    </div>
    <div class="b-column hidden-sm hidden-xs">
        <a class="b-short-photo-item fancybox" href="img/gallery/sm/gallery_10.jpg" title="photo stream" rel="footer-group"><img width="62" height="62" data-retina src="img/gallery/sm/gallery_10.jpg" alt=""/></a>
    </div>
    <div class="b-column hidden-sm hidden-xs">
        <a class="b-short-photo-item fancybox" href="img/gallery/sm/gallery_11.jpg" title="photo stream" rel="footer-group"><img width="62" height="62" data-retina src="img/gallery/sm/gallery_11.jpg" alt=""/></a>
    </div>
    <div class="b-column hidden-sm hidden-xs">
        <a class="b-short-photo-item fancybox" href="img/gallery/sm/gallery_12.jpg" title="photo stream" rel="footer-group"><img width="62" height="62" data-retina src="img/gallery/sm/gallery_12.jpg" alt=""/></a>
    </div>
</div>
      </div>-->
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