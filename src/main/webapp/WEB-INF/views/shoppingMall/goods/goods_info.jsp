<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/shopping_header.jsp" %>
<head>
<style>
.tab-content>#home {
	text-align: center;
}

.form-group>#file {
	border-style: none;
	padding-left: 0px;
}

.fa-star:before {
	color: rgb(251, 214, 0);
}

.main_btn {
	width: 150px;
}

.option {
	padding-top: 8px;
}

.product_image_area {
	padding-top: 0px;
	font-weight: bold;
}

.s_product_text h3 {
	font-size: 30px;
	font-weight: bold;
}

.s_product_text h2 {
	font-weight: bold;
}

.s_product_img img {
	width: 500px !important;
	height: 500px;
}

a#default-select.default-select {
	display: none;
}

#qna_Modal, #review_Modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 100; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* 일반 검색 모달창 내용 */
.qna_Content, .review_Content {
	background-color: #fefefe;
	margin: 8% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}
#qna_Modal, #review_Modal {
	opacity: 1.0;
}
/* .review_item.reply { */
/*     padding-left: 50px; */
/* } */
.product_description_area .table-responsive table td h5 {
	font-weight : bold !important;
}
.product_description_area .table-responsive table .gd_info {
	display : none;
}
.product_description_area table tr {
	border-bottom : 1px solid lightgray;
	font-size : 16px;
}
.product_description_area table th {
	padding : 15px 0;
	text-align : center;
	font-color : black !important;
}
.product_description_area table td {
	padding : 15px 0;
	text-align : center;
	font-weight : normal;
	font-color : black !important;
}
.product_description_area table td .view {
	padding : 15px;
	font-color : black !important;
	font-weight : normal !important;
}
</style>

<script>
$(document).ready(function() {
	
	// QNA paging
	$(".qna-page-item").on("click", function(e) {
		
		e.preventDefault();	// a태그를 클릭해도 페이지이동이 없도록,
		
		$('.qna-page-item').removeClass("active");
		$(this).addClass("active");
		
		var page = $('.qna-page-item.active a').text();
		
		qnaList_Ajax();
	});
	
	// REVIEW paging
	$(".review-page-item").on("click", function(e) {
		
		e.preventDefault();	// a태그를 클릭해도 페이지이동이 없도록,
		
		$('.review-page-item').removeClass("active");
		$(this).addClass("active");
		
		var page = $('.review-page-item.active a').text();
		
		reviewList_Ajax();
	});
});

function qnaList_Ajax() {
	
	var qnaPageNum = $('.qna-page-item.active a').attr("href");
	
	if(qnaPageNum === undefined)
		qnaPageNum = 1;
	
	var qnaAmount = 10;
	var goods_num = ${goods.goods_num};
	
	var data = {};
	data["pageNum"] = qnaPageNum * 1;
	data["amount"] = qnaAmount;
	data["goods_num"] = goods_num;
	
	// 상품 목록이 들어갈 div 클래스 이름 - 초기화
	$('#qna_list').empty();
	
	$.ajax({
		type : "POST",
		url : "/getQnaList_Ajax.do",
		data : JSON.stringify(data),
		dataType: "json",
		contentType : "application/json",
		success : function(data) {
			$.each(data, function(index, qna) {
				var output = "";
				
				if(data[index].re_lev == 1) 
					output += "<tr class='table_item reply'><td style='color:red;'>답변</td>";
				else
					output += "<tr class='table_item'><td style='color:blue;'>질문</td>";
					
				
				output += "<td>" + data[index].title + "</td>";
				output += "<td>" + data[index].nickname + "</td>";
				output += "<td>" + data[index].regdate + "</td></tr>";
				
				output += "<tr class='table_content' style='display:none;'>";
				output += "<td colspan='4'><div class='view'><p>" + data[index].content + "</p></div></td></tr>";

				$('#qna_list').append(output);

			});
		},
		error : function() {alert('qna ajax 통신 실패!');}
	});
}

