<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table, th,  tr,  td{
	 border : 1px solid black ;
	 border-collapse: collapse;
	 padding: 10px;
	}

}
	
</style>

</head>
<body>
	<%@include file="db.jsp"%>	
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String id = request.getParameter("userId");
		
		
		try{
			stmt = conn.createStatement();
			String querytext = "SELECT * FROM tbl_user WHERE userId ='" + id+ "'";
			rs = stmt.executeQuery(querytext);
				
			if(rs.next()){
				out.println("중복된 아이디");
		%>
		
			<div><%= rs.getString("userId")%></div>
			<div><%= rs.getString("name")%></div>
			<div><%= rs.getString("status")%></div>
		<%		
				} 
				else {
					out.println("삭제된 아이디");
				}
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>