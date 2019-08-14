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
						 <p>2019/07/08 LG TWINS 공지가 변경되었습니다.</p>
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
	<script src="resources/shoppingMall/js/theme.js"></script>
</body>

</html>