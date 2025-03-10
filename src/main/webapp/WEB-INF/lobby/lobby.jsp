<%@page import="java.util.ArrayList"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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

/* 오늘 하루 기분 이미지 */
#changeImg {
    margin-right: 6px;
}

/* 로그아웃 버튼 */
.logoutbutton:hover {
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

/* 프로필 */
.profilecontainer {
  position: absolute;
  width: 170px;
  height: 350px;
  top: 230px;
  left: 140px;
  background-color: rgba(255, 255, 255, 0.5);
}

/* 두 번째 칸 (To Do List) */
.secondcontainer {
  position: absolute;
  width: 210px;
  height: 570px;
  top: 210px;
  left: 357px;
  background-color: rgba(255, 255, 255, 0.5);
}

/* 할 일 추가 버튼 */
#todobutton {
	height: 30px;
	 background-color:#77BB31;
	 border: none;
	 border-radius: 4px;
	 cursor: pointer;
}

#todobutton:hover {
	background-color: #9ED459;
}

.todolist {
	background-image: url('/lobby/memo.png');
	background-size: cover;
	background-position: center; /* 이미지를 가운데 정렬 */
    background-repeat: no-repeat; /* 이미지 반복 방지 */
    width: 50%;
    height: 70px;
}

/* 세 번째 칸 */
.minihomecontainer {
  position: absolute;
  width: 590px;
  height: 570px;
  top: 210px;
  left: 600px;
  background-color: rgba(255, 255, 255, 0.5);
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

/* 페이징 버튼 */
.pagination .page-link {
    background-color: #f0f0f0;
    color: #333;
    padding-top: 1px; /* 위쪽 패딩 조정 */
    padding-bottom: 1px;
}

.pagination .page-item.active .page-link {
    background-color: #77BB31;
    color: white;
    border: none;
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

/* 사진 앨범 확대 모달 */
#myMiniPhotoModal .modal-content {
    background-image: url('lobby/minialbum.png');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: top;
}

/* 모달 헤더 아래쪽 구분선 제거 */
#myMiniPhotoModal .modal-header {
    border-bottom: none; 
}
</style>
<script>
	/* 왜 로그아웃이 안 될까 */
	$("#logout").click(function(){
		alert("submit");
		$.ajax({
			type:"get",
			dataType:"text",
			url:"${root}/intro/logout",
			success:function(res){
				window.location.href = "${root}/login";
				alert("로그아웃 되었습니다.");
			}else{
				alert("로그아웃 실패");
			}
		});
	});
</script>

</head>
<body>
<div class="container">
<!-- 미니 포토 클릭 시 확대 모달  =========================================-->
<div class="modal" id="myMiniPhotoModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <img src="" class="replelarge" id="largeImage" style="width: 100%;">
      </div>
    </div>
  </div>
