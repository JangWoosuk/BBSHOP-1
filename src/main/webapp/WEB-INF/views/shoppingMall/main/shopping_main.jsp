<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/shopping_header.jsp" %>

<!-- home_banner_slide 에 필요한 외부 링크 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">-->

<style>
.img-fluid {
	width: 250px; /* img width : 200px or 250px로 통일  */
}

.carousel-inner img {
	height: 550px;
}
.carousel-indicators {
	top: 550px;
	width: auto;
	height: 30px;
}
.carousel-indicators li {
	position: relative;
	width: 50px;
	height: 10px;
	margin-right: 5px;
	margin-left: 5px;
	background-color: #eae5e5;
	border-color: #eae5e5;
	border-style: solid;
	border-width: 1px;
}
.carousel-indicators .active {
	border-color: darkgreen;
	background-color: darkgreen;
}
.section_gap {
	padding: 80px 0px;
}

/* 로그인 모달 추가 */
#loginModal {
	opacity: 0.9;
}
</style>


<!--================Home Banner Area =================-->
<section class="home_banner_area">
	<div class="home_banner_img" style="padding-top:120px;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			  
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active">
				</li>
				<li data-target="#myCarousel" data-slide-to="1">
				</li>
				<li data-target="#myCarousel" data-slide-to="2">
				</li>
			</ol>
			
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="resources/shoppingMall/img/banner/main-bg-1.jpg" alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="resources/shoppingMall/img/banner/main-bg-2.JPG" alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="resources/shoppingMall/img/banner/main-bg-3.JPG" alt="Third slide">
				</div>
			</div>
			
		</div>
	</div>
</section>
<!--============== End Home Banner Area ==============-->


	<!--============추천상품 공간 : 전달받은 추천상품리스트를 출력=============-->
	<!--================Feature Product Area =================-->
	<div class="container">
	<section class="feature_product_area section_gap">
		<div class="main_box">
			<div class="container-fluid">
				<!-- 추천상품 배너부분 -->
				<div class="row" style="background-color : #57c051; margin-bottom : 40px; border-radius : 30px;">
					<div class="main_title" style="margin : 20px auto;">
						<h2 style="color : white; font-weight : bold; margin-bottom: 0px;">추천 상품</h2>
					</div>
				</div>
				
				<!-- 상품 list !반복! -->
				<div class="row">
				
<!-- 					<div class="col col1"> -->
<!-- 						<div class="f_p_item"> -->
<!-- 							<div class="f_p_img"> -->
<!-- 								<img class="img-fluid" src="resources/shoppingMall/img/product/feature-product/f-p-6.jpg" alt=""> -->
<!-- 							</div> -->
<!-- 							<a href="#"> -->
<!-- 								<h4>모리모토 195MBG 아이웹 내야</h4> -->
<!-- 							</a> -->
<!-- 							<h5>119,000원</h5> -->
<!-- 						</div> -->
<!-- 					</div> -->

					<!-- 상품 출력  -->
						<c:forEach items="${recommendList}" var="goods">
						<div class="col">
							<div class="f_p_item">
								<div class="f_p_img">
									<a href="/goods_info.do?goods_num=${goods.goods_num }&&category=${goods.category}"><img class="img-fluid" src="<c:out value='${goods.main_img }' />" ></a>
								</div>
								<a href="#">
									<h4><c:out value="${goods.name }" /></h4>
								</a>
								<h5><c:out value="${goods.price }" />원</h5>
							</div>
						</div>
						</c:forEach>
					<!-- end 상품 출력 -->
						
				</div>
				<!-- 상품 list 반복 끝 -->

				<!-- 페이지 출력 - script 항상 같이 따라가야함 -->
<!-- 				<div class="row"> -->
<!-- 					<nav class="cat_page mx-auto" aria-label="Page navigation example"> -->
<!-- 						<ul class="pagination"> -->
<!-- 							<li class="page-item page-item-left"> -->
<!-- 								<a class="page-link" href="#"> -->
<!-- 									<i class="fa fa-chevron-left" aria-hidden="true"></i> -->
<!-- 								</a> -->
<!-- 							</li> -->
<!-- 							<li class="page-item active"> -->
<!-- 								<a class="page-link" href="#">01</a> -->
<!-- 							</li> -->
<!-- 							<li class="page-item"> -->
<!-- 								<a class="page-link" href="#">02</a> -->
<!-- 							</li> -->
<!-- 							<li class="page-item"> -->
<!-- 								<a class="page-link" href="#">03</a> -->
<!-- 							</li> -->
<!-- 							<li class="page-item"> -->
<!-- 								<a class="page-link" href="#">04</a> -->
<!-- 							</li> -->
<!-- 							<li class="page-item"> -->
<!-- 								<a class="page-link" href="#">05</a> -->
<!-- 							</li> -->
<!-- 							<li class="page-item page-item-right"> -->
<!-- 								<a class="page-link" href="#"> -->
<!-- 									<i class="fa fa-chevron-right" aria-hidden="true"></i> -->
<!-- 								</a> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 					</nav> -->
<!-- 				</div> -->
			</div>
		</div>
	</section>
	<!--================End Feature Product Area =================-->

<%@ include file="../include/shopping_footer.jsp" %>