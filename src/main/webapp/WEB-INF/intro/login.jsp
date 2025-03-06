<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BuddyBuddy</title>
   <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Gaegu&family=Jua&family=Nanum+Pen+Script&family=Playwrite+AU+SA:wght@100..400&family=Single+Day&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style>
body {
  background-color: rgba(158,212,87,0.4);

}

.container {
  position: relative; 
  height: 100vh;
}

/* 로그인 창 이미지 (고정) */
.login {
  background-image: url('/login/login.png');
  background-size: contain; 
  background-position: center; 
  background-repeat: no-repeat; 
  background-attachment: fixed; 
  height: 100%; 
  position: absolute; 
  width: 100%; 
  z-index: -1; 
}

/* 아이디 입력란 */
.uidfield {
  position: absolute;
  width: 150px;
  height: 30px;
  top: 606px;
  left: 550px;
  background-color: rgba(255, 255, 255, 0.5);
  border: 1px solid black;
}

/* 비밀번호 입력란 */
.upassfield {
  position: absolute;
  width: 150px;
  height: 30px;
  top: 662px;
  left: 550px;
  background-color: rgba(255, 255, 255, 0.5);
  border: 1px solid black;
}

/* 로그인 버튼 (투명) */
.loginbutton {
	position: absolute;
	width: 150px;
	height: 90px;
	top: 605px;
	left: 765px;
	background: transparent;
	border: none; 
	opacity: 0; 
}
</style>
</head>

<body>
<div class="container">

	<!-- 아이디, 비밀번호 입력란 -->	
	<div class="logininputcontainer">
		<form id="loginform">
			<input type="text" id="loginid" class="uidfield" required="required">
			<input type="password" id="loginpass" class="upassfield" required="required">
			
			<button type="submit" class="loginbutton"></button>
		</form>
	</div>
	
	
	<!-- 로그인 창 이미지 -->
	<div class="login"></div>
	
</div>

<!-- 로그인 동작 -->
<script>
	$("#loginform").submit(function(e){
		e.preventDefault();
		// alert("submit"); // 작동 OK
		
		let loginid=$("#loginid").val();
		let loginpass=$("#loginpass").val();
		
		$.ajax({
			type:"get",
			dataType:"json",
			data:{"loginid":loginid,"loginpass":loginpass},
			url:"${root}/intro/login",
			success:function(res){
				// 로그인 성공 시의 동작 처리
				if(res.result=='success'){
					$("#loginid").val("");
					$("#loginpass").val("");
					
					//로그인 성공 시 아래 페이지 로드
					// alert("로그인 테스트 중"); // 작동 OK
					window.location.href = "${root}/"; // 페이지 경로 바꾸고 여기도 바꿔야 함ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
				}else{
					alert("아이디나 비밀번호가 맞지 않습니다");
					$("#loginpass").val("");
				}
			}
		});
	});
</script>	
	
</body>
</html>