<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신체정보등록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/web/resources/css/Main.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
*{
	padiing:0;
	margin:0;
}
.ptb50p{
	padding:25px 0;
}

.mb0{
	margin-bottom:0;
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
				 	<li class="active"><a href="/web/bodyinfo_register">신체정보등록</a></li>
				 	<li class=""><a href="#section3">선수추천목록</a>
				 	<li class=""><a href="#setion4">운동목록</a>
				 	<li class=""><a href="/web/m_list">경기기록</a>
				 	<li class=""><a href="#section5">관리자</a>
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
				<div class="container bodyinfo row">
					<div class="col-sm-8">
						<form >
							<div class="form-group">
								<label for="nickname">닉네임:</label>
								<input type="text" id="nickname" name="nickname" placeholder="닉네임을입력하세요" class="form-control">
							</div>
							<div class="form-group">
								<label for="height">키:</label>
								<input type="number" id="height" name="height" placeholder="키를입력해주세요" class="form-control">
							</div>
							<div class="form-group">
								<label for="weight">몸무게:</label>
								<input type="number" id="weight" name="weight" placeholder="몸무게를입력해주세요" class="form-control"> 
							</div>
							<div class="form-group ">
								<div class="btn col-sm-6 btn-default" data-toggle="collapse" data-target="#position">포지션추천</div>
								<div class="btn col-sm-6 btn-default">등록</div>
							</div>					
						</form>
						<div class="collapse" id="position">
							<label>Gaurd:</label>
							<p>가드에간단한설명</p>
						</div>
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