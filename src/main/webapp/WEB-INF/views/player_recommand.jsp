<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수추천목록</title>
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
.w100{
	width:100%;
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
				 	<li class="active"><a href="/player_recommand">선수추천목록</a>
				 	<li class=""><a href="/exercise_recommand">운동추천목록</a>
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
				
				<div class="container">
					<h1>선수목록</h1>
					
					<div class="dropdown">
					    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="nickname">케릭터이름
					    <span class="caret"></span></button>
					    <ul class="dropdown-menu" id="namemenu">
												      
					      
					    </ul>
					  </div>
					
					<div class="row" id="playerlist">
						
					</div>
					<div id="page" style="margin: 15px 0; text-align:center;" >
					</div>
					
				</div>
				
				
				<!-- Modal -->
				  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content liwidth">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">선수</h4>
				        </div>
				        <div class="modal-body media ">
				        	<div class="media-left">
				        		<img src="/resources/img/290776.jpg" alt="선수" class="media-object" style="width:150px; height:180px" >
				        	</div>
				        	<div class="media-body ">
					        	<ul class="table ">
					        		<li class="">
					        			<ul class="tr">
					        				<li>이름
					        				<li id="playername">허웅
					        			</ul>
					        			<ul class="tr">
					        				<li>신장
					        				<li id="playerheight">185
					        			</ul>
					        			<ul class="tr">
					        				<li>소속
					        				<li id="playerteam">상무
					        			</ul>
					        			<ul class="tr">
					        				<li>포지션
					        				<li id="playerposition">Gaurd
					        			</ul>
					        		</li>
					        	</ul>
				        	
				        	</div>
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
	<footer>
	 <div>
	 </div>
	</footer>
	<script type="text/javascript" src="/resources/js/common.js"></script>
	<script type="text/javascript" src="/resources/js/Myinfo.js"></script>
	<script>
	var id= "";
	id ="<%= session.getAttribute("id") %>";
	
	 $(document).ready(function(){
		 	var playerlist =[];
		 	var html ="";
			myinfoload(id);
			
			html = "";
			
			$.ajax({
				url:"/selectbodyinfo",
				type:"POST",
				data:{}
			}).done(function(data){
				var result = JSON.parse(data);
				console.log(result)
				
				for(var i = 0; i<result.length; i++){
					html +=`<li><a href="/player_recommand/\${result[i].character_nickname}">\${result[i].character_nickname}</a></li>`;
				}
				
				$("#namemenu").append(html);
				
			});
			
			var urlnumber = location.href.split("/");
			console.log(urlnumber, " -- urlnumber");
			
			if(urlnumber.length == 4){
				$.ajax({
					url:"/playerlistload",
					type:"POST",
					data:{}
				}).done(function(data){
					playerlist = data;
					html="";
					var img = new Image();
					for(var i = 0; i<data.length-1; i++){
							/* image존재여부 확인*/
						 isImage(data[i].player_img, data[i]); 
						
					}
					$("#page").empty();
					var pagenumber = Math.ceil(playerlist[playerlist.length-1] / 12);
					for(var i = 1; i<pagenumber; i++){
					html += `<button type="button" class="pagenumber btn btn-default">\${i}</button>`;
					}
					$("#page").append(html);
					$(".pagenumber").eq(0).addClass("active");
					
				});
			}else if(urlnumber.length ==5){
				nickname = urlnumber[4];
				$("#nickname").text(nickname);
				$("#nickname").append(`<span class="caret"></span>`);
				$.ajax({
					url:"/recommandlist",
					type:"POST",
					data:{nickname : nickname}
				}).done(function(data){
					console.log(data)
					playerlist = data;
					html ="";
					var img = new Image();
					for(var i = 0; i< data.length - 1; i++){
						isImage(data[i].player_img, data[i]);
					}
					$("#page").empty();
					var pagenumber = Math.ceil(data[data.length-1] / 12);
					console.log(pagenumber , " , pagenumber")
					for(var i = 1; i<=pagenumber; i++){
					html += `<button type="button" class="recommandpagenumber btn btn-default">\${i}</button>`;
					}
					$("#page").append(html);
					$(".recommandpagenumber").eq(0).addClass("active");
					
				});
			}
			
			
			$(document).on("click", ".player", function(){
				var src = $(this).attr("src");
				$(".media-object").eq(0).attr("src",src);
				
				for( var i = 0; i< playerlist.length; i++){
					if(src == playerlist[i].player_img ){
						$("#playername").text(playerlist[i].player_name);
						$("#playerheight").text(playerlist[i].player_height);
						$("#playerteam").text(playerlist[i].player_team);
						$("#playerposition").text(playerlist[i].player_position);
					}
				}
			})
			
			$(document).on("click", ".pagenumber", function(){
				var index = $(this).index();
				
				 $.ajax({
					url:"/playerlistload",
					type:"POST",
					data:{index : index}
				}).done(function(data){
					playerlist = data;
					html="";
					var img = new Image();
					for(var i = 0; i<data.length-1; i++){
							/* image존재여부 확인*/
						 isImage(data[i].player_img, data[i]); 
						
					}
					$("#page").empty();
					var pagenumber = Math.ceil(playerlist[playerlist.length-1] / 12);
					for(var i = 1; i<=pagenumber; i++){
						html += `<button type="button" class="pagenumber btn btn-default">\${i}</button>`;
					}
					$("#page").append(html);
					$(".pagenumber").eq(index).addClass("active");
					
				}); 
			});
			
			$(document).on("click", ".recommandpagenumber", function(){
				var index = $(this).index();
				
				console.log(nickname ,"???")
				 $.ajax({
					url:"/recommandlist",
					type:"POST",
					data:{index : index,
						nickname : nickname}
				}).done(function(data){
					playerlist = data;
					html="";
					var img = new Image();
					for(var i = 0; i<data.length-1; i++){
							/* image존재여부 확인*/
						 isImage(data[i].player_img, data[i]); 
						
					}
					$("#page").empty();
					var pagenumber = Math.ceil(playerlist[playerlist.length-1] / 12);
					for(var i = 1; i<=pagenumber; i++){
						html += `<button type="button" class="recommandpagenumber btn btn-default">\${i}</button>`;
					}
					$("#page").append(html);
					$(".pagenumber").eq(index).addClass("active");
					
				}); 
			});
			
	});
	
	function isImage(src){
		 var html = "";
		 var img = new Image();
		 $("#playerlist").empty();
		 img.onload = function(){
			 
			 html += `<div class="col-sm-2" style="margin: 20px 0;">
					<img src="\${src}" alt="선수" class="img-circle w100 player " data-toggle="modal" data-target="#myModal"> 
			   	</div>`;
			 $("#playerlist").append(html);
			 
		 }
		 
		 img.onerror= function(){
		 }
		 img.src=""+src;
		 
		 
	 }
</script>
</body>
</html>