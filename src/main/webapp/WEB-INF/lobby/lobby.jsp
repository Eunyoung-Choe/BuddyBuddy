<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My BuddyBuddy</title>
<link
	href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Gaegu&family=Jua&family=Nanum+Pen+Script&family=Playwrite+AU+SA:wght@100..400&family=Single+Day&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style>

.container {
  position: relative; 
  height: 100vh;
}

/* 로비 배경 이미지(고정) */
.lobby {
  background-image: url('/lobby/lobby.png');
  background-size: contain; 
  background-position: center; 
  background-repeat: no-repeat; 
  background-attachment: fixed; 
  height: 100%; 
  position: absolute; 
  width: 100%; 
  z-index: -1; 
}

/* 프로필 */
.profilecontainer {
  position: absolute;
  width: 170px;
  height: 350px;
  top: 230px;
  left: 140px;
  background-color: rgba(255, 255, 255, 0.5);
  border: 1px solid black;
}

/* 두 번째 칸 (To Do List) */
.secondcontainer {
  position: absolute;
  width: 210px;
  height: 570px;
  top: 210px;
  left: 357px;
  background-color: rgba(255, 255, 255, 0.5);
  border: 1px solid black;
}

/* 세 번째 칸 */
.minihomecontainer {
  position: absolute;
  width: 590px;
  height: 570px;
  top: 210px;
  left: 600px;
  background-color: rgba(255, 255, 255, 0.5);
  border: 1px solid black;
}

</style>

<script>

</script>

</head>

<body>
<div class="container">
	
	<!-- 프로필 -->
	<div class="profilecontainer">
		<div class="profilephoto" alt="profilephoto" style="width:100%; height:250px; margin-bottom:10px;">
			<!-- 프로필 이미지 -->
			<img src="${naverurl }/buddy/${dto.uprofile}" class="profilephoto"
				onerror="this.src='lobby/defaultprofile.png'" style="width:100%">
		</div>
		
		<!-- 프로필 유저 정보 -->
		<div class="profilecontent" alt="profilecontent">
			<h6>이름: ${dto.uname }</h6>
			<h6>가입일: <fmt:formatDate value="${dto.gaipday}" pattern="yyyy-MM-dd HH:mm"/></h6>
		</div>
	</div>
	

	<!-- 2라인 컨테이너 -->
	<div class="secondcontainer">
		<div class="todolist">
			To Do List
		</div>
	</div>
	
	
	
	<!-- 3라인 컨테이너 -->
	<div class="thirdcontainer">
		<div class="minihomecontainer">
			<c:if test="${sessionScope.loginstatus!=null}">
				<span>${sessionScope.loginid}의 미니 홈피</span>
			</c:if>
			
			<hr>
			<div class="minihome" style="width:590px;">
				<img alt="minihome" src="/lobby/minihome.png" style="width:100%;">
			</div>
		</div>
	</div>
	
	
	<!-- 로비 배경 이미지 -->
	<div class="lobby"></div>
</div>


</body>
</html>