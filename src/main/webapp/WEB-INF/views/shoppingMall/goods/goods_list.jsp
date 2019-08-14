<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/shopping_header.jsp" %>

<head>

<style> /*여긴 list의 style*/
/* 상품 상단 바(product_top_bar) - 오른쪽 (가격 bar) */
.banner_area .banner_inner{
background-color: #57c051;
}
.product_top_bar{
background-color: #ffffff
}

.right_dorp {
	display: flex;
	margin-left: auto;
	width: 330px;
}
.p_filter_widgets {
	width: 220px;
	padding-top: 10px;
	padding-bottom: 0px;
	padding-left: 15px;
	padding-right: 15px;
}
.img-fluid {
	width: 250px;	/* img width : 200px or 250px로 통일  */
}
.page-link {		/* 페이지번호 border 없애기 */
	border-style: none;
}
.widgets_inner {	/* price bar */
	width: 280px;
}
#amount
{
	width: 190px;
}
*, h4, h5 {
	font-weight : bold;
}
</style>

<script>
function goodsList_Ajax() {
	
	var min_amount = $('#min_amount').val();
	var max_amount = $('#max_amount').val();
	var search = '';
	
	var pageNum = $('#actionForm input[name="pageNum"]').val();
	
	if(pageNum === undefined)
		pageNum = 1;
	
	if(min_amount === "")
		min_amount = "1000";
	if(max_amount === "")
		max_amount = "500000";
	
	var data = {};
	
	data["pageNum"] = pageNum * 1;
	data["amount"] = 8;
	data["category"] = ${categoryInt};
	data["sorting"] = $('select.sorting option:selected').val();
	data["min_amount"] = min_amount;
	data["max_amount"] = max_amount;

	console.log($('select.sorting option:selected').val());
	
	$.ajax({
		url : "/getGoodsList_Ajax.do",
		type : 'POST',
		data : JSON.stringify(data),
		dataType: 'json',
		contentType : "application/json",
		success : function(goodsList) {
			
			search_Modal.style.display = "none";
			
			console.log('반환 리스트 : ' + goodsList);
			
			var output = "";

			$.each(goodsList, function(index, goods) {
				
				console.log('상품 목록 goods : ' + goods[index]);
				
				output += "<div class='col-lg-3 col-md-3 col-sm-6'>";
				output += "<div class='f_p_item'>";
				output += "<div class='f_p_img'>";
				output += "<a href='goods_info.do?goods_num=" + goods.goods_num + "&category=" + goods.category + "'>"; // goods.category가 안 먹혀서 일단 페이지 내의 ${categoryInt}를 들고 옴. 
				output += "<img class='img-fluid' src='" + goods.main_img +"' alt=''></a></div>";
				output += "<a href='#'><h4>" + goods.name + "</h4></a>";
				output += "<h5>" + goods.price + "원</h5></div></div>";
				
			});
			
			// 상품 목록이 들어갈 div 클래스 이름 - 초기화
			$('.latest_product_inner').empty();
			$('.latest_product_inner').append(output);
		},
		error : function() {
			
			alert('ajax 통신 실패!');
		}
	});
}
</script>
</head>

