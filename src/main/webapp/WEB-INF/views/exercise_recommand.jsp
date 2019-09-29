<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동선수추천</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
*{
	padding:0;
	margin:0;
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
	padding: 13px 20px;
	width:150px;
	border-bottom: 1px solid grey;
	box-sizing: border-box;
}
.liwidth{
	width:500px;
}
</style>

<script>
	/* $(document).ready(function(){
		
	}) */
</script>
</head>
<body>
	<section class="container-fluid">
		<div class="row content">
			 <nav class="col-sm-3 sidenav">
				 <ul class="menu nav nav-pills nav-stacked">
				 	<li class=""><a href="/">Home</a></li>
				 	<li class=""><a href="/bodyinfo_register">신체정보등록</a></li>
				 	<li class=""><a href="/player_recommand">선수추천목록</a>
				 	<li class="active"><a href="/exercise_recommand">운동추천목록</a>
				 	<li class=""><a href="/m_list">경기기록</a>
				 	<li class=""><a href="/admin">관리자</a>
				 </ul>
				 <div>
					<form class="row form-group">
						<div class="col-sm-12 ">
							<div class="form-control text-center">Admin</div>
						</div>
						<div class="col-sm-6">
							<button class=" btn form-control">내정보</button>
						</div>
						<div class="col-sm-6">
							<button class=" btn form-control">로그아웃</button>
						</div>
					</form>	 
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
					<div class="dropdown">
						<button class="btn dropdown-toggle form-control" type="button" data-toggle="dropdown">포지션
						<span class="caret"></span></button>
						<ul class="dropdown-menu">
							<li><a href="#">1.포인트가드</a></li>
							<li><a href="#">2.슈팅가드</a></li>
							<li><a href="#">3.스몰포워드</a></li>
							<li><a href="#">4.파워포워드</a></li>
							<li><a href="#">5.센터</a></li>
						</ul>
					</div>
				</div>	
				<div>
					<h2>포인트가드</h2>
					<h3>요구 되는 능력</h3>
					<span class="label label-info">속도</span>
					<span class="label label-info">민첩성</span>
					<span class="label label-info">볼 핸들링</span>
					<span class="label label-info">패싱</span>
					<span class="label label-info">득점</span>
				</div>			  
			</section>
		</div>
		
	</section>
	<footer>
	 <div>
	 </div>
	</footer>
</body>
</html>