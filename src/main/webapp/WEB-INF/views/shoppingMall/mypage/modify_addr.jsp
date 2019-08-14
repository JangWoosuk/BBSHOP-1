<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/mypage_header.jsp"%>

<style>
.genric-btn.default{
background :#57c051;
color: #ffffff;
}
.genric-btn.default:hover{
background: #57c051;
border: 1px solid #57c051;
}


h3 {
	font-weight: bold;
}
</style>
<div class="container">
	<div class="billing_details">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="mb-30 title_color">${num }번 배송지 수정
				</h3>
				<form class="row contact_form" action="/modify_userAddr.do" method="post"
					novalidate="novalidate" id="addr_info">
					<div class="col-md-6 form-group p_star">
						<label for="name">배송지명</label> <input type="text"
							class="form-control" id="name" name="name" placeholder="배송지명" value="<c:out value="${addrVO.name }"/>">
					</div>
					<div class="col-md-7 form-group p_star">
						<label for="contact">연락처</label> <input type="text"
							class="form-control" id="contact" name="contact"
							placeholder="연락처" value="<c:out value="${addrVO.contact }"/>">
					</div>
					<div class="col-md-4 form-group p_star"></div>
					<div class="col-md-4 form-group p_star">
						<label for="zipcode">우편번호</label> <input type="text"
							class="form-control" id="zipcode" name="zipcode"
							placeholder="우편번호" value="<c:out value="${addrVO.zc_key }"/>">
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
							placeholder="도로명 주소" value="<c:out value="${addrVO.roadAddress }"/>">
					</div>
					<div class="col-md-8 form-group p_star">
						<label for="addr">상세 주소</label> <input type="text"
							class="form-control" id="addr" name="addr" placeholder="상세 주소" value="<c:out value="${addrVO.addr }"/>">
					</div>
					<div class="col-md-4 form-group p_star">
						<input type="hidden" name="num" value="${num }">
					</div>
					<a href="#" class="genric-btn default radius" style="margin-left: 20px;" 
					onclick="modify_userAddr('addr_info');"><span>배송지 수정</span>
					</a>
				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function insertAddrInfo(form) {

		alert('배송지가 수정되었습니다.');

		$('#' + form).submit();
	}

	function execDaumPostcode() {

		new daum.Postcode({

				oncomplete : function(data) {

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('roadAddress').value = fullRoadAddr;
						document.getElementById('jibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소란을 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
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
	
	function modify_userAddr(form) {
		
		alert('배송지 정보가 수정되었습니다.');
		
		$('#' + form).submit();
	}
</script>

<%@ include file="../include/mypage_footer.jsp"%>