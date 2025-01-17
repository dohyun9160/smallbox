<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 헤더쪽에 path있음 -->
<c:set var="path" value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html >

<head>
<meta charset="UTF-8">
  <%@ include file = "/resources/include/head_beta.jsp"%>



<!-- 확인후 삭제 css -->
<link rel="stylesheet" href="${path}/booking1.css"   >



<title>예매사이트</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

// 영화 클릭시 css변경
function mnClk(mnNum){
   if($('#mo_no').val() == ""){
      $('#mn_' + mnNum).addClass('on');
   } else {
      $('#mn_' + $('#mo_no').val()).removeClass('on');
      $('#mn_' + mnNum).addClass('on');
   }
   $('#mo_no').val(mnNum);
}

// 영화관 클릭시 css변경
function regionClk(regionNum){
   if($('#th_no').val() == ""){
      $('#region_' + regionNum).addClass('on');
   } else {
      $('#region_' + $('#th_no').val()).removeClass('on');
      $('#region_' + regionNum).addClass('on');
   }
   $('#th_no').val(regionNum);
}

function scheduleClk(sch_no,sc_no){
   $('#sch_no').val(sch_no);
   $('#sc_no').val(sc_no);
}

document.addEventListener("DOMContentLoaded", function() {
    // 날짜 버튼 생성 및 이벤트 설정
    const date = new Date();
    const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
    const reserveDate = document.querySelector(".reserve-date");
    const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"];
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    
    for (let i = date.getDate(); i <= lastDay.getDate(); i++) {
        const button = document.createElement("button");
        button.setAttribute("type", "button");
        const spanWeekOfDay = document.createElement("span");
        const spanDay = document.createElement("span");

        button.style.boxShadow = "none";
        
        button.classList.add("movie-date-wrapper");
        spanWeekOfDay.classList.add("movie-week-of-day");
        spanDay.classList.add("movie-day");

        const dayOfWeek = weekOfDay[new Date(year, month - 1, i).getDay()];

        if (dayOfWeek === "토") {
            spanWeekOfDay.classList.add("saturday");
            spanDay.classList.add("saturday");
        } else if (dayOfWeek === "일") {
            spanWeekOfDay.classList.add("sunday");
            spanDay.classList.add("sunday");
        }

        spanWeekOfDay.innerHTML = dayOfWeek;
        button.append(spanWeekOfDay);
        button.append(" ");
        spanDay.innerHTML = i;
        button.append(spanDay);
        reserveDate.append(button);
        dayClickEvent(button);
    }

    function dayClickEvent(button) {
        button.addEventListener("click", function() {
            document.querySelectorAll(".movie-date-wrapper-active").forEach((list) => {
                list.classList.remove("movie-date-wrapper-active");
            });
            button.classList.add("movie-date-wrapper-active");
            const selectedYear = date.getFullYear();
            const selectedMonth = date.getMonth();
            const selectedDay = button.querySelector(".movie-day").textContent;

            const selectedDate = new Date(selectedYear, selectedMonth, selectedDay);
            const isoFormattedDate = new Date(Date.UTC(selectedYear, selectedMonth, selectedDay)).toISOString().split('T')[0];

            console.log("Selected Date:", isoFormattedDate);

            document.getElementById("sch_date").value = isoFormattedDate;
        });
    }
});

function checkForm(){
    // 영화 선택 여부 확인
    if(document.getElementById("mo_no").value === ""){
        alert("영화를 선택해주세요.");
        return false;
    }

    // 극장 선택 여부 확인
    if(document.getElementById("th_no").value === ""){
        alert("극장을 선택해주세요.");
        return false;
    }

    // 날짜 선택 여부 확인
    if(document.getElementById("sch_date").value === ""){
        alert("상영 날짜를 선택해주세요.");
        return false;
    }

    return true;
}

var selectedMoNo = "${param.mo_no}";
var selectedThNo = "${param.th_no}";
var selectedSchNo = "${param.sch_no}";

// 페이지 로드 후 해당 버튼에 'on' 클래스 추가
document.addEventListener("DOMContentLoaded", function() {
    // mo_no에 대한 버튼
    if (selectedMoNo) {
        var movieButton = document.getElementById('mn_' + selectedMoNo);
        if (movieButton) {
            movieButton.classList.add('on');
        }
    }

    // th_no에 대한 버튼
    if (selectedThNo) {
        var theaterButton = document.getElementById('region_' + selectedThNo);
        if (theaterButton) {
            theaterButton.classList.add('on');
        }
    }

    // sch_no에 대한 버튼
    if (selectedSchNo) {
        var scheduleButton = document.querySelector('button[value="' + selectedSchNo + '"]');
        if (scheduleButton) {
            scheduleButton.classList.add('on');
        }
    }
});
</script>
</head>
<body>

<header id="header">
   <%@ include file = "/resources/include/header_beta.jsp"%>
</header>

