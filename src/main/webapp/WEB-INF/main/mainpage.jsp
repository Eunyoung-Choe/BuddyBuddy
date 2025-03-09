<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello BuddyBuddy World</title>
   <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Gaegu&family=Jua&family=Nanum+Pen+Script&family=Playwrite+AU+SA:wght@100..400&family=Single+Day&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
body {
    background-image: url('/login/root.png'); /* 이미지 URL 설정 */
    background-size: cover; /* 배경 이미지 크기 조절 */
    background-repeat: no-repeat; /* 배경 이미지 반복 설정 */
    background-position: center; /* 배경 이미지 위치 설정 */
    height: 100vh; /* 화면 높이 100% 설정 */
    margin: 0; /* 기본 마진 제거 */
}

#loginBox {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 500px; /* 박스 크기 설정 (원하는 크기로 변경) */
    height: 400px; /* 박스 크기 설정 (원하는 크기로 변경) */
    /* background-color: rgba(255, 0, 0, 0.5); /* 박스 배경색 설정 (테스트용) */
    cursor: pointer; /* 마우스 커서 변경 */
}
</style>
</head>
<body>
<div id="loginBox"></div>
    <script>
        document.getElementById('loginBox').addEventListener('click', function() {
            window.location.href = '/login';
        });
    </script>
</body>
</html>