<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath }/resources" />
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${path}/assets/css/swiper.css">
<link rel="stylesheet" href="/resources/include/styleMegaBox.css" />
<%@ include file="/resources/include/head_beta.jsp"%>
<style type="text/css">
.bar123{
   border: 1px solid #dbdbdb;
    font-size: 15px;
    color: #666; 
    display: block; 
    width: 110px; 
    padding: 10px 20px; 
    background: #f5f5f5; 
    z-index: 10;
}

.movie_chart>div>div>div {
   display: block
}

.content .container {
   max-width: 1200px;
}

.content .swiper-container2 {
   overflow: hidden;
}

.movie_chart .swiper-slide {
   max-width: 270px
}

.movie_chart .swiper-slide .poster {
   max-height: 350px;
   overflow: hidden
}

.movie_chart .swiper-slide .infor {
   position: relative;
   min-height: 240px;
   max-height: 350px;
   overflow: hidden;
}

.movie_chart>div>div>div .infor .infor_btn {
   position: absolute;
   bottom: 17px;
   left: 17px;
   width: 100%;
   display: flex;
    z-index: 10;
}

.movie_chart>div>div>div .infor .infor_btn a {
   float: none;
   width: calc(45% - 10px);
   margin-right: 0
}


.movie_chart>div>div>div .infor .infor_btn a:first-of-type {
   margin-right:10px
}

.notice ul li{
   float:none
}
.help article > div{
   height: auto;
   min-height: 410px;
   
}
.service li{
   height: 205px
}
.notice ul li ul{
   position: relative;
   top: 0;
   left: 0
}

.modal {
    display: none; /* 기본적으로 모달을 숨김 */
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4); /* 반투명 배경 */
    align-items: center; /* 수직 중앙 정렬 */
    justify-content: center; /* 수평 중앙 정렬 */
}

/* 모달 콘텐츠 스타일 */
.modal-content {
    background-color: transparent;
    margin: auto;
    width: 100%;
    border: none;
    align-items: center; /* 수직 중앙 정렬 */
    justify-content: center; /* 수평 중앙 정렬 */
}

.modal-content .close {
    position: absolute; 
    top: -40px; 
    right: 550px; 
    font-size: 24px; 
    color: #333; /* 글자 색상 설정 */
    cursor: pointer; /* 마우스를 올렸을 때 포인터로 변경 */
    background-color: rgba(255, 255, 255, 0.7); /* 배경 색상 (선택 사항) */
    border-radius: 50%; /* 원형 배경 (선택 사항) */
    padding: 5px; /* 여백 추가 */
}




</style>
<script src="https://www.youtube.com/iframe_api"></script>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function () {
	    var slides = document.querySelectorAll('.swiper-slide');
	
	    slides.forEach(function (slide) {
	        slide.addEventListener('click', function () {
	            var slideNumber = slide.getAttribute('data-slide');
	            handleClick(slideNumber);
	        });
	    });
	
	    var modal = document.getElementById('myModal1');
	    var span = document.querySelector('.modal .close');
	
	    span.onclick = function() {
	        modal.style.display = 'none';
	        document.querySelector('.youtube').src = ''; // 비우기
	    }
	
	    window.onclick = function(event) {
	        if (event.target === modal) {
	            modal.style.display = 'none';
	            document.querySelector('.youtube').src = ''; // 비우기
	        }
	    }
	});
	
	function handleClick(slideNumber) {
	    var modal = document.getElementById("myModal1");
	    var iframe = modal.querySelector('.youtube');

	    // YouTube 동영상 ID로 URL 생성
	    var videoUrl = 'https://www.youtube.com/embed/' + slideNumber + '?autoplay=1&mute=1';

	    // iframe의 src 속성에 URL 설정
	    iframe.src = videoUrl;

	    // 모달 표시
	    modal.style.display = 'flex';
	}

