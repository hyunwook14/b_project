<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
	.w80p{
		width:75%;
		margin: auto;
	}
	.w20{
		width: 350px;
		text-align: center;
	}
	.mtb10{
		margin: 10px 0;
	}
	.mtb10{
		margin: 20px 0;
	}
	tbody{
		cursor:pointer;
	}
</style>
<script>
	var id= "";
	id ="<%= session.getAttribute("id") %>";
	
	
	$(document).ready(function(){
		$(".add").click(function(){
			location.href="/m_record"
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
		
		$.ajax({
			url:"/loadgamelist",
			type:"POST"
		}).done(function(data){
			html ="";
			console.log(data)
		
			for(var i =0; i<data.length; i++){
				html += `
				<tr class="detail">
					<td>\${data[i].record_date.year+1900}-\${data[i].record_date.month+1}-\${data[i].record_date.date} \${data[i].record_date.hours}:\${data[i].record_date.minutes}</td>
					<td>\${data[i].record_quarter}Q</td>
					<td>\${data[i].peoplen}</td>
				</tr>`;
			}
			
			
			$("#content").append(html);
		});
		
		$(document).on("click", ".detail", function(){
			console.log("과연 기억이 잘맞는지?")
			
			html ="";
			html =`
				<tr class="people">
				<td class="teamdivision">home</td>
				<td>away</td>
				<td>
				 <span class="score2">0</span> 
				</td>
				<td>
				 <span class="score3">0</span> 
				</td>
				<td>
				 <span class="score1">0</span>
				</td>
				<td>
				 <span class="foul">0</span>
				</td>
				<td>
				 <span class="assist">0</span>
				</td>
				<td>
				 <span class="steal">0</span>
				</td>
				<td>
				 <span class="block">0</span>
				</td>
				<td>
				 <span class="turnover">0</span>
				</td>
				<td><span class="totalscore">0</span>
				</td>
			</tr>
			`;
			
			$("#team").append(html);
			
			$("#myModal").modal("show");
		})
		
		
	});
</script>
</head>
<body>
	<section class="container-fluid">
		<div class="row content">
			 <nav class="col-sm-3 sidenav">
				 <ul class="menu nav nav-pills nav-stacked">
				 	<li class=""><a href="/main">Home</a></li>
				 	<li class=""><a href="/bodyinfo_register">신체정보등록</a></li>
				 	<li class=""><a href="/player_recommand">선수추천목록</a>
				 	<li class=""><a href="/exercise_recommand">운동목록</a>
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
				<div class="w80p">
					<h1 class="mtb20"> 경기 목록 </h1>
					<div class="mtb10">
						<form>
							<button type="button" class="btn btn-primary add">경기추가</button>
						</form>
					
					</div>
				
					<table class="table">
						<thead>
							<tr>
								<td>날짜</td>
								<td>쿼터</td>
								<td>인원</td>
							</tr>
						</thead>
						<tbody id="content">
							
						</tbody>
					</table>
		
				</div>
				<!-- Modal -->
				  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">자세히보기</h4>
				        </div>
				        <div class="modal-body">
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
</body>
</html>