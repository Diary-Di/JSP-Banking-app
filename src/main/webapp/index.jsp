<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Banking Application</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <script src="${pageContext.request.contextPath}/js/script.js" defer></script>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <jsp:include page="WEB-INF/sidebar.jsp" />

        <!-- Main Content -->
        <div class="main-content">
            <c:if test="${empty contentPage}">
                <c:set var="contentPage" value="home_page.jsp" />
            </c:if>
            <jsp:include page="WEB-INF/${contentPage}" />
        </div>
    </div>
</body>
</html>
