<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width,initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Sunflower:300,500,700&amp;subset=korean" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

    <style>
        /*바디태그에 폰트넣기*/
        @font-face{font-family:'NanumBarunpen';font-weight:normal;src:local(NanumBarunpen);src:url("resources/shoppingMall/fonts/NanumBarunpenR.eot");src:url("resources/shoppingMall/fonts/NanumBarunpenR.woff") format("woff"), url("resources/shoppingMall/fonts/NanumBarunpenR.woff2") format("woff2")}
	@font-face{font-family:'NanumBarunpen';font-weight:bold;src:local(NanumBarunpen);src:url("resources/shoppingMall/fonts/NanumBarunpenB.eot");src:url("resources/shoppingMall/fonts/NanumBarunpenB.woff") format("woff"), url("resources/shoppingMall/fonts/NanumBarunpenB.woff2") format("woff2")}

	body{font-family:NanumBarunpen, sans-serif}
        /*
        body {
            font-family: 'Sunflower', sans-serif;
        }*/

        /* Shop,Go Cummunity 눌렀을때 뜨는 모달(로그인모달) */
        .modal {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Stay in place */
            z-index: 1;
            /* Sit on top */
            left: 0;
            top: 0;
            width: 100%;
            /* Full width */
            height: 100%;
            /* Full height */
            overflow: auto;
            /* Enable scroll if needed */
            background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4);
            /* Black w/ opacity */
        }
		/*로그인 화면에서  회원가입 버튼을 눌렀을때 나오는 모달창*/
        .sign_up_Modal {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Stay in place */
            z-index: 1;
            /* Sit on top */
            left: 0;
            top: 0;
            width: 100%;
            /* Full width */
            height: 100%;
            /* Full height */
            overflow: auto;
            /* Enable scroll if needed */
            background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4);
            /* Black w/ opacity */
        }
        /*아이디,비밀번호찾기 누르면 나오는 모달창*/
        .findinfo_Modal {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Stay in place */
            z-index: 1;
            /* Sit on top */
            left: 0;
            top: 0;
            width: 100%;
            /* Full width */
            height: 100%;
            /* Full height */
            overflow: auto;
            /* Enable scroll if needed */
            background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4);
            /* Black w/ opacity */
        }
   
        /*이메일 인증눌렀을때 나오는 모달창*/
        .emailcheck_Modal {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Stay in place */
            z-index: 2;
            /* Sit on top */
            left: 10%;
            top: 10%;
            width: 40%;
            height: 40%; 
            overflow: auto;
            /* Enable scroll if needed */
       	    background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: #fefefe;
            /* Black w/ opacity */
        }
   		/*추가사항을 눌렀을시 나오는 모달창*/
        .moredetails_Modal {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Stay in place */
            z-index: 3;
            /* Sit on top */
            left: 0;
            top: 0;
            width: 100%;
            /* Full width */
            height: 100%;
            /* Full height */
            overflow: auto;
            /* Enable scroll if needed */
            background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4);
            /* Black w/ opacity */
        }

        /* 로그인 모달의 내용*/
        .modal-content {
            background-color: #fefefe;
            margin: 8% auto;
            /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
            /* Could be more or less, depending on screen size */
			
        }
        /*아이디 찾기 모달에 나오는 내용*/
        .findinfo-content {
            background-color: #fefefe;
            margin: 8% auto;
            /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
            /* Could be more or less, depending on screen size */
			
			
        }
        
		/*회원가입 모달의 내용*/
        .sign_up_content {
            background-color: #fefefe;
            margin: 5% auto;
            /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 35%;
            
            /* Could be more or less, depending on screen size */
        }
        /*이메일 인증 모달에 나오는 내용*/
         .emailcheck_content {
            background-color: #fefefe;
            margin: 8% auto;
            /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 10%;
            /* Could be more or less, depending on screen size */
        }
    	/*추가사항 모달에 나오는 내용*/
        .moredetails_content {
            background-color: #fefefe;
            margin: 8% auto;
            /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
            /* Could be more or less, depending on screen size */
        }
        

        /* The Close Button 스판 태그로 넣어주는 클로우즈 버튼*/
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /*체크박스에 넣어줄 style checked+label은 체크가 되고 라벨태그가 바로 붙었을때  밑에도 같은식 */
        input[type="checkbox"]:checked+label {
            background-position: 0 -15px;
        }

        input[type="checkbox"] {
            display: none;
        }

        input[type="checkbox"]+label {
            color: black;
        }

        input[type="checkbox"]+label span {
            display: inline-block;
            width: 19px;
            height: 19px;
            margin: -2px 10px 0 0;
            vertical-align: middle;
            background:
                url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) left top no-repeat;
            cursor: pointer;
        }

        input[type="checkbox"]:checked+label span {
            background:
                url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -19px top no-repeat;
        }

        /*동영상 내용*/
        #index-back {
            position: fixed;
            top: 0px;
            left: 0px;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -1000;
            overflow: hidden;
        }

        /*버튼 메뉴(shop,gocommunity)의 색상. */
        .BBSHOP {
            background-color: #57c051;
        }

        /*모달창 투명도*/
        #loginModal {
            opacity: 1;
        }

        #sign_up {
            opacity: 0.9;
        }
        #findinfo{
        	opacity: 0.9;
        }
        #emailcheck{
        	opacity: 0.9;
        }
        #moredetails{
        	opacity:0.9;
        }
        
    </style>

   
