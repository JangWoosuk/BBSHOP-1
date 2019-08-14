<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@ include file="../include/community_header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript"
	src="resources/community/js/smarteditor/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
	
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<body>
<div style="margin-bottom:100px;">
</div>
	<div class="section-top-border">
		<div class="row">
			<div class="col-lg-6 col-md-6" style="margin-left:auto;margin-right:auto;text-align:center;">
				<h3 class="mb-30 title_color" style="font-weight:bold;">글 수정</h3>
				<form id="writeForm" action="/communityUpdateAction.do" method="post">
				<input type="hidden" name="BOARD_NUM" value=<c:out value='${post.BOARD_NUM}'/>>
					<div class="mt-10">
						<input type="text" name="WRITER" value=<c:out value='${post.WRITER}'/> required
							class="single-input" readonly>
					</div>
					<div class="mt-10">
						<input type="text" name="TITLE" value=<c:out value='${post.TITLE}'/>
							required class="single-input">
					</div>
					<div class="input-group-icon mt-10">
						<div class="icon">
							<i class="fa fa-thumb-tack" aria-hidden="true"></i>
						</div>
						<div class="form-select" id="default-select">
							<select name="TEAM_NAME" id="TEAM_NAME">
								<option value="header">말머리를 선택하세요</option>
								<option value="kbo">KBO</option>
								<option value="lg">LG</option>
								<option value="lotte">롯데</option>
								<option value="hanwha">한화</option>
								<option value="doosan">두산</option>
								<option value="kia">기아</option>
								<option value="samsung">삼성</option>
								<option value="kiwoom">키움</option>
								<option value="nc">NC</option>
								<option value="sk">SK</option>
								<option value="kt">KT</option>
							</select>
						</div>
					</div>
					<div class="mt-10">
						<!-- <textarea name="content" id="ir1" rows="10" cols="100"
							style="width: 766px; height: 412px; display: none;"></textarea> -->
						<textarea name="BOARD_CONTENT" id="ir1" rows="10" cols="100" style="width:100%; height:412px; min-width:610px; display:none;"></textarea>
					</div>
					<div class="mt-10">
						<input type="file" name="UPLOADFILE" style="float:left;"/>
					</div>
					<div class="mt-10">
						<table style="width:100%;">
							<tr>
								<td align="center"><br /> <input type="submit" id="savebutton" value="수정" style="float:right;"/></td>
								<td align="center"><br /> <input type="button" value="취소" style="float:left;"
									onclick="location.href='/community_list.do?TEAM_NAME=${post.TEAM_NAME}'" /></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var oEditors = [];

		var sLang = "ko_KR"; // 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

		//추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1",
			sSkinURI : "resources/community/js/smarteditor/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function() {

				},
				I18N_LOCALE : sLang
			}, //boolean
			fOnAppLoad : function() {
				//예제 코드
				oEditors.getById["ir1"].exec("PASTE_HTML", ["<c:out value='${post.BOARD_CONTENT}'/>"]);
			},
			fCreator : "createSEditor2"
		});
		
	    $("#savebutton").click(function(){   
	    	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);  // 이부분에 에디터 validation 검증                  
	    	//폼 submit    
	    	if(confirm("글을 수정하시겠습니까?") == true){
	    	$("#writeForm").submit();     
	    	} else{
	    		return false;
	    	}
	    });
	</script>
	
	<script>
	// TEAM_NAME 불러와서 select 옵션 적용하는 과정
	$('select').find("option[value='${post.TEAM_NAME}']").prop("selected", true);
	
	</script>
</body>

<%@ include file="../include/community_footer.jsp" %>
