<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신체정보등록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >
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
.bodyinfo .row{
	width: 800px; 
	margin:10px auto; 
	padding:15px 15px; 
	background-color:#f1f1f1;
}
</style>

<script>
var id= "";
id ="<%= session.getAttribute("id") %>";

 $(document).ready(function(){
	var clicknumber = 0;
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
					<button class=" btn form-control">내정보</button>
				</div>
				<div class="col-sm-6">
					<button class=" btn form-control" formaction="/logout">로그아웃</button>
				</div>
			   </form>	 `;
	}
	$("#myinfo").append(html);
	
	$("#register").click(function(){
		var character_nickname = $("#character_nickname").val();
		var character_height = $("#character_height").val();
		var character_weight = $("#character_weight").val();
		
		if(clicknumber >0 && character_nickname != "" && character_height != "" && character_weight != "" ){
			var position_name = $("#position_name").text();
			var position_explanation = $("#position_explanation").text();
			$.ajax({
				url:"/register_bodyinfo",
				type:"POST",
				data:{
					character_nickname: character_nickname,
					character_height : character_height,
					character_weight : character_weight,
					character_position : position_name,
					character_explanation : position_explanation
				}
			}).done(function(data){
				console.log(data)
				if(data =="1"){
					alert("입력성공");
					$("#character_nickname").val("");
					$("#character_height").val("");
					$("#character_weight").val("");
					$("#position").empty();
				}
				else alert("케릭터인원초과했습니다.");
			});
		}else{
			alert("포지션추천을 눌러주세요");
		}
	})
	
	$("#recommand").click(function(){
		clicknumber++;
		var height = $("#character_height").val();
		
		$.ajax({
			url:"/position_recommand",
			type:"POST",
			data:{height:height}
		}).done(function(data){
			var result = JSON.parse(data);
			$("#position").empty();
			
			html = "";		
			for(var i = 0; i<result.length; i++){
				html +=`<label id="position_name">\${result[i].position_name}:</label>
						<p id="position_explanation">\${result[i].position_explanation}</p>`;
			}
						
			$("#position").append(html);
		});
		
	});
	
}); 
</script>
</head>
<body>
	<section class="container-fluid">
		<div class="row content">
			 <nav class="col-sm-3 sidenav">
				 <ul class="menu nav nav-pills nav-stacked">
				 	<li class=""><a href="/main">Home</a></li>
				 	<li class="active"><a href="/bodyinfo_register">신체정보등록</a></li>
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
				<div class="container bodyinfo ">
					<div class="row" style="">
						<form>
							<div class="form-group">
								<label for="nickname">닉네임:</label>
								<input type="text" id="character_nickname" name="character_nickname" placeholder="닉네임을입력하세요" class="form-control">
							</div>
							<div class="form-group">
								<label for="height">키:</label>
								<input type="number" id="character_height" name="character_height" placeholder="키를입력해주세요" class="form-control">
							</div>
							<div class="form-group">
								<label for="weight">몸무게:</label>
								<input type="number" id="character_weight" name="character_weight" placeholder="몸무게를입력해주세요" class="form-control"> 
							</div>
							<div class="form-group ">
								<div class="btn col-sm-6 btn-default" data-toggle="collapse" data-target="#position" id="recommand">포지션추천</div>
								<div  class="btn col-sm-6 btn-default" id="register">등록</div>
							</div>					
						</form>
						<div class="collapse" id="position">
							
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