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
		/* 리턴타입 */
		Statement stmt = null;
		/* 호출 */
		String stuNo = request.getParameter("stuNo");
		
		try{
			stmt = conn.createStatement();
			/* String querytext = "select * from student"; */
			rs = stmt.executeQuery("select * from student where stu_no = '" + stuNo + "'");
																/* 문자일때 양옆에 작은따옴표 붙여 */
			/* rs.next();
			out.println(rs.getString("stu_name"));
			rs.next();
			out.println(rs.getString("stu_no")); */
			
			
				if(rs.next()){
					out.println(rs.getString("stu_name") + "\t" 
							+ rs.getString("stu_no") + "\t" 
							+ rs.getString("stu_dept") + "\t"
							+ rs.getString("stu_gender"));
							
				} else {
					out.println("해당 학생이 존재하지 않습니다.");
				}; 
			
	
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
	
</body>
</html>