<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록지</title>
</head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular.min.js"></script>
<style>
.vab{
	vertical-align:bottom;
}
</style>
<script>
	angular.module('app', [])
	       .controller('controller', function($scope) {
	    	   $scope.newUser = {};
	    	   $scope.list = [
	    			{col1:"home",col2:"권봉준",col3:0,col4:0,col5:0,col6:0,col7:0,col8:0,col9:0,col10:0,col11:0},
	    			{col1:"away",col2:"주진홍",col3:0,col4:0,col5:0,col6:0,col7:0,col8:0,col9:0,col10:0,col11:0},
	    			{col1:"away",col2:"노형래",col3:0,col4:0,col5:0,col6:0,col7:0,col8:0,col9:0,col10:0,col11:0},
	    			{col1:"away",col2:"주현석",col3:0,col4:0,col5:0,col6:0,col7:0,col8:0,col9:0,col10:0,col11:0}
	    		];
	    	   $scope.btn = function(row, type, key, tot){
	    		   var point = 1;
	    		   if(key == "col3"){
    				   point = 2;
    			   } else if(key == "col4"){
    				   point = 3;
    			   }
	    		   if(type == "+"){
	    			   row[key] += point;
	    			   if(tot == "Y") row.col11 += point;	    			   
	    		   } else if(type == "-"){
	    			   if(row[key] != 0){
	    				   row[key] -= point;
	    				   if(tot == "Y") row.col11 -= point;
	    			   }
	    		   }
	    	   }
	    	   $scope.modal = function(){
	    		   $scope.newUser = {col1:"home",col2:"",col3:0,col4:0,col5:0,col6:0,col7:0,col8:0,col9:0,col10:0,col11:0};
	    		   $("#myModal").modal("show");
	    	   }
	    	   $scope.add = function(){
	    		   console.log($scope.newUser);
	    		   $scope.list.push($scope.newUser);
	    		   $("#myModal").modal("hide");
	    	   }
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
<section class="" data-ng-app="app" data-ng-controller="controller">
	<h1>match record</h1>
	인원추가:<button type="button" class="btn btn-primary plusp" data-ng-click="modal()">+</button>
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
		<tbody>
			<tr class="people" data-ng-repeat="row in list">
				<td>{{row.col1}}</td>
				<td>{{row.col2}}</td>
				<td><span class="score2">{{row.col3}}</span> <button type="button" class="btn btn-success score2" data-ng-click="btn(row, '+', 'col3', 'Y')">+</button><button type="button" class="btn btn-danger score2" data-ng-click="btn(row, '-', 'col3', 'Y')">-</button>
				</td>
				<td><span class="score3">{{row.col4}}</span> <button type="button" class="btn btn-success score3" data-ng-click="btn(row, '+', 'col4', 'Y')">+</button><button type="button" class="btn btn-danger score3" data-ng-click="btn(row, '-', 'col4', 'Y')">-</button>
				</td>
				<td><span class="score1">{{row.col5}}</span> <button type="button" class="btn btn-success score1" data-ng-click="btn(row, '+', 'col5', 'Y')">+</button><button type="button" class="btn btn-danger score1" data-ng-click="btn(row, '-', 'col5', 'Y')">-</button>
				</td>
				<td><span class="foul">{{row.col6}}</span> <button type="button" class="btn btn-success foul" data-ng-click="btn(row, '+', 'col6')">+</button><button type="button" class="btn btn-danger foul" data-ng-click="btn(row, '-', 'col6')">-</button> 
				</td>
				<td><span class="assist">{{row.col7}}</span> <button type="button" class="btn btn-success assist" data-ng-click="btn(row, '+', 'col7')">+</button><button type="button" class="btn btn-danger assist" data-ng-click="btn(row, '-', 'col7')">-</button>
				</td>
				<td><span class="steal">{{row.col8}}</span> <button type="button" class="btn btn-success steal" data-ng-click="btn(row, '+', 'col8')">+</button><button type="button" class="btn btn-danger steal" data-ng-click="btn(row, '-', 'col8')">-</button>
				</td>
				<td><span class="block">{{row.col9}}</span> <button type="button" class="btn btn-success block" data-ng-click="btn(row, '+', 'col9')">+</button><button type="button" class="btn btn-danger block" data-ng-click="btn(row, '-', 'col9')">-</button>
				</td>
				<td><span class="turnover">{{row.col10}}</span> <button type="button" class="btn btn-success turnover" data-ng-click="btn(row, '+', 'col10')">+</button><button type="button" class="btn btn-danger turnover" data-ng-click="btn(row, '-', 'col10')">-</button>
				</td>
				<td><span class="totalscore">{{row.col11}}</span>
				</td>	
			</tr>
		</tbody>
	</table>
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
	        		<input type="radio" name="team" data-ng-model="newUser.col1" value="home"> home
	        	</label>
	        	<label class="radio-inline">
	        		<input type="radio" name="team" data-ng-model="newUser.col1" value="away"> away
	        	</label>
	        	
	        	<div class="input-group">
	        		<label for="p_name" class="form-group">이름:</label>
	        		<input type="text" class="form-control" placeholder="선수이름입력을 입력하세요" data-ng-model="newUser.col2">
	        		<div class="input-group-btn vab"><br>
		        <button class="btn btn-default " type="submit"><i class="glyphicon glyphicon-search"></i></button>
		    </div>
	        	</div>
	        	<input type="submit" class="btn btn-default" value="등록" data-ng-click="add()">
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
