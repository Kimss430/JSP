<%@page import="org.apache.catalina.ant.jmx.JMXAccessorQueryTask"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="db.jsp"%>
	<%
		Statement stmt = null;
		String id = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("userName");
		
		try{
			stmt = conn.createStatement();
			String querytext =
			"INSERT INTO TBL_USER " 
			+ "VALUES ('" + id + "','" + pwd + "', '" + name + "',  0, 'N', 'C')";
			stmt.executeUpdate(querytext);
			
			out.println("저장!");
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	
		
		/* if(id.equals("test") && pwd.equals("1234")){
			out.println("성공");
		} else {
			out.println("실패");
		}
		 */
	%>
	
	
</body>
<script>
	alert("저장 되었습니다.");
	window.close();
	// 새로고침기능!!!!!!!!!!!
	window.opener.fnReload();
</script>
</html>