<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!--================ start footer Area  =================-->
	<footer class="footer-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6 class="footer_title">About Us</h6>
						 <p>야구용품 쇼핑을 넘어 야구를 사랑하는 사람들과 함께 이야기 할 수 있는 공간을 만들어갑니다.</p>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6 class="footer_title">Newsletter</h6>
						 <p>MIZUNO 브랜드의 새로운 제품이 입고되었습니다. (8/6)</p>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-footer-widget instafeed">
						<h6 class="footer_title">Instagram Feed</h6>
						<ul class="list instafeed d-flex flex-wrap">
							<li>
								<img src="resources/shoppingMall/img/instagram/Image-01.jpg" alt="">
							</li>
							<li>
								<img src="resources/shoppingMall/img/instagram/Image-02.jpg" alt="">
							</li>
							<li>
								<img src="resources/shoppingMall/img/instagram/Image-03.jpg" alt="">
							</li>
							<li>
								<img src="resources/shoppingMall/img/instagram/Image-04.jpg" alt="">
							</li>
							<li>
								<img src="resources/shoppingMall/img/instagram/Image-05.jpg" alt="">
							</li>
							<li>
								<img src="resources/shoppingMall/img/instagram/Image-06.jpg" alt="">
							</li>
							<li>
								<img src="resources/shoppingMall/img/instagram/Image-07.jpg" alt="">
							</li>
							<li>
								<img src="resources/shoppingMall/img/instagram/Image-08.jpg" alt="">
							</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6" style="padding-left : 50px;">
					<div class="single-footer-widget f_social_wd">
						<h6 class="footer_title">Follow Us</h6>
						<p>Let us be social</p>
						<div class="f_social">
							<a href="#">
								<i class="fa fa-facebook"></i>
							</a>
							<a href="#">
								<i class="fa fa-twitter"></i>
							</a>
							<a href="#">
								<i class="fa fa-dribbble"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row footer-bottom d-flex justify-content-between align-items-center" style="font-weight:bold;">
       			<p class="col-lg-12 footer-text text-center">
            	<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
           			Copyright &copy;
            		<script>
               			document.write(new Date().getFullYear());
            		</script>
            		All rights reserved by BitCamp
         		</p>
     		</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->

<!-- ================모달 js====================== -->
<script>
	var search_Modal = document.getElementById('search');
	var searchBig_Modal = document.getElementById('searchBig');

	var span1 = document.getElementsByClassName("close")[0];
	var span2 = document.getElementsByClassName("close")[1];

	var curtain = document.getElementById('curtain');
	var miniCart = document.getElementById('miniCart');
	
	var cart_btn = document.getElementById('cart_btn');
	var view_cart_btn = document.getElementById('view_cart_btn');
	var info_cart_btn = document.getElementById('info_cart_btn');
	
	//search_btn 눌렀을 때,
	$('#search_btn').click(function() {
		search_Modal.style.display = "block";
	})

	//searchBig_btn 눌렀을 때,
	$('#searchBig_btn').click(function() {
		searchBig_Modal.style.display = "block";
	})

	//x버튼 눌렀을 때, 모달창 끄기
	span1.onclick = function() {
		search_Modal.style.display = "none";
	}
	span2.onclick = function() {
		searchBig_Modal.style.display = "none";
	}

	//장바구니 아이콘 눌렀을 때, miniCart나오기
	cart_btn.onclick = function() {
		curtain.style.display = "block";
		miniCart.style.width = "350px";
	}
	//페이지이동 : viewcart 버튼 눌렀을 때, 
	view_cart_btn.onclick = function() {
		curtain.style.display = "none";
		miniCart.style.width = "0";
		location.href="/cart";
	}
	// 상품info에서 장바구니 버튼 눌렀을 때, miniCart나오기
	info_cart_btn.onclick = function() {
		curtain.style.display = "block";
		miniCart.style.width = "350px";
	}

	function openCart() {
		curtain.style.display = "block";
		miniCart.style.width = "350px";
	}
	
	function closeCart() {
		curtain.style.display = "none";
		miniCart.style.width = "0";
	}
	
	window.onclick = function(event) {
		
		if (event.target == search_Modal) {
			search_Modal.style.display = "none";
		} else if (event.target == searchBig_Modal) {
			searchBig_Modal.style.display = "none";
		} else if (event.target == curtain) {
			curtain.style.display = "none";
			miniCart.style.width = "0";
		}
	}
