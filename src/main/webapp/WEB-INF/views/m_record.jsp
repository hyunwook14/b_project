<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>기록지</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css" >
	<style>
		.vab{
			vertical-align:bottom;
		}
		
		.table>tbody>tr>td{
			vertical-align: middle;
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
				 	<li class=""><a href="/exercise_recommand">운동추천목록</a>
				 	<li class="active"><a href="/m_list">경기기록</a>
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
				<h1>match record</h1>
				쿼터:<input type="number" class="btn" min=1 max="4" id="quarter" value="1">
				인원추가:<button type="button" class="btn btn-primary plusp">+</button>
				<table class="table">
					<thead>
						<tr>
							<td>TEAM</td>
							<td>이름</td>
							<td>2점</td>
							<td>3점</td>
							<td>자유튜</td>
							<td>파울</td>
							<td>어시스트</td>
							<td>스틸</td>
							<td>블록</td>
							<td>턴오버</td>
							<td>총득점</td>	
						</tr>
					</thead>
					<tbody id="team">
						
					</tbody>
				</table>
				<button type="button" class="btn back">뒤로</button>
				<button type="button" class="btn" id="matchend">경기종료</button>
				
				<!-- Modal -->
				  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">선수등록</h4>
				        </div>
				        <div class="modal-body">
				          <form>
				          	<label class="radio-inline">
				          		<input type="radio" name="team" checked value="home"> home
				          	</label>
				          	<label class="radio-inline">
				          		<input type="radio" name="team" value="away"> away
				          	</label>
				          	
				          	<div class="input-group">
				          		<label for="p_name" class="form-group">이름:</label>
				          		<input type="text" class="form-control" id="nickname" placeholder="선수이름입력을 입력하세요" >
				          		<div class="input-group-btn vab"><br>
							        <button type="button" class="btn btn-default " type="submit"><i class="glyphicon glyphicon-search"></i></button>
							    </div>
				          	</div>
				          	<input type="button" class="btn btn-default" id="register" value="등록">
				          </form>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      </div>
				      
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
	
		function score(textflag, totalscore, parent, pmflag){
			
			if(textflag=="score2"){
				 var score = parseInt(parent.children().eq(2).children().eq(0).text());
				 if(pmflag ==1){
					 score += 2;
					 totalscore += 2;
				 }else if(pmflag ==0 && score > 0){
					 score -= 2;
					 totalscore -=2;
				 }
				 parent.children().eq(2).children().eq(0).text(score);
			}else if(textflag=="score3" ){
				var score = parseInt(parent.children().eq(3).children().eq(0).text()); 
				if(pmflag ==1){
					 score += 3;
					 totalscore += 3;
				 }else if(pmflag ==0 && score > 0){
					 score -= 3;
					 totalscore -=3;
				 }
				 parent.children().eq(3).children().eq(0).text(score);
			}else if(textflag=="score1"){
				var score = parseInt(parent.children().eq(4).children().eq(0).text()); 
				if(pmflag ==1){
					 score += 1;
					 totalscore += 1;
				 }else if(pmflag ==0 && score > 0){
					 score -= 1;
					 totalscore -=1;
				 }
				 parent.children().eq(4).children().eq(0).text(score);
			}else if(textflag=="foul"){
				var score = parseInt(parent.children().eq(5).children().eq(0).text()); 
				if(pmflag ==1 && score <5){
					 score += 1;
				 }else if(pmflag ==0 && score > 0){
					 score -= 1;
				 }
				 parent.children().eq(5).children().eq(0).text(score);
			}else if(textflag=="assist"){
				var score = parseInt(parent.children().eq(6).children().eq(0).text()); 
				if(pmflag ==1){
					 score += 1;
				 }else if(pmflag ==0 && score > 0){
					 score -= 1;
				 }
				 parent.children().eq(6).children().eq(0).text(score);
			}else if(textflag=="steal"){
				var score = parseInt(parent.children().eq(7).children().eq(0).text()); 
				if(pmflag ==1){
					 score += 1;
				 }else if(pmflag ==0 && score > 0){
					 score -= 1;
				 }
				 parent.children().eq(7).children().eq(0).text(score);
			}else if(textflag=="block"){
				var score = parseInt(parent.children().eq(8).children().eq(0).text()); 
				if(pmflag ==1){
					 score += 1;
				 }else if(pmflag ==0 && score > 0){
					 score -= 1;
				 }
				 parent.children().eq(8).children().eq(0).text(score);
			}else if(textflag=="turnover"){
				var score = parseInt(parent.children().eq(9).children().eq(0).text()); 
				if(pmflag ==1){
					 score += 1;
				 }else if(pmflag ==0 && score > 0){
					 score -= 1;
				 }
				 parent.children().eq(9).children().eq(0).text(score);
			}
			parent.children().eq(10).children().text(totalscore);	
			}
		
		$(document).ready(function(){
			
			var peoplelist = [];
			
			$("#register").click(function(){
				var name = $("#nickname").val();
				if(name == ""){
					alert("이름을입력해주세요");
				}else{
				
					var people = {};
					people.team =$("input[name=team]:checked").val();
					people.nickname = $("#nickname").val();
					people.score2 = 0;
					people.score3 = 0;
					people.score1 = 0;
					people.foul = 0;
					people.assist = 0;
					people.steal = 0;
					people.block = 0;
					people.turnover = 0;
					people.totalscore = 0;
					peoplelist.push(people);
					
					$("#team").empty();
					html = "";
					
					for(var i =0; i<peoplelist.length; i++){
						html += ` 
							<tr class="people">
								<td class="teamdivision">\${peoplelist[i].team}</td>
								<td>\${peoplelist[i].nickname}</td>
								<td><span class="score2">\${peoplelist[i].score2}</span> <button type="button" class="btn btn-success score2">+</button><button type="button" class="btn btn-danger score2">-</button>
								</td>
								<td><span class="score3">\${peoplelist[i].score3}</span> <button type="button" class="btn btn-success score3">+</button><button type="button" class="btn btn-danger score3">-</button>
								</td>
								<td><span class="score1">\${peoplelist[i].score1}</span> <button type="button" class="btn btn-success score1">+</button><button type="button" class="btn btn-danger score1">-</button>
								</td>
								<td><span class="foul">\${peoplelist[i].foul}</span> <button type="button" class="btn btn-success foul">+</button><button type="button" class="btn btn-danger foul">-</button> 
								</td>
								<td><span class="assist">\${peoplelist[i].assist}</span> <button type="button" class="btn btn-success assist">+</button><button type="button" class="btn btn-danger assist">-</button>
								</td>
								<td><span class="steal">\${peoplelist[i].steal}</span> <button type="button" class="btn btn-success steal">+</button><button type="button" class="btn btn-danger steal">-</button>
								</td>
								<td><span class="block">\${peoplelist[i].block}</span> <button type="button" class="btn btn-success block">+</button><button type="button" class="btn btn-danger block">-</button>
								</td>
								<td><span class="turnover">\${peoplelist[i].turnover}</span> <button type="button" class="btn btn-success turnover">+</button><button type="button" class="btn btn-danger turnover">-</button>
								</td>
								<td><span class="totalscore">\${peoplelist[i].totalscore}</span>
								</td>
							</tr>
						`;
					}
					$("#team").append(html);
					$("#nickname").val("");
					$("#myModal").modal("hide");
				}
			});
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
			
			$(".back").click(function(e){
				location.href="/m_list";
			});
			
			$("#matchend").click(function(e){
				console.log($("#quarter").val())
				var list = [];
				if($(".people").length == 0 ){
					alert("인원을 추가해주세요");
				}else{
					for(var i = 0 ; i< $(".people").length; i++){
						var p = {};
						p.record_assortment =$(".people").eq(i).children().eq(0).text(); //home away
						p.record_nickname =$(".people").eq(i).children().eq(1).text(); //nickname
						p.record_twop =$(".people").eq(i).children().eq(2).children().eq(0).text(); //score2
						p.record_threep =$(".people").eq(i).children().eq(3).children().eq(0).text(); //score3
						p.record_onep =$(".people").eq(i).children().eq(4).children().eq(0).text(); //score1
						p.record_foul =$(".people").eq(i).children().eq(5).children().eq(0).text(); //foul
						p.record_assist =$(".people").eq(i).children().eq(6).children().eq(0).text(); //assist
						p.record_steal =$(".people").eq(i).children().eq(7).children().eq(0).text(); //steal
						p.record_block =$(".people").eq(i).children().eq(8).children().eq(0).text(); //block
						p.record_turnover=$(".people").eq(i).children().eq(9).children().eq(0).text(); //turnover
						p.totalp=$(".people").eq(i).children().eq(10).children().eq(0).text(); //totalp
						p.record_quarter =$("#quarter").val();
						
						list.push(p);
					}
					
					var data = JSON.stringify(list);
					console.log(data)
					//jQuery.ajaxSettings.traditional = true;
					$.ajax({
						url:"/recordsave",
						type:"POST",
						data:{list:data},
					}).done(function(data){
						console.log(data)
						if( data == 1){
							alert("시합저장완료");
							location.href="/m_list";
						}else{
							alert("저장실패");
						}
					});
				}
			});
			
			$(".plusp").click(function(){
				$("#myModal").modal("show"); //모달창 띄우기
			});
			
			$(document).on("click",".btn-success", function(){
				var textflag;	 	//버튼클릭시 여러이벤트
				var pmflag;			//득점 감점 flag
				var classtexts = $(this).attr("class").split(" ");
				for(var i = 0; i<classtexts.length; i++){
					textflag = classtexts[i];
				}
				if(classtexts[1] == "btn-success") pmflag = 1; 	//득점
				else pmflag = 0; 								//감점
				
				if($(this).parent().parent().eq(0).children().length == 11)
					var totalscore = parseInt($(this).parent().parent().eq(0).children().eq(10)[0].innerText);
				else if($(this).parent().parent().eq(0).children().length == 10)
					var totalscore = parseInt($(this).parent().parent().eq(0).children().eq(9)[0].innerText);
				var parent = $(this).parent().parent();
				score(textflag, totalscore, parent, pmflag);
			})
			
			$(document).on("click",".btn-danger", function(){
				var textflag;	 	//버튼클릭시 여러이벤트
				var pmflag;			//득점 감점 flag
				var classtexts = $(this).attr("class").split(" ");
				for(var i = 0; i<classtexts.length; i++){
					textflag = classtexts[i];
				}
				if(classtexts[1] == "btn-success") pmflag = 1; 	//득점
				else pmflag = 0; 								//감점
				console.log($(this).parent().parent().eq(0).children().length, " --total")
				console.log($(this).parent().parent().eq(0))
				if($(this).parent().parent().eq(0).children().length == 11)
					var totalscore = parseInt($(this).parent().parent().eq(0).children().eq(10)[0].innerText);
				else if($(this).parent().parent().eq(0).children().length == 10)
					var totalscore = parseInt($(this).parent().parent().eq(0).children().eq(9)[0].innerText);
				var parent = $(this).parent().parent();
				score(textflag, totalscore, parent, pmflag);
			})
			
			
			/* $(".btn-success").click(function(e){
				var textflag;	 	//버튼클릭시 여러이벤트
				var pmflag;			//득점 감점 flag
				var classtexts = $(this).attr("class").split(" ");
				for(var i = 0; i<classtexts.length; i++){
					textflag = classtexts[i];
				}
				if(classtexts[1] == "btn-success") pmflag = 1; 	//득점
				else pmflag = 0; 								//감점
				
				var totalscore = parseInt($(this).parent().parent().eq(0).children().eq(10)[0].innerText);
				var parent = $(this).parent().parent();
				score(textflag, totalscore, parent, pmflag);
				
			}); */
			
			$(".btn-danger").click(function(e){
				var textflag;	 	//버튼클릭시 여러이벤트
				var pmflag;			//득점 감점 flag
				var classtexts = $(this).attr("class").split(" ");
				for(var i = 0; i<classtexts.length; i++){
					textflag = classtexts[i];
				}
				if(classtexts[1] == "btn-success") pmflag = 1; 	//득점
				else pmflag = 0; 								//감점
				
				var totalscore = parseInt($(this).parent().parent().eq(0).children().eq(10)[0].innerText);
				var parent = $(this).parent().parent();
				score(textflag, totalscore, parent, pmflag);
			});
			
			
		});
	</script>
</body>
</html>