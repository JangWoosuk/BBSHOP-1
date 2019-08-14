<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/shopping_header.jsp" %>

<style>
.page-item.active .page-link{
background-color: #57c051;
}
.cat_page .pagination li:hover a, .cat_page .pagination li.active a{
background-color: #57c051;
border-color: #57c051;
}
.genric-btn.default{
color:#ffffff;
background-color: #57c051;
}
.genric-btn.default:hover{
background-color: #57c051;
}
body {
	font-weight: bold;
	font-size: 17px;
}

.order_details_table {
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

a{
	color:#777777;
}

.genric-btn.primary{
	font-size:16px;
}

.nice-select {
	width: 110px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	var actionForm = $("#actionForm")
	
	$(".page-item a").on("click", function(e){
		
		e.preventDefault();
		
		console.log(actionForm.find("input[name='category']").val());
		
		var category = actionForm.find("input[name='category']").val();
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		console.log(category);
		
		actionForm.attr("action", category);
		
		actionForm.submit();
	});


	$(".move").on("click", function(e){
		
		e.preventDefault();
		
		actionForm.append("<input type='hidden' name='FAQ_NUM' value='"+
				$(this).attr("href")+"'>");
		actionForm.attr("action","/faq_get.do");
		actionForm.submit();
	})
	
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
</head>

<body>
	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="banner_inner d-flex align-items-center"
			style="background-color: #57c051;">
			<div class="container">
				<div class="banner_content text-center">
					<h2 style="color: white;">고객센터</h2>
					<div class="page_link">
						<a href="/shopping_main" style="color: white;">Home</a> <a
							href="/faq" style="color: white;">FAQ</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->
	<div class="container">
	<div class="button-group-area mt-40" style="margin-bottom: 30px; text-align:right;">
		<a href="/faq.do" class="genric-btn primary e-large"
			style="background: #57c051; font-size: 30px; font-weight: bold; width:15%;">FAQ</a>
		<a href="/one_to_one_list.do" class="genric-btn primary e-large"
			style="background: #a0a0a0; font-size: 30px; font-weight: bold; width:15%;">1:1문의</a>
	</div>
	
	<div class="button-group-area" style="text-align: center;">
		
		<a href="#" class="genric-btn primary radius"
			style="background: #57c051; color: #ffffff; font-weight: bold; width:19.6%;
			padding-right: 0px;margin-right: 0px;border-right-width: 0px;padding-left: 0px; border-left-width: 0px; margin-left: 0px;" >전체보기</a>
		<a href="#" class="genric-btn primary radius"
			style="background: #a0a0a0; color: #ffffff; font-weight: bold; width:19.6%;
			padding-right: 0px;margin-right: 0px;border-right-width: 0px;padding-left: 0px; border-left-width: 0px; margin-left: 0px;">변경/취소</a>
		<a href="#" class="genric-btn primary radius"
			style="background: #a0a0a0; color: #ffffff; font-weight: bold; width:19.6%;
			padding-right: 0px;margin-right: 0px;border-right-width: 0px;padding-left: 0px; border-left-width: 0px; margin-left: 0px;">교환/반품</a>
		<a href="#" class="genric-btn primary radius"
			style="background: #a0a0a0; color: #ffffff; font-weight: bold; width:19.6%;
			padding-right: 0px;margin-right: 0px;border-right-width: 0px;padding-left: 0px; border-left-width: 0px; margin-left: 0px;">주문/조회</a>
		<a href="#" class="genric-btn primary radius"
			style="background: #a0a0a0; color: #ffffff; font-weight: bold; width:19.6%;
			padding-right: 0px;margin-right: 0px;border-right-width: 0px;padding-left: 0px; border-left-width: 0px; margin-left: 0px;">상품문의</a>
	</div>
	
	<div class="button-group-area" style="margin-bottom: 20px; text-align: center;">
	<div class="order_details_table" style="margin-top: 0px; padding: 0px;">
		<!-- <h2 style="text-align: center;">고객센터</h2> -->
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr style="background: #9FC197;">
						<th style="width: 20%" scope="col">번호</th>
						<th style="width: 20%"scope="col">카테고리</th>
						<th style="width: 60%; text-align: center" scope="col">제목</th>
					</tr>
				</thead>
				
				<c:forEach items="${list}" var="FAQ">
				<tr>
					<td><c:out value="${FAQ.FAQ_NUM}" /></td>
					<td><c:out value="${FAQ.FAQ_CATEGORY}" /></td>
					<td><a class='move' href='<c:out value="${FAQ.FAQ_NUM}"/>'>
					<c:out value="${FAQ.SUBJECT}" /></a></td>
					
				</tr>

				</c:forEach>
			</table>
		</div>
	</div>
	
   <table class="paging_area"
      style="width: 1200px; margin-left: auto; margin-right: auto;">
      <tr>
         <td style="padding-left: 370px;">
         
            <nav class="cat_page mx-auto" aria-label="Page navigation example">
            
               <ul class="pagination" style="float: right;">

          	  <c:if test="${pageMaker.prev}">	
              <li class="page-item"><a class="page-link" href="${pageMaker.startPage -1}">
              <i class="fa fa-chevron-left" aria-hidden="true"></i>
                  </a></li>
              </c:if>
                 
                 <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                 <li class="page-item ${pageMaker.pagingVO.pageNum == num ? "active":""} ">
                 <a class="page-link" href="${num}">${num}</a></li>
                 </c:forEach>

                <c:if test="${pageMaker.next}">
                 	<li class="page-item"><a class="page-link" href="${pageMaker.endPage +1 }">
                 	<i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
                 </c:if>
                 
           
               </ul>
            </nav>
            	<form id='actionForm' action="/faq_list.do" method='get'>	
          			<input type='hidden' name='pageNum' value = '${pageMaker.pagingVO.pageNum}'>
          			<input type='hidden' name='amount' value = '${pageMaker.pagingVO.amount}'>
          			<input type='hidden' name='type' value ='<c:out value="${pageMaker.pagingVO.type}"/>'>
          			<input type='hidden' name='keyword' value ='<c:out value="${pageMaker.pagingVO.keyword}"/>'>
          			<input type='hidden' name='category' value='<c:out value="${page}"/>'>
          	   </form>	
         </td>
     
         
         <td class="search_area" style="float:right;">
         
            <div class="input-group" style="width: 80%; float:right;">
            	
            	<form id='searchForm' action="/faq_list.do" method='get' style="width: 400px; text-align: right">
            	
    				<select name='type' style="width: 110px;">    
    					
    					<option value=""
    					<c:out value="${pageMaker.pagingVO.type == null?'selected':''}" />>--</option>
  			          	
  			          	<option value="T"
  			          	<c:out value="${pageMaker.pagingVO.type eq 'T'?'selected':''}" />>제목</option>
            			
            			<option value="C"
            			<c:out value="${pageMaker.pagingVO.type eq 'C'?'selected':''}" />>내용</option>
            			
            			<option value="TC"
            			<c:out value="${pageMaker.pagingVO.type eq 'TC'?'selected':''}" />>제목 or 내용</option>
            			
            		</select>
 
            		
            		<input type='hidden' name='pageNum' value ='<c:out value="${pageMaker.pagingVO.pageNum}"/>' />
            		
          			<input type='hidden' name='amount' value = '<c:out value="${pageMaker.pagingVO.amount}"/>'/>
          			
               <input type="text" name='keyword' class="form-control" placeholder="글 검색" style="display: inline;
               width: 148px; padding-top: 0; padding-bottom: 5px" value='<c:out value="${pageMaker.pagingVO.keyword}"/>'/>
              
               <span class="input-group-btn">
                  <button class="btn btn-default" type="button" style="width: 50px; display:inline;" >
                     <i class="lnr lnr-magnifier"></i>
                  </button>
               </span>
            	</form>
            </div>
         </td>
      </tr>
   </table>
   </div>
   </div>
   </div>

<%@ include file="../include/shopping_footer.jsp" %>
