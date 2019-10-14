<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" >
<style>
.bgray{
	background-color: #f1f1f1;
}
.linep10{
	padding:10px 0;
}

.ptb50p{
	padding:25px 0;
}
.w80{
	width:80%;
}

.tr li{
	display:inline-block;
	padding: 15px 20px;
	width:250px;
	border-bottom: 1px solid grey;
    
}

</style>

</head>
<body>
	<section class="container-fluid">
		<div class="row content">
			 <nav class="col-sm-3 sidenav">
				 <ul class="menu nav nav-pills nav-stacked">
				 	<li class="active"><a href="/">Home</a></li>
				 	<li class=""><a href="/bodyinfo_register">신체정보등록</a></li>
				 	<li class=""><a href="/player_recommand">선수추천목록</a>
				 	<li class=""><a href="/exercise_recommand">운동추천목록</a>
				 	<li class=""><a href="/m_list">경기기록</a>
				 	<li><a href="#">게시판</a>
				 	<li id="admin" class="hidden"><a href="/admin">관리자</a>
				 </ul>
				 <div class="hidden">
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
				<div class="">
					<div class="ptb50p"></div>
					
					<div class="w80">
						<table class="table">
							<thead>
								<tr>
									<td>번호
									<td>제목
									<td>작성자
									<td>작성일
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>0
									<td>test
									<td>test1
									<td>2019-10-14
								</tr>
							</tbody>
						</table>
						<!-- <ul class="table2">
							<li>
								<ul class="tr">
									<li>번호
									<li>제목
									<li>작성자
									<li>작성일
								</ul>
								<ul class="tr">
									<li>0
									<li>test2
									<li>test2
									<li>2019-10-14
								</ul>
							</li>
						</ul> -->
					</div>
				</div>
			
			</section>
		</div>
		
	</section>
	<footer class="container-fluid">
	 <div>
	 </div>
	</footer>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>