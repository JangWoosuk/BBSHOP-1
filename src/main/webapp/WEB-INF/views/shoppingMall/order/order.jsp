<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<%@ include file="../include/shopping_header.jsp" %>

<style>
body {
   font-weight: bold;
   font-size: 17px;
}
.order_area {
   padding-top: 100px;
}
label[for="confirm-radio"] {
   position: relative;
}
.modal {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top - display가 block 처리되었을 때 view보다 상단에 노출되게 해줌*/
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0, 0, 0); /* Fallback color */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
#addressModal .modal-content {
   background-color: #fefefe;
   margin: 8% auto; /* 15% from the top and centeredl */
   padding: 10px;
   border: 1px solid #888;
   width: 25%; /* Could be more or less, depending on screen size */
   height: 65%;
}
/* The Close Button */
#addressModal #closeModal {
   color: #aaa;
   float: right;
   font-size: 28px;
   font-weight: bold;
}
#addressModal #closeModal:hover, #closeModal:focus {
   color: black;
   text-decoration: none;
   cursor: pointer;
}
#addressModal {
   opacity: 0.9;
}
#addressModal .modal-footer {
   margin-top: 20px;
}
#addressModal .modal-body {
   align: center;
}
#addressBtn {
   opacity: 0.9;
   border: 1px solid #888;
}
.order_box { .list { li{ overflow:hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
}
tr>th {
   font-weight: bold;
   text-align: center;
}
li a {
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 50px;
   height: 20px;
}
li, a {
   display: block;
}
.a{
  overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap;
  width:20px; 
}
</style>
<body>
   <!--================Home Banner Area =================-->
   <section class="banner_area">
      <div class="banner_inner d-flex align-items-center"
         style="background-color: #70e270;">
         <div class="container">
            <div class="banner_content text-center">
               <h2 style="color: white;">주문하기</h2>
               <div class="page_link">
                  <a href="/shopping_main.do" style="color: white;">쇼핑몰</a> <a
                     href="/order" style="color: white;">주문</a>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--================End Home Banner Area =================-->

   <!--================Order Area =================-->
   <section class="order_area">
      <div class="container">
         <div class="cart_inner">
            <h3>
                  주문 리스트
            </h3>
            <div class="table-responsive">
               <table class="table">
                  <thead>
                     <tr>
                        <th scope="col">상품명</th>
                        <!-- 상품정보_name -->
                        <th scope="col">상품 가격</th>
                        <!-- 상품정보_price -->
                        <th scope="col">수량</th>
                        <!-- 주문_상품병_수량 -->
                        <th scope="col">적립금</th>
                        <!-- 주문_상품병_수량 -->
                        <th scope="col">옵션</th>
                        <!-- 주문_상품병_수량 -->
                        <th scope="col">주문금액</th>
                        <!-- 주문_상품별_price -->
                     </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="order" items="${orderList}" varStatus="status">
                  <input type="hidden" value="${goodsList[status.index].goods_num}" class="goods_num" id="GOODS_NUM${status.index}"/>
                     <tr>
                        <td>
                           <div class="media">
                              <div class="d-flex">
                                 <img
                                   src="<c:out value='${goodsList[status.index].main_img}'/>"
                                    alt="" width="145" height="98">
                                 <!-- 상품정보_img -->
                              </div>
                              <div class="media-body">
                                 <p>${goodsList[status.index].name}</p>
                                 <!-- 상품정보_name -->
                              </div>
                           </div>
                        </td>
                        <td>
                             <h5 id=price${status.index}><c:out value="${order.PRICE}원"/></h5>
                        </td>
                        <td>
                           <div class="product_count">
                               <c:out value="${order.QNTTY}"/>
                           </div>
                        </td>
                        <td>
                           <h5>${order.SAVINGS}점</h5>
                        </td>
               <c:choose>
                         <c:when test="${goodsList[status.index].category eq 1 }">
                            <td>
                           <c:choose>
                              <c:when test="${optionList[status.index].HAND eq 0 }">
                                 좌/우 : 좌투<br>
                              </c:when>
                              <c:otherwise>
                                 좌/우 : 우투<br>
                              </c:otherwise>
                           </c:choose>
                           <c:choose>
                              <c:when test="${optionList[status.index].TAMING eq 0 }">
                                 길들이기 : 없음
                              </c:when>
                              <c:otherwise>
                                 길들이기 : 있음
                              </c:otherwise>
                           </c:choose>
                           </td>
                        </c:when>

                        <c:when test="${goodsList[status.index].category eq 2 }">
                           <td>
                           <c:choose>
                              <c:when test="${optionList[status.index].GD_SIZE eq 32 }">
                                 규격 : 32인치
                              </c:when>
                              <c:otherwise>
                                 규격 : 33인치
                              </c:otherwise>
                           </c:choose>
                           </td>
                        </c:when>

                        <c:when test="${goodsList[status.index].category eq 3 }">
                           <td>
                           <c:choose>
                              <c:when test="${optionList[status.index].GD_SIZE eq 85 }">
                                 사이즈 : 85
                              </c:when>
                              <c:when test="${optionList[status.index].GD_SIZE eq 90 }">
                                 사이즈 : 90
                              </c:when>
                              <c:when test="${optionList[status.index].GD_SIZE eq 95 }">
                                 사이즈 : 95
                              </c:when>
                              <c:when test="${optionList[status.index].GD_SIZE eq 100 }">
                                 사이즈 : 100
                              </c:when>
                              <c:otherwise>
                                 사이즈 : 105
                              </c:otherwise>
                           </c:choose>
                           </td>
                        </c:when>

                        <c:when test="${goodsList[status.index].category eq 4 }">
                           <td>
                           <c:choose>
                              <c:when test="${optionList[status.index].GD_SIZE eq 230 }">
                                 사이즈 : 230<br>
                              </c:when>
                              <c:when test="${optionList[status.index].GD_SIZE eq 240 }">
                                 사이즈 : 240<br>
                              </c:when>
                              <c:when test="${optionList[status.index].GD_SIZE eq 250 }">
                                 사이즈 : 250<br>
                              </c:when>
                              <c:when test="${optionList[status.index].GD_SIZE eq 260 }">
                                 사이즈 : 260<br>
                              </c:when>
                              <c:otherwise>
                                 사이즈 : 270<br>
                              </c:otherwise>
                           </c:choose>
                           <c:choose>
                              <c:when test="${optionList[status.index].SPIKE eq 0 }">
                                 스파이크 : 없음
                              </c:when>
                              <c:otherwise>
                                 스파이크 : 있음
                              </c:otherwise>
                           </c:choose>
                           </td>
                        </c:when>
                        <c:otherwise>
                           <td>
                           <c:choose>
                              <c:when test="${optionList[status.index].SALES_UNIT eq 0 }">
                                 판매단위 : 낱개
                              </c:when>
                              <c:otherwise>
                                 판매단위 : 12개(1박스)
                              </c:otherwise>
                           </c:choose>
                           </td>
                        </c:otherwise>
                   </c:choose>
                        <td>
                           <h5><c:out value="${order.TOTALPRICE}"/></h5>
                        </td>
                     </tr>
                    
                    
                    </c:forEach>
                     <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                           <h5>총 상품 금액</h5>
                        </td>
                        <td>
                           <h5>${allPrice }원</h5>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </section>
   <!--================End Cart Area =================-->

   <!--================Consumer Area =================-->
   <section class="consumer_area">
      <div class="container">
         <div class="billing_details">
            <div class="row">
               <div class="col-lg-6">
                  <h3 style="font-weight:bold;">주문자 정보</h3>
                  <form class="row contact_form" id="orderInfo" action="/kakaoPay.do" method="POST">
                     <input type="hidden" name="GOODS_NUM_LIST" id="GOODS_NUM_LIST"/>
                     <div class="col-md-12 form-group">
                        <input type="text" class="form-control" id="name" name="name"
                        value="<c:out value="${user.NAME}"/>" placeholder="성명">
                     </div>
                     <div class="col-md-6 form-group p_star">
                        <input type="text" class="form-control" id="phone1"
                           value="<c:out value="${user.PHONE}"/>"
                           placeholder="연락처1">
                     </div>
                     <div class="col-md-6 form-group p_star">
                        <input type="text" class="form-control" id="phone2" placeholder="연락처2">
                     </div>
                     <div class="col-md-12 form-group">
                        <input type="text" class="form-control" id="id"
                          value="<c:out value="${user.MEMBER_ID}"/>"
                           placeholder="이메일">
                     </div>
                     <div class="col-md-12 form-group" style="margin-bottom: 0px">
                        <div class="same_above">
                           <input type="checkbox" id="same_above" onClick="check(this)">
                           <label for="same_above" style="margin-bottom:30px;">위 정보와 같음</label>
                        </div>
                        <h3 style="font-weight:bold;">배송정보</h3>
                     </div>
                     <div class="col-md-12 form-group">
                        <input type="text" class="form-control" id="deli_name"
                           name="receiver" placeholder="성명">
                     </div>
                     <div class="col-md-6 form-group p_star">
                        <input type="text" class="form-control" id="deli_phone1"
                           name="phone" placeholder="연락처1">
                     </div>
                     <div class="col-md-6 form-group p_star">
                        <input type="text" class="form-control" id="deli_phone2"
                           name="phone2" placeholder="연락처2">
                     </div>
                     <div class="col-md-12 form-group">
                        <input type="text" class="form-control" id="deli_id"
                            placeholder="이메일">
                     </div>
                     <div class="col-md-12 form-group p_star">
                        <p style="font-weight:bold; color:black;">배송지 선택</p>
                      <!--  <label><input TYPE='radio' id="new_input"
                          name="addr_input" value='new_addr' />신규 입력</label> <label><input TYPE='radio'
                           id="user_input" name="addr_input" value='user_addr' />사용자 지정</label> --> <input
                           type="button" id="addressBtn" value="주소록 목록" />
                     </div>
                     <div class="col-md-12 form-group p_star">
                        <table>
                           <tr>
                              <td><p style="font-weight:bold; color:black;">주소</p></td>
                           </tr>
                           <tr>
                              <td><input type="text" class="form-control" id="zipcode_input" style="width: 100px;"></td>
                              <td><a href="javascript:execDaumPostcode()"
                     class="genric-btn default radius"> <span
                     style="font-weight: bold;">우편번호 검색</span></a></td>
                           </tr>
                        </table>
                     </div>
                     <div class="col-md-7 form-group p_star">
                        <input type="text" class="form-control" id="addr1" placeholder="도로명 주소">
                     </div>
                     <div class="col-md-5 form-group p_star">
                        <input type="text" class="form-control" id="addr2" placeholder="상세 주소">
                     </div>
                     <!-- hidden form -->
                     <input type="hidden" name="or_addr" value=""/>
                     <input type="hidden" name="pymntamnt" value="${allPrice}"/>
                     <div class="col-md-12 form-group">
                        <textarea class="form-control" name="or_msg" id="msg" rows="1" placeholder="주문메세지"></textarea>
                     </div>
                  </form>
               </div>
               <div class="col-lg-6">
                  <div class="order_box">
                     <h2 style="font-weight:bold;">결제단계</h2>                   
                     <ul class="list">
                        <li><p>상품 <span>총합</span></p></li>
                     <c:forEach var="order" items="${orderList}" varStatus="status">
                     <li>
                        <p class="product_name"><c:out value="${goodsList[status.index].name}" />
                        <span class="middle"><c:out value="x${order.QNTTY }" /></span>
                        <span class="last"><c:out value="${order.TOTALPRICE }" /></span></p>
                     </li>
                     </c:forEach>
                     </ul>
                     
                     <ul class="list list_2">
                        <li><p>가격 합계 <span><c:out value="${totalPrice}원" /></span>
                        </p></li>
                        <li><p>배송비 <span><c:out value="${shipping_fee}원" /></span>
                        </p></li>
                        <li><p>총 결제금액 <span><c:out value="${allPrice}원" /></span>
                        </p></li>
                     </ul>
                     <div class="payment_item">
                        <h3>결제 수단</h3>
                     </div>
                     <div class="payment_item active">
                        <div class="radion_btn">
                           <input type="radio" id="kakaoPay" style="z-index:1;"> <label
                              for="kakaoPay" style="font-size:17px; font-weight:bold;z-index:1; margin-top:-15px;">카카오페이 </label> <img
                              src="resources/shoppingMall/img/product/single-product/kakaopay.jpg"
                              alt="" style="width:70px;height:30px;">
                           <input type="hidden" name="pymntmthd" value="kakaoPay"/>
                           <div class="check"></div>
                        </div>
                     </div>
                     <div class="creat_account">
                        <input type="checkbox" id="payAgree"> <label
                           for="f-option4" style="font-size:17px; font-weight:bold;">구매 진행에 동의합니다.(필수)</label>
                     </div>
                     <a class="main_btn" onclick="goPay(this)">결제하기</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--================End Checkout Area =================-->

   <!-- ===============모달 Area ==================== -->
   <!-- The Modal -->
   <div id="addressModal" class="modal">

      <!-- Modal content -->
      <div class="modal-content">
         <!-- header -->
         <div class="modal-header">
            <!-- 닫기(x) 버튼 -->
            <span class="close" id="closeModal">&times;</span>
            <!-- header title -->
            <!-- <h4 class="modal-title" align="left">주소록 목록</h4>-->
         </div>
         <!-- body -->
         <div class="modal-body">

            <!-- form태그로 한 번에 묶어버리면 모든 주소의 값이 넘어갈 것 같아서 따로 했습니다 -->
            <!-- 주소 1 -->

            <table>
               <tr>
                  <td><p>주소 1 : <c:out value="${userAddr[0].name}"/></p></td>
               </tr>
               <tr>
                  <td><p id="modal_zipcode" class="modal_addr1"><c:out value="${userAddr[0].zc_key}"/></p></td>
               </tr>
               <tr>
                  <td><p id="modal_addr" class="modal_addr1"
                        style="margin-right: 10px;"><c:out value="${userAddr[0].roadAddress}"/></p></td>
                  <td><p id="modal_detailaddr" class="modal_addr1"><c:out value="${userAddr[0].addr}"/></p></td>
                  <td><input type="button" value="선택" id="button1"
                     onclick="putAddress(id)" /></td>
               </tr>
            </table>

            <!-- 주소 2 -->
            <table>
               <tr>
                  <td><p>주소 2 : <c:out value="${userAddr[1].name}"/></p></td>
               </tr>
               <tr>
                  <td><p id="modal_zipcode" class="modal_addr2"><c:out value="${userAddr[1].zc_key}"/></p></td>
               </tr>
               <tr>
                  <td><p id="modal_addr" class="modal_addr2"
                        style="margin-right: 10px;"><c:out value="${userAddr[1].roadAddress}"/></p></td>
                  <td><p id="modal_detailaddr" class="modal_addr2"><c:out value="${userAddr[1].addr}"/></p></td>
                  <td><input type="button" value="선택" id="button2"
                     onclick="putAddress(id)" /></td>
               </tr>
            </table>

            <!-- 주소 3 -->
            <table>
               <tr>
                  <td><p>주소 3 : <c:out value="${userAddr[2].name}"/></p></td>
               </tr>
               <tr>
                  <td><p id="modal_zipcode" class="modal_addr3"><c:out value="${userAddr[2].zc_key}"/></p></td>
               </tr>
               <tr>
                  <td><p id="modal_addr" class="modal_addr3"
                        style="margin-right: 10px;"><c:out value="${userAddr[2].roadAddress}"/></p></td>
                  <td><p id="modal_detailaddr" class="modal_addr3"><c:out value="${userAddr[2].addr}"/></p></td>
                  <td><input type="button" value="선택" id="button3"
                     onclick="putAddress(id)" /></td>
               </tr>
            </table>
         </div>
         <!-- Footer -->
         <div class="modal-footer">
            <table align="center">
               <tr>
                  <td><button type="button" id="close_addrModal" class="btn btn-info btn-block">닫기</button></td>
               </tr>
            </table>
         </div>
      </div>
   </div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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
            
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('zipcode_input').value = data.zonecode;      
                  document.getElementById('addr1').value = fullRoadAddr;
         //         document.getElementById('addr1').value = data.jibunAddress;

                  /*
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
                  */
                  
                  // 커서를 상세 주소 필드로 이동한다.
                  document.getElementById('addr2').focus();
               }
            }).open();
   }
