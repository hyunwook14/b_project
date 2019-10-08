<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신체정보등록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >

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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/js/Myinfo.js"></script>
	<script src="/resources/js/common.js"></script>
	<script>
		var id= "";
		id ="<%= session.getAttribute("id") %>";
		
		 $(document).ready(function(){
			var clicknumber = 0;
			var html ="";
			
			myinfoload(id);
			
			$("#register").click(function(){
				var character_nickname = $("#character_nickname").val();
				var character_height = $("#character_height").val();
				var character_weight = $("#character_weight").val();
				
				 
				
				if(clicknumber >0 && character_nickname != "" && character_height >= 100 && character_height <= 230 && character_weight >= 30 && character_weight <= 160){
							
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
									alert("등록");
									$("#character_nickname").val("");
									$("#character_height").val("");
									$("#character_weight").val("");
									$("#position").empty();
								}
								else alert("케릭터인원초과했습니다.");
							}); 
					}else if(character_nickname == "" || character_height == "" || character_weight == "" ){
						alert("정보를 확인하고 다시 입력하세요");
					}else if(clicknumber < 1){
						alert("포지션추천을 눌러주세요");
					}else if(character_height < 100 || character_height > 230 ){
						alert("키가 이상합니다 다시입력해주세요")
					}else if(character_weight < 30 || character_weight > 160){
						alert("몸무게가 이상합니다 다시입력해주세요")
					}
			})
			
			$("#recommand").click(function(){
				clicknumber++;
				var height = $("#character_height").val();
				var weight = $("#character_weight").val();
				if(height=="" || weight==""){
					alert("키와 몸무게 입력해주세요")
				}else{
					$.ajax({
						url:"/position_recommand",
						type:"POST",
						data:{height:height}
					}).done(function(data){
						var result = JSON.parse(data);
						console.log(data.length)
						if(data.length == 2){
								alert("정보를 수정해주세요")
								$("#position").empty();
								
								html = "";		
								
								html =`<label id="position_name">키값이 이상합니다:</label>
										<p id="position_explanation">다시입력해주세요</p>`;
								
								
								$("#position").append(html);
							}else{
							$("#position").empty();
							
							html = "";		
							for(var i = 0; i<result.length; i++){
								html +=`<label id="position_name">\${result[i].position_name}:</label>
										<p id="position_explanation">\${result[i].position_explanation}</p>`;
							}
										
							$("#position").append(html);
						}
					});
				}
				
				
			});
			
		}); 
	</script>
</body>
</html>