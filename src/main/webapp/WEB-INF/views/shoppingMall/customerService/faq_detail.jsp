<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ include file="../include/shopping_header.jsp"%>

<style>
body {
	font-size: 17px;
	font-weight: bold;
}

.comments-area .btn-report {
	background-color: #fff;
	color: #222222;
	border: 1px solid #eee;
	padding: 2px 18px;
	font-size: 12px;
	display: block;
	font-weight: 600;
	transition: all 300ms linear 0s;
}

.blog_info .blog_meta li a {
	background-color: #fff;
	color: #222222;
	border: 1px solid #eee;
	padding: 2px 18px;
	font-size: 12px;
	display: block;
	font-weight: 600;
	transition: all 300ms linear 0s;
	margin-left: 700px;
}

.single-post-area .fileUpload-area {
	border-top: 1px solid #eee;
	padding-top: 30px;
	margin-top: 60px;
}

.genric-btn.primary {
	background: #9FC197;
	font-size: 16px;
	font-weight: bold;
	color: white !important;
}
</style>

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
							href="/faq" style="color: white;">FAQ</a>
					</div>
				</div>
			</div>
		</div>
	</section>
<!--================End Home Banner Area =================-->
	<!--================Blog Area =================-->
	<section class="blog_area single-post-area p_120" style="padding-top:0px;">
		<div class="container" style="max-width:1500px;">
			<div class="row">
			
				<div class="col-lg-10 posts-list" style="margin-left:auto;margin-right:auto;margin-top:30px;">
					<div class="single-post row">

						<div class="col-lg-12  col-md-12" style="border-bottom:1px solid; border-color:#6c757d45;">
							<div class="blog_info text-left">
								<ul class="blog_meta list" style="border-top:1px solid;border-bottom:1px solid;border-color:#6c757d45;background:#9993;">
									<li>
										<table style="margin-left:auto;margin-right:auto;">
											<tr>
												<td>
													<h2>[상품] 재입고 알림 서비스가 없나요?</h2>
												</td>
											</tr>
										</table>
									</li>
									<li></li>
									<li>
										<table style="float:right;margin-top:20px;">
											<tr>
												<td><p class="bno" style="margin-right: 10px;">글
														번호: 5</p></td>
												<td><p class="title" style="margin-right: 10px;">
														<i class="lnr lnr-user"></i> admin
													</p></td>
												<td>
													<p class="regdate" style="margin-right: 10px;">
														<i class="lnr lnr-calendar-full"></i> 2019/07/11
													</p>
												</td>
											</tr>
										</table>
									</li>
								</ul>
							</div>
						</div>

						<div class="col-lg-9 col-md-9 blog_details"
							style="min-width: 100%;">
							<p>A. 저희 비비샵은 재입고 알림 서비스를 제공하고 있습니다. 다만, 해당 제품의 모든 옵션(컬러/크기 등의 옵션)이 품절되어야 [SMS 입고 알림]을 신청할 수 있는 버튼이 노출되어<br>
							해당 제품의 상세페이지에서 직접 신청이 가능해 집니다. 만약, 고객님이 재입고 안내를 문자로 받아보신 경우라 할지라도 다른 고객님들께서 먼저 구매를 하실 경우,<br>
							상황에 따라서 금방 품절이 될 수도 있으니 빠른 구매 부탁 드립니다 :) 재입고와 관련하여 궁금하시거나 문의사항 있으시면 언제든지 저희 쪽으로 연락 주시면 친절한 안내 도와드리도록 하겠습니다 :)<br>
							
							해당 제품의 옵션 중 일부 옵션만 품절이 된 경우, 시스템의 특성상 부득히 하게 [SMS 입고 알림] 버튼이 노출되지 않아, 재입고 알림 신청이 어렵습니다. (모든 옵션이 품절되면 버튼 자동 노출)<br>
							핑크로켓은 매주 화/수/금요일에 핑크로켓의 전 품절 상품에 대한 입고를 진행하므로, 재입고가 가능한 상품의 경우 저녁 7-8시 사이에 입고처리가 되어 구매하실 수 있습니다.<br>
							번거로우시더라도 해당 시간대에 방문해주셔서 재입고를 확인 부탁 드립니다. 일부 옵션 품절 시 시스템 상으로 편리하게 재입고 알림이 어려운 점, 양해 부탁 드립니다. :)<br>
							</p>

						</div>
					</div>
														<!-- 이전글 다음글 버튼 -->
					<div class="navigation-area" style="margin-top: 0px; width: 100%;">
						<div class="row">
							<div
								class="col-lg-12 col-md-12 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
								<div class="thumb" style="width:100%;background:white;">
									<a href="#"> <img class="img-fluid"
										src="resources/shoppingMall/img/left_arrow.png" alt=""
										style="width: 30px;float:left;">
									</a> <a href="#"> <img class="img-fluid"
										src="resources/shoppingMall/img/right_arrow.png" alt=""
										style="width: 30px;float:right;">
									</a>
								</div>
							</div>
						</div>
					</div>
					<!-- 이전글 다음글 버튼 끝 -->

					<!-- 수정, 삭제, 목록보기 버튼 -->
					<div style="width: 100%;">
						<div class="button-group-area mt-40">
							<a href="/faq" id="go_list"
								class="genric-btn primary radius" style="margin-left: 42%;">목록보기</a>
							<a href="/faq_modify" id="modify_post"
								class="genric-btn primary radius">수정</a> <a id="delete_post"
								class="genric-btn primary radius" style="float: right;">삭제</a>
						</div>
					</div>
					<!-- 수정, 삭제, 목록보기 버튼 끝 -->
				</div>
			</div>
		</div>
	</section>

	<script>
		// 글 상세 -> 삭제버튼
		var delete_postBtn = document.getElementById('delete_post');

		// 글 삭제 버튼 클릭 시 알람창
		delete_postBtn.onclick = function() {
			alert('글을 삭제하시겠습니까?');
		}
	</script>

<%@ include file="../include/shopping_footer.jsp"%>

</body>

</html>