<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
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

<script>
	var id= "";
	id ="<%= session.getAttribute("id") %>";
	
	 $(document).ready(function(){
		 	var playerlist =[];
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
			
			html = "";
			
			$.ajax({
				url:"/playerlistload",
				type:"POST",
				data:{}
			}).done(function(data){
				playerlist = data;
				html="";
				var img = new Image();
				for(var i = 0; i<data.length; i++){
						/* image존재여부 확인*/
					 isImage(data[i].player_img, data[i]); 
					
				}
				
			});
			
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
			
	});
	
	function isImage(src){
		 var html = "";
		 var img = new Image();
		 
		 img.onload = function(){
			 html += `<div class="col-sm-2">
					<img src="\${src}" alt="선수" class="img-circle w100 player " data-toggle="modal" data-target="#myModal"> 
			   	</div>`;
			 $("#playerlist").append(html);
			 
		 }
		 
		 img.onerror= function(){
		 }
		 img.src=""+src;
		 
		 
	 }
</script>
</head>
<body>
	<section class="container-fluid">
		<div class="row content">
			 <nav class="col-sm-3 sidenav">
				 <ul class="menu nav nav-pills nav-stacked">
				 	<li class=""><a href="/main">Home</a></li>
				 	<li class=""><a href="/bodyinfo_register">신체정보등록</a></li>
				 	<li class="active"><a href="/player_recommand">선수추천목록</a>
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
				
				<div class="container">
					<h1>선수목록</h1>
					<div class="row" id="playerlist">
						
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
</body>
</html>