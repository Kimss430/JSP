<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String userId = request.getParameter("userId");
		
		try{
			stmt = conn.createStatement();
			String querytext = 
				"UPDATE TBL_USER SET CNT = 0 WHERE USERID = '" + userId + "'";
			stmt.executeUpdate(querytext);
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>
<script>
	alert("초기화 되었습니다.");
	window.close();
	// 새로고침기능!!!!!!!!!!!
	window.opener.fnReload();	
</script>