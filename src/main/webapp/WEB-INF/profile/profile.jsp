<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.uname} BuddyBuddy Profile</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&family=Stylish&display=swap" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style>
body {
	background-color: #F1F1F1;
	font-family: "Stylish", serif;
  	font-style: normal;
}

/* 좌측 네비게이션 */
.navi {
	position: absolute;
	width: 72px;
	height: 300px;
	top: 222px;
	left: 34px;
	text-align: center;
}

a {
    text-decoration: none;
    color: inherit;
}

a:hover {
	color: #9ED459;
}

/* 컨테이너 */
.container {
  position: relative; 
  height: 100vh;
}

/* 로비 배경 이미지(고정) */
.lobby {
  background-image: url('/profile/profilebackground.png');
  background-size: contain; 
  background-position: center; 
  background-repeat: no-repeat; 
  background-attachment: fixed; 
  height: 100%; 
  position: absolute; 
  width: 100%; 
  z-index: -1; 
}

/* 왼쪽 - 버디바디 */
.leftcontainer {
	position: absolute;
	background-image: url('/profile/buddybaddy.png');
	width: 360px;
	height: 480px;
	top: 215px;
	left: 165px;
	background-size: cover; 
	background-position: center; 
}

/* 오른쪽 - 프로필 편집 */
.rightcontainer {
	position: absolute;
	width: 570px;
	height: 495px;
	top: 215px;
	left: 614px;
	border: 1px solid black;
}

/* 프로필 바꾸기 제목 */
.modifytitle>p {
	border-top: 2px solid #DCDEDB;
	background-color:#F5F5F5;
}

/* 아바타 꾸미기 제목 */
.modifyphototitle>p {
	border-top: 2px solid #DCDEDB;
	background-color:#F5F5F5;
}

</style>
</head>

<body>

<div class="container">
	<!-- 네비게이션 =======================================================-->
	<div class="navi">
		<h6 style="margin-top:14px; font-size:17px;">
			<a href="/lobby"> 홈 </a>
		</h6>
		<h6 style="margin-top:29px; font-size:17px;">
			<a href="/profile"> 프로필 </a>
		</h6>
		<h6 style="margin-top:30px; font-size:17px;"> 앨범 </h6>
		<h6 style="margin-top:30px; font-size:17px;"> 게시판 </h6>
		<h6 style="margin-top:31px; font-size:17px;"> 다이어리 </h6>
		<h6 style="margin-top:29px; font-size:17px;"> 방명록 </h6>
	</div>

	
	<!-- (왼쪽) 버디바디 ===================================================-->
	<div class="leftcontainer">
		<!-- 버디바디에 프로필 미리보기 -->
		<div class="buddybaddy" style="width:230px; height:270px; margin:146px 0 0 92px; border:1px solid black;">
			여기에 프로필 미리보기			
		</div>
	</div>
	
	
	<!-- (오른쪽) 프로필 정보 및 수정 -->
	<div class="rightcontainer">
		<!-- 프로필 바꾸기 -->
		<div class="modifytitle"> 
			<p style="color:#77BB31; font-size: 25px; margin-bottom:5px;">프로필 바꾸기</p>
			<div class="modifyprofile" style="border:1px solid black; width:100%; height:120px; margin-bottom:15px;">
										
			</div>
		</div>	
		
		<!-- 아바타 꾸미기 -->
		<div class="modifyphototitle">
			<p style="color:#77BB31; font-size: 25px; margin-bottom:5px;">아바타 꾸미기</p>
			<div class="modifyphoto" style="border:1px solid black; width:100%; height:120px;">
										
			</div>
		</div>
			
		
		
	</div>
	
	


	<!-- 로비 배경 이미지 ==================================================-->
	<div class="lobby"></div>
</div>

</body>
</html>