</script>
<!-- ================end 모달 js====================== -->


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="resources/shoppingMall/js/jquery-3.2.1.min.js"></script>
<script src="resources/shoppingMall/js/popper.js"></script>
<script src="resources/shoppingMall/js/bootstrap.min.js"></script>
<script src="resources/shoppingMall/js/stellar.js"></script>
<script src="resources/shoppingMall/vendors/lightbox/simpleLightbox.min.js"></script>
<script
	src="resources/shoppingMall/vendors/nice-select/js/jquery.nice-select.min.js"></script>
<script src="resources/shoppingMall/vendors/isotope/imagesloaded.pkgd.min.js"></script>
<script src="resources/shoppingMall/vendors/isotope/isotope-min.js"></script>
<script src="resources/shoppingMall/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="resources/shoppingMall/js/jquery.ajaxchimp.min.js"></script>
<script src="resources/shoppingMall/js/mail-script.js"></script>
<script src="resources/shoppingMall/vendors/jquery-ui/jquery-ui.js"></script>
<script
	src="resources/shoppingMall/vendors/counter-up/jquery.waypoints.min.js"></script>
<script src="resources/shoppingMall/vendors/counter-up/jquery.counterup.js"></script>
<script src="resources/shoppingMall/js/theme.js"></script>

<script src="https://kit.fontawesome.com/2eb351aff8.js"></script>

<!-- Modal -->
<!-- 마이페이지의 주문/배송의 주문 목록을 누르면 나옴 -->
<div class="modal modal-center fade" id="modal_order_detail"
	tabindex="-1" role="dialog" aria-labelledby="modal_order_detail_label"
	aria-hidden="true">
	<div class="modal-dialog mdl_od modal-center" role="document">
		<div class="modal-content mdl_od" style="margin-top: 0px;">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">주문 상세</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-6 mb-5 mb-md-0">
						<h3 class="h3 mb-3 text-black">주문 정보</h3>
						<div class="p-3 p-lg-4 border">
							<div class="form-group row">
								<div class="col-md-6">
									<label for="c_fname" class="text-black">주문일자 <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="or_date" name="or_date" 
											value="<fmt:formatDate pattern="yyyy-MM-dd" value="${orderVO.or_date }"/>" readonly>
								</div>
								<div class="col-md-6">
									<label for="orderer" class="text-black">주문자 <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="orderer" name="orderer" readonly>
								</div>
							</div>

							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_companyname" class="text-black">주문 번호 </label> <input
										type="text" class="form-control" id="mdl_or_num" name="mdl_or_num" readonly>
								</div>
							</div>
							
							<div class="form-group">
								<label for="order_notes" class="text-black">주문 메모</label>
								<textarea name="order_notes" id="order_notes" cols="30"
									rows="5" class="form-control" placeholder="" readonly></textarea>
							</div>

							<div class="form-group row">
								<div class="col-md-6">
									<label for="receiver" class="text-black">수취인 <span
										class="text-danger">*</span>
									</label> <input type="text" class="form-control" id="receiver"
										name="receiver" readonly>
								</div>
								<div class="col-md-6">
									<label for="postal_zip" class="text-black">우편번호 <span
										class="text-danger">*</span>
									</label> <input type="text" class="form-control" id="postal_zip"
										name="postal_zip" readonly>
								</div>
							</div>

							<div class="form-group row mb-5">
								<div class="col-md-6">
									<label for="email_address" class="text-black">배송번호 <span
										class="text-danger">*</span>
									</label> <input type="text" class="form-control" id="email_address"
										name="email_address" readonly>
								</div>
								<div class="col-md-6">
									<label for="phone" class="text-black">연락처 <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="phone" name="phone"
										placeholder="" readonly>
								</div>
							</div>

							<div class="form-group row">
								<div class="col-md-12">
									<label for="address" class="text-black">주소 <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="address" name="address"
										placeholder="기본 주소" readonly>
								</div>
							</div>

							<div class="form-group">
								<input type="text" class="form-control" placeholder="상세 주소" readonly>
							</div>

						</div>
					</div>
					<div class="col-md-6">
						<div class="row mb-5">
							<div class="col-md-12">
								<h3 class="h3 mb-3 text-black">상품 정보</h3>
								<div class="p-3 p-lg-2 border">
									<table class="table site-block-order-table mb-5">
										<thead>
											<th>상품</th>
											<th>수량</th>
											<th>금액</th>
										</thead>
										<tbody>
											<tr>
												<td id="goods"></td>
												<td>1</td>
												<td>￦30,000</td>
											</tr>
											<tr>
												<td class="text-black font-weight-bold"><strong>주문
														총합</strong></td>
												<td></td>
												<td class="text-black font-weight-bold"><strong>￦30,000</strong></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

</body>

</html>