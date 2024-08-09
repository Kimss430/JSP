<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="db2.jsp"%>

	<sql:query var="result" dataSource="${dataSource}">
	SELECT *
		FROM TBL_USER
		WHERE userId = ?
		AND pwd = ?
	
	<sql:param value="${param.id}" />
	<sql:param value="${param.pwd}" />
		
	</sql:query>


	<c:choose>
		<c:when test="${result.rows[0] != null}">
			<div>로그인성공</div>
		</c:when>
		<c:otherwise>
			<div>로그인실패</div>
		</c:otherwise>
	</c:choose>

			<button onclick="location.href='login.jsp'">로그인 페이지로 이동</button>


			<%-- <div>client ip : <%= request.getRemoteAddr()%></div>
    <div>요청 uri : <%= request.getRequestURI()%></div>
    <div>메소드 : <%= request.getMethod()%></div>
    <div>서버포트 : <%= request.getServerPort()%></div>
    <div>쿼리문 : <%= request.getQueryString()%></div>
			 --%>
</body>
</html>