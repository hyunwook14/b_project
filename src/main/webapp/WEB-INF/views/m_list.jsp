<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/web/resources/css/Main.css" >
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
			location.href="/web/m_record"
		});
	});
</script>
</head>
<body>
<nav class="">
 <div class="nav">
 <ul class="menu nav nav-pills nav-stacked">
 	<li class=""><a href="/web/Main">Home</a></li>
 	<li class=""><a href="#section2">정보등록</a></li>
 	<li class=""><a href="#section3">선수추천목록</a>
 	<li class=""><a href="#setion4">운동목록</a>
 	<li class="active"><a href="/web/m_list">경기기록</a>
 </ul>
 </div>
</nav>
<section class="">
	
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
<footer></footer>
</body>
</html>