</head>

<body>
    <!-- Index Background Video -->
    <video id="index-back" preload="auto" loop autoplay muted>
        <source src="resources/shoppingMall/img/indexmedia.mp4" type="video/mp4">
        <source src="resources/shoppingMall/img/indexmedia.ogg" type="video/ogg">
    </video>


    <div id="index">

        <!-- <button id="loginBtn">Login</button>-->

        <table cellpadding="0" cellspacing="0" width="100%">
            <tbody>
                <tr>
                    <td width="100%" height="700" align="center" valign="middle">
                        <table width="700" cellpadding="0" cellspacing="0" height="100">
                            <tbody>
                               <tr align = center>
                                	<img style ="background-color:rgba(255, 255, 255, 0); border: none " src ="${pageContext.request.contextPath }/resources/shoppingMall/img/logo.png">
                                    <br><br><br><br><br><br>
                                </tr>
                                <tr>

                                    <td style="text-align: center" class="BBSHOP" width="1000" height="100">
                                       
										<!-- 여기서 버튼을 누르면 로그인 창이 뜬다. -->
										<button id="goShop"
                                            style="background-color: rgba(255, 255, 255, 0); border: none ; border-width: 2000px "  >
                                            <p align="center">
                                                <font color="white"> <span style="font-size: 24pt;">SHOP</span></font>
                                                <br> <br>
                                                <font color="white"><span style="font-size: 14pt;">Go Shop</span></font>

                                            </p>
                                        </button>
                                    </td>

                                    <td width="1500"></td>
                                    <td style="text-align: center" class="BBSHOP" width="500" height="120">
                                        <button id="goCommunity"
                                            style="background-color: rgba(255, 255, 255, 0); border: none">
                                            <p align="center">
                                                <font color="white"> <span style="font-size: 22pt;">COMMUNITY</span>
                                                </font><br> <br>
                                                <font color="white"><span style="font-size: 12pt;">Go Community</span>
                                                </font>

                                            </p>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>

            </tbody>
        </table>


		<!-- 이부분 부터 로그인 모달이 띄어지는 부분이다. -->
        <div id="loginModal" class="modal">
			<!-- 로그인 모달의 내용 -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2 align="center">로 그 인</h2>
                <div class="modal-body" style="padding: 40px 50px;">
                    <form id="loginform" name="loginform" role="form" action="login.do" method="post">
                        <div class="form-group">
                       <input type='hidden' id='toPage' name='toPage' value=''>
                            <label for="userid">ID</label> <input type="text" class="form-control" id="userid"
                                name="MEMBER_ID" placeholder="ID를 입력하세요...">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label> <input type="password" class="form-control" id="password"
                                name="MEMBER_PW" placeholder="Password를 입력하세요...">
                        </div>
                        <div class="checkbox">
                            <input type="checkbox" id="login_checkbox" checked /> <label
                                for="login_checkbox"><span></span>ID 저장</label>
                            <input type="checkbox" id="login_maintain_checkbox" checked /> <label
                                for="login_maintain_checkbox"><span></span>로그인 상태 유지</label>
                        </div>
                        <input type="submit" value="로그인" class="btn btn-info btn-block">
                        <Br>
                    </form>
                    <input type="button" value="비회원 로그인" id="noAccount" class="btn btn-info btn-block">
                    <!--여기에 비회원 로그인할 컨트롤러 설정을 해야함.-->
                    <br>
                    <!-- 카카오 api 버튼 -->
                    <div align="center">
                    <Button id="kakao-login-btn" style="width:100% auto" onclick="location.href='http://developers.kakao.com/logout'"></Button>
					</div>
					<br>


					

                    <div style=" float:left;  margin-right:40px">
                        <Button id="sign_up_btn" class="btn btn-info btn-block">회원가입</Button> </div>

                    <div style=" float:right;"><Button id="find_info_btn" class="btn btn-info btn-block">아이디/비밀번호
                            찾기</Button></div>

                </div>


            </div>
        </div>
        <div id="findinfo" class="findinfo_Modal">
        	<!-- 아이디 /비밀번호 찾기 -->
        	<div class="findinfo-content">
        		<span class="close">&times;</span>
        		<h2 align=center>아이디 찾기</h2>
        		<form>
        			<div class=form-group>
        			<label for="findinfo_name">이름</label><br>
        			
        			<input type="text" class="form-control" id="findinfo_name" placeholder="가입시 기입한 이름을 적어주세요"><br>
        			</div>
        			<div class=form-group>
        			<label for="findinfo_phone">휴대전화</label><br>
        			<input type="text" class="form-control" id="findinfo_phone" placeholder="가입시 기입한 휴대전화 번호를 -를 제외하고 적어주세요."><br>
					</div>
        			<br>
        			<input type="submit" class="btn btn-info btn-block" value="확인">
              	</form>
           	</div>
		</div>        	
        
        <div id="sign_up" class="sign_up_Modal">
            <!-- 회원가입 모달창 -->
            <div class="sign_up_content">
                <span class="close">&times;</span>
                <h2 align="center">회 원 가 입</h2>
                <div class="sign_up_body" style="padding: 40px 50px;">

                    <form action="register.do" method="post" name="sign_form" role="form">
                        <table width=100% cellspacing=0 cellpadding=0 align=center>
                            
                                <tr>
                                    <td><div style='float:left'>
                                        <label for="sign_id">ID(Email)</label> &nbsp;&nbsp;&nbsp;
                                        </div>
                                        <div class="check_font" id="id_check" style='float:center'></div>
                                   

                                        <input type="text" class="form-control" id="sign_id" name="MEMBER_ID"
                                            placeholder="Email을 입력하세요">
                      
                            </td>
                            <td><br>
                                <input type="button" class="btn btn-info btn-block" name="emailbtn" id="auth_Email" value="Email인증"
                                     style="margin-left:10px" onclick="emailAvailCheck()" disabled="true">

                            </td>

                            </tr>

                            <tr>
                                <td>
                                    <label for="sign_pwd">Password</label><BR>
                                    <input type="password" class="form-control" id="sign_pwd" name="MEMBER_PW"
                                        placeholder="암호를 입력하세요">
                                </td>

                            </tr>
                            <tr>
                                <td><div style='float:left'>
                                    <label for="sign_pwd_check">Password Check</label>&nbsp;&nbsp;&nbsp;</div>
                                     <div class="check_font" id="pw_check" style='float:center'></div>
                                    <input type="password" class="form-control" id="sign_pwd_check"
                                        name="password_check" placeholder="암호를 다시 입력하세요">
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <label for="sign_name">Name</label><BR>
                                    <input type="text" class="form-control" id="sign_name" name="NAME"
                                        placeholder="이름을 입력하세요">
                                </td>

                            </tr>
                            
                            <tr>
                                <td><div style='float:left'>
                                    <label for="sign_nickname">Nickname</label>&nbsp;&nbsp;&nbsp;</div>
                                      <div class="check_font" id="nick_check" style='float:center'></div>
                                    <input type="text" class="form-control" id="sign_nickname" name="NICKNAME"
                                        placeholder="닉네임을 적어주세요">
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label for="sign_phone">Phone</label><BR>
                                    <input type="text" class="form-control" id="sign_phone" name="PHONE"
                                        placeholder="-제외한 번호를 적어주세요 ex)01012345678">
                                </td>
                                
                            </tr>
                            <tr>
                                <td>
                                    <label for="sign_birth">Birth</label><BR>
                                    <input type="text" class="form-control" id="sign_birth" name="BIRTH"
                                        placeholder="생년월일을 적어주세요 ex)190701">
                                </td>

                            </tr>
                </table>
                <br>
                <input type="button" id="moredetails_btn" class="btn btn-info btn-block" value="추가 사항 입력" disabled="true"></button>
               
                <br>
                <input type="submit" class="btn btn-info btn-block" id="sign_btn" name="sign" value="회원가입" disabled="true" >
                </form>
            </div>
        </div>

    </div>

		<div id="emailcheck" class="emailcheck_Modal">
			<div calss="emailcheck_content">
				<span class="close">&times;</span>
				
				<div class="emailcheck_body" style="padding: 40px 50px;">
				
					<h2 align=center>이메일 인증</h2>
				
						<div class="form-group">
					    <label for="auth">인증키</label>
                    	<input type="text" class="form-control" id="insertkey" placeholder="인증키를 적어주세요"></div>
					<br>
						<input type="button" id="authkey_check" value="인증" class="btn btn-info btn-block" onclick="checkAuthkey()">
			
				</div>
			</div>
		</div>

		<div id="moredetails" class="moredetails_Modal">
        <div class="moredetails_content">
            <span class="close">&times;</span>
            <h2 align="center">추 가 사 항</h2>
            <div class="moredetail_body" style="padding: 40px 50px;">
                        <div class=form_moredetails_group>

                <form action="moredetails.do" method="post" id="moredetailsform">
                	<input type='hidden'name='MEMBER_ID' id='md_id' value=''>
            		<input type='hidden'name='MEMBER_PW' id='md_pw' value=''>
                 	<input type='hidden' name='NAME' id='md_name' value=''>
                 	<input type='hidden' name='PHONE' id='md_phone' value=''>
                 	<input type='hidden' name='BIRTH' id='md_birth' value=''>
                 	<input type='hidden' name='NICKNAME' id='md_nickname' value=''>
                
                    <table width=100% cellspacing=0 cellpadding=0 align=center colspan="2">
                            <tr>
                                <td>
                                    <label for="team">선호 구단</label>
                                </td>
                                <td>
                                    <select class="form-control" name="TEAM" id="team">
                                    	<option value="team">Team</option>
                                        <option value="lg">LG</option>
                                        <option value="kiwoom">Kiwoom</option>
                                        <option value="kia">Kia</option>
                                        <option value="hanwha">Hanwha</option>
                                        <option value="lotte">Lotte</option>
                                        <option value="samsung">Samsung</option>
                                        <option value="nc">NC</option>
                                        <option value="doosan">Doosan</option>
                                        <option value="kt">KT</option>
                                        <option value="sk">SK</option>

                                    </select>
                                </td>
                            </tr>
                       
                            <tr>
                                <td>     <br>
                                    <label for="position">주 포지션</label></td>
                                <td>     <br>

                                    <div class="position select">
                                    <select class="form-control" name="POSITION" id="position">
                                    	<option value="position">Position</option>
                                        <option value="내야수">내야수</option>
                                        <option value="외야수">외야수</option>
                                        <option value="포수">포수</option>
                                        <option value="투수">투수</option>

                                    </select>
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td>     <br>
                                <label for="brand">브랜드1</label></td>
                                <td>     <br>
                                 <div>
                                   <select class="form-control" name="BRAND1" id="brand1">
                                   		<option value="">선택1</option>
                                        <option value="adidas">Adidas</option>
                                        <option value="asics">Asics</option>
                                        <option value="descente">Descente</option>
                                        <option value="brett">Brett</option>
                                        <option value="fila">Fila</option>
                                        <option value="mizuno">Mizuno</option>
                                        <option value="nike">Nike</option>
                                        <option value="morimoto">Morimoto</option>
                                        <option value="underarmour">UnderArmour</option>
                                        <option value="wilson">Wilson</option>
                                    </select>
                                </div>
                                </td>
                               
                            </tr>
                            <tr>
                                <td>
                                <br><label for="brand">브랜드2</label></td>
                                <td> <br>
                                 <div>
                                   <select class="form-control" name="BRAND2" id="brand2">
                                   		<option value="">선택2</option>
                                        <option value="adidas">Adidas</option>
                                        <option value="asics">Asics</option>
                                        <option value="descente">Descente</option>
                                        <option value="brett">Brett</option>
                                        <option value="fila">Fila</option>
                                        <option value="mizuno">Mizuno</option>
                                        <option value="nike">Nike</option>
                                        <option value="morimoto">Morimoto</option>
                                        <option value="underarmour">UnderArmour</option>
                                        <option value="wilson">Wilson</option>
                                    </select>
                                </div>
                                </td>
                               
                            </tr>
                            <tr>
                                <td><br>
                                <label for="brand">브랜드3</label></td>
                                <td><br>
                                 <div>
                                   <select class="form-control" name="BRAND3" id="brand3">
                                   		<option value="">선택3</option>
                                        <option value="adidas">Adidas</option>
                                        <option value="asics">Asics</option>
                                        <option value="descente">Descente</option>
                                        <option value="brett">Brett</option>
                                        <option value="fila">Fila</option>
                                        <option value="mizuno">Mizuno</option>
                                        <option value="nike">Nike</option>
                                        <option value="morimoto">Morimoto</option>
                                        <option value="underarmour">UnderArmour</option>
                                        <option value="wilson">Wilson</option>
                                    </select>
                                </div>
                                </td>
                               
                            </tr>
                          </table>
                       
                
                    <br>
                    <input type="button" class="btn btn-info btn-block" id="moredetails_submit" name="sign" value="회원가입">
                </form>
            </div>
        </div>
    </div>
    
     <script>
    //로그인시 아이디와 패스워드 체크
        function check_input() {
            var str, i, ch;
            // 아이디 체크 ----> 
            if (document.loginform.userid.value == "") {//아이디가 적혀있지 않을때
                alert("아이디를 입력하세요!!!");
                document.loginform.userid.focus(); //아이디 입력창으로 커맨드가 넘어간다.
                return;
            }
            else {
                str = document.loginform.userid.value; //아이디가 있으면 str에 아이디 값을 저장.

                for (i = 0; i < str.length; i++) { //ch에다가 하나씩 잘라서 넣어줌.
                    ch = str.substring(i, i + 1);
                    if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z")//숫자,문자가 아닐경우 특수 문자이기 때문에 다시 입력해야한다.
                        || (ch >= "A" && ch <= "Z"))) {
                        alert("특수문자가 포함, 다시 입력!!!");
                        document.loginform.userid.focus();
                        return;
                    }
                }
            } // 아이디 체크 <------

            // 패스워드 체크 ------ 아이디 체크와 같은식.>
            if (document.loginform.password.value == "") {
                alert("패스워드를 입력하세요!!!");
                document.loginform.password.focus();
                return;
            }
            else {
                str = document.loginform.password.value;

                for (i = 0; i < str.length; i++) {
                    ch = str.substring(i, i + 1);
                    if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z")
                        || (ch >= "A" && ch <= "Z"))) {
                        alert("특수문자가 포함, 다시 입력!!!");
                        document.loginform.password.focus();
                        return;
                    }
                }
            } // 패스워드 체크 <------

            loginform.submit();
        }
    
      //<![CDATA[ // 사용할 앱의 JavaScript 키를 설정해 주세요. 
    	  Kakao.init('25bbcf79c9a33e4e0d27eaa6bd0ddcf3'); //여기서 아까 발급받은 키 중 javascript키를 사용해준다. 
    	  // 카카오 로그인 버튼을 생성합니다.
    	  Kakao.Auth.createLoginButton({ 
    		  container: '#kakao-login-btn', 
    		  success: function(authObj){
    			  Kakao.API.request({

    			       url: '/v1/user/me',

    			       success: function(res) {

    			           //  alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
    			           //  alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
    			          
    			           console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
    			             console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
    			             console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
    			    		 console.log(res.birthday)
    			             console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
    			             var MEMBER_ID =  res.kaccount_email;
    						 
    			    		 $.ajax({
    			         		url:'kakaoLogin.do',
    			         		type:'POST', //여기서 String값으로 받고 밑에서 비교하는것을 success,fail로 비교하자!!
    			         		data:{MEMBER_ID:res.kaccount_email , NICKNAME:res.properties['nickname'],toPage:$("#toPage").val()},
    			         		dataType : "text",
    			         		success : function(data) {
    			         			alert('성공'+data);
    			         			location.href=data;
    			         				}, 
    			         		error : function() {
    			         			alert('실패');
    			 						console.log("실패");
    			 				}
    			 			});
    			       }
    			         })
    		  }, 
    		fail: function(err) { 
    			alert("실패"+JSON.stringify(err)); 
    			}
    			  }); //]]>

        
    </script>
    <!-- 아이디 중복과 비밀번호 일치 시키는 코드. -->
    <script>
    $(document).ready(function(){
    	
    	$("#noAccount").click(function(){
    		var toPage = $("#toPage").val();
    		alert(toPage);
    		location.href="noAccount.do?toPage="+toPage;
    	})
    		
    	
    	
    	//blur 는 input태그에서 포커스가 떠났을때 발생하는 jquery 이벤트 메소드이다. sign_id태그에서 벗어났을때 아이디가 중복인지 확인한다.
    	$("#sign_id").blur(function() {
        	
        	var MEMBER_ID = $("#sign_id").val();
        	
        	$.ajax({
        		url:'check_id.do?MEMBER_ID='+MEMBER_ID,
        		type:"GET", //여기서 String값으로 받고 밑에서 비교하는것을 success,fail로 비교하자!!
        		success : function(data) {
        			console.log("1: 중복이란다  0: 없는 아이디 란다 ="+data);
        			
        			if(data=='success'){
        				$("#id_check").text("사용중이란다");
        				$("#id_check").css("color","red");
        				$("#auth_Email").attr("disabled",true);
        				$("#sign_id").focus();
        				
        			}else {
						$("#id_check").text("사용 가능하단다");
						$("#id_check").css("color","green");
						$("#auth_Email").attr("disabled",false);
					}
				}, error : function() {
						console.log("실패");
				}
			});
    	$("#sign_pwd_check").blur(function(){
    		var password = $("#sign_pwd").val();
    		var password_check = $("#sign_pwd_check").val();
    		if(password == password_check){
    			$("#pw_check").text("비밀번호가 일치합니다!");
    			$("#pw_check").css("color","green");
    			
    		}
    		else{
    			$("#pw_check").text("비밀번호가 일치하지 않습니다.");
    			$("#pw_check").css("color","red");
    			$("#sign_pwd").focus();
    		}
    		
    	})
    });
    $("#sign_nickname").blur(function() {
    	
    	var MEMBER_NICKNAME = $("#sign_nickname").val();
    	
    	$.ajax({
    		url:'check_nickname.do?NICKNAME='+MEMBER_NICKNAME,
    		type:"GET", //여기서 String값으로 받고 밑에서 비교하는것을 success,fail로 비교하자!!
    		success : function(data) {
    			console.log("success: 중복이란다  false: 없는 닉네임 이란다 ="+data);
    			
    			if(data=='success'){
    				$("#nick_check").text("사용중이란다");
    				$("#nick_check").css("color","red");
    				$("#sign_nickname").focus();
    				
    			}else {
					$("#nick_check").text("사용 가능하단다");
					$("#nick_check").css("color","green");
					
				}
			}, error : function() {
					console.log("실패");
			}
		});
	});	
    
    $().ready(function(){
    	
    		$sign_btn = document.getElementById('sign_btn');
    		$moredetails_btn = document.getElementById('moredetails_btn');	
    		
    	if($('#sign_id').val()!=null &&$('#sign_pwd').val()!=null &&$('#sign_nickname').val()!=null && $('#sign_phone').val()!=null){
    		 
    		$('#sign_birth').blur(function(){
    			 
    		
    			$sign_btn = $('#sign_btn').attr('disabled',false);
    		
    			$moredetails_btn = $('#moredetails_btn').attr('disabled',false);
    		 
    		})
    	
    	}		
    	
    })
		});	
    
    </script>
    
    
	<!-- 이부분이 이메일 양식을 체크 하는부분 -->
    <script type="text/javascript">
    var authkey;
    var emailcheck_Modal = document.getElementById('emailcheck');
        var emailAvailCheck = function () {
            var userid = $('input[id=sign_id]').val();
            alert(userid);
            if (userid == '') {
                alert("메일 주소를 정확히 입력 해 주십시오");
                return false;
            }
            var useridarr = userid.split('@');
            if (useridarr.length < 2) {
                alert("메일 주소를 정확히 입력 해 주십시오");
                return false;
            }

            if (useridarr[0] == '' || useridarr[1] == '') {
                alert("메일 주소를 정확히 입력 해 주십시오");
                return false;
            }
            alert("이메일을 보냈습니다.");
            
            //컨트롤러에 ajax로 이메일을 보내고 인증키를 가져옴.
            jQuery.ajax({
    			url : 'authEmail.do',
    			type : 'POST',
    			data : {MEMBER_ID:userid},    			
    			dataType : "text",
    			success : function(authkey_rand){
    				alert(authkey_rand);
    				//인증키를 authkey 변수에 넣어줌.
    				authkey=authkey_rand;
    			},
    			error:function(){
    				alert("ajax통신 실패!!!");
    			}
    			});
            emailcheck_Modal.style.display="block";
        }
        
        var checkAuthkey = function(){
        	var insertkey = $('input[id=insertkey]').val();
        	if(authkey==insertkey){
        		alert("인증키가 일치합니다OOOOOOOOO.")
        		       		
        		emailcheck_Modal.style.display="none";
        		
        		//disabled 였던 버튼을 false로 바꿔줘야한다.
        		//$sign_btn = $('#sign_btn').attr('disabled',false);
        	}
        	else{
        		alert("인증키가 틀립니다XXXXXXXX.")
        		$('input[id=insertkey]').focus();
        	}
        }
        
    </script>

    <script>
        var modal = document.getElementById('loginModal');  //id가 loginModal인것을 찾아서 modal변수에 넣어준다.
        var modal_sign_up = document.getElementById('sign_up');
        var moredetails = document.getElementById('moredetails');
        var findinfo = document.getElementById('findinfo');

        var span1 = document.getElementsByClassName("close")[0];	//스판태그의 이벤트를 주기위해 사용.
        var span2 = document.getElementsByClassName("close")[1];
        var span3 = document.getElementsByClassName("close")[2];
        var span4 = document.getElementsByClassName("close")[3];
        var span5 = document.getElementsByClassName("close")[4];
        //SHOP 눌렀을시.
        $('#goShop').click(function () {
            modal.style.display = "block"; //modal.style.display = none 일시엔 보여지지 않지만 block으로 바꾸면 내용이보인다.
			//동적으로 쇼핑몰 메인으로 가기위해 히든으로 value값을 줌.
            $('[name="toPage"]').val("goShop");
		})
        //Community 눌렀을시
        $('#goCommunity').click(function () {
            modal.style.display = "block"; //modal.style.display = none 일시엔 보여지지 않지만 block으로 바꾸면 내용이보인다.
            //동적으로 커뮤니티 메인으로 가기위해 히든으로 value값을 줌.
            $('[name="toPage"]').val("goCommunity");
        })
        
        //회원가입 눌렀을때
        $('#sign_up_btn').click(function () {
            modal.style.display = "none";
            modal_sign_up.style.display = "block";
      
        })
        //추가사항 눌렀을때
        $('#moredetails_btn').click(function () {
        	
            modal_sign_up.style.display = "none";
            moredetails.style.display = "block";
            
            var MEMBER_ID= $("#sign_id").val();
            var MEMBER_PW= $("#sign_pwd").val();
            var MEMBER_NICKNAME= $("#sign_nickname").val();
            var MEMBER_NAME= $("#sign_name").val();
            var MEMBER_PHONE= $("#sign_phone").val();
            var MEMBER_BIRTH= $("#sign_birth").val();
            
            $("#md_id").val(MEMBER_ID);  
            $("#md_pw").val(MEMBER_PW);  
            $("#md_nickname").val(MEMBER_NICKNAME);  
            $("#md_name").val(MEMBER_NAME);  
            $("#md_phone").val(MEMBER_PHONE);  
            $("#md_birth").val(MEMBER_BIRTH);              
        });
        
        $('#moredetailsform').on('click', '#moredetails_submit', function(){
           	
        	var team=$("#team option:selected").val();
           	var position=$("#position option:selected").val();
           	var hand=$("#hand option:selected").val();
           	var brand1=$("#brand1 option:selected").val();
           	var brand2=$("#brand2 option:selected").val();
           	var brand3=$("#brand3 option:selected").val();
           	
           	var MEMBER_ID= $("#md_id").val();
            var MEMBER_PW= $("#md_pw").val();
            var MEMBER_NICKNAME= $("#md_nickname").val();
            var MEMBER_NAME= $("#md_name").val();
            var MEMBER_PHONE= $("#md_phone").val();
            var MEMBER_BIRTH= $("#md_birth").val();
         	
            var formData={TEAM:${'team'},POSITION:${'position'},HAND:${'hand'},BRAND1:${'brand1'},BRAND2:${'brand2'},BRAND3:${'brand3'},MEMBER_ID:${'MEMBER_ID'},MEMBER_PW:${'MEMBER_PW'},NICKNAME:${'MEMBER_NICKNAME'},NAME:${'MEMBER_NAME'},PHONE:${'MEMBER_PHONE'},BIRTH:${'MEMBER_BIRTH'}};
            
            console.log('formData : ' + formData);
         	
            jQuery.ajax({
    			url : 'moredetails.do',
    			type : 'POST',
    			data : formData,    			
    			dataType : "text",
    			success : function(){
    				
    				alert("통신완료!");
    			},
    			error:function(){
    				
    				alert("ajax통신 실패!!!");
    			}
    		});
           //	location.href="moredetails.do?TEAM="+team;
        });
		//아이디 비밀번호 찾기 눌렀을때
        $('#find_info_btn').click(function(){
        	modal.style.display="none";
        	findinfo.style.display="block";
        })
        
        
        
        //X버튼 눌렀을때 모달창 끄기.
        span1.onclick = function () {
            modal.style.display = "none";
        }
        span2.onclick = function () {
        	findinfo.style.display = "none";
        }

        span3.onclick = function () {
        	modal_sign_up.style.display = "none";
        }
       
        span4.onclick = function () {
        	emailcheck.style.display = "none";
        } 
        span5.onclick = function () {
        	moredetails.style.display = "none";
        }


        window.onclick = function (event) {
            if (event.target == modal) { //스크립트가 시작될때의 이벤트를 만들어준다.
                modal.style.display = "none";
            } else if (event.target == modal_sign_up) {
                modal_sign_up.style.display = "none";
            }
            else if (event.target == moredetails) {
                moredetails.style.display = "none";
            }
            else if(event.target==emailcheck){
            	emailcheck.style.display="none";
            }
            else if(event.target==findinfo){
            	findinfo.style.display="none";
            }
        }

    </script>
</body>

</html>