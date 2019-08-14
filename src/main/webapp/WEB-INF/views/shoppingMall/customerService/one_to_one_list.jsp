<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/shopping_header.jsp"%>

<style>
body {
	font-weight: bold;
	font-size: 17px;
}

.order_details_table {
	width: 1200px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 20px;
}

.order_details_table .table thead tr th {
	text-align: center;
}

.table td {
	text-align: center;
}

a {
	color: #777777;
}

.genric-btn.primary{
	font-size:16px;
}

.nice-select {
	width: 110px;
}

</style>

<script type="text/javascript">


		$(document).ready(function() {
			
			var actionForm = $("#actionForm");
			
			$(".page-item a").on("click", function(e){
				
				e.preventDefault();
				
				console.log($(this).attr("href"));
												
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				
				console.log(actionForm.find("input[name='pageNum']").val());
				
				actionForm.submit();
			});

		var result = '<c:out value="${result}"/>';
		
		$(".move").on("click", function(e){
			
			e.preventDefault();
			
			var value = Number($(this).attr("href"));
			
			console.log(value);
			
			actionForm.append("<input type='hidden' name='one_one_num' value='" + value + "'>");
			actionForm.attr("action","/onetoone_get.do");
			actionForm.submit();
		});
		
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function(e){
	
		if(!searchForm.find("option:selected").val()){
		alert("검색종류를 선택하세요");
		return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
		alert("키워드를 입력하세요");
		return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	});
	
	
	function move(where) {
		
		alert(where);
		
		location.href=where;
	}
});

		
</script>


