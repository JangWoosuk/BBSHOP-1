<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/mypage_header.jsp"%>

<style>
.sorting {
	margin-right: 50px;
}

h3, h4, h6 {
	font-weight: bold;
}
</style>
<div class="container">
	<section class="checkout_area section_gap" style="padding-top: 0px;">
		<!-- 의정 style수정 -->
		<div class="container">
			<div class="billing_details">
				<div class="row">
					<div class="col-lg-12" style="margin-bottom: 30px;">
						<h3 class="mb-30 title_color">회원 정보 수정</h3>
						<h5 style="margin-bottom: 30px;">* 회원 정보는 비밀번호가 일치해야 수정이 가능합니다.</h5>
						<form class="row contact_form" action="/modify_userInfo.do"
							method="post" novalidate="novalidate" id="modify_info">
							<div class="col-md-7 form-group p_star">
								<label for="name">이름</label> <input type="text"
									class="form-control" id="NAME" name="NAME"
									value="<c:out value="${memberInfo.NAME }" default="null" />">
							</div>
							<div class="col-md-5 form-group p_star"></div>						
							<div class="col-md-5 form-group p_star">
								<label for="pw">비밀번호</label> <input type="password" 
								id="MEMBER_PW" name="MEMBER_PW" oninput="checkPwd()" required class="form-control pass"
									value="<c:out value="${memberInfo.MEMBER_PW }" default="null" />" >
							</div>
							<div class="col-md-5 form-group p_star">
								<label for="pw_chk">비밀번호 확인</label> <input type="password" 
								id="PW_CHK" name="PW_CHK" oninput="checkPwd()" required class="form-control pass"
									value="<c:out value="${memberInfo.MEMBER_PW }" default="null" />">
							</div>
							<div class="col-md-2 form-group p_star"></div>
							<div class="col-md-10 form-group p_star">
								<span id="pwdCheck"></span>
							</div>
							<div class="col-md-5 form-group p_star">
								<label for="birth">생년월일</label> <input type="text"
									class="form-control" id="BIRTH" name="BIRTH"
									value="<c:out value="${memberInfo.BIRTH }" default="null" />"
									readonly>
							</div>
							<div class="col-md-7 form-group p_star"></div>
							<div class="col-md-5 form-group p_star">
								<label for="phone">휴대폰</label> <input type="text"
									class="form-control" id="PHONE" name="PHONE"
									value="<c:out value="${memberInfo.PHONE }" default="null" />">
							</div>
							<div class="col-md-7 form-group p_star"></div>
							<div class="col-md-5 form-group p_star">
								<label for="nickname">닉네임</label> <input type="text"
									class="form-control" id="NICKNAME" name="NICKNAME"
									value="<c:out value="${memberInfo.NICKNAME }" default="null" />">
							</div>
							<div class="col-md-3 form-group p_star">
								<a id="check" class="genric-btn default radius" 
								style="position: absolute; left: 0px; bottom: 0px;"><span>중복 확인</span></a>
							</div>
							<div class="col-md-4 form-group p_star"></div>
							<div class="col-md-3 form-group p_star">
								<span id="nickCheck"></span>
							</div>
						</form>
						<a href="#" class="genric-btn disable radius"
							onclick="modify_userInfo('modify_info')" id="modifybtn"><span>수정하기</span></a> <a
							id="withdraw" href="/withdraw.do"
							class="genric-btn default radius" style="float: right;"><span>회원
								탈퇴</span> </a>
					</div>
				</div>
			</div>
			<div class="billing_details">
				<div class="row">
					<div class="col-lg-12" style="margin-bottom: 30px;">
						<h3 class="mb-30 title_color">배송지 목록</h3>
						<a href="/write_addr.do?num=${addr_list.size() }"
							class="genric-btn default radius"
							style="float: right; margin-top: 0px;"><span>새 배송지 등록</span>
						</a>
						<div class="row">
							<c:forEach items="${addr_list }" var="AddrVO" varStatus="status">
								<div class="col-lg-4">
									<div class="contact_info">
										<h4>${AddrVO.num }번 배송지</h4>
										<br>
										<div class="info_item">
											<i class="fas fa-male"></i>
											<h6>배송지명</h6>
											<p>${AddrVO.name }</p>
										</div>
										<div class="info_item">
											<i class="lnr lnr-home"></i>
											<h6>주소</h6>
											<p>서울시 강남구 삼성동</p>
											<p>${AddrVO.addr }</p>
										</div>
										<div class="info_item">
											<i class="lnr lnr-phone-handset"></i>
											<h6>연락처</h6>
											<p>${AddrVO.contact }</p>
										</div>
									</div>
									<a href="/modify_addr.do?num=${status.count }"
										class="genric-btn default radius" style="margin-top: 30px"><span>배송지${AddrVO.num }
											수정</span> </a> <a href="#" onclick="deleteAddr('${AddrVO.num }');"
										class="genric-btn danger radius" style="margin-top: 30px"><span>배송지${AddrVO.num }
											삭제</span> </a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="billing_details">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="mb-30 title_color">추가 정보 수정</h3>
						<h5>* 구단과 포지션은 하나만 선택 가능합니다.</h5>
						<h5 style="margin-bottom: 30px;">* 관심 브랜드는 최대 3개까지 선택 가능합니다.</h5>
						<form class="row contact_form" action="#" method="post"
							novalidate="novalidate">
							<div class="product_top_bar" style="margin-bottom: 30px;">
								<div class="left_dorp" id="team">
									<h4 class="title_color">구단</h4>
									<select class="sorting" id="team">
											<option value="0">구단</option>
											<option value="SK 와이번스" 
												<c:if test="${member_detail.TEAM eq 'SK 와이번스' }">selected </c:if>>
												SK 와이번스</option>
											<option value="LG 트윈스"
												<c:if test="${member_detail.TEAM eq 'LG 트윈스' }">selected </c:if>>
												LG 트윈스</option>
											<option value="한화 이글스"
												<c:if test="${member_detail.TEAM eq '한화 이글스' }">selected </c:if>>
												한화 이글스</option>
											<option value="두산 베어스"
												<c:if test="${member_detail.TEAM eq '두산 베어스' }">selected </c:if>>
												두산 베어스</option>
											<option value="삼성 라이온즈"
												<c:if test="${member_detail.TEAM eq '삼성 라이온즈' }">selected </c:if>>
												삼성 라이온즈</option>
											<option value="키움 히어로즈"
												<c:if test="${member_detail.TEAM eq '키움 히어로즈' }">selected </c:if>>
												키움 히어로즈</option>
											<option value="KIA 타이거즈"
												<c:if test="${member_detail.TEAM eq 'KIA 타이거즈' }">selected </c:if>>
												KIA 타이거즈</option>
											<option value="KT 위즈"
												<c:if test="${member_detail.TEAM eq 'KT 위즈' }">selected </c:if>>
												KT 위즈</option>
											<option value="NC 다이노스"
												<c:if test="${member_detail.TEAM eq 'NC 다이노스' }">selected </c:if>>
												NC 다이노스</option>
									</select>
								</div>
								<div class="left_dorp">
									<h4 class="title_color">포지션</h4>
									<select class="sorting" id="position">
										<option value="0">포지션</option>
										<option value="포수"
											<c:if test="${member_detail.POSITION eq '포수' }">selected </c:if>>
											포수</option>
										<option value="투수"
											<c:if test="${member_detail.POSITION eq '투수' }">selected </c:if>>
											투수</option>
										<option value="1루수"
											<c:if test="${member_detail.POSITION eq '1루수' }">selected </c:if>>
											1루수</option>
										<option value="2루수"
											<c:if test="${member_detail.POSITION eq '2루수' }">selected </c:if>>
											2루수</option>
										<option value="3루수"
											<c:if test="${member_detail.POSITION eq '3루수' }">selected </c:if>>
											3루수</option>
										<option value="유격수"
											<c:if test="${member_detail.POSITION eq '유격수' }">selected </c:if>>
											유격수</option>
										<option value="외야수"
											<c:if test="${member_detail.POSITION eq '외야수' }">selected </c:if>>
											외야수</option>
									</select>
								</div>
								<div class="left_dorp">
									<h4 class="title_color">좌/우</h4>
									<select class="sorting" id="hand">
										<option value="2">좌/우</option>
										<option value="0"
											<c:if test="${member_detail.HAND == 0 }">selected </c:if>>
											좌투(오른손 착용)</option>
										<option value="1"
											<c:if test="${member_detail.HAND == 1 }">selected </c:if>>
											우투(왼손 착용)</option>
									</select>
								</div>
							</div>
							<div class="product_top_bar" style="margin-bottom: 30px;">
								<div class="left_dorp">
									<h4 class="title_color">브랜드 1</h4>
									<select class="sorting" id="brand1">
										<option value="1">브랜드 1</option>
										<option value="MIZUNO"
											<c:if test="${member_detail.BRAND1 eq 'MIZUNO' }">selected </c:if>>
											MIZUNO</option>
										<option value="WILSON"
											<c:if test="${member_detail.BRAND1 eq 'WILSON' }">selected </c:if>>
											WILSON</option>
										<option value="NIKE"
											<c:if test="${member_detail.BRAND1 eq 'NIKE' }">selected </c:if>>
											NIKE</option>
										<option value="ADIDAS"
											<c:if test="${member_detail.BRAND1 eq 'ADIDAS' }">selected </c:if>>
											ADIDAS</option>
										<option value="ASICS"
											<c:if test="${member_detail.BRAND1 eq 'ASICS' }">selected </c:if>>
											ASICS</option>
										<option value="FILA"
											<c:if test="${member_detail.BRAND1 eq 'FILA' }">selected </c:if>>
											FILA</option>
										<option value="MORIMOTO"
											<c:if test="${member_detail.BRAND1 eq 'MORIMOTO' }">selected </c:if>>
											MORIMOTO</option>
										<option value="UNDERARMOUR"
											<c:if test="${member_detail.BRAND1 eq 'UNDERARMOUR' }">selected </c:if>>
											UNDERARMOUR</option>
										<option value="DESCENTE"
											<c:if test="${member_detail.BRAND1 eq 'DESCENTE' }">selected </c:if>>
											DESCENTE</option>
										<option value="BRETT"
											<c:if test="${member_detail.BRAND1 eq 'BRETT' }">selected </c:if>>
											BRETT</option>
									</select>
								</div>
								<div class="left_dorp">
									<h4 class="title_color">브랜드 2</h4>
									<select class="sorting" id="brand2">
										<option value="1">브랜드 2</option>
										<option value="MIZUNO"
											<c:if test="${member_detail.BRAND2 eq 'MIZUNO' }">selected </c:if>>
											MIZUNO</option>
										<option value="WILSON"
											<c:if test="${member_detail.BRAND2 eq 'WILSON' }">selected </c:if>>
											WILSON</option>
										<option value="NIKE"
											<c:if test="${member_detail.BRAND2 eq 'NIKE' }">selected </c:if>>
											NIKE</option>
										<option value="ADIDAS"
											<c:if test="${member_detail.BRAND2 eq 'ADIDAS' }">selected </c:if>>
											ADIDAS</option>
										<option value="ASICS"
											<c:if test="${member_detail.BRAND2 eq 'ASICS' }">selected </c:if>>
											ASICS</option>
										<option value="FILA"
											<c:if test="${member_detail.BRAND2 eq 'FILA' }">selected </c:if>>
											FILA</option>
										<option value="MORIMOTO"
											<c:if test="${member_detail.BRAND2 eq 'MORIMOTO' }">selected </c:if>>
											MORIMOTO</option>
										<option value="UNDERARMOUR"
											<c:if test="${member_detail.BRAND2 eq 'UNDERARMOUR' }">selected </c:if>>
											UNDERARMOUR</option>
										<option value="DESCENTE"
											<c:if test="${member_detail.BRAND2 eq 'DESCENTE' }">selected </c:if>>
											DESCENTE</option>
										<option value="BRETT"
											<c:if test="${member_detail.BRAND2 eq 'BRETT' }">selected </c:if>>
											BRETT</option>
									</select>
								</div>
								<div class="left_dorp">
									<h4 class="title_color">브랜드 3</h4>
									<select class="sorting" id="brand3">
										<option value="1">브랜드 3</option>
										<option value="MIZUNO"
											<c:if test="${member_detail.BRAND3 eq 'MIZUNO' }">selected </c:if>>
											MIZUNO</option>
										<option value="3"
											<c:if test="${member_detail.BRAND3 eq 'WILSON' }">selected </c:if>>
											WILSON</option>
										<option value="NIKE"
											<c:if test="${member_detail.BRAND3 eq 'NIKE' }">selected </c:if>>
											NIKE</option>
										<option value="ADIDAS"
											<c:if test="${member_detail.BRAND3 eq 'ADIDAS' }">selected </c:if>>
											ADIDAS</option>
										<option value="ASICS"
											<c:if test="${member_detail.BRAND3 eq 'ASICS' }">selected </c:if>>
											ASICS</option>
										<option value="FILA"
											<c:if test="${member_detail.BRAND3 eq 'FILA' }">selected </c:if>>
											FILA</option>
										<option value="MORIMOTO"
											<c:if test="${member_detail.BRAND3 eq 'MORIMOTO' }">selected </c:if>>
											MORIMOTO</option>
										<option value="UNDERARMOUR"
											<c:if test="${member_detail.BRAND3 eq 'UNDERARMOUR' }">selected </c:if>>
											UNDERARMOUR</option>
										<option value="DESCENTE"
											<c:if test="${member_detail.BRAND3 eq 'DESCENTE' }">selected </c:if>>
											DESCENTE</option>
										<option value="BRETT"
											<c:if test="${member_detail.BRAND3 eq 'BRETT' }">selected </c:if>>
											BRETT</option>
									</select>
								</div>
							</div>
						</form>
						<div>
							<a href="#" class="genric-btn default radius"
								onclick="update_detail();" style="float: left;"><span>수정하기</span>
							</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
