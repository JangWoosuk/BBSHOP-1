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
.generic-blockquote{
border-left: none;
}
</style>
<div class="container">

	<div class="section-top-border">
		<h3 class="mb-30 title_color" style="font-size: 30px;">회원 탈퇴 신청</h3>
		<div class="row">
			<div class="col-lg-12">
				<blockquote class="generic-blockquote" style="padding-left:0px;margin-bottom: 0px;padding-bottom: 0px;">
					
					<p>저희 쇼핑몰의 부족했던 점과
					아쉬웠던 점을 적어주시면 감사하겠습니다. 더 좋은 모습으로 발전하도록 최선을 다하겠습니다. 그리하여 더 나은 모습으로
					고객님을 다시 만날 날을 기다리겠습니다. 그 동안 저희 쇼핑몰을 이용해주신 것을 진심으로 감사드립니다.</p></blockquote>
				<div class="mt-10">
					<textarea class="single-textarea" placeholder="남기시고 싶은 말씀을 적어주세요."
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Message'" style="margin-bottom: 20px; height: 200px;" required></textarea>
				</div>
				<p style="margin-bottom: 20px">탈퇴하기를 누르시면 1주일 간 계정이 휴면 상태로 전환됩니다. 1주일이 지나면 자동 삭제되고, 그 사이에 계정을 정상 복원할 수 있습니다.</p>
				<div class="text-center">
				<a href="/secede.do" class="genric-btn default radius" onclick="alert('계정이 휴면 처리되었습니다. 1주일 뒤 자동 삭제됩니다.');" style="margin-right: 10px;"><span>탈퇴하기</span>
						</a>
				<a href="/modify_info.do" class="genric-btn default radius"><span>취소하기</span>
						</a>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/mypage_footer.jsp"%>