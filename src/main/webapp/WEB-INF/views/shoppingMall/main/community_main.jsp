<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../include/community_header.jsp"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">



<link rel="stylesheet" href="resources/community/css/bootstrap.css">
<link rel="stylesheet" href="resources/community/css/animate.css">
<link rel="stylesheet"
	href="resources/community/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/community/css/aos.css">

<link rel="stylesheet"
	href="resources/shoppingMall/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="resources/shoppingMall/fonts/fontawesome/css/font-awesome.min.css">

<!-- Theme Style -->
<link rel="stylesheet" href="resources/community/css/style.css">
<style>
#videobcg {
	position: absolute;
	top: 202px;
	left: 0px;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -1000;
	overflow: hidden;
	opacity: 0.3;
}
</style>
</head>
<body>
	<section class="section visit-section" id="next-section">
		<div
			style="background-color: #70e270; width: 100%; min-height: 200px;">
			<table align="center">
				<!-- 전체 게시판으로 이동 -->
				<tr>
					<!-- KBO 게시판으로 이동 -->
					<td></td>
					<td></td>
					<td><div class="col-lg-2.5 col-md-5.5 visit mb-2.5"
							data-aos="fade-up">
							<a href="/community_list.do?TEAM_NAME=kbo"><img
								src="resources/community/img/kbo_main.png"
								alt="Image placeholder" class="img-fluid rounded"
								style="width: 200px; height: 200px; margin-bottom: 0px; margin-left: 45px;">
							</a>
						</div></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-12" align="center"></div>
			</div>

			<div class="row">
				<table align="center">
					<!-- 엘지 트윈스 게시판으로 이동 -->
					<tr>
						<td><div class="col-lg-2.5 col-md-5.5 visit mb-2.5"
								data-aos="fade-up">
								<a href="community_list.do?TEAM_NAME=lg"><img
									src="resources/community/img/lgtwins_main.png"
									alt="Image placeholder" class="img-fluid rounded"> </a>
							</div></td>

						<!-- 롯데 자이언츠 게시판으로 이동 -->
						<td><div class="col-lg-2.5 col-md-5.5 visit mb-2.5"
								data-aos="fade-up" data-aos-delay="100">
								<a href="/community_list.do?TEAM_NAME=lotte"><img
									src="resources/community/img/lottegiants_main.png"
									alt="Image placeholder" class="img-fluid rounded"> </a>
							</div></td>

						<!-- 한화 이글스 게시판으로 이동 -->
						<td>
							<div class="col-lg-2.5 col-md-5.5 visit mb-2.5"
								data-aos="fade-up" data-aos-delay="200">
								<a href="/community_list.do?TEAM_NAME=hanwha"><img
									src="resources/community/img/hanwhaeagles_main.png"
									alt="Image placeholder" class="img-fluid rounded"> </a>
							</div>
						</td>

						<!-- 기아 타이거즈 게시판으로 이동 -->
						<td>
							<div class="col-lg-2.5 col-md-5.5 visit mb-2.5"
								data-aos="fade-up" data-aos-delay="300">
								<a href="/community_list.do?TEAM_NAME=kia"><img
									src="resources/community/img/kiatigers_main.png"
									alt="Image placeholder" class="img-fluid rounded"> </a>
							</div>
						</td>

						<!-- 두산 베어스 게시판으로 이동 -->
						<td>
							<div class="col-lg-2.5 col-md-5.5 visit mb-2.5"
								data-aos="fade-up">
								<a href="/community_list.do?TEAM_NAME=doosan"><img
									src="resources/community/img/doosanbears_main.png"
									alt="Image placeholder" class="img-fluid rounded"> </a>
							</div>
						</td>
					</tr>
					<tr>
						<!-- 엔씨 다이노스 게시판으로 이동 -->
						<td>
							<div class="col-lg-2.5 col-md-5.5 visit mb-2.5"
								data-aos="fade-up" data-aos-delay="100">
								<a href="/community_list.do?TEAM_NAME=nc"><img
									src="resources/community/img/ncdinos_main.png"
									alt="Image placeholder" class="img-fluid rounded"> </a>
							</div>
						</td>

						<!-- 삼성 라이온즈 게시판으로 이동 -->
						<td>
							<div class="col-lg-2.5 col-md-5.5 visit mb-2.5"
								data-aos="fade-up" data-aos-delay="200">
								<a href="/community_list.do?TEAM_NAME=samsung"><img
									src="resources/community/img/samsunglions_main.png"
									alt="Image placeholder" class="img-fluid rounded"> </a>
							</div>
						</td>

						<!-- 키움 히어로즈 게시판으로 이동 -->
						<td>
							<div class="col-lg-2.5 col-md-5.5 visit mb-2.5"
								data-aos="fade-up" data-aos-delay="300">
								<a href="/community_list.do?TEAM_NAME=kiwoom"><img
									src="resources/community/img/kiwoomheroes_main.png"
									alt="Image placeholder" class="img-fluid rounded"> </a>
							</div>
						</td>

						<!-- SK 와이번즈 게시판으로 이동 -->
						<td>
							<div class="col-lg-2.5 col-md-5.5 visit mb-2.5"
								data-aos="fade-up" data-aos-delay="300">
								<a href="/community_list.do?TEAM_NAME=sk"><img
									src="resources/community/img/skwyverns_main.png"
									alt="Image placeholder" class="img-fluid rounded"> </a>
							</div>
						</td>

						<!-- 케이티 위즈 게시판으로 이동 -->
						<td>
							<div class="col-lg-2.5 col-md-5.5 visit mb-2.5"
								data-aos="fade-up" data-aos-delay="300">
								<a href="/community_list.do?TEAM_NAME=kt"><img
									src="resources/community/img/ktwiz_main.png"
									alt="Image placeholder" class="img-fluid rounded"> </a>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<!-- END row -->
		</div>
		<!-- END container -->
	</section>
	<!-- END section -->


	<!-- 동영상 배경 삽입 -->
	<video id="videobcg" preload="auto" autoplay="true" loop="loop"
		muted="muted" volume="0">
		<source src="resources/community/img/baseball_park.mp4"
			type="video/mp4">
	</video>
	<!-- Javascript -->
	<script src="resources/community/js/jquery-3.2.1.min.js"></script>
	<script src="resources/community/js/popper.min.js"></script>
	<script src="resources/community/js/bootstrap.min.js"></script>
	<script src="resources/community/js/owl.carousel.min.js"></script>
	<script src="resources/community/js/jquery.waypoints.min.js"></script>
	<script src="resources/community/js/aos.js"></script>
	<script src="resources/community/js/main.js"></script>

</body>
</html>