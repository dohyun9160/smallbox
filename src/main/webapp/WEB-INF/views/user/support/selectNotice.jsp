<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }/resources" />
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@ include file = "/resources/include/head_beta.jsp"%>
</head>
<body>
 <header id="header">
        <%@ include file = "/resources/include/header_beta.jsp"%>
   </header>
   <!-- //메인 콘텐츠-->
   <section class="content">
      <div class="container">
        <div class="row">
        <div class="mb-3">
                <h5 class="card-title text-center" style="font-size: 2.5rem;">공지사항 <span class="text-muted fw-normal ms-2"></span></h5>
            </div>
   <table class="table table-hover">
            <tr>
               <th class = "text-number" style = "width: 75px;">번호</th><th class = "text-center">제목</th><th class = "text-end">작성자ID</th><th class = "text-end">생성일</th>
            </tr>
            <tr>
               <td class = "text-number">${noticelist.bo_no}</td>
               <td>${noticelist.bo_title}</td>
               <td class = "text-end">${noticelist.bo_writerId}</td>
               <td class = "text-end">${noticelist.bo_createAt}</td>
            </tr>
            <tr>
            <th class = "text-number">내용</th>
               <td colspan = "4">${noticelist.bo_content}</td>
            </tr>
         
         </table>
         </div>
         </div>
         </section>
    <!-- //footer -->
    <footer>
        <%@ include file = "/resources/include/footer_beta.jsp"%>
    </footer>
    <!-- 플러그인 -->
        <%@ include file = "/resources/include/plugin_cdn.jsp"%>
</body>
</html>