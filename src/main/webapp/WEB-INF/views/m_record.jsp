<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>기록지</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/web/resources/css/Main.css" >
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<style>
		.vab{
			vertical-align:bottom;
		}
	</style>
</head>


<script>
	function score(textflag, totalscore, parent, pmflag){
		
		if(textflag=="score2"){
			 var score = parseInt(parent.children().eq(2).children().eq(0).text());
			 if(pmflag ==1){
				 score += 2;
				 totalscore += 2;
			 }else{
				 score -= 2;
				 totalscore -=2;
			 }
			 parent.children().eq(2).children().eq(0).text(score);
		}else if(textflag=="score3"){
			var score = parseInt(parent.children().eq(3).children().eq(0).text()); 
			if(pmflag ==1){
				 score += 3;
				 totalscore += 3;
			 }else{
				 score -= 3;
				 totalscore -=3;
			 }
			 parent.children().eq(3).children().eq(0).text(score);
		}else if(textflag=="score1"){
			var score = parseInt(parent.children().eq(4).children().eq(0).text()); 
			if(pmflag ==1){
				 score += 1;
				 totalscore += 1;
			 }else{
				 score -= 1;
				 totalscore -=1;
			 }
			 parent.children().eq(4).children().eq(0).text(score);
		}else if(textflag=="foul"){
			var score = parseInt(parent.children().eq(5).children().eq(0).text()); 
			if(pmflag ==1){
				 score += 1;
			 }else{
				 score -= 1;
			 }
			 parent.children().eq(5).children().eq(0).text(score);
		}else if(textflag=="assist"){
			var score = parseInt(parent.children().eq(6).children().eq(0).text()); 
			if(pmflag ==1){
				 score += 1;
			 }else{
				 score -= 1;
			 }
			 parent.children().eq(6).children().eq(0).text(score);
		}else if(textflag=="steal"){
			var score = parseInt(parent.children().eq(7).children().eq(0).text()); 
			if(pmflag ==1){
				 score += 1;
			 }else{
				 score -= 1;
			 }
			 parent.children().eq(7).children().eq(0).text(score);
		}else if(textflag=="block"){
			var score = parseInt(parent.children().eq(8).children().eq(0).text()); 
			if(pmflag ==1){
				 score += 1;
			 }else{
				 score -= 1;
			 }
			 parent.children().eq(8).children().eq(0).text(score);
		}else if(textflag=="turnover"){
			var score = parseInt(parent.children().eq(9).children().eq(0).text()); 
			if(pmflag ==1){
				 score += 1;
			 }else{
				 score -= 1;
			 }
			 parent.children().eq(9).children().eq(0).text(score);
		}
		
		
		
		parent.children().eq(10).children().text(totalscore);	
		}
	
	$(document).ready(function(){
		$(".back").click(function(e){
			location.href="/web/m_list";
		});
		
		$("#matchend").click(function(e){
			e.preventDefault();
			console.log("경기종료")
		});
		
		$(".plusp").click(function(){
			$("#myModal").modal("show"); //모달창 띄우기
		});
		
		$(".btn-success").click(function(e){
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
		
		/*
		$("button").click(function(e){
			var index = $("button").index(this);
			if( index == 0){
			}else{
			
				var textflag;	 	//버튼클릭시 여러이벤트
				var pmflag;			//득점 감점 flag
				var classtexts = $(this).attr("class").split(" ");
				for(var i = 0; i<classtexts.length; i++){
					textflag = classtexts[i];
				}
				if(classtexts[1] == "btn-success") pmflag = 1; 	//득점
				else pmflag = 0; 								//감점
				
				var totalscore = parseInt($(this).parent().parent().eq(0).children().eq(10)[0].innerText);
				
				if(textflag=="score2"){
					var score = parseInt($(this).parent()[0].childNodes[0].innerText);
					if( pmflag == 1){
						score += 2;
						totalscore += 2;
					}else{
						score -= 2;
						totalscore -= 2;
					}
					$(this).parent()[0].childNodes[0].innerText = score;
					$(this).parent().parent().eq(0).children().eq(10)[0].innerText= totalscore;
				}else if(textflag=="score3"){
					var score = parseInt($(this).parent()[0].childNodes[0].innerText);
					if( pmflag == 1){
						score += 3;
						totalscore += 3;
					}else{
						score -= 3;
						totalscore -= 3;
					}
					$(this).parent()[0].childNodes[0].innerText = score;
					$(this).parent().parent().eq(0).children().eq(10)[0].innerText= totalscore;
				}else if(textflag=="score1"){
					var score = parseInt($(this).parent()[0].childNodes[0].innerText);
					if( pmflag == 1){
						score += 1;
						totalscore += 1;
					}else{
						score -= 1;
						totalscore -= 1;
					}
					$(this).parent()[0].childNodes[0].innerText = score;
					$(this).parent().parent().eq(0).children().eq(10)[0].innerText= totalscore;
				}else if(textflag=="foul"){
					var score = parseInt($(this).parent()[0].childNodes[0].innerText);
					if( pmflag == 1){
						score += 1;
					}else{
						score -= 1;
					}
					$(this).parent()[0].childNodes[0].innerText = score;
				}else if(textflag=="assist"){
					var score = parseInt($(this).parent()[0].childNodes[0].innerText);
					if( pmflag == 1){
						score += 1;
					}else{
						score -= 1;
					}
					$(this).parent()[0].childNodes[0].innerText = score;
				}else if(textflag=="steal"){
					var score = parseInt($(this).parent()[0].childNodes[0].innerText);
					if( pmflag == 1){
						score += 1;
					}else{
						score -= 1;
					}
					$(this).parent()[0].childNodes[0].innerText = score;
				}else if(textflag=="block"){
					var score = parseInt($(this).parent()[0].childNodes[0].innerText);
					if( pmflag == 1){
						score += 1;
					}else{
						score -= 1;
					}
					$(this).parent()[0].childNodes[0].innerText = score;
				}else if(textflag=="turnover"){
					var score = parseInt($(this).parent()[0].childNodes[0].innerText);
					if( pmflag == 1){
						score += 1;
					}else{
						score -= 1;
					}
					$(this).parent()[0].childNodes[0].innerText = score;
				}
			
			/*console.log($(this).parent().parent())  *//*
			}
		});*/
	});
</script>
<body>
<nav class="">
 <div class="nav">
 <ul class="menu nav nav-pills nav-stacked">
 	<li class=""><a href="#section1">Home</a></li>
 	<li class=""><a href="#section2">정보등록</a></li>
 	<li class=""><a href="#section3">선수추천목록</a>
 	<li class=""><a href="#setion4">운동목록</a>
 	<li class="active"><a href="#section5">경기기록</a>
 </ul>
 </div>
</nav>
<section class="">
	<h1>match record</h1>
	인원추가:<button type="button" class="btn btn-primary plusp">+</button>
	<table class="table table-striped">
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
		<tr class="people">
			<td>home</td>
			<td>진현욱</td>
			<td><span class="score2">0</span> <button type="button" class="btn btn-success score2">+</button><button type="button" class="btn btn-danger score2">-</button>
			</td>
			<td><span class="score3">0</span> <button type="button" class="btn btn-success score3">+</button><button type="button" class="btn btn-danger score3">-</button>
			</td>
			<td><span class="score1">0</span> <button type="button" class="btn btn-success score1">+</button><button type="button" class="btn btn-danger score1">-</button>
			</td>
			<td><span class="foul">0</span> <button type="button" class="btn btn-success foul">+</button><button type="button" class="btn btn-danger foul">-</button> 
			</td>
			<td><span class="assist">0</span> <button type="button" class="btn btn-success assist">+</button><button type="button" class="btn btn-danger assist">-</button>
			</td>
			<td><span class="steal">0</span> <button type="button" class="btn btn-success steal">+</button><button type="button" class="btn btn-danger steal">-</button>
			</td>
			<td><span class="block">0</span> <button type="button" class="btn btn-success block">+</button><button type="button" class="btn btn-danger block">-</button>
			</td>
			<td><span class="turnover">0</span> <button type="button" class="btn btn-success turnover">+</button><button type="button" class="btn btn-danger turnover">-</button>
			</td>
			<td><span class="totalscore">0</span>
			</td>	
		</tr>
		<tr>
			<td>away</td>
			<td>Jordan</td>
			<td><span class="score2">0</span> <button type="button" class="btn btn-success score2">+</button><button type="button" class="btn btn-danger score2">-</button>
			</td>
			<td><span class="score3">0</span> <button type="button" class="btn btn-success score3">+</button><button type="button" class="btn btn-danger score3">-</button>
			</td>
			<td><span class="score1">0</span> <button type="button" class="btn btn-success score1">+</button><button type="button" class="btn btn-danger score1">-</button>
			</td>
			<td><span class="foul">0</span> <button type="button" class="btn btn-success foul">+</button><button type="button" class="btn btn-danger foul">-</button> 
			</td>
			<td><span class="assist">0</span> <button type="button" class="btn btn-success assist">+</button><button type="button" class="btn btn-danger assist">-</button>
			</td>
			<td><span class="steal">0</span> <button type="button" class="btn btn-success steal">+</button><button type="button" class="btn btn-danger steal">-</button>
			</td>
			<td><span class="block">0</span> <button type="button" class="btn btn-success block">+</button><button type="button" class="btn btn-danger block">-</button>
			</td>
			<td><span class="turnover">0</span> <button type="button" class="btn btn-success turnover">+</button><button type="button" class="btn btn-danger turnover">-</button>
			</td>
			<td><span class="totalscore">0</span>
			</td>	
		</tr>
	</table>
	<button type="button" class="btn back">뒤로</button><button type="button" class="btn" id="matchend">경기종료</button>
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
	          		<input type="radio" name="team" checked> home
	          	</label>
	          	<label class="radio-inline">
	          		<input type="radio" name="team" > away
	          	</label>
	          	
	          	<div class="input-group">
	          		<label for="p_name" class="form-group">이름:</label>
	          		<input type="text" class="form-control" placeholder="선수이름입력을 입력하세요" >
	          		<div class="input-group-btn vab"><br>
				        <button class="btn btn-default " type="submit"><i class="glyphicon glyphicon-search"></i></button>
				    </div>
	          	</div>
	          	<input type="submit" class="btn btn-default" value="등록">
	          </form>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
</section>
<footer></footer>
</body>
</html>