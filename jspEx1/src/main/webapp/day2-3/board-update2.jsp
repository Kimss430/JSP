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
		
		
		try{
			stmt = conn.createStatement();
			String querytext = "UPDATE TBL_BOARD SET TITLE = 'D', CONTENTS = 'D' WHERE BOARDNO = 'boardNo'";
			rs = stmt.executeQuery(querytext);
		
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
	
</body>
</html>