function reviewList_Ajax() {
	var reviewPageNum = $('.review-page-item.active a').attr("href");
	
	if(reviewPageNum === undefined)
		reviewPageNum = 1;
	
	var reviewAmount = ${reviewPageMaker.pagingVO.amount};
	var goods_num = ${goods.goods_num};
	
	var data = {};
	data["pageNum"] = reviewPageNum * 1;
	data["amount"] = reviewAmount;
	data["goods_num"] = goods_num;
	data["score"] = $('select#score option:selected').val() * 1;
	console.log(data);
	
	// 상품 목록이 들어갈 div 클래스 이름 - 초기화
	$('#review_list').empty();
	
	$.ajax({
		type : "POST",
		url : "/getReviewList_Ajax.do",
		data : JSON.stringify(data),
		dataType: "json",
		contentType : "application/json",
		success : function(data) {
			$.each(data, function(index, review) {
				var output = "";
				
				output += "<tr class='table_item'>";
				output += "<td>" + data[index].rv_num + "</td>";
				output += "<td>" + data[index].title + "</td>";
				
				output += "<td>";
				// 별점
				for(i=0; i<data[index].score; i++) {
					output += "<i class='fa fa-star'></i>"
				}
				output += "</td>";
				output += "<td>" + data[index].nickname + "</td>";
				output += "<td>" + data[index].re_date + "</td></tr>";
				
				output += "<tr class='table_content' style='display:none;'>";
				output += "<td colspan='5'><div class='view'><p>" + data[index].contents + "</p></div></td></tr>";
				
				$('#review_list').append(output);
			});
		},
		error : function() {alert('review ajax 통신 실패!');}
	});
}
function reviewScore_Ajax() {

	var goods_num = ${goods.goods_num};
	
	var data = {};
	data["goods_num"] = goods_num;
	
	$.ajax({
		type : "POST",
		url : "/getReviewScore_Ajax.do",
		data : JSON.stringify(data),
		dataType: "json",
		contentType : "application/json",
		success : function(data) {
			
			$('div.box_total').empty();
			var output = '';
			output += "<h5 style='font-weight:bold;'>평균 별점</h5>";
			output += "<h4>" + data.avg + "</h4>";
			$('div.box_total').append(output);
		
			$('div.rating_list').empty();
			var output = '';
			output += "<h3 style='font-weight:bold !important; color=black;'>총 " + data.total + "개의 후기</h3>";
			output += "<ul class='list'>";
			output += "<li>5 Star <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'>" +
				"</i><i class='fa fa-star'></i><i class='fa fa-star'></i>  " + data.scoreCount[4] + "개</li>";
			output += "<li>4 Star <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'>" +
				"</i><i class='fa fa-star'></i><i class='fa fa-star' style='visibility: hidden;'></i>  " + data.scoreCount[3] + "개</li>";
			output += "<li>3 Star <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'>" +
				"</i><i class='fa fa-star' style='visibility: hidden;'></i><i class='fa fa-star' style='visibility: hidden;'></i>  " + data.scoreCount[2] + "개</li>";
			output += "<li>2 Star <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star' style='visibility: hidden;'>" +
				"</i><i class='fa fa-star' style='visibility: hidden;'></i><i class='fa fa-star' style='visibility: hidden;'></i>  " + data.scoreCount[1] + "개</li>";
			output += "<li>1 Star <i class='fa fa-star'></i><i class='fa fa-star' style='visibility: hidden;'></i><i class='fa fa-star' style='visibility: hidden;'>" +
				"</i><i class='fa fa-star' style='visibility: hidden;'></i><i class='fa fa-star' style='visibility: hidden;'></i>  " + data.scoreCount[0] + "개</li></ul>";
			$('div.rating_list').append(output);
		},
		error : function() {alert('review score ajax 통신 실패!');}
	});
}
</script>
</head>

	<!--================Home Banner Area =================-->	
	<section class="banner_area">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>상품 정보</h2>
					<div class="page_link">
						<a href="/shopping_main">쇼핑몰</a>		
						<a href="/goods_list.do?category=${categoryInt }">${categoryString }</a>	<!-- 값 넣어주기 -->
						<a href="/goods_info.do?goods_num=${goods.goods_num }&&category=${categoryInt}">${goods.name }</a>	<!-- 값 넣어주기 -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->

	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<!-- 상품 이미지 부분 -->
				<div class="col-lg-6">
					<div class="s_product_img">
						<img class="d-block w-100" src=${goods.main_img } alt="">
					</div>
				</div>
				
				<!-- 상품정보, 옵션, 구매/장바구니 버튼 -->
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">	
						<!-- 상품명 -->
						<h3 id="product_name">${goods.name}</h3>
						<!-- 상품가격 -->
						<h2>${goods.price }원</h2>
						<!-- 옵션들 -->
						<ul class="list">
							<li>
								<!-- 카테고리 값, 클릭 시 페이지 이동--> 
								<a class="active" href="/goods_list.do?category=${categoryInt }">
									<span>카테고리</span><span style="padding-left:20px; color:red;" id="category">${categoryString }</span>
								</a>
							</li>
							<li>&nbsp;</li>
							<!-- select된 값 읽기  var value = $('#glove_hand option:selected').val(); -->
					<!-- 글러브 옵션 ---------------->
							<li>	
								 <a class="default-select glove" id="default-select" href="#none">
									<!-- 옵션1 -->
									<label for="glove_hand"><span class="option">좌 / 우</span></label>
									<select id="glove_hand" class="glove">
										<option value="0">좌투(오른손착용)</option>
										<option value="1">우투(왼손착용)</option>
									</select>
								</a>
							</li>
							<li>
								<a class="default-select glove" id="default-select" href="#none">
									<!-- 옵션2 -->
									<label for="glove_taming"><span class="option">길들이기</span></label>
									<select id="glove_taming" class="glove">
										<option value="0">선택안함</option>
										<option value="1">볼집+각잡기(+15000)</option>
									</select>
								</a>
							</li>
					<!-- ---------------------->
					<!-- 배트 옵션 ---------------->
							<li>	<!-- 배트 옵션 -->
								<a class="default-select bat" id="default-select" href="#none">
									<label for="bat_size"><span class="option">규격</span></label>
									<select id="bat_size" class="bat">
										<option value="33">33인치</option>
										<option value="32">32인치</option>
									</select>
								</a>
							</li>
					<!-- ---------------------->
					<!-- 유니폼 옵션 ---------------->
							<li>	<!-- 유니폼 옵션 -->
								<a class="default-select uniform" id="default-select" href="#none">
									<label for="uniform_size"><span class="option">사이즈</span></label>
									<select id="uniform_size" class="uniform">
										<option value="85">85</option>
										<option value="90">90</option>
										<option value="95">95</option>
										<option value="100">100</option>
										<option value="105">105</option>
									</select>
								</a>
							</li>
					<!-- ---------------------->
					<!-- 야구화 옵션 ---------------->
							<li>	<!-- 야구화 옵션 -->
								<a class="default-select shoes" id="default-select" href="#none">
									<label for="shoes_size"><span class="option">사이즈</span></label>
									<select id="shoes_size" class="shoes">
										<option value="230">230</option>
										<option value="240">240</option>
										<option value="250">250</option>
										<option value="260">260</option>
										<option value="270">270</option>
									</select>
								</a>
							</li>
							<li>
								<a class="default-select shoes" id="default-select" href="#none">
									<label for="shoes_spike"><span class="option">사이즈</span></label>
									<select id="shoes_spike" class="shoes">
										<option value="0">선택안함</option>
										<option value="1">스파이크(+5000)</option>
									</select>
								</a>
							</li>
					<!-- ---------------------->
					<!-- 야구공 옵션 ---------------->
							<li>	<!-- 야구공 옵션 -->
								<a class="default-select ball" id="default-select" href="#none">
									<label for="ball_unit"><span class="option">판매단위</span></label>
									<select id="ball_unit" class="ball">
										<option value="0">낱개</option>
										<option value="1">12개(1타스)</option>
									</select>
								</a>
							</li>
					<!-- ---------------------->
						</ul>
						<p>
							적립금 : 1790원 <br>
							배송비 : 2500원 (5만원 이상 구매 시, 무료배송)
						</p>
						<!-- 상품 수량 체크 -->
						<div class="product_count">
							<label for="qty">수  량  :</label>
							<input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:" class="input-text qty">
							<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
							 class="increase items-count" type="button">
								<i class="lnr lnr-chevron-up"></i>
							</button>
							<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) && sst > 1 ) result.value--; return false;"
							 class="reduced items-count" type="button">
								<i class="lnr lnr-chevron-down"></i>
							</button>
						</div>
						<div class="card_area" style="width:400px;">
							<form id="option" action="/order_good.do" method="get" style="display:inline-block;" onsubmit='return setOption();'>
								<input type="hidden" name="category" value=${goods.category }>
								<input type="hidden" name="goods_num" value=${goods.goods_num }>
								<input type="hidden" name="option1" value="">
								<input type="hidden" name="option2" value="">
								<input type="hidden" name="qty" value="">
								<input type="submit" class="main_btn" value="구매하기">
							</form>
	
							<a class="main_btn" id="info_cart_btn" href="#">장바구니</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">상세설명</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">상품 정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">상품 Q&A</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">상품 후기</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
