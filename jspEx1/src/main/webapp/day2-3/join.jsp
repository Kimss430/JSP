<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 아이디, 패스워드, 이름 -->
	<form action="join-insert.jsp" name="user">
		<div>
			아이디 : <input type="text" name="userId">
			<button type="button" onclick="fnCheck()">중복체크</button>
		</div>
		<div>
			패스워드 : <input type="password" name="pwd">
		</div>
		<div>
			이름 : <input type="text" name="userName">
		</div>
		<div>
			전화번호 : <input type="text" name="phon">
		</div>
		<div>
			<label><input type="radio" name="gender" value="남자">남자</label>
			<label><input type="radio" name="gender" value="여자">여자</label>
		</div>
		<button>폼 액션 저장</button>
		<button type="button" onclick="fnSave()">함수 저장</button>
		<button type="button" onclick="fnSubmit()">액션 수정 후 서브밋</button>
		<button type="button" onclick="fnInsert()">복습</button>
		
	</form>
</body>
</html>
<script>
	  function fnSave() {
		var f = document.user;
		/* console.log(f.userId); */
		
		location.href = 
				"join-insert.jsp?userId="+f.userId.value
				+"&pwd="+f.pwd.value 
				+"&userName="+f.userName.value;
	  } 
	  function fnSubmit() {
		  var f = document.user;
		  f.action = "join-insert2.jsp";
		  f.submit();
		  
	  } 
	  function fnInsert(){
		  var f = document.user;
		  f.action = "user-insert.jsp";
		  f.submit();
	  } 
	  function fnCheck(){
		  var f = document.user; 
		  /* var param ="userId="+f.userId.value;
		  location.herf = "id" */
		  f.action = "id-check.jsp";
		  f.submit();
	  }
	  /* function fnReloard(){
		  location.reloard;
	  } */
</script>