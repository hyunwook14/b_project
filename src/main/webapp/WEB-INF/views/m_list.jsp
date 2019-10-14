<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" >
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
</head>
<body>
 	
	<section class="container-fluid">
		<div class="row content">
			 <nav class="col-sm-3 sidenav">
				 <ul class="menu nav nav-pills nav-stacked">
				 	<li class=""><a href="/">Home</a></li>
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
					 <ul id="page" class="pagination">
						 	
						 	
					 </ul>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/Myinfo.js"></script>
<script src="/resources/js/common.js"></script>
<script>
	var id= "";
	id ="<%= session.getAttribute("id") %>";
	
	function genRowspan(className){
	    $("." + className).each(function() {
	        var rows = $("." + className + ":contains('" + $(this).text() + "')");
	        console.log($(this).text())
	        console.log(rows)
	        if (rows.length > 1) {
	            rows.eq(0).attr("rowspan", rows.length);
	            rows.not(":eq(0)").remove();
	        }
	    });
	}
	
	function timetrans(time){
		if(time < 10){
			time = "0"+time ;
		}
		return time
	}
	
	$(document).ready(function(){
		
		$(".add").click(function(){
			location.href="/m_record"
		});
		
		var html ="";
		
		if(id != "null"){
			myinfoload(id);
		}
		
		
			var lastindex = location.href.lastIndexOf("/")+ 1;
			var index = location.href.substring(lastindex);
			if( index == "m_list" || index == 0 || index == "") {
				index = 1
			}
			$.ajax({
				url:"/loadgamelist",
				type:"POST",
				data:{index:index}
			}).done(function(data){
				html ="";
				var month;
				var date;
				var hours;
				var minutes;
				var seconds;
				for(var i =0; i<data.length-1; i++){
					month = data[i].record_date.month+1;
					date = data[i].record_date.date;
					hours = data[i].record_date.hours;
					minutes = data[i].record_date.minutes;
					seconds = data[i].record_date.seconds;
					
					month = timetrans(month);
					date = timetrans(date);
					hours = timetrans(hours);
					minutes = timetrans(minutes);
					seconds = timetrans(seconds);
					
					html += `
					<tr class="detail">
						<td class='date'>\${data[i].record_date.year+1900}-\${month}-\${date} \${hours}:\${minutes}:\${seconds}</td> 
						<td class='quarter'>\${data[i].record_quarter} Q</td>
						<td>\${data[i].peoplen}</td>
					</tr>`;
				}
				
				$("#content").append(html);
				
				var totalpage = Math.ceil(data[data.length-1] / 10)
				
				console.log(Math.ceil((index- 1)/5) , "--")
				
				 var startpage ;
				
				if(index <6 ){
					startpage = 1;
				}else{
					startpage = Math.ceil(index / 5) * 5 -4;
				}
				/*if (index % 5 == 0) {
					startpage = (index / 5 - 1)*5 + 1;
				} else {
					startpage = Math.trunc(index / 5)*5 +1;
				} */
				
				var prepage= startpage -5;
				if(prepage <0) prepage = 1;
				var nextpage= startpage +5;
				if(nextpage > totalpage) nextpage -= 5;
				
				var count = 0;
				html ="";
				html += `<li><a href="/m_list/\${prepage}"><</a>`;
				for(var i = startpage; i <= totalpage; i++){
					count++;
					html += `<li id ="\${i}" class="pagenum"><a href="/m_list/\${i}">\${i}</a>`;
					if(count == 5) break;
				}
				html += `<li><a href="/m_list/\${nextpage}">></a>`;
				$("#page").empty();
				$("#page").append(html);
				
				console.log(index)
				 if((index-1) <0){
					index = 1
				}
				$(`#\${index}`).addClass("active");
			});
		
		
		
		$(document).on("click", ".detail", function(){
			var index = $(this).index()
			var date = $(".date").eq(index).text();
			var quarters = $(".quarter").eq(index).text().split(" ");
			var quarter = quarters[0];
			console.log(date," - " ,quarter, "---datae")
			
			$.ajax({
				url:"/loadresult",
				type:"POST",
				data:{
					record_date: date,
					record_quarter:quarter
				}
			}).done(function(data){
				html ="";
				$("#team").empty();
				for(var i=0; i<data.length; i++){
				html +=`
					<tr class="people">
					<td class="teamdivision">\${data[i].record_assortment}</td>
					<td>\${data[i].record_nickname}</td>
					<td>
					 <span class="score2">\${data[i].record_twop}</span> 
					</td>
					<td>
					 <span class="score3">\${data[i].record_threep}</span> 
					</td>
					<td>
					 <span class="score1">\${data[i].record_onep}</span>
					</td>
					<td>
					 <span class="foul">\${data[i].record_foul}</span>
					</td>
					<td>
					 <span class="assist">\${data[i].record_assist}</span>
					</td>
					<td>
					 <span class="steal">\${data[i].record_steal}</span>
					</td>
					<td>
					 <span class="block">\${data[i].record_block}</span>
					</td>
					<td>
					 <span class="turnover">\${data[i].record_turnover}</span>
					</td>
					<td><span class="totalscore">\${data[i].record_totalp}</span>
					</td>
				</tr>
				`;
					
				}
				$("#team").append(html);
				//genRowspan("teamdivision");
			});
			
				$("#myModal").modal("show");
			
		})
		
		
	});
</script>
</body>

</html>