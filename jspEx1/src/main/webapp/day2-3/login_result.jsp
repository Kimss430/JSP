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
					+ "WHERE userId = '" + id + "' "
					+ "AND pwd = '" + pwd + "'";
			rs = stmt.executeQuery(querytext);
			if(rs.next()){
				// 아이디 o , 패스워드 o
				if(rs.getInt("cnt") >= 5){
					// 5번 이상 실패
					out.println("5번이상 실패. 관리자에게 문의");
				} else {
					// 로그인 성공
					/* 세션!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! */
					session.setAttribute("userId", rs.getString("userId"));
					session.setAttribute("status", rs.getString("status"));
					if(rs.getString("status").equals("A")){ // 권한이 A
						// user-list.jsp 이동
						response.sendRedirect("user-list.jsp");
					} else {
						// board-list.jsp로 이동
						response.sendRedirect("board-list2.jsp");
					}
					
				}
				
			} else {
				// 아이디나 패스워드 다른경우
				querytext = 
						"SELECT * FROM TBL_USER "
						+ "WHERE userId = '" + id + "'";
				rs = stmt.executeQuery(querytext);
				
				if(rs.next()){
					// 아이디는 o, 비밀번호는 x일 경우
					if(rs.getInt("cnt") >= 5){
						// 비밀번호 5번 이상 실패된 상황
						out.println("5번이상 실패. 관리자에게 문의");
						
					} else {
						// cnt 값 1증가
						out.println("비밀번호 확인하세요.");
						querytext = 
								"UPDATE TBL_USER  SET "
								+ "cnt = cnt + 1 " 
								+ "WHERE userId = '" + id + "'";
						stmt.executeUpdate(querytext);
						
					}
					
				} else {
					// 없는 아이디로 로그인 시도
					out.println("아이디 확인하세요.");
					
				}
				
				
				 /* 버튼추가 -> login.jsp로 이동 
				 + "아이디/비밀번호 다시 확인" TBL_USER의 cnt값 1증가
				 정상입력했더라도 cnt 5이상이면 "5번이상실패. 관리자에게 문의" */
			}
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
		<button onclick="location.href='login.jsp'">로그인 페이지로 이동</button>
	
	
	<%-- <div>client ip : <%= request.getRemoteAddr()%></div>
    <div>요청 uri : <%= request.getRequestURI()%></div>
    <div>메소드 : <%= request.getMethod()%></div>
    <div>서버포트 : <%= request.getServerPort()%></div>
    <div>쿼리문 : <%= request.getQueryString()%></div>
			 --%>
</body>
</html>