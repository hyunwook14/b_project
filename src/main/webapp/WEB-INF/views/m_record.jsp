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
			var textflag;
			var classtexts = $(this).attr("class").split(" ");
			for(var i = 0; i<classtexts.length; i++){
				textflag = classtexts[i];
			}
			console.log(textflag, "---어떤거클릭?")
			
			if(textflag=="score2"){
			}else if(textflag=="score3"){
				
			}else if(textflag=="score1"){
				
			}else if(textflag=="foul"){
				
			}else if(textflag=="assist"){
				
			}else if(textflag=="steal"){
				
			}else if(textflag=="block"){
				
			}else if(textflag=="turnover"){
				
			}
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
	<tr>
		<td>home</td>
		<td>진현욱</td>
		<td>2 <button type="button" class="btn btn-success scroe2">+</button><button type="button" class="btn btn-danger">-</button>
		</td>
		<td>0 <button type="button" class="btn btn-success score3">+</button><button type="button" class="btn btn-danger">-</button>
		</td>
		<td>2 <button type="button" class="btn btn-success score1">+</button><button type="button" class="btn btn-danger">-</button>
		</td>
		<td>0 <button type="button" class="btn btn-success foul">+</button><button type="button" class="btn btn-danger">-</button> 
		</td>
		<td>5 <button type="button" class="btn btn-success assist">+</button><button type="button" class="btn btn-danger">-</button>
		</td>
		<td>0 <button type="button" class="btn btn-success steal">+</button><button type="button" class="btn btn-danger">-</button>
		</td>
		<td>0 <button type="button" class="btn btn-success block">+</button><button type="button" class="btn btn-danger">-</button>
		</td>
		<td>0 <button type="button" class="btn btn-success turnover">+</button><button type="button" class="btn btn-danger">-</button>
		</td>
		<td>6 
		</td>	
	</tr>
	<tr>
		<td>away</td>
		<td>고동희</td>
		<td>2</td>
		<td>0</td>
		<td>2</td>
		<td>0</td>
		<td>5</td>
		<td>0</td>
		<td>0</td>
		<td>0</td>
		<td>6</td>	
	</tr>
	

</table>
<button type="button" class="btn ">경기종료</button>
</section>
<footer></footer>
</body>
</html>