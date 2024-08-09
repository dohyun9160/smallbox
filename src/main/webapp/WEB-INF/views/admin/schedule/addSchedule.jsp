<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/resources/include/head_beta.jsp"%>
</head>
<body>
<header id="header">
       <%@ include file="/resources/include/headerAdmin_beta.jsp"%>
</header>

<div id="site-content">
    <main class="main-content">
        <div class="container">
            <div class="page">
                <div class="breadcrumbs">
                    <a href="/admin">관리자홈</a>
                    <span>"스케줄 추가하기"</span>
                </div>

                <div class="content">
                    <div class="row">
                        <div class="col-md-6">
                            <figure class="movie-poster">
                                <img src="${contextPath}/resources/images/no_image.jpg" alt="사진을 넣어주세요">
                            </figure>
                        </div>
                        <div class="col-md-6">
                            <form action="/admin/movie/updateMovie" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="sc_no" value="${schedule.sc_no}" required>
                                <div class="mb-3">
                                    <label for="cat_no" class="form-label">영화번호</label>
                                    <input type="number" id="mo_no" name="mo_no" class="form-control" value="${schedule.mo_no}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="cat_no" class="form-label">상영관번호</label>
                                    <input type="number" id="sc_no" name="sc_no" class="form-control" value="${schedule.sc_no}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="mo_status" class="form-label">상태</label>
                                    <input type="number" id="sch_status" name="sch_status" class="form-control" value="${schedule.sch_status}" required> [예약O : 1 / 예약X : 0]
                                </div>
                                <div class="mb-3">
                                    <label for="cat_no" class="form-label">상영날짜</label>
                                    <input type="date" id="sch_date" name="sch_date" class="form-control" value="${schedule.sch_date}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="cat_no" class="form-label">시작 시간</label>
                                    <input type="text" id="sch_startTime" name="sch_startTime" class="form-control" value="${schedule.sch_startTime}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="cat_no" class="form-label">종료 시간</label>
                                    <input type="text" id="sch_endTime" name="sch_endTime" class="form-control" value="${schedule.sch_endTime}" required>
                                </div>
                                <button type="submit" class="btn btn-primary">저장하기</button>
                            </form>
                        </div>
                    </div> <!-- row -->
                </div>
            </div>
        </div> <!-- .container -->
    </main>
</div>

<footer>
    <%@ include file="/resources/include/footer_beta.jsp"%>
</footer>
<!-- 플러그인 -->
<%@ include file="/resources/include/plugin_cdn.jsp"%>

</body>
</html>