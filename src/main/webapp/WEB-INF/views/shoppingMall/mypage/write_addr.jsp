<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/mypage_header.jsp"%>

<style>
.genric-btn.default{
	background: #57c051;
}
.genric-btn.default:hover{
	background: #ffffff;
}

h3 {
	font-weight: bold;
}
body{
	text-align: none;
}

.confirm-checkbox input+label {
	border: 2px solid #a4aaa7;
}
</style>
<div class="container">
	<div class="billing_details">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="mb-30 title_color" style="text-align: center; font-size: 30px; padding-bottom: 25px;">배송지 등록</h3>
				<form class="row contact_form" action="/write_userAddr.do" method="post" novalidate="novalidate" id="write_addr">
					<div class="col-md-3 form-group p_star">
						<div class="switch-wrap d-flex justify-content-between"
							style="width: 30%;">
							<p>1번 배송지</p>
							<div class="confirm-checkbox">
								<input type="checkbox" id="addr1" name="num" value="1">
								<label for="addr1" class="addr_chk"></label>
							</div>
						</div>
					</div>
					<div class="col-md-3 form-group p_star">
						<div class="switch-wrap d-flex justify-content-between"
							style="width: 30%;">
							<p>2번 배송지</p>
							<div class="confirm-checkbox">
								<input type="checkbox" id="addr2" name="num" value="2">
								<label for="addr2" class="addr_chk"></label>
							</div>
						</div>
					</div>
					<div class="col-md-3 form-group p_star">
						<div class="switch-wrap d-flex justify-content-between"
							style="width: 30%;">
							<p>3번 배송지</p>
							<div class="confirm-checkbox">
								<input type="checkbox" id="addr3" name="num" value="3">
								<label for="addr3" class="addr_chk"></label>
							</div>
						</div>
					</div>
					<div class="col-md-6 form-group p_star">
						<label for="name">배송지명</label> <input type="text"
							class="form-control" id="name" name="name" placeholder="배송지명">
					</div>
					<div class="col-md-7 form-group p_star">
						<label for="contact">연락처</label> <input type="text"
							class="form-control" id="contact" name="contact"
							placeholder="연락처">
					</div>
					<div class="col-md-4 form-group p_star"></div>
					<div class="col-md-4 form-group p_star">
						<label for="zipcode">우편번호</label> <input type="text"
							class="form-control" id="zipcode" name="zipcode"
							placeholder="우편번호">
					</div>
					<div class="col-md-3 form-group p_star">
						<a href="javascript:execDaumPostcode()"
							class="genric-btn default radius"
							style="position: absolute; left: 0px; bottom: 0px;"> <span
							style="font-weight: bold;">우편번호 검색</span>
						</a>
					</div>
					<div class="col-md-8 form-group p_star">
						<label for="roadAddress">도로명 주소</label> <input type="text"
							class="form-control" id="roadAddress" name="roadAddress"
							placeholder="도로명 주소">
					</div>
					<div class="col-md-8 form-group p_star">
						<label for="addr">상세 주소</label> <input type="text"
							class="form-control" id="addr" name="addr" placeholder="상세 주소">
					</div>
					<div class="col-md-4 form-group p_star">
						<input type="hidden" name="num" value="${num }">
					</div>
					<a href="#" class="genric-btn default radius"
						onclick="insertAddrInfo('write_addr');" style="margin-left: 20px;">
						<span style="font-weight: bold;">배송지 등록</span>
					</a>
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function insertAddrInfo(form) {

		alert('배송지가 등록되었습니다.');

		$('#' + form).submit();
	}

	function execDaumPostcode() {

		new daum.Postcode({

					oncomplete : function(data) {
						
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}

						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}

						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						document.getElementById('zipcode').value = data.zonecode;
						document.getElementById('roadAddress').value = fullRoadAddr;
						document.getElementById('jibunAddress').value = data.jibunAddress;

						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>

<%@ include file="../include/mypage_footer.jsp"%>