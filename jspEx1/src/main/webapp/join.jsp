<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<!-- 데이터를 처리할 페이지 -->
	<form action="join_result.jsp" method="get" name="login">
		<div>
			아이디 : <input type="text" name="userId">
		</div>
		<div>
			비밀번호 : <input type="password" name="pwd">
		</div>
		<div>
			이름 : <input type="text" name="userName">
		</div>

		<div>
			<label><input type="radio" value="M" name="gender">남자</label>
			<label><input type="radio" value="F" name="gender">여자</label>
		</div>
		<button @onclick="fnJoin">회원 가입</button>
		<!-- <input type="submit" value="회원 가입"> -->
	</form>

</body>
</html>
<script>
	function fnJoin() {
		var login = document.login;
		
	}
</script>

