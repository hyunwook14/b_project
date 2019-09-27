<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>

.ptb50p{
	padding:25px 0;
}

.mb0{
	margin-bottom:0;
}
.progressw{
	width:33%;
}
.vertical-align{
	vertical-align: middle !important ;
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
				 	<li class="active"><a href="/">Home</a></li>
				 	<li class=""><a href="/bodyinfo_register">신체정보등록</a></li>
				 	<li class=""><a href="/player_recommand">선수추천목록</a>
				 	<li class=""><a href="/exercise_recommand">운동목록</a>
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
				<div class="container userinfo">
					<div class="row">
						<button type="button" class="btn form-control" data-toggle="collapse" data-target="#userinfolist">내 신체정보보기 </button>
					</div>
					<div class="row collapse mt50p" id="userinfolist">
							<div class="progress">
										<div class="progress-bar progressw" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100" >33%</div>
							</div>
							<div class="col-sm-4">
								<div class="well">
									<button type="button" class="btn">수정</button>
									<button type="button" class="btn hidden">확인</button>
									<button type="button" class="btn">삭제</button>
									<table class="table table-bordered mb0 ">
										<tbody>
											<tr class="text_center">
												<td class="vertical-align">nickname</td>
												<td><input type="text" value="우키" class="form-control" disabled></td>
											</tr>
											<tr>
												<td class="vertical-align">키</td>
												<td><input type="number" value="199" class="form-control" disabled></td>
											</tr>
											<tr>
												<td class="vertical-align">몸무게</td>
												<td><input type="number" value="100" class="form-control" disabled></td>
											</tr>
											<tr>
												<td>추천포지션</td>
												<td>F</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="well">
									2
								</div>
							</div>
							<div class="col-sm-4">
								<div class="well">
									3
								</div>
							</div>
					</div>
					<div class="">
						<div>
							<button type="button" class="btn form-control" data-toggle="collapse" data-target="#mymatch">내 시합목록 </button>
						</div>
						<div class="row collapse mt50p" id="mymatch">
							<div class="">
								<table class="table table-bordered mb0">
										<thead>
											<tr>
												<td>경기날짜</td>
												<td>쿼터</td>
												<td>총인원</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>2019-09-26</td>
												<td>1</td>
												<td>12</td>
											</tr>
											
										</tbody>
									</table>
							</div>
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