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
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					"SELECT * FROM TBL_USER "
					+ "WHERE userId = '" + id + "'"
					+ "AND pwd = '" + pwd + "'";
			rs = stmt.executeQuery(querytext);
			if(rs.next()){
				out.println("로그인성공");
				session.setAttribute("userId", rs.getString("userId"));
				response.sendRedirect("board-list.jsp");
			} else {
				out.println("로그인실패");
			}
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
		
	
	
	<%-- <div>client ip : <%= request.getRemoteAddr()%></div>
    <div>요청 uri : <%= request.getRequestURI()%></div>
    <div>메소드 : <%= request.getMethod()%></div>
    <div>서버포트 : <%= request.getServerPort()%></div>
    <div>쿼리문 : <%= request.getQueryString()%></div>
			 --%>
</body>
</html>