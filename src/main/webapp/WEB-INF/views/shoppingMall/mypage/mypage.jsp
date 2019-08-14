<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/mypage_header.jsp"%>

<style>
.genric-btn.default{
	background: #dde8e1;
}
.genric-btn.default:hover{
	background: #dde8e1;
}
.col-md-4::before {
	position: absolute;
	left: 0;
	top: 10px;
	content: '';
	display: block;
	width: 1px;
	height: 73px;
	background: #e6e6e6;
}

.col-md-4:first-child::before {
	content: '';
}

a {
	text-decoration: none;
}
</style>
<div class="container">
	<div class="section-top-border" style="display: flex;">
		<div class="col-md-6"
			style="float: left; text-align: center; background: #024137; padding: 50px; height: 300px;">
			<aside class="single_sidebar_widget author_widget"
				style="color: white;">
				<p></p>
				<h4>강민구</h4>
				<p>mangoJuiceDeli</p>
				<br> <br>
				<div class="br"></div>
			</aside>
			<div class="col-md-4" style="color: white;">
				<p>
					<i class="fas fa-money-check"></i>
				</p>
				<span>보유 쿠폰</span>
				<h4>0 개</h4>
			</div>
			<div class="test">
				<div class="col-md-4" style="color: white;">
					<p>
						<i class="fas fa-won-sign"></i>
					</p>
					<span>보유 적립금</span>
					<h4>￦ ${savings_list["0"].or_savings_total }</h4>
				</div>
				<div class="col-md-4" style="color: white;">
					<p>
						<i class="fas fa-star"></i>
					</p>
					<span>보유 포인트</span>
					<h4>0 P</h4>
				</div>
			</div>
		</div>
		<!-- grade -->
		<div class="plan col-sm-3 col-md-3"
			style="float: left; height: 150px;">
			<div class="plan-name-gold">
				<p>
					<i class="fas fa-medal"></i>
				</p>
				<span>회원 등급</span>
				<h1 style="margin-top: 10px; color: #abae46;">Gold</h1>
			</div>
			<div style="padding: 30px; background: #b7d2b1; height: 150px;">
				<p>
					<i class="far fa-credit-card"></i>
				</p>
				<h4>
					<span>멤버십 혜택 안내</span>
				</h4>
				<span><a href="#" style="color: #777777;" data-toggle="tooltip" data-placement="bottom"
							title="멤버십 등급 및 혜택 출력 될 것임">자세히 보기</a></span>
			</div>
		</div>
		<div class="col-sm-3 col-md-3 text-center"
			style="float: left; background: #dde8e1; height: 300px;">
			<div style="padding: 50px 40px 50px 40px;">
				<div class="blog_info text-center">
					<ul class="blog_meta list" style="clear: both">
						<li><a href="#" data-toggle="tooltip" data-placement="right"
							title="2019/07/12"><span>가입일</span> <i
								class="lnr lnr-calendar-full"></i> </a></li>
						<li><a href="#" data-toggle="tooltip" data-placement="right"
							title="￦ 50,000"><span>누적 구매액</span> <i class="lnr lnr-eye"></i>
						</a></li>
						<li><a href="#" data-toggle="tooltip" data-placement="right"
							title="￦ 25,000"><span>다음 등급까지 남은 구매액</span> <i
								class="lnr lnr-bubble"></i> </a></li>
						<li><a href="#" data-toggle="tooltip" data-placement="right"
							title="회원님은 경고 횟수 0회 입니다."><span>누적 경고</span> <i
								class="lnr lnr-user"></i> </a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="section-top-border"
		style="background: #ffffff; padding-bottom: 20px;">
		<div class="areaBox">
			<div class="myOrderBox">
				<div class="myOrderCon" style="border-right:none; border-left:none; border-bottom:none; border-top:none;">
					<div class="row"
						style="width: 1000px; margin: 0 auto; padding-left: 100px">

						<div class="col-sm-2 col-md-2"
							style="width: 150px; text-align: center;">
							 <c:choose>
									<c:when test="${empty stts_list[0] }">
										<span class="order_now">0</span>
										<br>
									</c:when>
									<c:otherwise>
										<span class="order_now">${stts_list[0] }</span>
										<br>
									</c:otherwise>
								</c:choose> <a href="#" class="genric-btn default circle"
								style="clear: both;"> <span>결제완료</span></a>
						</div>
						<div class="col-sm-2 col-md-2"
							style="width: 150px; text-align: center;">
							 <c:choose>
									<c:when test="${empty stts_list[1] }">
										<span class="order_now">0</span>
										<br>
									</c:when>
									<c:otherwise>
										<span class="order_now">${stts_list[1] }</span>
										<br>
									</c:otherwise>
								</c:choose> <a href="#" class="genric-btn default circle"
								style="clear: both;"> <span>배송 준비중</span></a>
						</div>
						<div class="col-sm-2 col-md-2"
							style="width: 150px; text-align: center;">
							 <c:choose>
									<c:when test="${empty stts_list[2] }">
										<span class="order_now">0</span>
										<br>
									</c:when>
									<c:otherwise>
										<span class="order_now">${stts_list[2] }</span>
										<br>
									</c:otherwise>
								</c:choose> <a href="#" class="genric-btn default circle"
								style="clear: both;"> <span>배송중</span></a>
						</div>
						<div class="col-sm-2 col-md-2"
							style="width: 150px; text-align: center;">
							 <c:choose>
									<c:when test="${empty stts_list[3] }">
										<span class="order_now">0</span>
										<br>
									</c:when>
									<c:otherwise>
										<span class="order_now">${stts_list[3] }</span>
										<br>
									</c:otherwise>
								</c:choose> <a href="#" class="genric-btn default circle"
								style="clear: both;"> <span>배송 완료</span></a>
						</div>
						<div class="col-sm-2 col-md-2"
							style="width: 150px; text-align: center;">
							 <c:choose>
									<c:when test="${empty stts_list[4] }">
										<span class="order_now">0</span>
										<br>
									</c:when>
									<c:otherwise>
										<span class="order_now">${stts_list[4] }</span>
										<br>
									</c:otherwise>
								</c:choose> <a href="#" class="genric-btn default circle"
								style="clear: both;"> <span>주문 취소</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section-top-border">
		<h3 style="padding: 15px 0px 0px 15px; text-align: center;">내 적립금 현황</h3>
		<h5 align="right">내 적립금 : ${pageMaker.total }건</h5>
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr style="background: #ffffff; padding: 20px;">
						<th scope="col"
							style="text-align: center; padding: 20px; width: 15%">주문날짜</th>
						<th scope="col" style="text-align: center; padding: 20px;">주문내역</th>
						<th scope="col"
							style="text-align: center; padding: 20px; width: 15%">적립금</th>
						<th scope="col"
							style="text-align: center; padding: 20px; width: 15%">총 적립금</th>
					</tr>
				</thead>
				<tbody style="text-align: center;">
				</tbody>
			</table>
			<div class="text-center">
				<ul class="pagination">
					<!-- 페이지 목록 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li
							class="page-item  ${pageMaker.pagingVO.pageNum == num ? 'active' : ''}"
							id="btn_${num }"><a href="${num}" class="page-link">${num}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- 페이징 버튼 처리를 위한 히든 폼 -->
			<form id="actionForm" action="/savings.do">
				<input type="hidden" name="pageNum" value="${pageMaker.pagingVO.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.pagingVO.amount }">
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">

	var actionForm = $("#actionForm");
	
	// 페이지가 로드되면 불러와지는 적립금 리스트
	$(document).ready(function() {
		
		var amount = actionForm.find("input[name='amount']").val();
		var pageNum = actionForm.find("input[name='pageNum']").val();

		var data = {
			pageNum : pageNum,
			amount : amount
		};

		$.ajax({
			type : "POST",
			url : "/savingListPaging.do",
			data : JSON.stringify(data),
			dataType : "json",
			contentType : "application/json",
			success : function(result) {

				var start = ${pageMaker.startPage};
				var end = ${pageMaker.endPage};
				
				var str = '';
				var paging = '';

				$.each(result, function(index, value) {

					str += '<tr><td><h5>' + result[index].or_date
							+ '</h5></td><td><h5>' + result[index].or_items
							+ '</h5></td><td><h5>' + '￦ '
							+ result[index].or_savings + '</h5></td><td><h5>'
							+ '￦ ' + result[index].or_savings_total
							+ '</h5></td></tr>';
				});

				$('tbody').empty();
				$('tbody').append(str);

				// 페이징 버튼 AJAX 처리
				for (var i = start; i <= end; i++) {
					
					paging += '<li class="page-item ';
					
					if (${pageMaker.pagingVO.pageNum} == i)
						paging += 'active';
					
					paging += '" id="btn_' + i + '">';
					paging += '<a href="' + i + '" class="page-link">' + i + '</a></li>';
				}
				
				$('.pagination').empty();
				$('.pagination').append(paging);
				
				$('#btn_1').addClass("active");
			},
			error : function() {
				
				alert('AJAX 요청 실패!');
			}
		});
	});
	
	// 페이지네이션 버튼 클릭시 이벤트 처리
	$(document).on("click", ".page-item a", function(e) {
		
		e.preventDefault();
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));

		var data = {
			pageNum : actionForm.find("input[name='pageNum']").val(),
			amount : actionForm.find("input[name='amount']").val()
		};

		$.ajax({
			type : "POST",
			url : "/savingListPaging.do",
			data : JSON.stringify(data),
			dataType : "json",
			contentType : "application/json",
			success : function(result) {

				var start = ${pageMaker.startPage};
				var end = ${pageMaker.endPage};
			
				var str = '';
				var paging = '';

				$.each(result, function(index, value) {

					str += '<tr><td><h5>' + result[index].or_date
							+ '</h5></td><td><h5>' + result[index].or_items
							+ '</h5></td><td><h5>' + '￦ '
							+ result[index].or_savings + '</h5></td><td><h5>'
							+ '￦ ' + result[index].or_savings_total
							+ '</h5></td></tr>';
				});

				$('tbody').empty();
				$('tbody').append(str);

				// 페이징 버튼 AJAX 처리
				for (var i = start; i <= end; i++) {
					
					paging += '<li class="page-item ';
					
					if (${pageMaker.pagingVO.pageNum} == i)
						paging += 'active';
					
					paging += '" id="btn_' + i + '">';
					paging += '<a href="' + i + '" class="page-link">' + i + '</a></li>';
				}
				
				$('.pagination').empty();
				$('.pagination').append(paging);
				
				$('.page-item').removeClass("active");
				$('#btn_' + actionForm.find("input[name='pageNum']").val()).addClass("active");
			},
			error : function() {
				
				alert('AJAX 요청 실패!');
			}
		});
	});
</script>

<%@ include file="../include/mypage_footer.jsp"%>