<body>


	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="banner_inner d-flex align-items-center"
			style="background-color: #70e270;">
			<div class="container">
				<div class="banner_content text-center">
					<h2 style="color: white;">고객센터</h2>
					<div class="page_link">
						<a href="/shopping_main" style="color: white;">Home</a> <a
							href="/one_to_one_list" style="color: white;">1대1 문의</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->
	<div class="button-group-area mt-40" style="margin-bottom: 30px; margin-top: 40px;">
		<a href="/faq_list.do" class="genric-btn primary e-large"
			style="background: #024137; margin-left: 30%; padding: 6px 60px; font-size: 30px; font-weight: bold;">FAQ</a>
		<a href="/onetoonelist.do" class="genric-btn primary e-large"
			style="background: #024137; margin-left: 21%; padding: 6px 60px; font-size: 30px; font-weight: bold;">1:1문의</a>
	</div>

		<div class="order_details_table" style="margin-top: 0px; padding: 0px;">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr style="background: #9FC197;">
							<th scope="col"
								style="width: 15%;">번호</th>
							<th scope="col"
								style="width: 15%;">카테고리</th>
							<th scope="col"
								style="width: 50%;">제목</th>
							<th scope="col"
								style="width: 20%;">날짜</th>
						</tr>
					</thead>
					
				  	<c:forEach items="${list}" var="OnetoOne">
						<tr>
							<td><c:out value="${OnetoOne.one_one_num}" /></td>
							<td><c:out value="${OnetoOne.one_category}" /></td>
							<td><a class='move' href='${OnetoOne.one_one_num}'>
									<c:out value="${OnetoOne.one_title}" />
							</a></td>
							<td><c:out value="${OnetoOne.regdate}" /></td>
						</tr>

					</c:forEach>
					
				</table>
			</div>
		</div>

	<table class="paging_area"
		style="width: 1200px; margin-left: auto; margin-right: auto;">
		<tr>
			
			<td><a href="#writing_modal" class="genric-btn default radius"
				data-toggle="modal" style="font-weight: bold; font-size: 17px;">글쓰기</a></td>
				
			<td style="padding-left: 270px;">
			<nav class="cat_page mx-auto" aria-label="Page navigation example">
			
					<ul class="pagination" style="float: right;">

						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link"href="${pageMaker.startPage -1}"> 
							<i class="fa fa-chevron-left" aria-hidden="true"></i>
							</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="page-item ${pageMaker.pagingVO.pageNum == num ? active : ''}">
								<a class="page-link" href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="page-item"><a class="page-link" href="${pageMaker.endPage +1 }">
							<i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
						</c:if>

					</ul>
				</nav>
				
				<form id='actionForm' action="/onetoonelist.do" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.pagingVO.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.pagingVO.amount}'>
					<input type='hidden' name='type' value='<c:out value="${pageMaker.pagingVO.type}"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${pageMaker.pagingVO.keyword}"/>'>
					<!--   <input type='hidden' name='one_to_one_category'>-->
				</form>
				</td>
		
			<td class="search_area" style="float: right;">

				<div class="input-group" style="width: 80%; float: right;">

					<form id='searchForm' action="/onetoonelist.do" method='get'
						style="width: 400px; text-align: right">

						<select name='type' style="width: 110px;">

							<option value=""
								<c:out value="${pageMaker.pagingVO.type == null?'selected':''}" />>--</option>

							<option value="T"
								<c:out value="${pageMaker.pagingVO.type eq 'T'?'selected':''}" />>제목</option>

							<option value="C"
								<c:out value="${pageMaker.pagingVO.type eq 'C'?'selected':''}" />>내용</option>

							<option value="TC"
								<c:out value="${pageMaker.pagingVO.type eq 'TC'?'selected':''}" />>제목
								or 내용</option>

						</select>
						
						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.pagingVO.pageNum}"/>' />
						
						<input type='hidden' name='amount' value='<c:out value="${pageMaker.pagingVO.amount}"/>' />
						
						<input type="text" name='keyword' class="form-control" placeholder="글 검색" style="display: inline; 
						width: 148px; padding-top: 0; padding-bottom: 5px" value='<c:out value="${pageMaker.pagingVO.keyword}"/>' />
						
						<span class="input-group-btn">
							<button class="btn btn-default" type="button" style="width: 50px; display: inline;">
								<i class="lnr lnr-magnifier"></i>
							</button>
						</span>
					</form>
				</div>
			</td>
		</tr>
	</table>

	<!-- ===============모달 Area ==================== -->
	<!-- 글쓰기 모달 -->
	<div class="modal fade" id="writing_modal" tabindex="-1" role="dialog"
		aria-labelledby="writing_modal_label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 30%; margin: 8% auto;">
				<div class="modal-header">
					<h2 class="text-black" style="font-weight: bold">글쓰기</h2>
					<span class="close" data-dismiss="modal">&times;</span>
				</div>
			<form role="form" action="/onetoone_register.do" method="post">
								
				<div class="modal-body">
					<div class="row">
						<div class="col-md-11">
							<div class="form-group row">
									<div class="col-md-6">
										<label for="subject" class="text-black">제목 <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="subject" name="one_title">
									</div>
									<div class="col-md-6">
										<label for="category" class="text-black">카테고리 <span
											class="text-danger">*</span></label>
										<div class="left_dorp">
											<select class="sorting" name="one_category">
												<option value="--">--</option>
												<option value="주문/배송">주문/배송</option>
												<option value="상품관련">상품관련</option>
												<option value="결제관련">결제관련</option>
												<option value="기타">기타</option>
											</select>
										</div>
									</div>
									<div class="col-md-10">
										<label for="content" class="text-black mt-10" >내용 <span
											class="text-danger" >*</span></label>
										<div>
											<textarea class="single-textarea" placeholder="글 내용을 작성해주세요."
												onfocus="this.placeholder = ''" name="one_contents" style="margin-bottom: 10px"></textarea>
										</div>
									</div>
									<div class="col-md-6">
										<label for="content" class="text-black">첨부파일</label>
										<div>
											<input type="file" id="file" name="one_file">
										</div>
									</div>
								</div> 
				
						</div>
					</div>
				</div>
				<div class="modal-footer" align="center">
				<button type="submit" class="genric-btn default radius">등록</button>
					<button type="button" class="genric-btn danger radius"
						data-dismiss="modal">닫기</button>
					
				</div>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="../include/shopping_footer.jsp"%>