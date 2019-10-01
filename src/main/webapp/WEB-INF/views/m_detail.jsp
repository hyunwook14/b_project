<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록 자세히보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
	
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
				 	<li class=""><a href="/exercise_recommand">운동추천목록</a>
				 	<li class="active"><a href="/m_list">경기기록</a>
				 	<li id="admin" class="hidden"><a href="/admin">관리자</a>
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
				<div class="container liwidth">
					
				</div>	
						  
			</section>
		</div>
		
	</section>
	<footer>
	 <div>
	 </div>
	</footer>

	<nav class="">
	 <div class="nav">
	 <ul class="menu nav nav-pills nav-stacked">
	 					<li class=""><a href="/main">Home</a></li>
					 	<li class=""><a href="/bodyinfo_register">신체정보등록</a></li>
					 	<li class=""><a href="/player_recommand">선수추천목록</a>
					 	<li class=""><a href="/exercise_recommand">운동목록</a>
					 	<li class="active"><a href="/m_list">경기기록</a>
					 	<li id="admin" class="hidden"><a href="/admin">관리자</a>
	 </ul>
	 </div>
</nav>
<section class="">
	<h1>자세히보기</h1>
	
</section>
<footer></footer>
</body>
</html>