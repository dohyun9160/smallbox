<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }/resources" />
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
  <head>
        <%@ include file = "/resources/include/head_beta.jsp"%>
            <!-- 영화 템플릿 -->
    	<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		<!-- Loading third party fonts -->
		<link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
		<link href="${path}/detailMovie/fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
 <style type="text/css">
 	#showPageList {
    margin: 20px 0;
	}

	#showPageList ul {
	    list-style: none;
	    padding: 0;
	    margin: 0;
	    display: flex;
	}
	
	#showPageList li {
	    margin: 0 5px;
	}
	
	#showPageList a {
	    text-decoration: none;
	    color: #007bff; /* 기본 링크 색상 */
	    padding: 8px 12px;
	    border-radius: 4px;
	    border: 1px solid #007bff;
	    background-color: #fff; /* 기본 배경 색상 */
	    transition: background-color 0.3s, color 0.3s;
	}
	
	#showPageList a:hover {
	    background-color: #007bff;
	    color: #fff; /* Hover 시 텍스트 색상 변경 */
	}
	
	#showPageList .current-page a {
	    background-color: #007bff; /* 현재 페이지 배경 색상 */
	    color: #fff; /* 현재 페이지 텍스트 색상 */
	    border: 1px solid #007bff; /* 현재 페이지 테두리 색상 */
	}
	
	#showPageList .disabled a {
	    color: #ddd; /* 비활성 링크 색상 */
	    border: 1px solid #ddd; /* 비활성 링크 테두리 색상 */
	    background-color: #f9f9f9; /* 비활성 링크 배경 색상 */
	}
	
	#PageList {
	    margin: 20px 0;
	}
	
	#PageList ul {
	    list-style: none;
	    padding: 0;
	    margin: 0;
	    display: flex;
	}
	
	#PageList li {
	    margin: 0 5px;
	}
	
	#PageList a {
	    text-decoration: none;
	    color: #007bff; /* 기본 링크 색상 */
	    padding: 8px 12px;
	    border-radius: 4px;
	    border: 1px solid #007bff;
	    background-color: #fff; /* 기본 배경 색상 */
	    transition: background-color 0.3s, color 0.3s;
	}
	
	#PageList a:hover {
	    background-color: #007bff;
	    color: #fff; /* Hover 시 텍스트 색상 변경 */
	}
	
	#PageList .current-page a {
	    background-color: #007bff; /* 현재 페이지 배경 색상 */
	    color: #fff; /* 현재 페이지 텍스트 색상 */
	    border: 1px solid #007bff; /* 현재 페이지 테두리 색상 */
	}
	
	#PageList .disabled a {
	    color: #ddd; /* 비활성 링크 색상 */
	    border: 1px solid #ddd; /* 비활성 링크 테두리 색상 */
	    background-color: #f9f9f9; /* 비활성 링크 배경 색상 */
	}
 </style>
  </head>
  <body>
    
 <header id="header">
        <%@ include file = "/resources/include/header_beta.jsp"%>