<!-- #home : 상세 설명 -->
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					<!-- DB, 사진3번째컬럼, 상세사진 긴~거 띄우기 -->
				  	<img class="bbshop-info" src=${goods.dtl_img2 } alt="" style="max-width: -webkit-fill-available;" >
				</div>
				
<!-- #profile : 상품 정보 (객체의 속성들? 다 설정) ----------------------------------------------------------------------------------->
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<td><h5>카테고리</h5></td>
									<td><h5><c:out value="${categoryString }" /></h5></td>
								</tr>
								<tr>
									<td><h5>상품번호</h5></td>
									<td><h5><c:out value="${goods.goods_num }" /></h5></td>
								</tr>
								<tr>
									<td><h5>상품명</h5></td>
									<td><h5><c:out value="${goods.name }" /></h5></td>
								</tr>
								<tr>
									<td><h5>가격</h5></td>
									<td><h5><c:out value="${goods.price }" />원</h5></td>
								</tr>
								<tr>
									<td><h5>브랜드</h5></td>
									<td><h5><c:out value="${goods.brand }" /></h5></td>
								</tr>
							<c:choose>
								<c:when test="${categoryInt eq 1 }">
								<tr class="gd_info glove">
									<td><h5>포지션</h5></td>
									<td><h5>투수, 올라운드</h5></td>
								</tr>
								<tr class="gd_info glove bat shoes">
									<td><h5>색상</h5></td>
									<td><h5>black</h5></td>
								</tr>
								</c:when>
								<c:when test="${categoryInt eq 2 }">
								<tr class="gd_info bat">
									<td><h5>재질</h5></td>
									<td><h5>알루미늄</h5></td>
								</tr>
								<tr class="gd_info glove bat shoes">
									<td><h5>색상</h5></td>
									<td><h5>black</h5></td>
								</tr>
								</c:when>
								<c:when test="${categoryInt eq 3 }">
								<tr class="gd_info uniform">
									<td><h5>구단</h5></td>
									<td><h5>??</h5></td>
								</tr>
								<tr class="gd_info uniform">
									<td><h5>홈어웨이</h5></td>
									<td><h5>??</h5></td>
								</tr>
								</c:when>
								<c:when test="${categoryInt eq 4 }">
								<tr class="gd_info glove bat shoes">
									<td><h5>색상</h5></td>
									<td><h5>black</h5></td>
								</tr>
								</c:when>
								<c:otherwise>
								<tr class="gd_info ball">
									<td><h5>용도</h5></td>
									<td><h5>??</h5></td>
								</tr>
								</c:otherwise>
							</c:choose>
								
							</tbody>
						</table>
					</div>
				</div>
				