</div>

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
	
	
	<!-- 오늘 기분 선택 ========================================== -->
	<div class="feeling" style="display:flex; align-items:center; position:absolute; top:153px; left:650px;">
		<form action="">
	        <select name="" id="changeImg" style="border:1px solid #77BB31;">
	            <option value="./emoji/default.png">평범한 하루~</option>
	            <option value="./emoji/smile.png">신난다!>ㅁ<</option>
	            <option value="./emoji/sad.png">슬퍼ㅠ^ㅠ</option>
	            <option value="./emoji/angry.png">화났어ㅡㅡ^</option>
	            <option value="./emoji/upset.png">짜증나💢</option>
	        </select>
	    </form>
	    <img id="myImg" src="./emoji/default.png" alt="default">
	</div>
 	   
    <script>
        let changeimg = document.getElementById("changeImg");
        let myImg = document.getElementById("myImg");

        function changeImage(){
            let index = changeimg.selectedIndex;
            myImg.src = changeimg.options[index].value;
        }
        
        changeImage();
        changeimg.onchange = changeImage;
    </script>
	
	
	<!-- 로그아웃 ================================================-->
	<div class="logout" style="position: absolute; width:80px; top:160px; left:1155px; font-size:16px;">
		<a href="/login"> 로그아웃 </a> <!-- 임시 방편으로 일단 이동만... -->
		
		<!-- <c:if test="${sessionScope.loginstatus!=null}">
			<button type="button" onclick="/login" class="logoutbutton" id="logout" style="border:1px solid gray; border-radius:7px; color:#575958;">
				로그아웃
			</button>  -->
		</c:if>
	</div>
	
	
	<!-- 프로필 ==================================================-->
	<div class="profilecontainer">
		<div class="profilephoto" alt="profilephoto" style="width:100%; height:210px; margin-bottom:15px; position:relative;">
			<!-- 프로필 이미지 -->
			<img src="${naverurl}/buddy/${dto.uprofile}" class="profilephoto"
        		onerror="this.src='/lobby/default${dto.num}.gif'" style="width:100%; position:absolute; bottom:0; border-bottom:1px dotted #575958;">
		</div>
		
		<!-- 프로필 유저 정보 (BuddyMemberController의 Dto -->
		<div class="profilecontent" alt="profilecontent" style="text-align: center;">
			<h5 style="color:#77BB31">₊‧°𐐪 <b>${dto.uname}</b> 𐑂°‧₊</h5> 
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
			<!-- To Do List -->
			<span style="color:#77BB31; font-size: 17px;"> 오늘의 할 일 </span> 
			<hr style="margin:5px 0 5px 0;">
			
			<div class="todolist" style="width:100%; height:220px;">
				
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
				<img alt="miniphoto" src="/lobby/miniphoto${dto.num}.jpg" class="mini" id="largeImage1" 
					style="width:45%; height: 90%; margin: 5px 20px 0 0;" data-bs-toggle="modal" data-bs-target="#myMiniPhotoModal">
				<img alt="miniphoto" src="/lobby/miniphoto${dto.num}.png" class="mini" id="largeImage2" 
					style="width:45%; height: 90%; margin-top:5px;" data-bs-toggle="modal">
			</div>
		</div>
		
		
		<!-- 날씨 API -->
		<div class="weather" style="margin-top:30px;">
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
				<h6 style="margin-top:8px; margin-bottom:2px;color:#77BB31; font-size: 17px;">TALK TALK! 한마디 남기기</h6> 
				
				<!-- 한마디 입력란 -->
				<form action="./lobby" method="post" enctype="multipart/form-data">
					<input type="text" class="input-sentence" id="sentence" name="content" required="required" placeholder="오늘의 한마디는?" style="width:520px; margin-bottom:3px;display:inline-block;">
					<button type="submit" class="sentence-save" id="btnsave">게시</button>
				</form>
				
				<!-- 한마디 목록 (페이징)-->
				<table class="lobbyboard-table">
					<thead>
						<tr>
						    <th width="50" style="text-align: center;">번호</th>
						    <th width="400" style="text-align: center;">내용</th>
						    <th width="100" style="text-align: center;">작성자</th>
						    <th width="100" style="text-align: center;">작성일</th>
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
						 <c:forEach var="dto" items="${boardList}">
						 	<tr>
						 		<td align="center">
						 			${no}
						 			<c:set var="no" value="${no-1}"/>
						 		</td>
						 		<td>
					 				${dto.content}						 			
						 		</td>
						 		
						 		<td align="center">${dto.writer}</td>
						 		<td align="center">
						 			<span style="font-size: 14px;">
						 				<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
						 			</span>
						 		</td>
						 	</tr>			 
						 </c:forEach>
						</c:if>				
					</tbody>
				</table>
				
				
				<div style="width: 700px;">
					<ul class="pagination pagination-sm" style="margin-left: 250px;">
						<c:if test="${startPage>1}">
							<li class="page-item">
								<a class="page-link" href="./lobby?pageNum=${startPage-1}">Prev</a>
							</li>
						</c:if>
						<c:forEach var="pp" begin="${startPage}" end="${endPage}">
							<c:if test="${pp==pageNum}">
								<li class="page-item active">
									<a class="page-link" href="./lobby?pageNum=${pp}">${pp}</a>
								</li>
							</c:if>
							<c:if test="${pp!=pageNum}">
								<li class="page-item">
									<a class="page-link" href="./lobby?pageNum=${pp}">${pp}</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${endPage<totalPage}">
							<li class="page-item">
								<a class="page-link" href="./lobby?pageNum=${endPage+1}">Next</a>
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

<!-- 날씨 API -->
<script src="weather.js"></script>

<!-- 사진 앨범 이미지 확대 모달 -->
<script>
	$(document).on("click", "img.mini", function() {
	    let imgSrc = $(this).attr("src");
	    $("#largeImage").attr("src", imgSrc); // 큰 사진 src 설정
	    $("#myMiniPhotoModal").modal("show"); 
	});
	
	$(document).on("change", "input[name='items']", function() {
        if (this.checked) {
            let itemToDelete = $(this).val();
            $.ajax({
                url: "./lobby", // 현재 페이지로 요청
                type: "POST",
                data: { deleteItem: itemToDelete }, // 삭제할 항목 값 전송
                success: function() {
                    location.reload(); // 페이지 새로고침
                }
            });
        }
    });
</script>
</body>
</html>