</script>
</head>
<body>
   <header id="header" class="clearfix">
      <%@ include file="/resources/include/header_beta.jsp"%>
   </header>
   <section id="banner">
      <div class="slider">
         <div class="swiper-container">
            <div class="swiper-wrapper">
               <div class="swiper-slide ss1" data-slide="EiCmnIaj4u8">
                  <div class="container">
                     <div class="row">
                        <h3>InsideOut2</h3>
                        <p>Disney PIXAR 흥행몰이중!</p>
                     </div>
                  </div>
               </div>
               <div class="swiper-slide ss2" data-slide="fRkOWmfZjkY">
                  <div class="container">
                     <div class="row">
                        <h3>파묘</h3>
                        <p>1000만 관객 돌파!</p>
                     </div>
                  </div>
               </div>
               <div class="swiper-slide ss3" data-slide="4uSn4Dem9i0">
                  <div class="container">
                     <div class="row">
                        <h3>외계+인2부</h3>
                        <p>초호화 배우진 대기중!</p>
                     </div>
                  </div>
               </div>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
         </div>
      </div>
   </section>

   
   <!-- //banner -->
   <!-- //메인 콘텐츠-->
   <section class="content">
            <section id="movie">
               <div class="container">
                  <div class="row">
                     <div class="movie">
                        <div class="movie_chart">
                           <div class="swiper-container2"
                              style="display: block; margin-right: 40px;">
                              <div class="chart_cont1 swiper-wrapper">
                                 <c:forEach var="movie" items="${movieList}"
                                    varStatus="status">
                                    <!-- 상영중인영화 -->
                                    <div class="swiper-slide">
                                       <div class="poster">
                                          <figure>
                                             <img
                                                src="${contextPath}/resources/images/${movie.mo_photo}"
                                                alt="${movie.mo_name}" class="img-fluid">
                                          </figure>
                                          <div class="rank">
                                             <strong>${status.index + 1}</strong>
                                          </div>
                                       </div>
                                       <div class="infor">
                                          <!-- a15 걸어야 12세이상관람가표시나오고 / a19 걸어야 15세이상관람가나오고 / a12 걸어야 19세이상관람가나옴-->
                                          <h3>
                                             <span
                                                class="icon 
                                                        <c:choose>   
                                                            <c:when test="${movie.mo_rating == '전체관람가'}">all</c:when>
                                                            <c:when test="${movie.mo_rating == '만12세이상관람가'}">a15</c:when>
                                                            <c:when test="${movie.mo_rating == '만15세이상관람가'}">a19</c:when>
                                                            <c:otherwise>unknown</c:otherwise>
                                                        </c:choose>
                                                         ir_pm">${movie.mo_rating}</span>
                                             <strong>${movie.mo_name}</strong>
                                          </h3>
                                          <div class="infor_btn">
                                             <a href="${contextPath}/user/movie/detailMovie?mo_no=${movie.mo_no}">상세정보</a>
                                            	<c:choose>
								                <c:when test="${member == null}">
								            		<a href="${contextPath}/user/loginForm">예매하기</a>
								                </c:when>
								                <c:otherwise>
								              		<a href="${contextPath}/user/reservation/reservation">예매하기</a>
								                </c:otherwise>
							                </c:choose>
                                          </div>
                                       </div>
                                    </div>
                                 </c:forEach>
                              </div>
                           </div>
                           <!-- //chart_cont1-->
                        </div>
                        <!-- //movie_chart -->
                     </div>
                  </div>
               </div>
            </section>
            <!-- //movie -->
    <section id="help">
        <div class="container">
            <div class="row">
                <div class="help clearfix">
                    <article class="help_box1">
                        <h3><em>공지사항</em></h3>
                        <div class="notice">
                            <ul>
                                <li><a href="${contextPath}/user/support/notice" class = "bar123">전체공지</a></li>
                                <li>
                                    <ul>
                                     <c:forEach var="board" items="${noticeTop4List}">
                                        <li>
                                            <dl>
                                                <dt><strong class="bar">전체</strong> <em>${board.bo_createAt}</em></dt>
                                                <dd><a href="/user/support/selectNotice?bo_no=${board.bo_no}">${board.bo_title}</a></dd>
                                            </dl>            
                                        </li>
                                     </c:forEach>
                                    </ul>
                                </li>
                                
                            </ul>
                        </div>
                    </article>
                    <article class="help_box2">
                        <h3><em>스몰박스 할인카드</em></h3>
                        <div class="card">
                            <ul>
                                <li>
                                    <a >
                                        <span><img src="${path}/assets/img/card01.jpg" srcset="assets/img/card01@2.jpg 2x" alt="card01"></span>
                                        <strong>T멤버십 일반</strong>
                                        <em>영화 2,000원 현장 할인(1일 5매)</em>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span><img src="${path}/assets/img/card02.jpg" srcset="assets/img/card02@2.jpg 2x" alt="card02"></span>
                                        <strong>LG U+</strong>
                                        <em>영화 2,000원 현장 할인(1일 5매)</em>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span><img src="${path}/assets/img/card03.jpg" srcset="assets/img/card03@2.jpg 2x" alt="card03 "></span>
                                        <strong>SK멤버십 일반</strong>
                                        <em>영화 2,000원 현장 할인(1일 5매)</em>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </article>
                    <article class="help_box3">
                        <h3>고객센터</h3>
                        <div class="service">   <!-- 고객센터 include -->
                            <%@ include file="/resources/include/support.jsp"%>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </section>
    <!-- //help -->
   </section>
   <!-- modal -->
   <div id="myModal1" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	       <iframe class ="youtube" width="800" height="600"  ></iframe>
	    </div>
	</div>

   <!-- //footer -->
   <footer>
      <%@ include file="/resources/include/footer_beta.jsp"%>
   </footer>
   <!-- 플러그인 -->
   <%@ include file="/resources/include/plugin_cdn.jsp"%>
   <script src="${path}/assets/js/modernizr-custom.js"></script>
   <script src="${path}/assets/js/ie-checker.js"></script>
   <script src="${path}/assets/js/swiper.min.js"></script>
   <script src="${path}/assets/js/iframe_api.js"></script>
   <script src="${path}/assets/js/movie.js"></script>
   <script>
      //배너 이미지 슬라이드
      var swiper = new Swiper('.swiper-container', {
         pagination : {
            el : '.swiper-pagination',
         },
         navigation : {
            nextEl : '.swiper-button-next',
            prevEl : '.swiper-button-prev',
         },
         autoplay : {
            delay : 5000,
         },
      });

      //영화차트 이미지 슬라이드
      var swiper = new Swiper('.swiper-container2', {
         slidesPerView : 3,
         spaceBetween : 35,
         //            mousewheel: {
         //                invert: true,
         //            },
         keyboard : {
            enabled : true,
            onlyInViewport : false,
         },
         autoplay : {
            delay : 6000,
         },
         breakpoints : {
            600 : {
               slidesPerView : 1.4,
               spaceBetween : 24
            },
            768 : {
               slidesPerView : 2,
               spaceBetween : 24
            },
            960 : {
               slidesPerView : 3,
               spaceBetween : 24
            }
         }
      });

      //영화차트 탭 메뉴
      var movBtn = $(".movie_title > ul > li");
      var movCont = $(".movie_chart > div");

      movCont.hide().eq(0).show();

      movBtn.click(function(e) {
         e.preventDefault();
         var target = $(this);
         var index = target.index();
         movBtn.removeClass("active");
         target.addClass("active");
         movCont.css("display", "none");
         movCont.eq(index).css("display", "block");
      });

      //공지사항 탭 메뉴
      var tabMenu = $(".notice");

      //컨텐츠 내용을 숨겨주세요!
//       tabMenu.find("ul > li > ul").hide();
//       tabMenu.find("li.active > ul").show();

      function tabList(e) {
         e.preventDefault(); //#의 기능을 차단
         var target = $(this);
         target.next().show().parent("li").addClass("active").siblings("li")
               .removeClass("active").find("ul").hide();
         //버튼을 클릭하면 ~ div를 보여주고
         //부모의 li 태그에 클래스 추가하고
         //형제의 li 태그에 클래스 제거하고
         //제거한 자식의 div 태그를 숨겨줌 
      }

      tabMenu.find("ul > li > a").click(tabList).focus(tabList);
   </script>
</body>
</html>