</header>

		<div id="site-content">
			<main class="main-content">
				<div class="container">
					<div class="page">
						<div class="breadcrumbs">
							<a href="/">Home</a>
							<span>영화 전체리스트</span>
						</div>
						
						<div class="filters">
							<select name="movieCategoryBox" id="movieCategoryBox" onchange = "selectBoxChange()" placeholder="Choose Category">
									<option value= "0">전체영화</option>
								<c:forEach var = "category" items = "${category}">
									<option value="${category.cat_no}">${category.cat_name}</option>
								</c:forEach>
								
								<script>
								    	function selectBoxChange() {
								    		
								    		var langSelect = document.getElementById("movieCategoryBox");
								    		var selectValue = langSelect.options[langSelect.selectedIndex].value;
								    		
								    		console.log("값들어오나 체크 selectValue : " + selectValue);
								    		
								    		var cat_no = selectValue;
								    		
								    		var category = "cat_no="+cat_no;
								    		
								    		console.log("cat_no = " + cat_no);
								    		
								    		
								    		$.ajax({	
								    			url : "${contextPath}/user/movie/selectCategory",
								    			type : "POST",
								    			data : {"cat_no":selectValue,
								    				    "mo_ca": "mo_ca"
								    			},
								    			dataType : "json",
								    			success: function(moviePageList){
								 					console.log('ajax 통신 성공');
								 					var htmls = "";
								 					if(moviePageList!=null){
								 						 htmls += '<div class="movie-list">';
								 						$(moviePageList.movieDtoList).each(function(){
								 						    console.log(this.mo_no +"="+this.mo_name);
								 						    htmls += '<div class="movie">';
								 						    htmls += '<figure class="movie-poster"><a href="${contextPath}/user/movie/detailMovie?mo_no=' + this.mo_no + '">';
								 						    htmls += '<img src="${contextPath}/resources/images/' + this.mo_photo + '">';
								 						    htmls += '</a></figure>';
								 						    htmls += '<div class="movie-title"><a href="${contextPath}/user/movie/detailMovie?mo_no=' + this.mo_no + '">' + this.mo_name + '</a></div>';
								 						    htmls += '</div>';
								 						}) // each End
								 						htmls += '</div>';
								 						
								 						var pageDTO = moviePageList.pageDTO;
								 						console.log("page :" + pageDTO.startPage);
								 						htmls += '<div id="PageList">';
								 						htmls += '<ul>';

								 						if (pageDTO.prev) {
								 						    htmls += '<li><a href="/user/movie/movieList?pageNum=' + (pageDTO.pageNum - 10) + '&cat_no=' + cat_no + '">10페이지 뒤로가기</a></li>';
								 						}

								 						// 페이지 번호 링크 추가
								 						for (var count = pageDTO.startPage; count <= pageDTO.endPage; count++) {
								 						    htmls += '<li' + (count === pageDTO.pageNum ? ' class="current-page"' : '') + '>';
								 						    htmls += '<a href="/user/movie/movieList?pageNum=' + count + '&cat_no=' + cat_no + '">' + count + '</a>';
								 						    htmls += '</li>';
								 						}

								 						// 'next'가 존재할 경우 다음 페이지 링크 추가
								 						if (pageDTO.next) {
								 						    htmls += '<li><a href="/user/movie/movieList?pageNum=' + (pageDTO.pageNum + 10) + '&cat_no=' + cat_no + '">10페이지 넘어가기</a></li>';
								 						}

								 						htmls += '</ul>';
								 						htmls += '</div>';
								 						
								 						
								 													 			
								 					}else{
								 						htmls = htmls + "<h3>등록된 영화가 없습니다.</h3>";
								 					}
								 					document.getElementById("showMovie").style.display ='none';		
								 					document.getElementById("showPageList").style.display ='none';		
													$("#replylist").html(htmls);
								 				},
								 				error: function(){
								 					alert('ajax 통신 실패');		
								 				}
								    		});

								    	}
								</script>
							</select>
						</div>
						<div id = "showMovie">
						<div class="movie-list">
								<c:forEach var="movie" items="${moviePageList.movieDtoList}">
									<div class="movie">
									<figure class="movie-poster"><a href="${contextPath}/user/movie/detailMovie?mo_no=${movie.mo_no}">
									<img src="${contextPath}/resources/images/${movie.mo_photo}" alt="${movie.mo_name}">
									</a></figure>
									<div class="movie-title"><a href="${contextPath}/user/movie/detailMovie?mo_no=${movie.mo_no}">${movie.mo_name}</a></div>
									</div>
								</c:forEach>
						</div> <!-- .movie-list -->
						</div>
						<div id = "replylist"></div>
						<!-- 가을이가 했던거 
						<div class="pagination">
							<a href="#" class="page-number prev"><i class="fa fa-angle-left"></i></a>
							<span class="page-number current">1</span>
							<a href="#" class="page-number">2</a>
							<a href="#" class="page-number">3</a>
							<a href="#" class="page-number">4</a>
							<a href="#" class="page-number">5</a>
							<a href="#" class="page-number next"><i class="fa fa-angle-right"></i></a>
						</div>
						-->
						<div id="showPageList">
						    <ul>
						        <c:if test="${moviePageList.pageDTO.prev}">
						            <li class="disabled"><a href="/user/movie/movieList?pageNum=${moviePageList.pageDTO.pageNum-10 }">10페이지 뒤로가기 </a></li>
						        </c:if>
						        <c:forEach var="num" begin="${moviePageList.pageDTO.startPage }" end="${moviePageList.pageDTO.endPage }">
						            <c:choose>
						                <c:when test="${moviePageList.pageDTO.startPage + num - 1 == moviePageList.pageDTO.pageNum}">
						                    <li class="current-page">
						                        <a href="/user/movie/movieList?pageNum=${moviePageList.pageDTO.startPage+num-1 }">${moviePageList.pageDTO.startPage+num-1}</a>
						                    </li>
						                </c:when>
						                <c:otherwise>
						                    <li>
						                        <a href="/user/movie/movieList?pageNum=${moviePageList.pageDTO.startPage+num-1 }">${moviePageList.pageDTO.startPage+num-1}</a>
						                    </li>
						                </c:otherwise>
						            </c:choose>
						        </c:forEach>
						        <c:if test="${moviePageList.pageDTO.next}">
						            <li class="disabled"><a href="/user/movie/movieList?pageNum=${moviePageList.pageDTO.pageNum+10 }">10페이지 넘어가기</a></li>
						        </c:if>
						    </ul>
						</div>

						
					</div>
				</div> <!-- .container -->
			</main>
		</div>
		<!-- Default snippet for navigation -->		

<footer>
    <%@ include file="/resources/include/footer_beta.jsp"%>
</footer>
<!-- 플러그인 -->
<%@ include file="/resources/include/plugin_cdn.jsp"%>


</body>
</html>