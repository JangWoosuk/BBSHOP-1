<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/mypage_header.jsp"%>
<style>
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	padding: 20px;
	line-height: 1.42857143;
	vertical-align: top;
	border-top: 1px solid #ddd;
}

.order_details_table {
	padding: 0px 30px 0px 30px;
	background: white;
}
</style>
<div class="container">
	<div class="order_details_table" style="margin-top: 10px">
		<h3 class="mb-30 title_color">내가 남긴 글</h3>
		<h5 align="left">내가 작성한 <span id="table_content">상품 후기</span>입니다.</h5>
		<div class="single-element-widget">
			<div class="default-select" id="default-select" style="margin-top: 30px;">
				<select id="category" onchange="getTableWithAjax(this.value);">
					<option value="review" selected>상품 후기</option>
					<option value="qna">상품 QnA</option>
					<option value="onetoone">1:1 문의</option>
				</select>
				<h5 align="right"><span id="all_cnt">총 게시글 : ${pageMaker.total }개</span></h5>
			</div>
		</div>
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr style="background: #b5dab6;">
						<th scope="col" style="width: 10%; font-weight: bold;">번호</th>
						<th scope="col" style="width: 15%; font-weight: bold;">카테고리</th>
						<th scope="col" style="font-weight: bold;">제목</th>
						<th scope="col" style="width: 10%; font-weight: bold;" id="changing"></th>
						<th scope="col" style="width: 18%; font-weight: bold;">날짜</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="text-center">
				<ul class="pagination">
					<!-- 페이지 목록 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="page-item  ${pageMaker.pagingVO.pageNum == num ? 'active' : ''}" id="btn_${num }">
							<a href="${num}" class="page-link">${num}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- 페이징 처리를 위한 히든 폼 -->
			<form id="actionForm">
				<input type="hidden" name="pageNum" value="${pageMaker.pagingVO.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.pagingVO.amount }">
				<input type="hidden" name="category" value="">
			</form>
		</div>
	</div>
</div>

<script>

