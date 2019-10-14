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
					<h2 id="positionname">포지션을선택해주세요</h2>
					<div id="skills">
						
					</div>
				</div>
				<div class="container">
					<a href="https://www.youtube.com/results?search_query=%EB%86%8D%EA%B5%AC+%EA%B0%95%EC%9D%98" target="_blanck">더보기</a>
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
					
				    <!-- Indicators -->
				    <ol class="carousel-indicators">
				      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				      <li data-target="#myCarousel" data-slide-to="1"></li>
				      <li data-target="#myCarousel" data-slide-to="2"></li>
				    </ol>
				
				    <!-- Wrapper for slides -->
				    <div class="carousel-inner">
				    	 <div class="item active">
			         
			         <iframe id="1" width="1150" height="720" 
					  src="https://www.youtube.com/embed/dZXwyIDtgmA" 
					  frameborder="0" 
					  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
					  allowfullscreen>
					 </iframe>
					
			        <div class="carousel-caption">
			          
			        </div>
			      </div>
			      
			      <div class="item">
			        <iframe id="2" width="1150" height="720" 
					  src="https://www.youtube.com/embed/5NdPsGx9soU" 
					  frameborder="0" 
					  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
					  allowfullscreen>
					  </iframe>
			        <div class="carousel-caption">
			          
			        </div>
			      </div>
			    
			      <div class="item">
			        <iframe id="3" width="1150" height="720" 
					  src="https://www.youtube.com/embed/oiVtphgmEcY" 
					  frameborder="0" 
					  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
					  allowfullscreen>
					  </iframe>
			        <div class="carousel-caption">
			          
			        </div>
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
	<script type="text/javascript" src="/resources/js/Myinfo.js"></script>
	<script src="/resources/js/common.js"></script>
	<script>
		var id= "";
		id ="<%= session.getAttribute("id") %>";
		<% 
			BasketballPositionVO result = (BasketballPositionVO) request.getAttribute("result");
			String position ="";
			String explanantion="";
			String skill1="";
			String skill2="";
			String skill3="";
			if(result == null){
				System.out.println("null값 jsp");
			}else{
				 position = result.getPosition_name();
				 explanantion = result.getPosition_explanation();
				 skill1 = result.getPosition_skill1();
				 skill2 = result.getPosition_skill2();
				 skill3 = result.getPosition_skill3();
			}
		%>
		$(document).ready(function(){
			var srcpath = "https://www.youtube.com/embed/";
			$('.carousel').carousel({
				  interval: false
			});
			
			var html ="";
			myinfoload(id)
			
			var position = "<%= position %>";
			var explanantion = "<%= explanantion %>";
			var skill1 = "<%= skill1 %>";
			var skill2 = "<%= skill2 %>";
			var skill3 = "<%= skill3 %>";
			
			/* $.ajax({
				url:"/",
				
			}).done(function(data){
				
			}); */
			
			var href =location.href.split("/");
			console.log(href);
			var html = "";
			
			if(href.length == 5 && href[4] != ""){
				
				$("#positionname").text(position);
				
				
				html = `
					<h3>요구 되는 능력</h3>
					<span class="label label-info">\${skill1}</span>
					<span class="label label-info">\${skill2}</span>
					<span class="label label-info">\${skill3}</span>
					<h4>포지션 특징:
					\${explanantion}	
					</h4>
				`;
				
				$("#skills").append(html);
				
				
				html = "";
				
				/* html = `
					
			  
				`;
				
				$(".carousel-inner").eq(0).append(html); */
				
				html = `
					<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				      <span class="glyphicon glyphicon-chevron-left"></span>
				      <span class="sr-only">Previous</span>
				    </a>
				    <a class="right carousel-control" href="#myCarousel" data-slide="next">
				      <span class="glyphicon glyphicon-chevron-right"></span>
				      <span class="sr-only">Next</span>
				    </a>
				`;
				
				$("#myCarousel").append(html);
				
				$.ajax({
					url:"/loadsrc",
					type:"POST",
					data: {position: position}
				}).done(function(data){
					console.log(data);
					
					for(var i =0 ; i < data.length; i++){
						var srcpath = "https://www.youtube.com/embed/";
						srcpath += data[i].src;
						console.log(srcpath);
						$(`#\${i+1}`).attr("src", srcpath);
					}
				})
				
			}
			
			
		}) 
	</script>
</body>
</html>