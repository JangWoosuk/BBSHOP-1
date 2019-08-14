<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/mypage_header.jsp"%>

<style>
.product_top_bar{
	background: #ffffff;
}
.genric-btn.default{
	background: #57c051;
}
.genric-btn.default:hover{
	background: #ffffff;
}

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
						<h3 class="mb-30 title_color" style="text-align: center; font-size: 30px; padding-bottom: 25px;">회원 정보 수정
						<a id="withdraw" href="/withdraw.do" class="genric-btn default radius" style="float: right;"><span>회원 탈퇴</span></a>
						<a href="#" class="genric-btn disable radius" onclick="modify_userInfo('modify_info')" id="modifybtn" style="float: right; margin-right: 10px;"><span>수정하기</span></a>
						</h3>

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
									value="<c:out value="${memberInfo.PHONE }" default="null" />"
									readonly>
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
						
					</div>
				</div>
			</div>
			<div class="billing_details">
				<div class="row">
					<div class="col-lg-12" style="margin-bottom: 30px;">
						<h3 class="mb-30 title_color" style="text-align: center; font-size: 30px; padding-bottom: 25px; padding-left: 150px;">배송지 목록
							<a href="/write_addr.do?num=${addr_list.size() }"
							class="genric-btn default radius"
							style="float: right; margin-top: 0px;"><span>새 배송지 등록</span>
						</a>
						
						</h3>
					
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
											<p>${AddrVO.roadAddress }</p>
											<p>${AddrVO.addr }</p>
										</div>
										<div class="info_item">
											<i class="lnr lnr-phone-handset"></i>
											<h6>연락처</h6>
											<p>${AddrVO.contact }</p>
										</div>
									</div>
									<a href="/modify_addr.do?num=${status.count }"
										class="genric-btn default radius" style="margin-top: 30px"><span>배송지 
											수정</span> </a> 
											<a href="#" onclick="deleteAddr('${AddrVO.num }');"
										class="genric-btn danger radius" style="margin-top: 30px; font-size: 14px"><span>배송지 
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
						<h3 class="mb-30 title_color" style="text-align: center; font-size: 30px; padding-bottom: 25px; padding-left: 110px;">추가 정보 수정
						<a href="#" class="genric-btn default radius"
								onclick="update_detail();" style="float: right;"><span>수정하기</span>
							</a></h3>
						<h5>* 구단과 포지션은 하나만 선택 가능합니다.</h5>
						<h5 style="margin-bottom: 30px;">* 관심 브랜드는 최대 3개까지 선택 가능합니다.</h5>
						<form class="row contact_form" action="#" method="post"
							novalidate="novalidate">
							<div class="product_top_bar" style="margin-bottom: 30px;">
								<div class="left_dorp" id="team">
									<h4 class="title_color">구단</h4>
									<select class="sorting" id="team">
											<option value="0">구단</option>
											<option value="sk" 
												<c:if test="${member_detail.TEAM eq 'sk' }">selected </c:if>>
												SK 와이번스</option>
											<option value="lg"
												<c:if test="${member_detail.TEAM eq 'lg' }">selected </c:if>>
												LG 트윈스</option>
											<option value="hanwha"
												<c:if test="${member_detail.TEAM eq 'hanwha' }">selected </c:if>>
												한화 이글스</option>
											<option value="doosan"
												<c:if test="${member_detail.TEAM eq 'doosan' }">selected </c:if>>
												두산 베어스</option>
											<option value="samsung"
												<c:if test="${member_detail.TEAM eq 'samsung' }">selected </c:if>>
												삼성 라이온즈</option>
											<option value="kiwoom"
												<c:if test="${member_detail.TEAM eq 'kiwoom' }">selected </c:if>>
												키움 히어로즈</option>
											<option value="kia"
												<c:if test="${member_detail.TEAM eq 'kia' }">selected </c:if>>
												KIA 타이거즈</option>
											<option value="kt"
												<c:if test="${member_detail.TEAM eq 'kt' }">selected </c:if>>
												KT 위즈</option>
											<option value="nc"
												<c:if test="${member_detail.TEAM eq 'nc' }">selected </c:if>>
												NC 다이노스</option>
											<option value="lotte"
												<c:if test="${member_detail.TEAM eq 'lotte' }">selected </c:if>>
												롯데 자이언츠</option>
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
										<option value="내야수"
											<c:if test="${member_detail.POSITION eq '내야수' }">selected </c:if>>
											내야수</option>
										<option value="외야수"
											<c:if test="${member_detail.POSITION eq '외야수' }">selected </c:if>>
											외야수</option>
									</select>
								</div>
								<div class="left_dorp">
								</div>
							</div>
							<div class="product_top_bar" style="margin-bottom: 30px;">
								<div class="left_dorp">
									<h4 class="title_color">브랜드 1</h4>
									<select class="sorting" id="brand1">
										<option value="">브랜드 1</option>
										<option value="mizuno"
											<c:if test="${member_detail.BRAND1 eq 'mizuno' }">selected </c:if>>
											MIZUNO</option>
										<option value="wilson"
											<c:if test="${member_detail.BRAND1 eq 'wilson' }">selected </c:if>>
											WILSON</option>
										<option value="nike"
											<c:if test="${member_detail.BRAND1 eq 'nike' }">selected </c:if>>
											NIKE</option>
										<option value="adidas"
											<c:if test="${member_detail.BRAND1 eq 'adidas' }">selected </c:if>>
											ADIDAS</option>
										<option value="asics"
											<c:if test="${member_detail.BRAND1 eq 'asics' }">selected </c:if>>
											ASICS</option>
										<option value="fila"
											<c:if test="${member_detail.BRAND1 eq 'fila' }">selected </c:if>>
											FILA</option>
										<option value="morimoto"
											<c:if test="${member_detail.BRAND1 eq 'morimoto' }">selected </c:if>>
											MORIMOTO</option>
										<option value="underarmour"
											<c:if test="${member_detail.BRAND1 eq 'underarmour' }">selected </c:if>>
											UNDERARMOUR</option>
										<option value="descente"
											<c:if test="${member_detail.BRAND1 eq 'descente' }">selected </c:if>>
											DESCENTE</option>
										<option value="brett"
											<c:if test="${member_detail.BRAND1 eq 'brett' }">selected </c:if>>
											BRETT</option>
									</select>
								</div>
								<div class="left_dorp">
									<h4 class="title_color">브랜드 2</h4>
									<select class="sorting" id="brand2">
										<option value="">브랜드 2</option>
										<option value="mizuno"
											<c:if test="${member_detail.BRAND2 eq 'mizuno' }">selected </c:if>>
											MIZUNO</option>
										<option value="wilson"
											<c:if test="${member_detail.BRAND2 eq 'wilson' }">selected </c:if>>
											WILSON</option>
										<option value="nike"
											<c:if test="${member_detail.BRAND2 eq 'nike' }">selected </c:if>>
											NIKE</option>
										<option value="adidas"
											<c:if test="${member_detail.BRAND2 eq 'adidas' }">selected </c:if>>
											ADIDAS</option>
										<option value="asics"
											<c:if test="${member_detail.BRAND2 eq 'asics' }">selected </c:if>>
											ASICS</option>
										<option value="fila"
											<c:if test="${member_detail.BRAND2 eq 'fila' }">selected </c:if>>
											FILA</option>
										<option value="morimoto"
											<c:if test="${member_detail.BRAND2 eq 'morimoto' }">selected </c:if>>
											MORIMOTO</option>
										<option value="underarmour"
											<c:if test="${member_detail.BRAND2 eq 'underarmour' }">selected </c:if>>
											UNDERARMOUR</option>
										<option value="descente"
											<c:if test="${member_detail.BRAND2 eq 'descente' }">selected </c:if>>
											DESCENTE</option>
										<option value="brett"
											<c:if test="${member_detail.BRAND2 eq 'brett' }">selected </c:if>>
											BRETT</option>
									</select>
								</div>
								<div class="left_dorp">
									<h4 class="title_color">브랜드 3</h4>
									<select class="sorting" id="brand3">
										<option value="">브랜드 3</option>
										<option value="mizuno"
											<c:if test="${member_detail.BRAND3 eq 'mizuno' }">selected </c:if>>
											MIZUNO</option>
										<option value="wilson"
											<c:if test="${member_detail.BRAND3 eq 'wilson' }">selected </c:if>>
											WILSON</option>
										<option value="nike"
											<c:if test="${member_detail.BRAND3 eq 'nike' }">selected </c:if>>
											NIKE</option>
										<option value="adidas"
											<c:if test="${member_detail.BRAND3 eq 'adidas' }">selected </c:if>>
											ADIDAS</option>
										<option value="asics"
											<c:if test="${member_detail.BRAND3 eq 'asics' }">selected </c:if>>
											ASICS</option>
										<option value="fila"
											<c:if test="${member_detail.BRAND3 eq 'fila' }">selected </c:if>>
											FILA</option>
										<option value="morimoto"
											<c:if test="${member_detail.BRAND3 eq 'morimoto' }">selected </c:if>>
											MORIMOTO</option>
										<option value="underarmour"
											<c:if test="${member_detail.BRAND3 eq 'underarmour' }">selected </c:if>>
											UNDERARMOUR</option>
										<option value="descente"
											<c:if test="${member_detail.BRAND3 eq 'descente' }">selected </c:if>>
											DESCENTE</option>
										<option value="brett"
											<c:if test="${member_detail.BRAND3 eq 'brett' }">selected </c:if>>
											BRETT</option>
									</select>
								</div>
							</div>
						</form>

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
	
	// 추가 정보 수정 함수
	function update_detail() {
				
		alert('추가 정보가 수정되었습니다.');
		
		var team = $('#team option:selected').val();
		var position = $('#position option:selected').val();
		var brand1 = $('#brand1 option:selected').val();
		var brand2 = $('#brand2 option:selected').val();
		var brand3 = $('#brand3 option:selected').val();

		submit(team, position, brand1, brand2, brand3);
	}
	
	function submit(team, position, brand1, brand2, brand3) {
		
		alert('submit 함수 진입');
		
		console.log(team);
		console.log(position);
		console.log(brand1);
		console.log(brand2);
		console.log(brand3);
		
		var formObj = document.createElement("form");
		
		var i_team = document.createElement("input");
		var i_position = document.createElement("input");
		var i_brand1 = document.createElement("input");
		var i_brand2 = document.createElement("input");
		var i_brand3 = document.createElement("input");
	    
		i_team.name = "TEAM";
		i_team.value = team;
		
		i_position.name = "POSITION";
		i_position.value = position;
		
		i_brand1.name = "BRAND1";
		i_brand1.value = brand1;
		
		i_brand2.name = "BRAND2";
		i_brand2.value = brand2
		
		i_brand3.name = "BRAND3";
		i_brand3.value = brand3;
		
	    formObj.appendChild(i_team);
	    formObj.appendChild(i_position);
	    formObj.appendChild(i_brand1);
	    formObj.appendChild(i_brand2);
	    formObj.appendChild(i_brand3);

	    document.body.appendChild(formObj);
	    
	    formObj.method = "post";
	    formObj.action = "modify_detail.do";
	    
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