<body>
	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>${categoryString }</h2>	<!-- 카테고리(String) 출력 -->
					<div class="page_link">
						<a href="/shopping_main">쇼핑몰</a>
						<!-- url에 카테고리값 전달, view에 카테고리(String) 출력 -->
						<a href="/goods_list.do?category=${categoryInt }">${categoryString }</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->

	<!--================Category Product Area =================-->
	<section class="cat_product_area">
		<div class="container-fluid">
			<div class="row flex-row-reverse">
				<div class="col-lg-12">
					<div class="product_top_bar">
						<!-- 정렬 -->
						<div class="left_dorp">
							<select class="sorting" onchange="goodsList_Ajax()">
								<option id="new" 		value="new">신상품</option>
								<option id="best" 		value="best">인기상품</option>
								<option id="lowPrice" 	value="lowPrice">낮은가격</option>
								<option id="highPrice" 	value="highPrice">높은가격</option>
							</select>
						</div>
						<!-- end 정렬 -->
						<!-- price bar -->
						<div class="right_dorp ml-auto">
								<h4>Price</h4>
							<div class="widgets_inner p_filter_widgets">
								<div class="range_item">
									<div id="slider-range"></div>
									<div class="row m0">
										<label for="amount" style="visibility:hidden;">Price:</label>
										<input type="text" id="amount" readonly style="text-align:center; font-size:15px; display:none">
										<input type="text" id="min_amount" readonly style="text-align:center; font-size:17px;">
										<input type="text" value="~" readonly style="width:15px; text-align:center; font-size:15px; ">
										<input type="text" id="max_amount" readonly style="text-align:center; font-size:17px; ">
									</div>
								</div>
							</div>
						</div>
						<!-- end price bar -->
 					</div>
					
					<div class="latest_product_inner row">
					
						<!-- 상품 출력 
						<c:forEach items="${goodsList }" var="goods">
						<div class="col-lg-3 col-md-3 col-sm-6">
							<div class="f_p_item">
								<div class="f_p_img">
									<a href="/goods_info?goods_num=${goods.goods_num }"><img class="img-fluid" src="<c:out value='${goods.main_img }' />" alt=""></a>
								</div>
								<a href="#">
									<h4><c:out value="${goods.name }" /></h4>
								</a>
								<h5><c:out value="${goods.price }" />원</h5>
							</div>
						</div>
						</c:forEach>
						<!-- end 상품 출력 -->
						
						<script>
						goodsList_Ajax();						
						</script>
						
					</div>
				</div>
			</div>
			
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			<div>&nbsp;</div>

		<!-- 페이지 출력 - script 항상 같이 따라가야함 -->
		<div class="row">
			<nav class="cat_page mx-auto" aria-label="Page navigation example">
				<ul class="pagination">
					<c:if test="${pageMaker.prev }">
						<li class="page-item page-item-left"><a class="page-link"
							href="${pageMaker.startPage-1 }"><i class="fa fa-chevron-left" aria-hidden="true"></i>
						</a></li>
					</c:if>
					
					
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="page-item  ${pageMaker.pagingVO.pageNum == num? 'active':''}">
							<a class="page-link" href="${num }">${num }</a></li>
					</c:forEach>
					
					<!-- 
					<li class="page-item"><a class="page-link" href="#">02</a></li>
					<li class="page-item"><a class="page-link" href="#">03</a></li>
					<li class="page-item"><a class="page-link" href="#">04</a></li>
					<li class="page-item"><a class="page-link" href="#">05</a></li>
					-->
					
					<c:if test="${pageMaker.next }">
						<li class="page-item page-item-right"><a class="page-link"
							href="${pageMaker.endPage+1 }"> <i class="fa fa-chevron-right" aria-hidden="true"></i>
						</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
		
		
		<form id="actionForm">
			<input type="hidden" name="pageNum" value="1">	<!-- 초기값 1 -->
			<input type="hidden" name="amount" value="${pageMaker.pagingVO.amount }">
			<input type="hidden" name="category" value="${categoryInt }">
			<input type="hidden" name="sorting" value="$('select.sorting option:selected').val()">
			<input type="hidden" name="min_amount" value="">
			<input type="hidden" name="max_amount" value="">
		</form>
		
	</div>
	</section>
	<!--================End Category Product Area =================-->

	<script>	
	$(document).ready(function() {
		
		// paging
		var actionForm = $("#actionForm");
		
		$(".page-item").on("click", function(e) {
			
			e.preventDefault();	// a태그를 클릭해도 페이지이동이 없도록,
			
			$('.page-item').removeClass("active");
			$(this).addClass("active");
			
			var page = $('.page-item.active a').text();
			

			// form 태그 내 pageNum값은 href 속성값으로 변경
			$('#actionForm input[name="pageNum"]').val(page);

			goodsList_Ajax();
		});
		
		/*
		// 페이지 active 처리
		var page_item = $('.page-item');
		
		$('.page-item').click(function() {
			$('.page-item').removeClass("active");
			$(this).addClass("active");
		});
		*/
		
		// price slider - 변경할 때,
		$('span.ui-slider-handle.ui-corner-all.ui-state-default').click(function() {goodsList_Ajax();});
	});
	</script>
</body>

<%@ include file="../include/shopping_footer.jsp" %>