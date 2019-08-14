<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/mypage_header.jsp"%>

<style>
.goods {
	width: 50px;
	height: 30px;
}

.visit {
	text-align: center;
}

.order_details_table {
	padding: 0px 30px 0px 30px;
	background: white;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	padding: 20px;
	line-height: 1.42857143;
	vertical-align: top;
	border-top: 1px solid #ddd;
}

.modal-dialog, .mdl_od {
	width: 80%;
	height: 50%;
	margin: 0;
	padding: 0;
}

.modal-content, .mdl_od {
	height: auto;
	min-height: auto;
}

.modal, .modal-center {
	position: absolute;
	left: 180px;
}

@media screen and (min-width: 768px) {
	.modal.modal-center:before {
		display: inline-block;
		vertical-align: middle;
		content: "";
		height: 60%;
	}
}

.modal-dialog, .modal-center {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
</style>

<div class="container">
	<div class="order_details_table" style="margin-top: 10px;">
		<p><h3 class="mb-30 title_color">주문 / 배송</h3></p>
		<h5 align="left">내 주문의 상태를 조회하고 취소할 수 있습니다.</h5>
		<h5 align="right"><span id="all_cnt">내 주문 : ${pageMaker.total }건</span></h5>
		<div class="col-md-6" style="margin-bottom: 10px; padding-left: 0px;">
			<input type="checkbox" name="stts" value="0" id="paid" onclick="showOrderList()">
				<label for="paid" class="addr_chk">결제완료</label>&nbsp;&nbsp;
			<input type="checkbox" name="stts" value="1" id="deliverPre" onclick="showOrderList()">
				<label for="deliverPre" class="addr_chk">배송준비중</label>&nbsp;&nbsp;
			<input type="checkbox" name="stts" value="2" id="delivering" onclick="showOrderList()">
				<label for="delivering" class="addr_chk">배송중</label>&nbsp;&nbsp;
			<input type="checkbox" name="stts" value="3" id="deliverFin" onclick="showOrderList()">
				<label for="deliverFin" class="addr_chk">배송완료</label>&nbsp;&nbsp;
			<input type="checkbox" name="stts" value="4" id="cancel" onclick="showOrderList()">
				<label for="cancel" class="addr_chk">주문취소</label>
		</div>
		<!-- 끝 -->
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col" style="width: 10%; font-weight: bold;">주문번호</th>
					<th scope="col" style="width: 10%; font-weight: bold;">주문일자</th>
					<th scope="col" style="font-weight: bold;">주문목록</th>
					<th scope="col" style="width: 10%; font-weight: bold;">결제금액</th>
					<th scope="col" style="width: 10%; font-weight: bold;">주문상태</th>
					<th scope="col" style="width: 15%; font-weight: bold;">배송현황</th>
					<th scope="col" style="width: 15%; font-weight: bold;">주문취소</th>
				</tr>
			</thead>
			<tbody id="order_table">
			</tbody>
		</table>
		<div class="text-center">
			<ul class="pagination">
				<!-- 페이지 목록 버튼 -->
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="page-item ${pageMaker.pagingVO.pageNum == num ? 'active' : ''}" id="btn_${num }">
						<a href="${num}" class="page-link">${num}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
		<!-- 페이징 버튼 처리를 위한 히든 폼 -->
		<form id="actionForm" action="order_status.do">
			<input type="hidden" name="pageNum" value="${pageMaker.pagingVO.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.pagingVO.amount }">
		</form>
	</div>
</div>

<script>

	var actionForm = $("#actionForm");

	var order_num = '';
	var order_item = '';
	var order_date = '';
	var order_name = '';
	var order_msg = '';
	var receiver = '';

	// 주문 취소
	function fn_cancel_order(order_num) {

		var answer = confirm("주문을 취소하시겠습니까?");

		if (answer == true) {

			alert("주문이 취소되었습니다.");

			var formObj = document.createElement("form");
			var i_order_num = document.createElement("input");

			i_order_num.name = "order_num";
			i_order_num.value = order_num;

			formObj.appendChild(i_order_num);
			document.body.appendChild(formObj);

			formObj.method = "post";
			formObj.action = "/order_cancel.do";

			formObj.submit();
		}
	}

	// 주문내역 클릭시 뜨는 모달 데이터 처리
	function showModal(order_idx) {

		var list = new Array();

		<c:forEach items="${orders_list}" var="orderVO" varStatus="status">
			
			if ('${status.index}' == order_idx) {
	
				list.push('${orderVO.order_num}');
				list.push('${orderVO.items}');
				list.push('${orderVO.or_date}');
				list.push('${orderVO.name}')
				list.push('${orderVO.or_msg}')
				list.push('${orderVO.receiver}');
			}
			
		</c:forEach>

		order_num = list[0];
		order_item = list[1];
		order_date = list[2];
		order_name = list[3];
		order_msg = list[4];
		receiver = list[5];
	}
	
	// 주문 목록 모달 처리
	$(document).ready(function() {

		$('#modal_order_detail').on('show.bs.modal', function(event) {

			$('#mdl_or_num').val(order_num);
			$('#or_date').val(order_date);
			$('#goods').html(order_item);
			$('#orderer').val(order_name);
			$('#order_notes').html(order_msg);
			$('#receiver').val(receiver);
		});

	});
	
	// 주문 배송 상태에 따른 체크박스 클릭시의 함수
	function showOrderList(checkbox) {
		
		var checkValues = new Array();
		
		actionForm.find("input[name='pageNum']").val(1); // 어떠한 카테고리든 선택시에는 1페이지부터 보이게 고정한다.
		
		if ($("input[name='stts']:checked").length == 0) {
			
			checkValues.push('5'); // 체크된 버튼이 없을시에 전체 주문을 불러온다.
			
		} else {
		
			$("input[name='stts']:checked").each(function(){
				
				checkValues.push($(this).val());
			});
		}
		
		var pageNum = actionForm.find("input[name='pageNum']").val();
		var amount = actionForm.find("input[name='amount']").val();
		
		var data = {};	  
		data["stts"] = checkValues;
		data["pageNum"] = pageNum;
		data["amount"] = amount;
		
		console.log('ajax에서 컨트롤러로 보낼 데이터 : ' + data);
		
		$.ajax({
			type: "POST",	    
			url : "/orderListCheck.do",
			data : JSON.stringify(data),    
			dataType: "json",			
			contentType:"application/json",			
			success : function(result) {
							
				var str = '';
				var end = (Math.ceil(pageNum / 10.0)) * 10;
				var start = end - 9;
				var total = result.length;
				var paging = '';
				var cnt = 0;
				
				var realEnd = (Math.ceil((result.total * 1.0) / amount));
				
				if (realEnd < end) {
					end = realEnd;
				}
																		
				var values = result.orders_list;
					
				$.each(values, function(index, value) {
										
					str += '<tr><td><h5>' + values[index].order_num + '</h5></td><td><h5>' + values[index].or_date;
					str += '</h5></td><td><h5>';
					str += '<a href="' + values[index].items + '" data-toggle="modal" data-target="#modal_order_detail" style="color: #222222;"';
					str += ' onclick="showModal(' + cnt + ');">';
					str += values[index].items + '</a></h5></td><td><h5>';
					str += '￦ ' + values[index].pymntamnt + '</h5></td><td><h5>';
							
					cnt = cnt + 1;
					
					switch(values[index].stts) {
						
						case 0 : str += '결제완료'; break;
						case 1 : str += '배송준비중'; break;
						case 2 : str += '배송중'; break;
						case 3 : str += '<span style="color: blue;">배송완료</span>'; break;
						case 4 : str += '<span style="color: red;">주문취소</span>'; break;
					}
						
					str += '</h5></td><td>' + '<button type="button" id="see_order" class="genric-btn default radius"><span>배송 조회</span></button></td><td>';
					
					if (values[index].stts == 0) {
							
						str += 	'<button type="button" id="cancel_order" class="genric-btn danger radius" onClick="fn_cancel_order(' + values[index].order_num + ')">'
						+ '<span>주문 취소</span></button></td></tr>';
							
					} else {
							
						str += '</td></tr>';
					}
					
				});
				
				$('#order_table').empty();
				$('#order_table').append(str);
				
				// 전체 주문 수 표시 AJAX 처리
				var all_cnt = '';
				all_cnt += '내 주문 : ' + result.total + '건';
				
				$('#all_cnt').empty();
				$('#all_cnt').append(all_cnt);
				
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
			
			error: function() {
			
				alert('ajax 에러!');
			}
		});
	}
	
	// 페이지가 로드되면 주문/배송 전체 리스트 불러오기
	$(document).ready(function() {
		
		var data = {
			pageNum: actionForm.find("input[name='pageNum']").val(), 
			amount: actionForm.find("input[name='amount']").val()
		};
		
		$.ajax({
			type: "POST",
			url: "/orderListPaging.do",
			data : JSON.stringify(data),
			dataType : "json",
			contentType: "application/json",
			success : function(result) {
				
				var start = ${pageMaker.startPage};
				var end = ${pageMaker.endPage};
				
				var str = '';
				var paging = '';
								
				$.each(result, function(index, value){
										
					str += '<tr><td><h5>' + result[index].order_num + '</h5></td><td><h5>' + result[index].or_date;
					str += '</h5></td><td><h5>';
					str += '<a href="' + result[index].items + '" data-toggle="modal" data-target="#modal_order_detail" style="color: #222222;"';
					str += ' onclick="showModal(' + index + ');">';
					str += result[index].items + '</a></h5></td><td><h5>';
					str += '￦ ' + result[index].pymntamnt + '</h5></td><td><h5>';
						
					switch(result[index].stts) {
					
						case 0 : str += '결제완료'; break;
						case 1 : str += '배송준비중'; break;
						case 2 : str += '배송중'; break;
						case 3 : str += '<span style="color: blue;">배송완료</span>'; break;
						case 4 : str += '<span style="color: red;">주문취소</span>'; break;
					}
					
					str += '</h5></td><td>' + '<button type="button" id="see_order" class="genric-btn default radius"><span>배송 조회</span></button></td><td>';
					
					if (result[index].stts == 0) {
						
						str += 	'<button type="button" id="cancel_order" class="genric-btn danger radius" onClick="fn_cancel_order(' + result[index].order_num + ')">'
						+ '<span>주문 취소</span></button></td></tr>';
						
					} else {
						
						str += '</td></tr>';
					}
				});
				
				$('#order_table').empty();
				$('#order_table').append(str);
				
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
	})
	
	// 페이징 버튼 클릭시 페이징 함수
	$(document).on("click", ".page-item a", function(e) {

		e.preventDefault();
		
		var checkValues = new Array();
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		if ($("input[name='stts']:checked").length == 0) {
			
			checkValues.push('5'); // 체크된 버튼이 없을시에 전체 주문을 불러온다.
			
		} else {
		
			$("input[name='stts']:checked").each(function(){
		    				
				checkValues.push($(this).val());
			});
		}
		
		var pageNum = actionForm.find("input[name='pageNum']").val();
		var amount = actionForm.find("input[name='amount']").val();
		
		var data = {};  
		data["stts"] = checkValues;
		data["pageNum"] = pageNum;
		data["amount"] = amount;
		
		$.ajax({
			type: "POST",	    
			url : "/orderListCheck.do",
			data : JSON.stringify(data),    
			dataType: "json",			
			contentType:"application/json",			
			success : function(result) {
							
				var str = '';
				var end = (Math.ceil(pageNum / 10.0)) * 10;
				var start = end - 9;
				var total = result.length;
				var paging = '';
				var cnt = 0;

				var realEnd = (Math.ceil((result.total * 1.0) / amount));
				
				if (realEnd < end) {
					end = realEnd;
				}
																		
				var values = result.orders_list;
					
				$.each(values, function(index, value) {
					
					console.log(index);
					
										
					str += '<tr><td><h5>' + values[index].order_num + '</h5></td><td><h5>' + values[index].or_date;
					str += '</h5></td><td><h5>';
					str += '<a href="' + values[index].items + '" data-toggle="modal" data-target="#modal_order_detail" style="color: #222222;"';
					str += ' onclick="showModal(' + cnt + ');">';
					str += values[index].items + '</a></h5></td><td><h5>';
					str += '￦ ' + values[index].pymntamnt + '</h5></td><td><h5>';
					
					cnt = cnt + 1;
							
					switch(values[index].stts) {
						
						case 0 : str += '결제완료'; break;
						case 1 : str += '배송준비중'; break;
						case 2 : str += '배송중'; break;
						case 3 : str += '<span style="color: blue;">배송완료</span>'; break;
						case 4 : str += '<span style="color: red;">주문취소</span>'; break;
					}
						
					str += '</h5></td><td>' + '<button type="button" id="see_order" class="genric-btn default radius"><span>배송 조회</span></button></td><td>';
					
					if (values[index].stts == 0) {
							
						str += 	'<button type="button" id="cancel_order" class="genric-btn danger radius" onClick="fn_cancel_order(' + values[index].order_num + ')">'
						+ '<span>주문 취소</span></button></td></tr>';
							
					} else {
							
						str += '</td></tr>';
					}
					
				});
				
				$('#order_table').empty();
				$('#order_table').append(str);
				
				// 전체 주문 수 AJAX 처리
				var all_cnt = '';
				all_cnt += '내 주문 : ' + result.total + '건';
				
				$('#all_cnt').empty();
				$('#all_cnt').append(all_cnt);
				
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
			
			error: function() {
			
				alert("error = " + errorThrown);
			}
		});
	});
</script>

<%@ include file="../include/mypage_footer.jsp"%>