<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/web/resources/css/Main.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
*{
	padiing:0;
	margin:0;
}

.bgray{
	background-color: #f1f1f1;
}
.linep10{
	padding:10px 0;
}

.biw100{
	width:100%;
	height:calc(850px - 162px);
	background-image: url('https://news.hmgjournal.com/upload/common/activeSquare/binary/slamdunk-1[0].jpg');
	background-repeat: no-repeat;
	background-position: top;
	background-size:cover;
}
.opacityd{
	opacity:1;
}
.ptb50p{
	padding:25px 0;
}
.mt50p{
	/* margin-top:450px; */
}

</style>
</head>
<body>
	<section class="container-fluid">
		<div class="row content">
			 <nav class="col-sm-3 sidenav">
				 <ul class="menu nav nav-pills nav-stacked">
				 	<li class="active"><a href="/web/Main">Home</a></li>
				 	<li class=""><a href="#section2">정보등록</a></li>
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
				<div class="biw100 imgw">
					<div class="ptb50p"></div>
					
					<div class="container well mt50p">
						<form class="form-horizontal">
							<div class="form-group ">
								<div class="col-sm-offset-2 ">
									<label class="control-label">로그인</label>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="id"> id:</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="id" id="id" placeholder="아아디를입력해주세요">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2"> pw:</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" name="pw" placeholder="비밀번호를입력해주세요">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button class="btn">로그인</button>
									<button class="btn">회원가입</button>
								</div>
							</div>
						</form>
					</div>
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