<div class="container" style="padding-bottom: 0px;">
   <div class="inner-wrap" style="padding-top: 40px; padding-bottom: 100px;">
      <div class="quick-reserve">
         <div class="tit-util">
            <h2 class="tit">예매</h2>
         </div>
         <div class="quick-reserve-area">
            <form id="reservtion" method="post" name="reservtion" onsubmit="return checkForm()">
               <!-- 영화 선택 -->                  
               <div class="movie-choice">
                  <p class="tit">영화</p>
                     <div class="list-area">
                        <div class="all-list">
                           <button type="button" class="btn-tab on" id="movieAll" style="box-shadow: none;">전체</button>
                           <div class="list">
                              <div class="scroll m-scroll mCustomScrollbar _mCS_1" id="movieList">
                                 <div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0">
                                    <div id="mCSB_1_container" class="mCSB_container" style="position: relative; top: 0; left: 0;" dir="ltr">
                                       <ul>
                                          <c:forEach var = "movie" items="${movieServiceList}">
                                             <li>
                                                <!-- 영화선택시 페이지를 다시 불러오기 위해 type="button" 삭제 -->
                                                <button  class="btn" type="button" id="mn_${movie.mo_no }" style="box-shadow: none;" onclick="mnClk(${movie.mo_no })">
                                                <span class="movie-grade small ${movie.mo_rating}"></span>
                                                <span class="txt">${movie.mo_name}</span>
                                                <c:if test="${movie.mo_no==mo_no }">
                                                   $('#mn_' + movie.mo_no).addClass('on');
                                                </c:if>
                                                </button>
                                             </li>
                                          </c:forEach>
                                       </ul>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
               </div>
               <!-- 영화관(지역) -->                        
               <div class="theater-choice">
                  <div class="tit-area">
                     <p class="tit">극장</p>
                  </div>
                  <div class="list-area" id="brchTab">
                     <div class="all-list">
                        <button type="button" class="btn-tab on" style="box-shadow: none;">전체</button>
                        <div class="list">
                           <div class="scroll" id="brchList">
                              <ul>
                                 <c:forEach var = "theater" items="${theaterList}">
                                    <li>
                                       <button type="button" class="btn" id="region_${theater.th_no}" onclick="regionClk(${theater.th_no});" style="box-shadow: none;">
                                          <span class="txt">${theater.th_name}</span>
                                       </button>
                                    </li>
                                 </c:forEach>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>   
               <!--  날짜  -->
               <div class="date-choice">
                  <div class="tit-area">
                        <p class="tit">날짜</p>
                     </div>                      
                  <div class="reserve-date"></div>                                        
                  <button type="submit" value="검색" style="box-shadow: none;">검색하기</button>
                  </div>
               <input type="hidden" id="mo_no" name="mo_no"   value="" /> 
               <input type="hidden" id="th_no" name="th_no" value="" />
               <input type="hidden" id="sch_date" name="sch_date" value="" />
            </form>
            
               <!-- 상영시간 정보 입력 후 진행-->
               <div class="time-choice">
                  <div class="tit-area">
                     <p class="tit">시간</p>
                  </div>
                  <div class="movie-schedule-area">
                     <!-- 3개 모두 선택을 하지 않았으면 보임 -->
                     <c:if test="${empty param.mo_no or empty param.th_no or empty param.sch_date}">      
                        <div class="no-result" id="playScheduleNonList">
                           <i class="iconset ico-movie-time"></i>
                           <p class="txt" style="text-align: center;">
                               영화와 극장을 선택하시면<br> 상영시간표를 비교하여 볼 수 있습니다.
                           </p>
                        </div>
                     </c:if>
                     <!-- 3개 모두 선택을 하면 보임 -->   
                     <form action="/user/reservation/reservation2" method="post">
                        <c:if test="${not empty param.mo_no and not empty param.th_no and not empty param.sch_date}">                                 
                           <div class="result">
                               <div class="scroll m-scroll mCustomScrollbar _mCS_16 mCS_no_scrollbar" id="playScheduleList" style="display: flex; align-items: center; justify-content: center;">
                                   <div style="max-height: none;" tabindex="0">
                                       <div style="position: relative; top: 0; left: 0;" dir="ltr">
                                           <ul>
                                               <c:forEach var="schedule" items="${schduleList}">
                                                   <li>
                                                       <button class="btn" name="selectedSchedule" value="${schedule.sch_startTime}" onclick="scheduleClk(${schedule.sch_no},${schedule.sc_no});" style="box-shadow: none; width: 300px; height: 30px; display: flex; align-items: center; justify-content: center;">
                                                           <span class="txt">${schedule.sc_no}관 ${schedule.sch_startTime}</span>
                                                       </button>
                                                   </li>
                                               </c:forEach>
                                           </ul>
                                       </div>
                                   </div>
                               </div>
                           </div>
                        </c:if>
                        <input type="hidden" id="sc_no" name="sc_no" value="" /> 
                        <input type="hidden" id="mo_no" name="mo_no" value="${params.mo_no}">
                        <input type="hidden" id="th_no" name="th_no" value="${params.th_no}">
                        <input type="hidden" id="sch_no" name="sch_no" value="${params.sch_no}">                              
                     </form>
                  </div>
               </div>
               
         </div>
      </div>
   </div>
</div>   
            
<!-- //footer -->
<footer>
   <%@ include file = "/resources/include/footer_beta.jsp"%>
</footer>
<!-- 플러그인 -->
<%@ include file = "/resources/include/plugin_cdn.jsp"%>               
   
</body>
</html>