<!-- #contact : 상품 Q&A -------------------------------------------------------------------------------------------------------->
				<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
					<div class="row">
						<div class="col-lg-12">
							<div class="comment_list">
								<!-- 상품 QNA list가 출력될  table -->
								<table border="0" style="width : -webkit-fill-available;">
									<thead>
										<tr>
											<th scope="col" class="qna_number">질문/답변</th>
											<th scope="col" class="qna_title" style="width:60%;">제목</th>
											<th scope="col" class="qna_nickname">닉네임</th>
											<th scope="col" class="qna_date">날짜</th>
										</tr>
									</thead>
									<tbody id="qna_list">
								
									<script>
										qnaList_Ajax();
									</script>
	
									</tbody>
								</table>

							<!-- 페이지 출력 - script 항상 같이 따라가야함 -->
							<div class="row" style="padding-top:30px; margin:0; max-width:100%;">
								<nav class="cat_page mx-auto" aria-label="Page navigation example">
									<ul class="pagination">
										<c:if test="${qnaPageMaker.prev }">
											<li class="page-item page-item-left qna-page-item">
												<a class="page-link" href="${qnaPageMaker.startPage-1 }">
													<i class="fa fa-chevron-left" aria-hidden="true"></i>
												</a>
											</li>
										</c:if>

										<!-- a태그의 href속성에 페이지번호값을 설정하였다. -->
										<c:forEach var="num" begin="${qnaPageMaker.startPage }" end="${qnaPageMaker.endPage }">
											<li class="page-item qna-page-item ${qnaPageMaker.pagingVO.pageNum == num? 'active':''}">
												<a class="page-link" href="${num }">${num }</a>
											</li>
										</c:forEach>

										<c:if test="${qnaPageMaker.next }">
											<li class="page-item page-item-right qna-page-item">
												<a class="page-link" href="${qnaPageMaker.endPage+1 }">
													<i class="fa fa-chevron-right" aria-hidden="true"></i>
												</a>
											</li>
										</c:if>
									</ul>
								</nav>
								<button class="btn submit_btn" id="qna_btn">상품 문의 등록</button>
							</div>

								<!-- Q&A 작성버튼
								<div class="col-md-12 text-right" style="padding : 20px 0 0 0;">
									<button class="btn submit_btn" id="qna_btn">상품 문의 등록</button>
								</div>
								-->
							</div>
						</div>
						
		<!-- ==================== qna 작성 모달 ==================== -->
						<div id="qna_Modal">
							<div class="qna_Content review_box ">
								<span class="modal_close close">&times;</span>	<!-- X버튼 -->
								<h4 align="center">Q&A 작성하기</h4>
								
								<!-- 상품QNA 작성 FORM (id:#contactForm) -->
								<form class="row contact_form" action="/registerGoodsQna.do" method="post" id="contactForm" novalidate="novalidate">
									<!-- Q&A 제목 -->
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="title" name="title" placeholder="Q&A 제목">
										</div>
									</div>
									<!-- Q&A 내용 -->
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="content" id="content" rows="1" placeholder="Q&A 내용"></textarea>
										</div>
									</div>
									<!-- Q&A 첨부파일 -->
									<div class="col-md-12">
										<div class="form-group">
											<input type="FILE" class="form-control" id="attached_file" name="attached_file" placeholder="첨부파일">
										</div>
									</div>
									
									<!-- hidden : goods_num -->
									<input type="hidden" name="goods_num" value=${goods.goods_num }>
									<input type="hidden" name="category" value=${goods.category }>
								
									<!-- Q&A 등록(submit)버튼 -->
									<div class="col-md-12 text-right">
										<input type="submit" value="등록하기" class="btn submit_btn" >
									</div>
								</form>
							
							</div>
						</div>
		<!-- ==================== end qna 작성 모달 ==================== -->
					</div>
				</div>
				
<!-- #review : 상품 후기 --------------------------------------------------------------------------------------------------------->
				<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-12">
						
						<div class="row total_rate">
						
							<div class="col-3">
								<div class="single-element-widget">
									<h3 class="mb-30 title_color" style="padding-left:30px; font-weight:bold;">별점 별 보기</h3>
									<div class="default-select" id="default-select">
										<select id="score" onchange="reviewList_Ajax()">
											<option value="0">전체</option>
											<option value="5">★★★★★</option>
											<option value="4">★★★★☆</option>
											<option value="3">★★★☆☆</option>
											<option value="2">★★☆☆☆</option>
											<option value="1">★☆☆☆☆</option>
										</select>
									</div>
								</div>
							</div>
							
						
							<div class="col-6">
								<div class="box_total">
									<!-- 평균값 입력 -->
<!-- 								<h5>평균 별점</h5> -->
<!-- 								<h4>5.0</h4> -->
								</div>
							</div>
							
							
							<div class="col-3" style="text-align:center;">
								<div class="rating_list">
							<!--	<h3>총 ??개의 후기</h3>
									<ul class="list">
									<!-- 후기 별점 글 개수 입력 -->
								</div>
							</div>
							
							<script>
								reviewScore_Ajax();
							</script>
							
						</div>
						<div class="comment_list">
							<table border="0" style="width : -webkit-fill-available;">
									<thead>
										<tr>
											<th scope="col" class="review_number">번호</th>
											<th scope="col" class="review_title" style="width:50%;">제목</th>
											<th scope="col" class="review_score">별점</th>
											<th scope="col" class="review_nickname">닉네임</th>
											<th scope="col" class="review_date">날짜</th>
										</tr>
									</thead>
									<tbody id="review_list">
									<script>
										reviewList_Ajax();
									</script>
									</tbody>
								</table>

							<!-- 페이지 출력 - script 항상 같이 따라가야함 -->
							<div class="row" style="padding-top:30px; margin:0; max-width:100%;">
								<nav class="cat_page mx-auto" aria-label="Page navigation example">
									<ul class="pagination">
										<c:if test="${reviewPageMaker.prev }">
											<li class="page-item page-item-left review-page-item">
												<a class="page-link" href="${reviewPageMaker.startPage-1 }">
													<i class="fa fa-chevron-left" aria-hidden="true"></i>
												</a>
											</li>
										</c:if>

										<!-- a태그의 href속성에 페이지번호값을 설정하였다. -->
										<c:forEach var="num" begin="${reviewPageMaker.startPage }" end="${reviewPageMaker.endPage }">
											<li class="page-item review-page-item ${reviewPageMaker.pagingVO.pageNum == num? 'active':''}">
												<a class="page-link" href="${num }">${num }</a>
											</li>
										</c:forEach>

										<c:if test="${reviewPageMaker.next }">
											<li class="page-item page-item-right review-page-item">
												<a class="page-link" href="${reviewPageMaker.endPage+1 }">
													<i class="fa fa-chevron-right" aria-hidden="true"></i>
												</a>
											</li>
										</c:if>
									</ul>
								</nav>
								<button class="btn submit_btn" id="review_btn">상품 후기 등록</button>
							</div>
						</div>
		<!-- ==================== 후기 작성 모달 ==================== -->
						<div id="review_Modal">
							<div class="review_Content review_box">
								<span class="modal_close close">&times;</span>	<!-- X버튼 -->
								<form class="row review_form" action="/registerReview.do" method="post" id="reviewForm" novalidate="novalidate">
								<h4 align="center">후기 작성하기</h4>
								<div id="star_review">
									<input type="radio" name="score" value="5">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									&nbsp;
									<input type="radio" name="score" value="4">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									&nbsp;
									<input type="radio" name="score" value="3">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									&nbsp;
									<input type="radio" name="score" value="2">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									&nbsp;
									<input type="radio" name="score" value="1">
									<i class="fa fa-star"></i>
								</div>
								
									<!-- 후기 제목 -->
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="title" name="title" placeholder="REVIEW 제목">
										</div>
									</div>
									<!-- 후기 내용 -->
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="contents" id="contents" rows="1" placeholder="REVIEW 내용"></textarea>
										</div>
									</div>
									<!-- 후기 첨부파일 -->
									<div class="col-md-12">
										<div class="form-group">
											<input type="FILE" class="form-control" id="re_img" name="re_img" placeholder="첨부파일">
										</div>
									</div>
									
									<!-- hidden : goods_num, category -->
									<input type="hidden" name="goods_num" value=${goods.goods_num }>
									<input type="hidden" name="category" value=${goods.category }>
									
									<div class="col-md-12 text-right">
										<button type="submit" value="submit" class="btn submit_btn">등록하기</button>
									</div>
								</form>
							</div>
						</div>
		<!-- ==================== 후기 작성 모달 ==================== -->
		
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->
<script>
//setOption
function setOption() {
	var form = document.forms["option"];
	
	var category = form['category'].value;
	var qty = $('.product_count .qty');
	
	if(category == 1) {
		var option = $('select.glove option:selected');
		form['option1'].value = option[0].value;
		form['option2'].value = option[1].value;
	}
	else if(category == 2) {
		var option = $('select.bat option:selected');
		form['option1'].value = option[0].value;
	}
	else if(category == 3) {
		var option = $('select.uniform option:selected');
		form['option1'].value = option[0].value;
	}
	else if(category == 4) {
		var option = $('select.shoes option:selected');
		form['option1'].value = option[0].value;
		form['option2'].value = option[1].value;
	}
	else if(category == 5) {
		var option = $('select.ball option:selected');
		form['option1'].value = option[0].value;
	}
	
	form['qty'].value = qty[0].value;
	
	return true;
}
</script>
<script>
//setOption
function setOption() {
	var form = document.forms["option"];
	
	var category = form['category'].value;
	var qty = $('.product_count .qty');
	
	if(category == 1) {
		var option = $('select.glove option:selected');
		form['option1'].value = option[0].value;
		form['option2'].value = option[1].value;
	}
	else if(category == 2) {
		var option = $('select.bat option:selected');
		form['option1'].value = option[0].value;
	}
	else if(category == 3) {
		var option = $('select.uniform option:selected');
		form['option1'].value = option[0].value;
	}
	else if(category == 4) {
		var option = $('select.shoes option:selected');
		form['option1'].value = option[0].value;
		form['option2'].value = option[1].value;
	}
	else if(category == 5) {
		var option = $('select.ball option:selected');
		form['option1'].value = option[0].value;
	}
	
	form['qty'].value = qty[0].value;
	
	return true;
}
</script>
<script>
	// table(qna, review) - 제목 클릭시, 내용 보여주는 이벤트
	var table_item = document.getElementsByClassName("table_item");
	var table_content = document.getElementsByClassName("table_content");
	
	// ajax로 동적으로 데이터 뿌려준 후, 그 데이터에 대한 click event처리
	$(document).on("click", ".table_item", function() {
		var index =  $('.table_item').index(this);
		$(".table_content:eq(" + index + ")").toggle();
	});
</script>

<script>
	// 카테고리 별로 옵션 다르게 나오게 하기.
	// var category = document.getElementById("category");
	// 하드코딩 - 수정필요
	
	var glove = document.querySelectorAll("a.glove");
	var bat = document.querySelectorAll("a.bat");
	var uniform = document.querySelectorAll("a.uniform");
	var shoes = document.querySelectorAll("a.shoes");
	var ball = document.querySelectorAll("a.ball");
	
	console.log(glove);
	
	var category = ${categoryInt};
	var categoryOption = ['', glove, bat, uniform, shoes, ball];
	
	/*
	for(let i=1; i<categoryArr.length; i++) {
		if(category == i) {
			for(j=0; i<categoryOption[i].length; i++) {
				categoryOption[i][j].style.display = "flex";
			}
		}
	}
	*/
	
	if(category == 1) {
		$('.gd_info.glove').css('display', 'table-row');
		$('a.glove').css('display', 'flex');
	}
	else if(category == 2) {
		$('.gd_info.bat').css('display', 'table-row');
		$('a.bat').css('display', 'flex');
	}
	else if(category == 3) {
		$('.gd_info.uniform').css('display', 'table-row');
		$('a.uniform').css('display', 'flex');
	}
	else if(category == 4) {
		$('.gd_info.shoes').css('display', 'table-row');
		$('a.shoes').css('display', 'flex');
	}
	else if(category == 5) {
		$('.gd_info.ball').css('display', 'table-row');
		$('a.ball').css('display', 'flex');
	}
	
	//상품info에서 장바구니 버튼 눌렀을 때, miniCart나오기
	info_cart_btn.onclick = function() {
				
		var data = {};
		
		data["goods_num"] = ${goods.goods_num};
		data["category"] = ${categoryInt};
		data["qty"] = $('#sst').val();

		// 카테고리가 글러브일 경우, 상품 옵션을 data에 넣어준다.
		// 글러브(1)인 경우만 우선적으로 구현.
		if (category == 1) {
			
			data["option1"] = $('#glove_hand option:selected').val();
			data["option2"] = $('#glove_taming option:selected').val();
		}
		
		$.ajax({
			type: "POST",
			url: "addGoodsToCart.do",
			data: JSON.stringify(data),
			dataType: "json",
			contentType: "application/json",
			success: function(result) {
								
				var content = '';
				var total = 0;
				var total_price = result.goods.price * result.qty;
				
				var carts = result.cart_list;
				
				content += '<li class="miniCart_item">';
				content += '<a href="/goods_info.do">';
				content += '<img class="item_img" src="';
				content += result.goods.main_img + '">';
				content += '</a>';
					
				content += '<div class="item_info">';
				
				content += '<div id="item-name" class="item-name">' + result.goods.name + '</div>';
				content += '<div id="item-price"><span>' + total_price + '원</span></div>';
				content += '<div id="item-quantity">수량 : <span>' + result.qty + '</span></div>';
				
				content += '</div>';
				content += '</li>';
				
				total += parseInt(total_price);
								
				$.each(carts, function(index, value) {
				
					content += '<li class="miniCart_item">';
					content += '<a href="/goods_info.do">';
					content += '<img class="item_img" src="';
					content += result.goods_list[index].main_img + '">';
					content += '</a>';
						
					content += '<div class="item_info">';
					
					content += '<div id="item-name" class="item-name">' + result.goods_list[index].name + '</div>';
					content += '<div id="item-price"><span>' + value.TOTALPRICE + '원</span></div>';
					content += '<div id="item-quantity">수량 : <span>' + value.QNTTY + '</span></div>';
					
					content += '</div>';
					content += '</li>';
				});
				
				total += parseInt(result.allPrice);
				
				$('.miniCart_list').empty();
				$('.miniCart_list').append(content);
				
				// 미니카트 total 없애기
				
				$('#minicart_total').empty();
				$('#minicart_total').append(total);
				$('#minicart_total').append('원');
				
			},
			error: function() {

				alert('ajax 실패!');
			}
		});
		
		// 미니카트 나오기
		curtain.style.display = "block";
		miniCart.style.width = "350px";
	}
	
</script>
<script>
//qna, review 모달
var qna_Modal = document.getElementById('qna_Modal');
var review_Modal = document.getElementById('review_Modal');

var close1 = document.getElementsByClassName("modal_close")[0];
var close2 = document.getElementsByClassName("modal_close")[1];


//qna_btn 눌렀을 때,
$('#qna_btn').click(function() {
	qna_Modal.style.display = "block";
})
//review_btn 눌렀을 때,
$('#review_btn').click(function() {
	review_Modal.style.display = "block";
})
//x버튼 눌렀을 때, 모달창 끄기
close1.onclick = function() {
	qna_Modal.style.display = "none";
}
close2.onclick = function() {
	review_Modal.style.display = "none";
}

window.onclick = function(event) {
	if (event.target == qna_Modal) {
		qna_Modal.style.display = "none";
	} else if (event.target == review_Modal) {
		review_Modal.style.display = "none";
	}
}
</script>

<%@ include file="../include/shopping_footer.jsp" %>
