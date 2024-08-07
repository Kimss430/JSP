<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		/* String title = rs. */
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String boardNo = request.getParameter("boardNo");
		
		try{
			stmt = conn.createStatement();
			String querytext = 
					"UPDATE tbl_board "
					+ "SET TITLE = 'title', CONTENTS = 'contents' "
					+ "WHERE BOARDNO = 'boardNo'";
			rs = stmt.executeQuery(querytext);
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
	
</body>
</html>