</script>
   <script>
      var modal = document.getElementById('addressModal');
      // Get the button that opens the modal
      var btn = document.getElementById("addressBtn");
      // Get the <span> element that closes the modal
      <!--var span = document.getElementsByClassName("close")[0];-->
      var span = document.getElementById("closeModal");
      // 닫기 버튼 불러오기
      <!-- var close = document.getElementsByClassName("btn-block")[0]; -->
      var close = document.getElementById('close_addrModal');
      // 주문자 정보의 이름 불러오기
      var order_name = document.getElementById('name');
      // 주문자 정보의 번호1 불러오기
      var order_phone1 = document.getElementById('phone1');
      // 주문자 정보의 번호2 불러오기
      var order_phone2 = document.getElementById('phone2');
      // 주문자 정보의 이메일 불러오기
      var order_id = document.getElementById('id');
      // 배송 정보의 이름 불러오기
      var deli_name1 = document.getElementById('deli_name');
      // 배송 정보의 번호1 불러오기
      var deli_phone = document.getElementById('deli_phone1');
      // 배송 정보의 번호2 불러오기
      var deli_phone2 = document.getElementById('deli_phone2');
      // 배송 정보의 이메일 불러오기
      var deli_id = document.getElementById('deli_id');
      // 구매 정보 동의 체크박스 불러오기
      var payAgree = document.getElementById('payAgree');
      // 배송 정보의 우편번호란 불러오기
      var zipcode_input = document.getElementById('zipcode_input');
      // 배송 정보의 주소 불러오기
      var deli_addr1 = document.getElementById('addr1');
      // 배송 정보의 상세 주소 불러오기
      var deli_addr2 = document.getElementById('addr2');
      // 주소록 1의 정보 배열로 받아오기
      var addr_arr1 = document.getElementsByClassName('modal_addr1');
      // 주소록 2의 정보 배열로 받아오기
      var addr_arr2 = document.getElementsByClassName('modal_addr2');
      // 주소록 3의 정보 배열로 받아오기
      var addr_arr3 = document.getElementsByClassName('modal_addr3');
      
      $(document).ready(function() {
         $('p.product_name:not(.middle,.last)').css('color','green');
        });
      // When the user clicks on the button, open the modal 
      btn.onclick = function() {
         modal.style.display = "block";
      }
      // When the user clicks on <span> (x), close the modal
      span.onclick = function() {
         modal.style.display = "none";
      }
      // 닫기 버튼을 누른 경우 display none.(창 없앰)
      close.onclick = function() {
         modal.style.display = "none";
      }
      // When the user clicks anywhere outside of the modal, close it
      window.onclick = function(event) {
         if (event.target == modal) {
            modal.style.display = "none";
         }
      }
      // 위 정보와 같음 체크박스 누르면 주문자 정보 불러옴 
      function check(same_above) {
         if (same_above.checked == true) {
            deli_name.value = order_name.value;
            deli_phone1.value = order_phone1.value;
            deli_phone2.value = order_phone2.value;
            deli_id.value = order_id.value;
         }
      }
      // 구매 동의 체크박스가 선택되었는지 확인
      function goPay(button) {
         
        var goods_num = new Array();
         
         if (payAgree.checked == false) {
            alert('구매 동의 체크박스가 선택되어야 합니다.');
         } else{
            // 선택되었으면 goods_num을 controller에 전달한다.
          $("input[class='goods_num']").each(function() {
                var num = $(this).val();
                goods_num.push(num);
          });
            alert(goods_num);
          $("#GOODS_NUM_LIST").val(goods_num);
          $("#orderInfo").submit();
         }
      }
      
      function getForm(){
         
         var nameList = new Array();
         
          var form = $('<form></form>');
           form.attr('action', url);
           form.attr('method', 'post');
           form.appendTo('body');
           $("input[name='name']").each(function(){
              var name = $(this).val();
              nameList.push(name);
           });
           alert(nameList);
      }
           
   //             var num = $(this).val();
      //          goods_num.push(num);
      //    });
    //       var idx = $("<input type='hidden' value="+idx+" name='idx'>");
    //       var pwd = $("<input type='hidden' value="+pw+" name='password'>");
    //       var mode = $("<input type='hidden' value='educomPw' name='mode'>");
    //       form.append(idx);
    //       form.append(pwd);
    //       form.append(mode);
   //        form.submit();
           
      
      // 우편주소검색 창 띄우기
      function openZipcode(joinform) {
         var url = "/zipcode"
         // 새로운 창을 띄워주는 것
         open(url, "confirm", "toolbar=no,location=no,"
               + "status=no,menubar=no," + "scrollbars=yes,resizable=no,"
               + "width=410,height=400");
      }
      // 주소록 목록 모달에서 주소 값 받아오기
      function putAddress(id) {
         if (id.charAt(id.length - 1) == 1) {
            zipcode_input.value = addr_arr1[0].innerHTML;
            deli_addr1.value = addr_arr1[1].innerHTML;
            deli_addr2.value = addr_arr1[2].innerHTML;
         } else if ((id.charAt(id.length - 1) == 2)) {
            zipcode_input.value = addr_arr2[0].innerHTML;
            deli_addr1.value = addr_arr2[1].innerHTML;
            deli_addr2.value = addr_arr2[2].innerHTML;
         } else {
            zipcode_input.value = addr_arr3[0].innerHTML;
            deli_addr1.value = addr_arr3[1].innerHTML;
            deli_addr2.value = addr_arr3[2].innerHTML;
         }
         $('#close_addrModal').trigger('click');
      }
   </script>

<%@ include file="../include/shopping_footer.jsp" %>