<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
	.w80p{
		width:75%;
		margin: auto;
	}
	.w20{
		width: 350px;
		text-align: center;
	}
	.mtb10{
		margin: 10px 0;
	}
	.mtb10{
		margin: 20px 0;
	}
	tbody{
		cursor:pointer;
	}
</style>
<script>
	$(document).ready(function(){
		$(".add").click(function(){
			location.href="/m_record"
		});
	});
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
				 	<li class=""><a href="/exercise_recommand">운동목록</a>
				 	<li class="active"><a href="/m_list">경기기록</a>
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
				<div class="w80p">
			<h1 class="mtb20"> 경기 목록 </h1>
			<div class="mtb10">
				<form>
					<button type="button" class="btn btn-primary add">경기추가</button>
				</form>
			
			</div>
		
			<table class="table">
				<thead>
					<tr>
						<td>날짜</td>
						<td>쿼터</td>
						<td>인원</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2019-09-24</td>
						<td>1Q</td>
						<td>10</td>
					</tr>
					<tr>
						<td>2019-09-24</td>
						<td>2Q</td>
						<td>10</td>
					</tr>
				</tbody>
			</table>
		
		</div>
			
			</section>
		</div>
	</section>
<footer></footer>
</body>
</html>