<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>내정보</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >
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
	
	</head>
	<body>
	 	
		<section class="container-fluid">
			<div class="row content">
				 <nav class="col-sm-3 sidenav">
					 <ul class="menu nav nav-pills nav-stacked">
					 	<li class=""><a href="/main">Home</a></li>
					 	<li class=""><a href="/bodyinfo_register">신체정보등록</a></li>
					 	<li class=""><a href="/player_recommand">선수추천목록</a>
					 	<li class=""><a href="/exercise_recommand">운동목록</a>
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
					<div class="w80p">
						<h1 class="mtb20"> 내정보 </h1>
						<div class="mtb10">
							<form class="">
								<div class="form-group">
									<label for="usrid">아이디:</label>	
									<input type="text" id="usrid" class="form-control" readonly>
								</div>
								<div class="form-group">
									<label for="usrpw">비밀번호:</label>	
									<input type="password" id="usrpw" class="form-control">
								</div>
								<div class="form-group">
									<label for="usremail">이메일:</label>	
									<input type="email" id="usremail" class="form-control">
								</div>
								<div class="form-group">
									<label for="characternumber">케릭터수:</label>	
									<input type="text" id="characternumber" class="form-control" readonly>
								</div>
								<div class="form-group">
									<button type="button" class="btn btn-info" id="update">수정</button>
									<button type="button" class="btn btn-danger" id="delete">탈퇴</button>
								</div>
							</form>
						</div>
					
					</div>
					  
				</section>
			</div>
		</section>
	<footer></footer>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/js/Myinfo.js"></script>
	<script>
		var id= "";
		id ="<%= session.getAttribute("id") %>";
		
		$(document).ready(function(){
			
			
			var html ="";
			
			if( id != ""){
				 if( id == "admin"){
						$("#admin").removeClass("hidden");	
					}
				html =`<form class="row form-group">
						<div class="col-sm-12 ">
							<div class="form-control text-center">\${id}</div>
						</div>
						<div class="col-sm-6">
							<button type="button" id="myinfobtn" class=" btn form-control">내정보</button>
						</div>
						<div class="col-sm-6">
							<button class=" btn form-control" formaction="/logout">로그아웃</button>
						</div>
					   </form>	 `;
			}
			$("#myinfo").append(html);
			
			$.ajax({
				url:"/loadmyinfo",
				type:"POST"
			}).done(function(data){
				console.log(data )
				$("#usrid").val(data.user_id);
				$("#usrpw").val(data.user_pw);
				$("#usremail").val(data.user_email);
				$("#characternumber").val(data.user_characternumber);
			});
			
			$("button").click(function(){
				console.log("수정,삭제")
				var user_id = $("#usrid").val();
				var user_pw = $("#usrpw").val();
				var user_email =$("#usremail").val();
				var user_characternumber = $("#characternumber").val()
				var index =  $(this).index();
				console.log(typeof index)
				console.log($(this).index(), $(this))
				
				$.ajax({
					url:"/updatemyinfo",
					type:"POST",
					data:{
						user_id:user_id,
						user_pw :user_pw,
						user_email :user_email,
						user_characternumber :user_characternumber,
						index : index
					}
				}).done(function(data){
					console.log(data)
					if(data == 1){
						alert("정보수정성공했습니다.")
					}else if(data == 2){
						alert("회원탈퇴성공했습니다.")
						location.href="/logout";
					}else{
						alert("정보 수정,삭제 실패했습니다.")
					}
				});
			});
		});
	</script>
	</body>
</html>