<%@page import="com.java.web.vo.BasketballPositionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동선수추천</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>

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


</head>
<body>
	<section class="container-fluid">
		<div class="row content">
			 <nav class="col-sm-3 sidenav">
				 <ul class="menu nav nav-pills nav-stacked">
				 	<li class=""><a href="/main">Home</a></li>
				 	<li class=""><a href="/bodyinfo_register">신체정보등록</a></li>
				 	<li class=""><a href="/player_recommand">선수추천목록</a>
				 	<li class="active"><a href="/exercise_recommand">운동추천목록</a>
				 	<li class=""><a href="/m_list">경기기록</a>
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
					<div class="dropdown">
						<button class="btn dropdown-toggle form-control" type="button" data-toggle="dropdown">포지션
						<span class="caret"></span></button>
						<ul class="dropdown-menu">
							<li><a href="/exercise_recommand/Point Guard">포인트가드</a></li>
							<li><a href="/exercise_recommand/Shooting Guard">슈팅가드</a></li>
							<li><a href="/exercise_recommand/Small Forward">스몰포워드</a></li>
							<li><a href="/exercise_recommand/Power Forward">파워포워드</a></li>
							<li><a href="/exercise_recommand/Center">센터</a></li>
						</ul>
					</div>
				</div>	
				<div>
					<h2 id="positionname">포인트가드</h2>
					<div id="skills">
						
					</div>
				</div>			  
			</section>
		</div>
		
	</section>
	<footer>
	 <div>
	 </div>
	</footer>
	<script type="text/javascript" src="/resources/js/Myinfo.js"></script>
	<script src="/resources/js/common.js"></script>
	<script>
		var id= "";
		id ="<%= session.getAttribute("id") %>";
		<% 
			BasketballPositionVO result = (BasketballPositionVO) request.getAttribute("result");
			String position = result.getPosition_name();
			String explanantion = result.getPosition_explanation();
			String skill1 = result.getPosition_skill1();
			String skill2 = result.getPosition_skill2();
			String skill3 = result.getPosition_skill3();
		%>
		$(document).ready(function(){
			var html ="";
			myinfoload(id)
			
			var position = "<%= position %>";
			var explanantion = "<%= explanantion %>";
			var skill1 = "<%= skill1 %>";
			var skill2 = "<%= skill2 %>";
			var skill3 = "<%= skill3 %>";
			
			$("#positionname").text(position);
			
			var html = "";
			
			html = `
				<h3>요구 되는 능력</h3>
				<span class="label label-info">\${skill1}</span>
				<span class="label label-info">\${skill2}</span>
				<span class="label label-info">\${skill3}</span>
			`;
			
			$("#skills").append(html);
			
		}) 
	</script>
</body>
</html>