<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
</div>
	<!--================ End footer Area  =================-->

<script>
<!-- ================ 모달 & 장바구니 js ====================== -->
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
		
		var data = {};
		
		$.ajax({
			type: "POST",
			url: "getCartList.do",
			data: JSON.stringify(data),
			dataType: "json",
			contentType: "application/json",
			success: function(result) {
								
				var content = '';
				var total = '';
				var carts = result.cart_list;
				
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
				
				$('.miniCart_list').empty();
				$('.miniCart_list').append(content);
				
				// 미니카트 total 없애기
				total += result.allPrice + '원';
				
				$('#minicart_total').empty();
				$('#minicart_total').append(total);
				
			},
			error: function() {

				alert('ajax 실패!');
			}
		});
		
		curtain.style.display = "block";
		miniCart.style.width = "350px";
	}
	//페이지이동 : viewcart 버튼 눌렀을 때, 
	view_cart_btn.onclick = function() {
		curtain.style.display = "none";
		miniCart.style.width = "0";
		location.href="/cart";
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
	
	// 일반 검색 버튼 눌렀을 때
	function general_search() {
		
		var min_amount = $('#min_amount').val();
		var max_amount = $('#max_amount').val();
		
		var pageNum = 1;
		var amount = $('#actionForm input[name="amount"]').val();
		
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
		
		// 일반 검색 키워드
		data["search"] = $('#search_name').val();

		console.log(data);
		
		$.ajax({
			url : "/getGoodsList_Ajax.do",
			type : 'POST',
			data : JSON.stringify(data),
			dataType: 'json',
			contentType : "application/json",
			success : function(goodsList) {
				
				alert('일반 검색 ajax 성공!');
				
				search_Modal.style.display = "none";
				
				console.log('일반 검색 반환 상품 리스트 : ' + goodsList);
				
				var paging = '';
				var output = '';

				$.each(goodsList, function(index, goods) {
					
					output += "<div class='col-lg-3 col-md-3 col-sm-6'>";
					output += "<div class='f_p_item'>";
					output += "<div class='f_p_img'>";
					output += "<a href='goods_info.do?goods_num=" + goods.goods_num + "&&category=" + goods.category +"'>";
					output += "<img class='img-fluid' src='" + goods.main_img +"' alt=''></a></div>";
					output += "<a href='#'><h4>" + goods.name + "</h4></a>";
					output += "<h5>" + goods.price + "원</h5></div></div>";
					
				});
				
				// 상품 목록이 들어갈 div 클래스 이름 - 초기화
				$('.latest_product_inner').empty();
				$('.latest_product_inner').append(output);
				
				// 페이징 버튼 처리
				var pagination = "";
				var end = Math.ceil(pageNum / 10.0) * 10;
				var start = end - 9;
				var realEnd = Math.ceil( (goodsList.length * 1.0) / amount );
				
				console.log('end : ' + end);
				console.log('start : ' + start);
				console.log('realEnd : ' + realEnd);
				
				if (realEnd < end) {
					end = realEnd;
				}
				
				console.log('realEnd 적용 후의 end : ' + end);
				
				for (var i = start; i <= end; i++) {
					
					paging += '<li class="page-item ';
					
					if (pageNum == i)
						paging += 'active';
					
					paging += '" id="btn_' + i + '">';
					paging += '<a href="' + i + '" class="page-link">' + i + '</a></li>';
				}
				
				$('.pagination').empty();
				$('.pagination').append(paging);
				
				$(document).on("click", ".page-item", function(e) {
					
					e.preventDefault();
					
					$('.page-item').removeClass("active");
					$(this).addClass("active");
					
					var page = $('.page-item.active a').text();

					// form 태그 내 pageNum값은 href 속성값으로 변경
					$('#actionForm input[name="pageNum"]').val(page);

				});
			},
			error : function() {
				
				alert('ajax 통신 실패!');
			}
		});
	};
	
	// 상세 검색 버튼 눌렀을 때
	function detail_search() {
		
		var min_amount = $('#min_amount').val();
		var max_amount = $('#max_amount').val();
		
		var pageNum = 1; // 검색 버튼을 누르면 항상 1페이지를 보여주도록 pageNum을 고정한다.
		var amount = $('#actionForm input[name="amount"]').val();
		
		if(pageNum === undefined)
			pageNum = 1;
		
		if(min_amount === "")
			min_amount = "1000";
		if(max_amount === "")
			max_amount = "500000";
		
		// 각 상세 검색 필터 체크박스
		var positions = new Array();
		var colors = new Array();
		var brands = new Array();
		
		$("input[name='position']:checked").each(function() {
			
			positions.push($(this).val());
		})

		$("input[name='color']:checked").each(function() {
			
			colors.push($(this).val());
		})
		
		$("input[name='brand']:checked").each(function() {
			
			brands.push($(this).val());
		})
		
		// 상세 검색 데이터 잘 들어갔는지 테스트
		console.log('포지션 : ' + positions);
		console.log('색상 : ' + colors);
		console.log('브랜드 : ' + brands);
		
		var data = {};
		
		data["pageNum"] = pageNum * 1;
		data["amount"] = 8;
		data["category"] = ${categoryInt};
		data["sorting"] = $('select.sorting option:selected').val();
		data["min_amount"] = min_amount;
		data["max_amount"] = max_amount;
		
		data["positions"] = positions;
		data["colors"] = colors;
		data["brands"] = brands;
		
		$.ajax({
			url : "/getGoodsList_Ajax.do",
			type : 'POST',
			data : JSON.stringify(data),
			dataType: 'json',
			contentType : 'application/json',
			success : function(goodsList) {
				
				alert('상세 검색 ajax 성공!');
				
				searchBig_Modal.style.display = "none";
				
				var paging = '';
				var output = '';
				
				$.each(goodsList, function(index, goods) {				
					
					console.log(goods);
					
					output += "<div class='col-lg-3 col-md-3 col-sm-6'>";
					output += "<div class='f_p_item'>";
					output += "<div class='f_p_img'>";
					output += "<a href='goods_info.do?goods_num=" + goods.goods_num + "&&category=" + goods.category +"'>";
					output += "<img class='img-fluid' src='" + goods.main_img +"' alt=''></a></div>";
					output += "<a href='#'><h4>" + goods.name + "</h4></a>";
					output += "<h5>" + goods.price + "원</h5></div></div>";
					
				});
				
				// 상품 목록이 들어갈 div 클래스 이름 - 초기화
				$('.latest_product_inner').empty();			
				$('.latest_product_inner').append(output);

				// 페이징 버튼 처리 (PageDTO를 다시 받기가 좀 그래서 endPage 구하는 로직을 직접 씀)
				var end = Math.ceil(pageNum / 10.0) * 10;
				var start = end - 9;
				var realEnd = Math.ceil( (goodsList.length * 1.0) / amount );
				
				if (realEnd < end) {
					end = realEnd;
				}
				
				console.log('goodsList.length : ' + goodsList.length);
				console.log('end : ' + end);
				console.log('start : ' + start);
				console.log('realEnd : ' + realEnd);
				console.log('realEnd 적용 후의 end : ' + end);
				
				for (var i = start; i <= end; i++) {
					
					paging += '<li class="page-item ';
					
					if (pageNum == i) {
						paging += 'active';
					}
					
					paging += '">';
					paging += '<a href="' + i + '" class="page-link">' + i + '</a></li>';
				}
				
				$('.pagination').empty();
				$('.pagination').append(paging);
				
				$(document).on("click", ".page-item", function(e) {
					
					e.preventDefault();
					
					$('.page-item').removeClass("active");
					$(this).addClass("active");
					
					var page = $('.page-item.active a').text();

					// form 태그 내 pageNum값은 href 속성값으로 변경
					$('#actionForm input[name="pageNum"]').val(page);

				});

			},
			error : function() {
				
				alert('ajax 통신 실패!');
			}
		});
	}

</script>
<!--================ 모달 & 장바구니 js====================== -->

<!--
<script>
	// 페이지 active 처리
	$(document).ready(function() {
		var page_item = $('.page-item');

		$('.page-item').click(function() {
			$('.page-item').removeClass("active");
			$(this).addClass("active");
		});

		$('.page-item-left').click(function() {
			$('.page-item').removeClass("active");
			page_item[5].classList.add("active");
		})
		$('.page-item-right').click(function() {
			$('.page-item').removeClass("active");
			page_item[1].classList.add("active");
		})
	});
</script>
-->

<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="resources/shoppingMall/js/jquery-3.2.1.min.js"></script>
	<script src="resources/shoppingMall/js/popper.js"></script>
	<script src="resources/shoppingMall/js/bootstrap.min.js"></script>
	<script src="resources/shoppingMall/js/stellar.js"></script>
	<script src="resources/shoppingMall/vendors/lightbox/simpleLightbox.min.js"></script>
	<script src="resources/shoppingMall/vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="resources/shoppingMall/vendors/isotope/imagesloaded.pkgd.min.js"></script>
	<script src="resources/shoppingMall/vendors/isotope/isotope-min.js"></script>
	<script src="resources/shoppingMall/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="resources/shoppingMall/js/jquery.ajaxchimp.min.js"></script>
	<script src="resources/shoppingMall/js/mail-script.js"></script>
	<script src="resources/shoppingMall/vendors/jquery-ui/jquery-ui.js"></script>
	<script src="resources/shoppingMall/vendors/counter-up/jquery.waypoints.min.js"></script>
	<script src="resources/shoppingMall/vendors/counter-up/jquery.counterup.js"></script>
	<script src="resources/shoppingMall/js/theme.js"></script>
</body>

</html>