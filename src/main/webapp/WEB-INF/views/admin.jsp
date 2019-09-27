<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/web/resources/css/Main.css" >
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
	padding: 15px 20px;
	width:150px;
	border-bottom: 1px solid grey;
	border-right: 1px solid grey;
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
				 	<li class=""><a href="/web/index">Home</a></li>
				 	<li class=""><a href="/web/bodyinfo_register">신체정보등록</a></li>
				 	<li class=""><a href="#section3">선수추천목록</a>
				 	<li class=""><a href="#setion4">운동목록</a>
				 	<li class=""><a href="/web/m_list">경기기록</a>
				 	<li class="active"><a href="/web/admin">관리자</a>
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
				<div class="container media">
					<div class="media-left">
						<img src="/web/resources/img/kbl.png" class="media-object" alt="KBL" style="width:120px">	
					</div>
					<div class="media-body">
						<h3 class="mediaheading">KBL 선수데이터 가져오기 </h3>
						<div class="btn form-control btn-link">
							Crawling click me
						</div>
					</div>			
				</div>
				<div class="container">
					<h1 data-toggle="collapse" data-target="#demo">회원목록</h1>
					<button type="button" class="btn btn-danger hidden"> 탈퇴</button>
					<div id="demo" class="collapse">
					<ul class="table" >
						<li >
							<ul class="tr">
								<li>선택
								<li>아이디
								<li>비밀번호
								<li>등록한 선수 수
								<li>탈퇴여부
							</ul>
						</li>
						<li>
							<ul class="tr">
								<li><input type="checkbox">
								<li>admin
								<li>11
								<li>3
								<li>N
							</ul>
						</li>
					</ul>
					</div>
					
				</div>
				<div>
					
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