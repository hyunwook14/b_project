<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>

.ptb50p{
	padding:25px 0;
}

.mb0{
	margin-bottom:0;
}
.progressw33{
	width:33%;
}
.progressw66{
	width:66%;
}
.progressw100{
	width:100%;
}
.vertical-align{
	vertical-align: middle !important ;
}

</style>

<script>
	var id= "";
	id ="<%= session.getAttribute("id") %>";
	
	 $(document).ready(function(){
		$("#c_info").click(function(){
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
						<button class=" btn form-control">내정보</button>
					</div>
					<div class="col-sm-6">
						<button class=" btn form-control" formaction="/logout">로그아웃</button>
					</div>
				   </form>	 `;
		}
		$("#myinfo").append(html);
		
		html =`<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" >0%</div>
			   `;
		$(".progress").eq(0).append(html);
		
		$.ajax({
			url:"/selectbodyinfo",
			type:"POST",
			data:{}
		}).done(function(data){
			var list = JSON.parse(data);
			var html ="";
			if(list.length == 0){
				
				html = `<div class="col-sm-4">
							<div class="well">
							신체정보를등록해주세요
							</div>
						</div>`;
			}else{
				for(var i =0; i<list.length; i++){
					html += `<div class="col-sm-4">
						<div class="well">
						<button type="button" class="btn">수정</button>
						<button type="button" class="btn hidden">확인</button>
						<button type="button" class="btn">삭제</button>
						<table class="table table-bordered mb0 ">
							<tbody>
								<tr class="text_center">
									<td class="vertical-align">nickname</td>
									<td><input type="text" value="\${list[i].character_nickname}" class="form-control" disabled></td>
								</tr>
								<tr>
									<td class="vertical-align">키</td>
									<td><input type="number" value="\${list[i].character_height}" class="form-control" disabled></td>
								</tr>
								<tr>
									<td class="vertical-align">몸무게</td>
									<td><input type="number" value="\${list[i].character_weight}" class="form-control" disabled></td>
								</tr>
								<tr>
									<td>추천포지션</td>
									<td>F</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>`;
				}
				
				
				$(".progress-bar").eq(0).removeClass("progressw33");
				$(".progress-bar").eq(0).removeClass("progressw66");
				$(".progress-bar").eq(0).removeClass("progressw100");
				
				if(list.length == 1){
					$(".progress-bar").eq(0).addClass("progressw33");
					$(".progress-bar").eq(0).text("33%")	
				}
				else if(list.length == 2){
					$(".progress-bar").eq(0).addClass("progressw66");
					$(".progress-bar").eq(0).text("66%")
				}
				else if(list.length == 3){
					$(".progress-bar").eq(0).addClass("progressw100");
					$(".progress-bar").eq(0).text("100%")
				}
			}
			$("#userinfolist").append(html);
			
		});
		
		
	}); 
</script>
</head>
<body>
	<section class="container-fluid">
		<div class="row content">
			 <nav class="col-sm-3 sidenav">
				 <ul class="menu nav nav-pills nav-stacked">
				 	<li class="active"><a href="/main">Home</a></li>
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
				<div class="container userinfo">
					<div class="row">
						<button type="button" id="c_info" class="btn form-control" data-toggle="collapse" data-target="#userinfolist">내 신체정보보기 </button>
					</div>
					<div class="row collapse mt50p" id="userinfolist">
							<div class="progress">
							</div>
							  
							<!-- <div class="col-sm-4">
								<div class="well">
									2
								</div>
							</div>
							<div class="col-sm-4">
								<div class="well">
									3
								</div>
							</div> -->
					</div>
					<div class="">
						<div>
							<button  type="button" class="btn form-control" data-toggle="collapse" data-target="#mymatch">내 시합목록 </button>
						</div>
						<div class="row collapse mt50p" id="mymatch">
							<div class="">
								<table class="table table-bordered mb0">
										<thead>
											<tr>
												<td>경기날짜</td>
												<td>쿼터</td>
												<td>총인원</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>2019-09-26</td>
												<td>1</td>
												<td>12</td>
											</tr>
											
										</tbody>
									</table>
							</div>
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