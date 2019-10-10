<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
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
				<div class="biw100 imgw">
					<div class="ptb50p"></div>
					
					<div class=" well">
						<form class="form-horizontal">
							<div class="form-group ">
								<div class="col-sm-offset-1 ">
									<label class="control-label">로그인</label>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="id"> id:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="user_id" id="id" placeholder="아아디를입력해주세요">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="pw"> pw:</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" name="user_pw" id="pw" placeholder="비밀번호를입력해주세요">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-10">
									<button class="btn" formmethod="post" formaction="/login">로그인</button>
									<button class="btn c_user" formaction="/c_user">회원가입</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			
			</section>
		</div>
		
	</section>
	<footer class="">
	 <div>
	 </div>
	</footer>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>