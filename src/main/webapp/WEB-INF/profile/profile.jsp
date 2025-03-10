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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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

/* 오늘 하루 기분 이미지 */
#changeImg {
    margin-right: 6px;
}

/* 로그아웃 버튼 */
.logoutbutton:hover {
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
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

/* 미리보기 프로필에 적용하기 버튼 */
#photosubmit:hover {
	color: #77BB31;
}


/* 오른쪽 - 프로필 편집 */
.rightcontainer {
	position: absolute;
	width: 570px;
	height: 495px;
	top: 215px;
	left: 614px;
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

/* 모달 배경 이미지 */
#myUpdateModal .modal-content {
    background-image: url('profile/modal.png');
    background-size: cover;
    background-repeat: no-repeat;
}

/* 모달 Header 크기 조정 */
#myUpdateModal .modal-header {
    height: 55px; 
}

/* 모달 위치 */
#myUpdateModal .modal-dialog {
    position: fixed;
    top: 45%;
    left: 77.8%;
    transform: translate(-50%, -50%);
}

/* 모달 뒷배경 어둡기 정도 */
.modal-backdrop {
    background-color: rgba(0, 0, 0, 0); /* 어둡기 정도 조절 (0~1, 0: 투명, 1: 완전 불투명) */
}

/* 버디몰 */
.buddymall {
	position: absolute;
	background-image: url('/profile/buddymall.png');
	width:100%;
	height:287px;
	background-size: cover; 
	background-position: center; 
}

</style>
</head>
<body>
<div class="container">

<!-- 회원정보 수정 모달 ==========================================================-->
<div class="modal" id="myUpdateModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" style="color:#77BB31;"> 프로필 바꾸기 </h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <h6 style="margin-bottom:2px; color:#77BB31;"> 이름 </h6>
        <input type="text" class="form-control" id="uname"
        value="${dto.uname}">
        <h6 style="margin-bottom:2px; margin-top:5px; color:#77BB31;"> 아이디 </h6>
        <input type="text" class="form-control" id="uid"
        value="${dto.uid}">
        <h6 style="margin-bottom:2px; margin-top:5px; color:#77BB31;"> 비밀번호 </h6>
        <input type="text" class="form-control" id="upass"
        value="${dto.upass}">
        <br>
        <button type="button" id="btnupdate" data-bs-dismiss="modal" style="border:none;background-color:none; color:#548F3C;">
        	수정
       	</button>
        
        <script>
        	$("#btnupdate").click(function(){
        		$.ajax({
        			type:"post",
        			dataType:"text",
        			data:{"uname":$("#uname").val(),"uid":$("#uid").val(),
        				"upass":$("#upass").val(),"num":${dto.num}},
        			url:"./update",
        			success:function(){
        				location.reload();
        			}
        		});
        	});
        
        </script>
      </div>
    </div>
  </div>
</div>


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

	
	<!-- (왼쪽) 버디바디 ===================================================-->
	<div class="leftcontainer">
		<!-- 버디바디에 변경한 프로필 미리보기 -->
		<div class="buddybaddy" style="width:237px; height:285px; margin:140px 0 0 92px;">
			<img id="previewImage" src="" alt="미리보기" style="width:100%; height:100%; object-fit:cover; display:none;">
		</div>
		
		<!-- 미리보기의 이미지 클라우드 저장 및 로비 프로필에 적용하기 -->
		<div class="submitbutton" style="padding-left:35px; margin-top:auto; display:flex; align-items:center; justify-content:center; height:55px;">
			<form action="./lobby" method="post" enctype="multipart/form-data">
				<input type="file" name="profileImage" id="photoUpload" style="display: none;">
				<button type="submit" id="photosubmit" style="width:200px; border:none; background-color:transparent;"> 
					𐐪 프로필에 적용하기 𐑂 
				</button>
			</form>
		</div>
	</div>
	
	
	<!-- (오른쪽) 프로필 정보 및 수정 -->
	<div class="rightcontainer">
		<!-- 프로필 개인정보 바꾸기 -->
		<div class="modifytitle"> 
			<p style="color:#77BB31; font-size: 25px; margin-bottom:5px; padding-left:10px; display: flex; justify-content: space-between; align-items: flex-end;">
				프로필 바꾸기 
				<button style="float:right; font-size:17px; color:#575958; border:none; background-color:transparent;" data-bs-toggle="modal" data-bs-target="#myUpdateModal"> 
					✎수정 
				</button>
			</p>
			<div class="modifyprofile" style="width:100%; height:120px; margin-bottom:15px; padding-left:10px;">
				<p style="margin:0; font-size:17px; color:#548F3C;"> <b>내 정보</b> </p>
				<span style="color:#548F3C;">꒰ა 이름	|</span> ${dto.uname} <br>
				<span style="color:#548F3C;">꒰ა 아이디 |</span> ${dto.uid } <br>				
				<span style="color:#548F3C;">꒰ა 비밀번호 |</span> ${dto.upass } <br>
				<span style="color:#548F3C;">꒰ა 가입일  |</span> ${dto.gaipday }
			</div>
		</div>	
		
		<!-- 아바타 꾸미기 -->
		<div class="modifyphototitle" style="margin-top:20px;">
			<p style="color:#77BB31; font-size: 25px; margin-bottom:5px; padding-left:10px; padding-right:6px; display: flex; justify-content: space-between; align-items: flex-end;">
				아바타 꾸미기 
				<label for="photoUpload" style="cursor: pointer; float:right; font-size:17px; color:#575958;"> 
					ෆ옷장 
				</label>
				
				<!-- <form action="./profile" method="post" enctype="multipart/form-data">
					<input type="file" name="profileImage" id="photoUpload" style="display: none;">
				</form> -->
			</p>
			<!-- 버디몰 사진 구성 -->
			<div class="buddymall"></div>
							
			
		</div>
	</div>
	



	<!-- 로비 배경 이미지 ==================================================-->
	<div class="lobby"></div>
</div>


<!-- 아바타 미리보기 JS코드 -->
<script>
    document.getElementById("photoUpload").addEventListener("change", function(event) {
        const file = event.target.files[0];  // 선택한 파일 가져오기
        if (file) {
            
        	const reader = new FileReader();
            reader.onload = function(e) {
                const previewImage = document.getElementById("previewImage");
                previewImage.src = e.target.result;
                previewImage.style.display = "block";  // 이미지 보이게 변경
            };
            reader.readAsDataURL(file); // 파일을 읽어 Data URL로 변환

            uploadFile(file);
        }
    });
    
    var uploadfileName = ''
    
    function uploadFile(file){
        const formData = new FormData();
        
        // FormData에 파일 추가
        formData.append("profileImage", file);
        
        $.ajax({
            url: "/profile",  // 서버의 업로드 처리 경로로 변경해야 합니다
            type: "POST",
            data: formData,
            processData: false,  // FormData 처리 방지
            contentType: false,  // 컨텐츠 타입 자동 설정 방지
            success: function(response) {
                console.log("파일 업로드 성공!");
                console.log("서버 응답:", response);
                // 성공 시 추가 처리 코드
                
                uploadfileName = response
            },
            error: function(xhr, status, error) {
                console.error("파일 업로드 실패:", error);
                // 실패 시 처리 코드
            }
        });	
    }
    
</script>
</body>
</html>