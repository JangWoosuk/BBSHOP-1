<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    
<%@ include file="../include/shopping_header.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="com.bbshop.bit.cart.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%
 	List<GoodsVO> goodsList= (List<GoodsVO>)request.getAttribute("goodsList");
 List<Cart_GDVO> cartList= (List<Cart_GDVO>)request.getAttribute("cartList");
 int allPrice = (int)request.getAttribute("allPrice");
 int shipping_fee = (int)request.getAttribute("shipping_fee");
 %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<style>
@font-face{font-family:'NanumBarunpen';font-weight:normal;src:local(NanumBarunpen);src:url("resources/shoppingMall/fonts/nanumbarunpenR.eot");src:url("resources/shoppingMall/fonts/nanumbarunpenR.woff") format("woff"), url("resources/shoppingMall/fonts/nanumbarunpenR.woff2") format("woff2")}
@font-face{font-family:'NanumBarunpen';font-weight:bold;src:local(NanumBarunpen);src:url("resources/shoppingMall/fonts/nanumbarunpenB.eot");src:url("resources/shoppingMall/fonts/nanumbarunpenB.woff") format("woff"), url("resources/shoppingMall/fonts/nanumbarunpenB.woff2") format("woff2")}

body{font-family:NanumBarunpen, sans-serif}
/*
.d-flex{
	width:30%
}*/
</style>
	<!-- 1. vo를 만들자  (완료)
		 2. 전체 선택을 누르면 상품이 전체다 뜨게하자.(완료)
		 3. 퀀티티의 양을 늘리면 토탈 값이 올라가자(완료)
		 4. 토탈이 올라가면 서브토탈이 올라가자.(완료)
		 5. 금액이 일정이상 올라가면 배송료를 무료로 주자.(완료)
		 6. 물품의 사진을 받아오자.(완료)
		 7. 해당 상품이 삭제되면 삭제되는 controller를 써서 삭제를 하자.(선택삭제,전체삭제)
		 8. 위의 사항이 모두 마무리가되면 주문으로 넘겨주자.(DB를 만져야함)
		
		 
	-->
	<script>
	$(document).ready(function(){
		//전체 체크박스 클릭시 전체체크 혹은 전체해제 
		$("#check_all").click(function(){
			if($("#check_all").is(":checked")){
				$(".check").prop("checked" , true);
			}
			else{
				$(".check").prop("checked", false);
				
			}
			
			
		});
		
		//하위 항목중 하나라도 체크가 풀릴시 전체 체크도 풀려야한다.
		$(".check").click(function(){
			if($("input[class='check']:checked").length<=${cartList.size()}){
				$("#check_all").prop("checked",false);
				
			}else{
				$("#check_all").prop("checked",true);
			}
		
		
		});
			
	});
		
	</script>
	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>Shopping Cart</h2>
					<div class="page_link">
						<a href="/shopping_main">쇼핑몰</a>
						<a href="/cart.do">Cart</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->

	<!--================Cart Area =================-->
	<section class="cart_area">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th width="4%"><input type='checkbox' class='check' id='check_all'></th>
								<th scope="col" >GoodsNum</th>
								<th scope="col" style="width:4%" >Photo</th>
								<th style='text-align:center' scope="col">Product</th>
								<th scope="col" >Price</th>
								<th scope="col" >Savings</th>
								<th scope="col">Quantity</th>
								<th scope="col">Total</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach var="cart" items="${cartList}" varStatus="status">
				
							<tr>
								<td>
								<input type='checkbox' class='check' id='pd_check'>
								</td>
								
								<td><h5>${goodsList[status.index].GOODS_NUM}</h5>
								</td>
								<td>
											<img src="<c:out value='${goodsList[status.index].MAIN_IMG}'/>" style="width:100%; height:50%" alt="">
								</td>
								<td>
											<p><c:out value="${goodsList[status.index].NAME}"/></p>
								</td>
								<td>
									<h5 id=price${status.index}><c:out value="${cart.PRICE}원"/></h5>
								</td>
								<td>
								<h5><c:out value="${cart.SAVINGS}"/></h5>
								</td>
								
								<td>
									<div class="product_count">
										<input type="text" name="qty" id="sst${status.index}" value="${cart.QNTTY }" title="Quantity:" class="input-text qty">
										<button id="QNTTYUP${status.index}" onclick="var result = document.getElementById('sst${status.index}'); var sst = result.value; if( !isNaN( sst )) result.value++;  return false;"
										 class="increase items-count" type="button">
											<i class="lnr lnr-chevron-up"></i>
										</button>
										<button id="QNTTYDOWN${status.index}" onclick="var result = document.getElementById('sst${status.index}'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 1 ) result.value--;return false;"
										 class="reduced items-count" type="button">
											<i class="lnr lnr-chevron-down"></i>
										</button>
									</div>
								</td>
								<td>
									<h5 id="totalPrice${status.index}"><c:out value="${cart.TOTALPRICE}원"/></h5>
								</td>
							</tr>
 							<script>
 							//지금 은 버튼이 움직일때로 했는데 후에 시간이 나면 버튼말고 인풋태그의 값이 변할때 값이 변하는걸로 변경하자.
							//업버튼을 눌렀을시 ajax로 값을 변경해준다.
							$('#QNTTYUP${status.index}').click(function(){
								var sst = $('#sst${status.index}').val();
								//get방식을 이용해서 값을 보냄
								$.ajax({
 				        			url:"QnttyUp.do?index=${status.index}&QNTTY="+sst,
 				        			type:"GET",
 				        			dataType:"text", //text를 받아와서 data를 ,를 기점으로 잘라서 배열에 저장.
 				        			success : function(data) {
 				        				var result =data.split(",");
 				        				
 				        				$("#totalPrice${status.index}").html(result[0]+"원");
 				        				$("#allPrice").html(result[1]+"원");
 				        				$("#shipping_fee").html(result[2]+"원");
 									}, error : function() {
 											console.log("실패");
 									}
 								});
 							});
							$('#QNTTYDOWN${status.index}').click(function(){
								var sst = $('#sst${status.index}').val();
								
								$.ajax({
 				        			url:"QnttyDown.do?index=${status.index}&QNTTY="+sst,
 				        			type:"GET",
 				        			dataType:"text",
 				        			success : function(data) {
 				        				var result = data.split(",");
 				        				
 				        				$("#totalPrice${status.index}").html(result[0]+"원");
 				        				$("#allPrice").html(result[1]+"원");
 				        				$("#shipping_fee").html(result[2]+"원");
 									}, error : function() {
 											console.log("실패");
 									}
 								});
 							});
 						    
 							</script>
 							</c:forEach>
							<tr class="shipping_area">
								<td>
								
								</td>
								<td>
								</td>
								<td></td>
								<td></td>
								<td></td>	
								<td>
								</td>
								<td>
									<h5>배송비</h5>
								</td>				
								<td>
									<h5 id="shipping_fee">${shipping_fee}원</h5>
								</td>
							</tr>
							<tr>
								<td>
								</td>
								<td>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td>
								</td>
								<td>
									<h5>Total:</h5>
								</td>
								<td>
									<h5 id="allPrice">${allPrice}원</h5>
								</td>
							</tr>
						</tbody>
					</table>
							
							
							
							<div style="float:left">
							<button style="width:100%" class="genric-btn danger radius e-large" id="selectDelete">선택삭제</button>
								</div>				
							
							
							
							<div style="float:right" class="checkout_btn_inner">
											<a class="main_btn" href="/order">결제하기</a>
											
											<a class="genric-btn default-border radius e-large" href="/goods_list">계속 쇼핑하기</a>
										</div>
											
								
							
							
							
				</div>
			</div>
		</div>
		<script>
		//for문을 돌려서 체크 된값을 가져오고 그 인덱스를 가져와서 
		//해당 인덱스의 값을 카트 에서 지워주면될듯.
		$("#selectDelete").click(function(){
			var listindex=[];
			$('input:checkbox[type=checkbox]:checked').each(function () {
				listindex.push($('.check').index(this));
			
				});
			var ajaxarr={"listindex":listindex}
			alert(listindex);
			$.ajaxSettings.traditional = true;
			$.ajax({
     			url:"selectDelete.do",
     			type:"POST",
     			data:ajaxarr,
     			dataType:"text", //text를 받아와서 data를 ,를 기점으로 잘라서 배열에 저장.
     			success : function(data) {
     				console.log("성공");
     				}, error : function() {
							console.log("실패");
					}
				});
		});
		
		
		</script>
	</section>
	<!--================End Cart Area =================-->


<%@ include file="../include/shopping_footer.jsp" %>