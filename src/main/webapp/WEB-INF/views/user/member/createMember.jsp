<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }/resources" />
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
  <head>
        <%@ include file = "/resources/include/head_beta.jsp"%>
  </head>
  <body>
   <header id="header">
        <%@ include file = "/resources/include/header_beta.jsp"%>
   </header>
    <!-- //메인 콘텐츠-->
      <div class="container mt-5 user-form join-form">
                          <h2>회원가입</h2>
                          <form id="signupForm" action="${contextPath}/user/createMember" method="post">
                              <div>
                                  <label for="mem_id">아이디<span class="red">*</span></label>

                                  <input type="text" name="mem_id" id="mem_id" value="" placeholder="아이디">
                                  <button id="checkIdBtn">아이디 중복 확인</button>
                                  <div id="idCheckResult"></div>

                              </div>
                              <div>
                                  <label for="mem_password">비밀번호<span class="red">*</span></label>
                                  <input type="password" name="mem_password" id="mem_password" value="" placeholder="비밀번호" >
                              </div>
                              <div>
                                  <label for="mem_name">이름<span class="red">*</span></label>
                                  <input type="text" name="mem_name" id="mem_name" value="" placeholder="이름" >
                              </div>
                              <div>
                                  <label for="mem_ssn">주민등록번호<span class="red">*</span></label>
                                  <input type="text" name="mem_ssn" id="mem_ssn" value="" placeholder="주민등록번호" >
                              </div>
                              <div>
                                  <label for="mem_phoneNumber">전화번호<span class="red">*</span></label>
                                  <input type="text" name="mem_phoneNumber" id="mem_phoneNumber" value="" placeholder="전화번호" >
                              </div>
                              <div>
                                  <label for="mem_accumulatedAmount"></label>
                                  <input type="hidden" name="mem_accumulatedAmount" id="mem_accumulatedAmount" value="0" placeholder="누적금액" >
                              </div>
                           
                              <div>
                                  <label for="mem_address">주소</label>
								  <input type="button" onclick="execDaumPostcode()" value="주소 검색"><br>
                                  <input type="text" id="postcode" placeholder="우편번호">
								  <input type="text" id="address" placeholder="주소"><br>
								  <input type="text" id="detailAddress" placeholder="상세주소">
								  <input type="text" id="extraAddress" placeholder="참고항목">
								  <div id="map" style="width:420px;height:420px;margin-top:10px;"></div>
								  		
                                  <input type="hidden" name="mem_address" id="mem_address" placeholder="주소" >
                              </div>
                              <div class="join-btn">
                                  <button id="join_membership" type="submit">회원가입</button>
                              </div>
                          </form>
      </div>
    <!-- //footer -->
    <footer>
        <%@ include file = "/resources/include/footer_beta.jsp"%>
    </footer>
    <!-- 플러그인 -->
        <%@ include file = "/resources/include/plugin_cdn.jsp"%>

<script>
    $(document).ready(function() {
        $('#checkIdBtn').click(function() {
            var mem_id = $('#mem_id').val();
            $.ajax({
                type: 'POST',
                url: 'findId',
                data: { mem_id: mem_id },
                success: function(response) {
                    if (response === "1") {
                        $('#idCheckResult').text('중복된 아이디입니다.');
                    } else {
                        $('#idCheckResult').text('사용 가능한 아이디입니다.');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error: ' + error);
                }
            });
        });

        $('#signupForm').submit(function(event) {
            // 회원가입 폼 제출 시 추가적인 검증을 여기에 작성할 수 있습니다.
            event.preventDefault(); // 폼의 기본 제출 동작을 막음

            // 필요한 추가 작업을 수행한 후 폼을 제출할 수 있습니다.
            // 예를 들어, 아이디 중복 확인 결과에 따라 폼 제출을 막을 수 있습니다.
            var mem_id = $('#mem_id').val();
            var idCheckResult = $('#idCheckResult').text();

            if (idCheckResult === '사용 가능한 아이디입니다.') {
                // AJAX 요청을 통해 서버로 폼 데이터를 전송할 수 있습니다.
                // 예시 코드:
                $.ajax({
                    type: 'POST',
                    url: 'createMember', // 회원가입 처리 URL
                    data: $('#signupForm').serialize(),
                    success: function(response) {
                        alert('회원가입이 완료되었습니다!');
                        // 필요 시 페이지를 리다이렉트하거나 다른 작업을 수행할 수 있습니다.
                        location.href = "/";
                    },
                    error: function(xhr, status, error) {
                        console.error('AJAX Error: ' + error);
                    }
                });
            } else {
                alert('아이디 중복 확인을 해주세요.');
            }
        });
    });
    
    
    document.querySelector("#join_membership").addEventListener("click",addressAdd);
    
    function addressAdd(){
    	 var address = document.getElementById("address").value;
         var detailAddress = document.getElementById("detailAddress").value;
         document.getElementById("mem_address").value = address+""+detailAddress;
    }
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9a3d859476431a69a94b5ef70b7d03e&libraries=services"></script>
	<script>
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };
	
	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	              
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	                
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	            	
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	                        var result = results[0]; //첫번째 결과의 값을 활용
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	</script>
  </body>
</html>
