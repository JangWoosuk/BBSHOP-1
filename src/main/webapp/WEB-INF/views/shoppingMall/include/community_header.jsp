<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" href="img/favicon.png" type="image/png">

	<title>야매샵</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="resources/shoppingMall/css/bootstrap.css">
	<link rel="stylesheet" href="resources/shoppingMall/vendors/linericon/style.css">
	<link rel="stylesheet" href="resources/shoppingMall/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/shoppingMall/vendors/owl-carousel/owl.carousel.min.css">
	<link rel="stylesheet" href="resources/shoppingMall/vendors/lightbox/simpleLightbox.css">
	<link rel="stylesheet" href="resources/shoppingMall/vendors/nice-select/css/nice-select.css">
	<link rel="stylesheet" href="resources/shoppingMall/vendors/animate-css/animate.css">
	<link rel="stylesheet" href="resources/shoppingMall/vendors/jquery-ui/jquery-ui.css">
	
	<!-- font -->
	<link href="//fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet" type="text/css">
	
	<!-- main css -->
	<link rel="stylesheet" href="resources/shoppingMall/css/style.css">
	<link rel="stylesheet" href="resources/shoppingMall/css/responsive.css">
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	
	<!-- basic bootstrap config -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
/* 반응형 main menu */
@media (min-width : 1601px) {
	.col-lg-7 {
		-ms-flex: 0 0 68%;
    	flex: 0 0 68%;
    	max-width: 68%
	}
	.col-lg-5 {
		-ms-flex: 0 0 32%;
    	flex: 0 0 32%;
    	max-width: 32%
	}
}
@media (max-width : 1600px) {
	.col-lg-7 {
		-ms-flex: 0 0 73%;
    	flex: 0 0 73%;
    	max-width: 73%
	}
	.col-lg-5 {
		-ms-flex: 0 0 27%;
    	flex: 0 0 27%;
    	max-width: 27%
	}
}

/* 폰트 : 나눔바른체 */
@font-face {
	font-family: 'NanumBarunpen';
	font-weight: normal;
	src: local(NanumBarunpen);
	src: url("resources/shoppingMall/fonts/nanumbarunpenR.eot");
	src: url("resources/shoppingMall/fonts/nanumbarunpenR.woff") format("woff"),
		url("resources/shoppingMall/fonts/nanumbarunpenR.woff2") format("woff2");
}
@font-face {
	font-family: 'NanumBarunpen';
	font-weight: bold;
	src: local(NanumBarunpen);
	src: url("resources/shoppingMall/fonts/nanumbarunpenB.eot");
	src: url("resources/shoppingMall/fonts/nanumbarunpenB.woff") format("woff"),
		url("resources/shoppingMall/fonts/nanumbarunpenB.woff2") format("woff2");
}
body {
	font-family: NanumBarunpen, sans-serif;
}

.pull-right {
    margin-left: auto;
    margin-right: auto;
}

.header_area .navbar .nav .nav-item.active .nav-link{
	color:#222222;
	font-size:25px;
	font-weight:bold;
}

.top_menu .right_side li a {
	font-size:16px;
	font-weight:bold;
}
</style>

</head>

<body>
	<!--================Header Menu Area =================-->
	<header class="header_area">
		<div class="top_menu row m0">
			<div class="container-fluid" style="max-width:1900px;">
				<div class="float-left">
				</div>
				<div class="float-right">
					<ul class="right_side">
						<li><a href="/savings.do"> 마이페이지 </a></li>
						<li><a href="/shopping_main.do"> 쇼핑몰 </a></li>
						<li><a href="/faq.do"> 고객센터 </a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container-fluid" style="max-width:1900px;">
					<!-- Brand and toggle get grouped for better mobile display -->
					<!-- 로고 주석 처리
					<a class="navbar-brand logo_h" href="/community_main">
						<img src="resources/shoppingMall/img/logo.png" alt="커뮤니티메인" style="visibility:hidden;">
					</a>
					-->
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
						<div class="row w-100">
								<ul class="nav navbar-nav center_nav pull-right">
									<li class="nav-item active"><a class="nav-link"
										href="/community_list.do?TEAM_NAME=kbo">KBO</a></li>
									<li class="nav-item active"><a class="nav-link"
										href="community_list.do?TEAM_NAME=lg">LG</a></li>
									<li class="nav-item active"><a class="nav-link"
										href="/community_list.do?TEAM_NAME=lotte">롯데</a></li>
									<li class="nav-item active"><a class="nav-link"
										href="/community_list.do?TEAM_NAME=hanwha">한화</a></li>
									<li class="nav-item active"><a class="nav-link"
										href="/community_list.do?TEAM_NAME=kia">기아</a></li>
									<li class="nav-item active"><a class="nav-link"
										href="/community_list.do?TEAM_NAME=doosan">두산</a></li>
									<li class="nav-item active"><a class="nav-link"
										href="/community_list.do?TEAM_NAME=nc">NC</a></li>
									<li class="nav-item active"><a class="nav-link"
										href="/community_list.do?TEAM_NAME=samsung">삼성</a></li>
									<li class="nav-item active"><a class="nav-link"
										href="/community_list.do?TEAM_NAME=kiwoom">키움</a></li>
									<li class="nav-item active"><a class="nav-link"
										href="/community_list.do?TEAM_NAME=sk">SK</a></li>
									<li class="nav-item active"><a class="nav-link"
										href="/community_list.do?TEAM_NAME=kt">KT</a></li>
								</ul>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</header>