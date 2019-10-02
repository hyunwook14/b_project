<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
h1:hover{
	cursor:pointer;
}
.ptb50p{
	padding:25px 0;
}

.mb0{
	margin-bottom:0;
}

.table .tr, .tr li{
	display:inline-block;
}
.tr li{
	padding: 15px 20px;
	width:150px;
	border-bottom: 1px solid grey;
	border-right: 1px solid grey;
}
.w100{
	float:left;
	position:absolute;
	left:0;
	top:0;
	width:100%;
	height:1000px;
	background-color:black;
	opacity: 0.9;
	z-index:1;
}

.w50{
	position:absolute;
	left: calc(100% / 2 - 187.5px);
	top: 250px;
	
	z-index: 2;
}

</style>

<script>
	var id= "";
	id ="<%= session.getAttribute("id") %>";
	
	$(document).ready(function(){
		var html ="";
		
		if( id != ""){
			 if( id == "admin"){
					$("#admin").removeClass("hidden");	
				}
			html =`<form class="row form-group">
					<div class="col-sm-12 ">
						<div class="form-control text-center">\${id}</div>
					</div>
					<div class="col-sm-6">
						<button class=" btn form-control">내정보</button>
					</div>
					<div class="col-sm-6">
						<button class=" btn form-control" formaction="/logout">로그아웃</button>
					</div>
				   </form>	 `;
		}
		$("#myinfo").append(html);
		
		$.ajax({
			url:"/userlist",
			type:"POST",
			data:{}
		}).done(function(data){
			html="";
			
			for(var i =0; i<data.length; i++){
				
				html += `<li>
						<ul class="tr">
							<li><input type="checkbox">
							<li>\${data[i].user_id}
							<li>\${data[i].user_pw}
							<li>\${data[i].user_characternumber}
							<li>\${data[i].user_delYN}
						</ul>
						</li>`;
			}
			
			$(".table").eq(0).append(html); 
			
		});
		
		$("#crawling").click(function(){
			$("#popupbackground").removeClass("hidden");
			$("#popup").removeClass("hidden");
			
			$.ajax({
				url:"/crawling",
				type:"POST",
				data:{}
			}).done(function(data){
				console.log("adfadfad")
				console.log(data)
				
				$("#popupbackground").addClass("hidden");
				$("#popup").addClass("hidden");
				
				if( data == 0) {
					alert("이미 데이터가 존재합니다");
				}
			});
		})
		
	}) 
</script>
</head>
<body>
	<section class="container-fluid">
		<div class="row content">
			 <nav class="col-sm-3 sidenav">
				 <ul class="menu nav nav-pills nav-stacked">
				 	<li class=""><a href="/main">Home</a></li>
				 	<li class=""><a href="/bodyinfo_register">신체정보등록</a></li>
				 	<li class=""><a href="/player_recommand">선수추천목록</a>
				 	<li class=""><a href="/exercise_recommand">운동목록</a>
				 	<li class=""><a href="/m_list">경기기록</a>
				 	<li id="admin" class="active"><a href="/admin">관리자</a>
				 </ul>
				 <div id="myinfo">
					
					
				 </div>
			 </nav>
			 
		 	 <section class="col-sm-9">
				<header class="jumbotron bgc">
					<div class="container text-center">
						<img src="http://www.gdu.co.kr/images/main/logo.png" alt="IMAGE">
					</div>
				</header>
				<div class="bgray linep10"></div>	
				<div class="container media">
					<div class="media-left">
						<img src="/resources/img/kbl.png" class="media-object" alt="KBL" style="width:120px">	
					</div>
					<div class="media-body">
						<h3 class="mediaheading">KBL 선수데이터 가져오기 </h3>
						<button type="button" class="btn form-control btn-link" id="crawling">
							Crawling click me
						</button>
					</div>			
				</div>
				<div class="container">
					<h1 data-toggle="collapse" data-target="#demo" class="">회원목록</h1>
					<button type="button" class="btn btn-danger hidden" id=""> 탈퇴</button>
					<div id="demo" class="collapse">
					<ul class="table" >
						<li>
							<ul class="tr">
								<li>선택
								<li>아이디
								<li>비밀번호
								<li>등록한 선수 수
								<li>탈퇴여부
							</ul>
						</li>
						
					</ul>
					</div>
					
				</div>
				
			</section>
			<div class="w100 hidden" id="popupbackground">
				
			</div>
			<div class="w50 hidden" id="popup">
				<img src="/resources/img/loading.gif" alt="기다리는중">
			</div>
		</div>
	</section>
	
	
	<footer>
	 <div>
	 </div>
	</footer>
</body>
</html>