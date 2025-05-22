<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Banking Application</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/sidebar.css">
    <script src="js/script.js" defer></script>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <jsp:include page="WEB-INF/pages/sidebar.jsp" />
        <!-- Main Content -->
        <div class="main-content">
            <c:set var="contentPage" value="${contentPage != null ? contentPage : 'home_page.jsp'}" />
            <jsp:include page="WEB-INF/pages/${contentPage}" />
        </div>
    </div>
</body>
</html>