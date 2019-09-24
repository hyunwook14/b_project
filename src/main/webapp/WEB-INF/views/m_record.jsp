<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록지</title>
</head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/web/resources/css/Main.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("button").click(function(){
			var indextext = $("button").index(this);
			
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
			
			/*console.log($(this).parent().parent())  */
			
		});
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
인원추가:<button type="button" class="btn btn-primary">+</button>
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
		<td>고동희</td>
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
<button type="button" class="btn ">경기종료</button>
</section>
<footer></footer>
</body>
</html>