</div>

<script>
	
	function modify_userInfo(form) {

		alert('회원 정보가 수정되었습니다.');
		$('#' + form).submit();
	}

	function deleteAddr(num) {

		var answer = confirm('배송지를 삭제하시겠습니까?');

		if (answer == true) {

			alert('배송지가 삭제되었습니다.');
			location.href = "/delete_userAddr.do?num=" + num;
		}
	}
	
	function update_detail() {
				
		alert('추가 정보가 수정되었습니다.');
		
		var team = $('#team option:selected').val();
		var position = $('#position option:selected').val();
		var hand = $('#hand option:selected').val();
		var brand1 = $('#brand1 option:selected').val();
		var brand2 = $('#brand2 option:selected').val();
		var brand3 = $('#brand3 option:selected').val();

		submit(team, position, hand, brand1, brand2, brand3);
	}
	
	function submit(team, position, hand, brand1, brand2, brand3) {
		
		var formObj = document.createElement("form");
		
		var i_team = document.createElement("input");
		var i_position = document.createElement("input");
		var i_hand = document.createElement("input");
		var i_brand1 = document.createElement("input");
		var i_brand2 = document.createElement("input");
		var i_brand3 = document.createElement("input");
	    
		i_team.name = "TEAM";
		i_team.value = team;
		
		i_position.name = "POSITION";
		i_position.value = position;
		
		i_hand.name = "HAND";
		i_hand.value = hand;
		
		i_brand1.name = "BRAND1";
		i_brand1.value = brand1;
		
		i_brand2.name = "BRAND2";
		i_brand2.value = brand2
		
		i_brand3.name = "BRAND3";
		i_brand3.value = brand3;
		
	    formObj.appendChild(i_team);
	    formObj.appendChild(i_position);
	    formObj.appendChild(i_hand);
	    formObj.appendChild(i_brand1);
	    formObj.appendChild(i_brand2);
	    formObj.appendChild(i_brand3);

	    document.body.appendChild(formObj);
	    
	    formObj.method = "post";
	    formObj.action = "/modify_detail.do";
	    
	    formObj.submit();
	}
	
	//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
		
    function checkPwd() {
		
        var inputed = $('.pass').val();
        var reinputed = $('#PW_CHK').val();
        
        if (reinputed == "" && (inputed != reinputed || inputed == reinputed)) {
        	
            $("#PW_CHK").css("background-color", "#FFCECE");
            
			var html = "<span style='color: red'>비밀번호가 일치하지 않습니다.</span>";
			
			$('#pwdCheck').empty();
			$('#pwdCheck').append(html);
			
			$('#modifybtn').attr('class', 'genric-btn disable radius');
            
        } else if (inputed == reinputed) {
        	
            $("#PW_CHK").css("background-color", "#B0F6AC");
            
			var html = "<span style='color: blue'>비밀번호가 일치합니다.</span>";
			
			$('#pwdCheck').empty();
			$('#pwdCheck').append(html);
			
			$('#modifybtn').attr('class', 'genric-btn default radius');
            
        } else if (inputed != reinputed) {
        	
            $("#PW_CHK").css("background-color", "#FFCECE");
            
			var html = "<span style='color: red'>비밀번호가 일치하지 않습니다.</span>";
			
			$('#pwdCheck').empty();
			$('#pwdCheck').append(html);
			
			$('#modifybtn').attr('class', 'genric-btn disable radius');
		}
    }
	
	$(document).ready(function(e){

		// 닉네임 변경 중복 확인
		$('#check').click(function(){
			
			$.ajax({
				url: "${pageContext.request.contextPath}/nickCheck.do",
				type: "GET",
				data:{
					"NICKNAME":$('#NICKNAME').val()
				},
				success: function(result){
					
					if(result == 0 && $.trim($('#NICKNAME').val()) != '' ) {
						
						var html = "<span style='color: blue'>사용 가능한 닉네임입니다.</span>";
						
						$('#nickCheck').empty();
						$('#nickCheck').append(html);
						
					} else {

						var html = "<span style='color: red'>사용 불가능한 닉네임입니다.</span>";
						
						$('#nickCheck').empty();
						$('#nickCheck').append(html);
					}
				},
				error: function(){
					
					alert("ajax 에러");
				}
			});
			

		});
	
	
	});
</script>

<%@ include file="../include/mypage_footer.jsp"%>