// 페이지가 로드되면 ajax로 전체 게시글 가지고 옴.
$(document).ready(function() {

	var actionForm = $("#actionForm");
	
	actionForm.find("input[name='category']").val('review'); // 처음에는 리뷰 게시판을 불러온다.
	
	var amount = actionForm.find("input[name='amount']").val();
	var pageNum = actionForm.find("input[name='pageNum']").val();
	var category = actionForm.find("input[name='category']").val();
	
	var data = {};
	
		data["pageNum"] = pageNum; 
		data["amount"] = amount;
		data["category"] = category;
				
	$.ajax({
		type : 'POST',
		url : '/getTableWithAjax.do',
		data : JSON.stringify(data),
		dataType : 'json',
		contentType: "application/json",
		success : function(result) {
								
			var values = '';
			
			var start = ${pageMaker.startPage};
			var end = ${pageMaker.endPage};
			var str = '';
			var col = '';
			var paging = '';
			
			if (category == 'review') {
				
				category = '상품 후기';
				col = '별점';
				values = result.review;
				
			} else if (category == 'qna') {
				
				category = '상품 QnA';
				col = '상품 번호';
				values = result.qna;
				
			} else if (category == 'onetoone') {
				
				category = '1:1 문의';
				col = '문의유형';
				values = result.onetoone;
			}
			
			$.each(values, function(index, value){
								
				if (category == '상품 후기') {
					
					str += '<tr><td><h5>' + values[index].rv_num + '</h5></td><td><h5>' + category + '</h5></td><td><h5>' + values[index].title + '</h5></td><td><h5>'
						+ values[index].score + '</h5></td><td><h5>' + values[index].re_date + '</h5></td></tr>';
					
				} else if (category == '상품 QnA') {
					
					str += '<tr><td><h5>' + values[index].qna_num + '</h5></td><td><h5>' + category + '</h5></td><td><h5>' + values[index].title + '</h5></td><td><h5>'
						+ values[index].goods_num + '</h5></td><td><h5>' + values[index].regdate + '</h5></td></tr>';
						
				} else if (category == '1:1 문의') {
					
					str += '<tr><td><h5>' + values[index].one_one_num + '</h5></td><td><h5>' + category + '</h5></td><td><h5>' + values[index].one_title + '</h5></td><td><h5>'
						+ values[index].one_category + '</h5></td><td><h5>' + values[index].regdate + '</h5></td></tr>';	
				}
				
			});
				
			$('tbody').empty();
			$('tbody').append(str);
			
			// 게시판 종류 표시를 바꿔준다
			$('#table_content').empty();
			$('#table_content').append(category);
			
			$('#changing').empty();
			$('#changing').append(col);
			
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

// 드롭다운 메뉴에서 게시글 종류를 선택했을때
function getTableWithAjax(menu) {
	
	var actionForm = $("#actionForm");
	
	actionForm.find("input[name='category']").val(menu);	
	actionForm.find("input[name='pageNum']").val(1); // 1페이지부터 보여줘야 하므로 1로 바꾼다.
	
	var amount = actionForm.find("input[name='amount']").val();
	var pageNum = actionForm.find("input[name='pageNum']").val();
	var category = actionForm.find("input[name='category']").val();
	
	var data = {};
	
	data["pageNum"] = pageNum; 
	data["amount"] = amount;
	data["category"] = category;
				
	$.ajax({
		type : 'POST',
		url : '/getTableWithAjax.do',
		data : JSON.stringify(data),
		dataType : 'json',
		contentType: "application/json",
		success : function(result) {
								
			var values = '';
			var cate = '';
			var str = '';
			var paging = '';
			var cnt = 0;
			var total = result.total;
			
			if (category == 'review') {
				
				cate = '상품 후기';
				col = '별점';
				values = result.review;
				
			} else if (category == 'qna') {
				
				cate = '상품 QnA';
				col = '상품 번호';
				values = result.qna;
				
			} else if (category == 'onetoone') {
				
				cate = '1:1 문의';
				col = '문의유형';
				values = result.onetoone;		
			
			}
			
			$.each(values, function(index, value){
								
				if (cate == '상품 후기') {
					
					str += '<tr><td><h5>' + values[index].rv_num + '</h5></td><td><h5>' + cate + '</h5></td><td><h5>' + values[index].title + '</h5></td><td><h5>'
						+ values[index].score + '</h5></td><td><h5>' + values[index].re_date + '</h5></td></tr>';
					
				} else if (cate == '상품 QnA') {
					
					str += '<tr><td><h5>' + values[index].qna_num + '</h5></td><td><h5>' + cate + '</h5></td><td><h5>' + values[index].title + '</h5></td><td><h5>'
						+ values[index].goods_num + '</h5></td><td><h5>' + values[index].regdate + '</h5></td></tr>';
						
				} else if (cate == '1:1 문의') {
					
					str += '<tr><td><h5>' + values[index].one_one_num + '</h5></td><td><h5>' + cate + '</h5></td><td><h5>' + values[index].one_title + '</h5></td><td><h5>'
						+ values[index].one_category + '</h5></td><td><h5>' + values[index].regdate + '</h5></td></tr>';
				}
				
			});
				
			$('tbody').empty();
			$('tbody').append(str);
			
			$('#table_content').empty();
			$('#table_content').append(cate);
			
			$('#changing').empty();
			$('#changing').append(col);
			
			var all_cnt = '';
			all_cnt += '총 게시글 : ' + total + '개';
			
			$('#all_cnt').empty();
			$('#all_cnt').append(all_cnt);
			
			// 페이징 버튼 AJAX 처리
			var end = Math.ceil(pageNum / 10.0) * 10;
			var start = end - 9;
			var realEnd = Math.ceil( (total * 1.0) / amount );
				
			if (realEnd < end) {
				end = realEnd;
			}
			
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
}

// 페이징 버튼을 클릭했을때
$(document).on("click", ".page-item a", function(e) {

	e.preventDefault();
	
	var actionForm = $("#actionForm");
	
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	var amount = actionForm.find("input[name='amount']").val();
	var pageNum = actionForm.find("input[name='pageNum']").val();
	var category = actionForm.find("input[name='category']").val();
	
	var data = {};
	
		data["pageNum"] = pageNum; 
		data["amount"] = amount;
		data["category"] = category;
				
	$.ajax({
		type : 'POST',
		url : '/getTableWithAjax.do',
		data : JSON.stringify(data),
		dataType : 'json',
		contentType: "application/json",
		success : function(result) {
								
			var values = '';
			var cate = '';
			var str = '';
			var paging = '';
			var total = result.total;
			
			if (category == 'review') {
				
				cate = '상품 후기';
				col = '별점';
				values = result.review;
				
			} else if (category == 'qna') {
				
				cate = '상품 QnA';
				col = '상품 번호';
				values = result.qna;
				
			} else if (category == 'onetoone') {
				
				cate = '1:1 문의';
				col = '문의유형';
				values = result.onetoone;		
			
			}
			
			$.each(values, function(index, value){
								
				if (cate == '상품 후기') {
					
					str += '<tr><td><h5>' + values[index].rv_num + '</h5></td><td><h5>' + cate + '</h5></td><td><h5>' + values[index].title + '</h5></td><td><h5>'
						+ values[index].score + '</h5></td><td><h5>' + values[index].re_date + '</h5></td></tr>';
					
				} else if (cate == '상품 QnA') {
					
					str += '<tr><td><h5>' + values[index].qna_num + '</h5></td><td><h5>' + cate + '</h5></td><td><h5>' + values[index].title + '</h5></td><td><h5>'
						+ values[index].goods_num + '</h5></td><td><h5>' + values[index].regdate + '</h5></td></tr>';
						
				} else if (cate == '1:1 문의') {
					
					str += '<tr><td><h5>' + values[index].one_one_num + '</h5></td><td><h5>' + cate + '</h5></td><td><h5>' + values[index].one_title + '</h5></td><td><h5>'
						+ values[index].one_category + '</h5></td><td><h5>' + values[index].regdate + '</h5></td></tr>';
				}
				
			});
				
			$('tbody').empty();
			$('tbody').append(str);
			
			$('#table_content').empty();
			$('#table_content').append(cate);
			
			$('#changing').empty();
			$('#changing').append(col);
			
			// 게시판 종류별 총 게시글 출력
			var all_cnt = '';
			all_cnt += '총 게시글 : ' + total + '개';
			
			$('#all_cnt').empty();
			$('#all_cnt').append(all_cnt);
			
			// 페이징 버튼 AJAX 처리
			var end = Math.ceil(pageNum / 10.0) * 10;
			var start = end - 9;
			var realEnd = Math.ceil( (total * 1.0) / amount );
				
			if (realEnd < end) {
				end = realEnd;
			}
			
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