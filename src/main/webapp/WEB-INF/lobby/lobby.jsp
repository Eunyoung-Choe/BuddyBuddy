<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.uname } BuddyBuddy Hompy</title>
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
	top: 220px;
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

/* 한마디 제출 버튼 */
#btnsave {
	 width:63px;
	 height: 30px;
	 background-color:#77BB31;
	 border: none;
	 border-radius: 4px;
	 cursor: pointer;
}
#btnsave:hover {
	background-color: #9ED459;
}

/* 날씨 목록 가로 정렬 */
dl {
  display: inline-block;
  margin-right: 20px;
  margin-bottom: 0;
}

/* 앨범 사진 2개 */
.miniphoto {
	background-image: url('/lobby/album.png');
	background-size: cover;
	background-position: center; /* 이미지를 가운데 정렬 */
    background-repeat: no-repeat; /* 이미지 반복 방지 */
    width: 100%;
    height: 105px;
}
</style>

<script>

</script>

</head>

<body>
<div class="container">
	<!-- 네비게이션 ==================================================-->
	<div class="navi">
		<h6 style="margin-top:14px; font-size:17px;">
			<a href="/lobby"> 홈 </a>
		</h6>
		<h6 style="margin-top:29px; font-size:17px;">
			<a href="/profile"> 프로필 </a>
		</h6>
		<h6 style="margin-top:31px; font-size:17px;"> 앨범 </h6>
		<h6 style="margin-top:30px; font-size:17px;"> 게시판 </h6>
		<h6 style="margin-top:31px; font-size:17px;"> 다이어리 </h6>
		<h6 style="margin-top:29px; font-size:17px;"> 방명록 </h6>
	</div>
	
	
	<!-- 프로필 ==================================================-->
	<div class="profilecontainer">
		<div class="profilephoto" alt="profilephoto" style="width:100%; height:210px; margin-bottom:15px; position:relative;">
			<!-- 프로필 이미지 -->
			<img src="${naverurl}/buddy/${dto.uprofile}" class="profilephoto"
        		onerror="this.src='${naverurl}/lobby/default${dto.num}.gif'" style="width:100%; position:absolute; bottom:0;">
		</div>
		
		<!-- 프로필 유저 정보 (BuddyMemberController의 Dto -->
		<div class="profilecontent" alt="profilecontent" style="text-align: center;">
			<h6 style="color:#77BB31">₊‧°𐐪 <b>${dto.uid}</b> 𐑂°‧₊</h6> 
			<h6 style="margin-top:10px;">✿ 홈피 분양일 ✿<br><fmt:formatDate value="${dto.gaipday}" pattern="yyyy-MM-dd HH:mm"/></h6>
		</div>
		
		<!-- 버디 복권 이미지 -->
		<div class="lotto" style="position: absolute; top:404px;">
			<img alt="lotto" src="lobby/lotto.png" style="width:100%;">
		</div>
	</div>
	


	<!-- 2라인 컨테이너 ==================================================-->
	<div class="secondcontainer">
		<div>
			<span style="color:#77BB31; font-size: 17px;">To Do List</span> 
			<hr style="margin:5px 0 5px 0;">
			
			<div class="todolist" style="width:100%; height:220px; border:1px solid black;">
				
			</div>
		</div>
		
		<!-- dto. 출력 테스트 중
		<c:forEach var="dto" items="${members }">
			${dto.uid }
		</c:forEach>-->
		
		
		<!-- 유저별 사진 -->
		<div class="miniphotocontainer" style="margin-top:23px;">
			<span style="color:#77BB31; font-size: 17px;">사진 앨범</span>
			
			<div class="miniphoto" style="display:flex;">
				<img alt="miniphoto" src="/lobby/miniphoto${dto.num}.jpg" style="width:45%; height: 90%; margin: 5px 20px 0 0;">
				<img alt="miniphoto" src="/lobby/miniphoto${dto.num}.png" style="width:45%; height: 90%; margin-top:5px;">
			</div>
		</div>
		
		
		<!-- 날씨 API -->
		<div class="weather" style="margin-top:20px;">
			<span style="color:#77BB31; font-size: 17px;">지금 나의 날씨는 ~</span>
			<hr style="margin:5px 0 5px 0;">
		    <dl>
		      <dt>기온</dt>
		      <dd class="temperature"></dd>
		    </dl>
		    <dl>
		    	<dt>위치</dt>
		      <dd class="place"></dd>
		    </dl>
			<dl>
				<dt>설명</dt>
		      <dd class="description"></dd>
			</dl>
		</div>	    
	</div>
	
	
	
	<!-- 3라인 컨테이너 ==================================================-->
	<div class="thirdcontainer">
		<div class="minihomecontainer">
			<c:if test="${sessionScope.loginstatus!=null}">
				<span style="color:#77BB31; font-size: 17px;">${sessionScope.loginid}의 마이룸౨ৎ˚⟡˖ ࣪</span>
			</c:if>
			
			<!-- 미니홈 이미지 -->
			<div class="minihome" style="width:590px; margin-top:5px;">
				<!-- 로그인 한 user에 따라 미니홈이 다르게 뜨도록 설정 -->
				<img alt="minihome" src="/lobby/minihome${dto.num}.gif" style="width:100%;">
			</div>
			
			<!-- 한마디 남기기 -->
			<div class="lobbyboard">
				<h6 style="margin-top:8px; color:#77BB31; font-size: 17px;">TALK TALK! 한마디 남기기</h6> 
				
				<!-- 한마디 입력란 -->
				<form action="./lobby" method="post" enctype="multipart/form-data">
					<input type="text" class="input-sentence" id="sentence" name="content" required="required" placeholder="오늘의 한마디는?" style="width:520px; display:inline-block;">
					<button type="submit" class="sentence-save" id="btnsave">게시</button>
				</form>
				
				<!-- 한마디 목록 -->
				<!-- 페이징 처리 코드 그대로 가져옴 -->
				<table class="lobbyboard-table">
					<thead>
						<tr>
							<th width="50">번호</th>
							<th width="400">내용</th>
							<th width="100">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${totalCount==0}">
							<tr>
								<td colspan="5" align="center">
									등록된 글이 없습니다
								</td>
							</tr>
						</c:if>
						
						<c:if test="${totalCount>0}">
						 <c:forEach var="dto" items="${list}">
						 	<tr>
						 		<td align="center">
						 			${no}
						 			<c:set var="no" value="${no-1}"/>
						 		</td>
						 		<td>
						 		<!-- 제목 -->
						 			<a href="./detail?idx=${dto.idx}&pageNum=${pageNum}"
						 			style="color: black;text-decoration: none;">
						 				<!-- 답글인 경우 레벨수만큼 띄어쓰기 -->
						 				<c:if test="${dto.relevel>0}">
						 					<c:forEach begin="1" end="${dto.relevel}">
						 						&nbsp;&nbsp;&nbsp;
						 					</c:forEach>
						 					
						 					<!-- 답글인 경우 re 이미지 -->
						 					<img src="../re.png">
						 				</c:if>
						 				${dto.subject}
						 				
						 				<!-- 댓글이 있는 경우에만 갯수 출력 -->
						 				<c:if test="${dto.repleCount>0}">
						 					<span style="color:red;">[${dto.repleCount}]</span>
						 				</c:if>
						 			</a>		 				
						 		</td>
						 		
						 		<td align="center">${dto.writer}</td>
						 		<td align="center">
						 			<span style="font-size: 14px;">
						 				<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
						 			</span>
						 		</td>
						 		<td align="center">${dto.readcount}</td>
						 	</tr>			 
						 </c:forEach>
						</c:if>				
					</tbody>
				</table>
				
				
				<div style="width: 700px;">
					<ul class="pagination" style="margin-left: 200px;">
						<c:if test="${startPage>1}">
							<li class="page-item">
								<a class="page-link" href="./list?pageNum=${startPage-1}">Prev</a>
							</li>
						</c:if>
						<c:forEach var="pp" begin="${startPage}" end="${endPage}">
							<c:if test="${pp==pageNum}">
								<li class="page-item active">
									<a class="page-link" href="./list?pageNum=${pp}">${pp}</a>
								</li>
							</c:if>
							<c:if test="${pp!=pageNum}">
								<li class="page-item">
									<a class="page-link" href="./list?pageNum=${pp}">${pp}</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${endPage<totalPage}">
							<li class="page-item">
								<a class="page-link" href="./list?pageNum=${endPage+1}">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
	
	
	<!-- 로비 배경 이미지 ==================================================-->
	<div class="lobby"></div>
</div>

<script src="weather.js"></script>
</body>
</html>