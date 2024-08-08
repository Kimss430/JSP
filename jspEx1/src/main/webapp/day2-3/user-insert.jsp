<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="user-insert.jsp" >
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		
		
		try{
			stmt = conn.createStatement();
			String querytext = "SELECT * FROM TBL_BOARD";
			rs = stmt.executeQuery(querytext);
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</form>
</body>
</html>