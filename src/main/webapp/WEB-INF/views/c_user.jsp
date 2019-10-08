<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/Main.css" >

<style>


.bgray{
	background-color: #f1f1f1;
}
.linep10{
	padding:10px 0;
}

.biw100{
	width:100%;
	height:calc(850px - 162px);
	background-image: url('https://news.hmgjournal.com/upload/common/activeSquare/binary/slamdunk-1[0].jpg');
	background-repeat: no-repeat;
	background-position: top;
	background-size:cover;
}

.ptb50p{
	padding:25px 0;
}

</style>

</head>
<body>
	<section class="container-fluid">
		<div class="row content">
			 <nav class="col-sm-3 sidenav">
				 <ul class="menu nav nav-pills nav-stacked">
				 	<li class="active"><a href="/">Home</a></li>
				 	<li class=""><a href="/bodyinfo_register">신체정보등록</a></li>
				 	<li class=""><a href="/player_recommand">선수추천목록</a>
				 	<li class=""><a href="/exercise_recommand">운동목록</a>
				 	<li class=""><a href="/m_list">경기기록</a>
				 	<li id="admin" class="hidden"><a href="/admin">관리자</a>
				 </ul>
				 <div class="hidden" id="userinfo">
					<form class="row form-group">
						<div class="col-sm-12 ">
							<div class="form-control text-center ">Admin</div>
						</div>
						<div class="col-sm-6">
							<button class=" btn form-control">내정보</button>
						</div>
						<div class="col-sm-6">
							<button class=" btn form-control">로그아웃</button>
						</div>
					</form>	 
				 </div>
			 </nav>
			 
		 	 <section class="col-sm-9">
				<header class="jumbotron bgc">
					<div class="container text-center">
						<img src="http://www.gdu.co.kr/images/main/logo.png" alt="IMAGE">
					</div>
				</header>
				<div class="bgray linep10"></div>	
				<div class="biw100 imgw">
					<div class="ptb50p"></div>
					
					<div class="container well mt50p">
						<form class="form-horizontal">
							<div class="form-group ">
								<div class="col-sm-offset-5 ">
									<label class="control-label">회원가입</label>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-1" for="id"> id:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="user_id" id="id" placeholder="아아디를입력해주세요">
								</div>
								<div class="col-sm-1">
									<button type="button" class="btn form-contorl" id="idcheck">확인</button>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-1" for="pw"> pw:</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" name="user_pw" id="pw" placeholder="비밀번호를입력해주세요">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-1" for="pw2"> 확인:</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" name="pw2" id="pw2" placeholder="비밀번호를확인해주세요">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-1" for="email"> email:</label>
								<div class="col-sm-9">
									<input type="email" class="form-control" name="user_email" id="email" placeholder="이메일을입력해주세요">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-1 col-sm-4">
									<button class="btn form-control" formaction="/">뒤로가기</button>
								</div>
								<div class=" col-sm-4">
									<button type="button" class="btn form-control" id="create">회원가입</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			
			</section>
		</div>
		
	</section>
	<footer>
	 <div>
	 </div>
	</footer>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			var idflag=0;
			var pwflag=0;
			
			/* id중복검사 */
			$("#idcheck").click(function(){
				var id = $("#id").val();
				if(id == ""){
					alert("아이디를 입력해주세요");
				}else{
					$.ajax({
						url:"/idcheck",
						type:"POST",
						data:{"id": id}
					}).done(function(data){
						if(data == "true"){
							alert("아이디 사용가능합니다");
							idflag=1;
							$("#id").css("borderColor", "#86E57F");
						}else{
							$("#id").css("borderColor", "red");
							alert("아이디값이 중복됩니다");
						}
					});
				}
			});
			
			/*비밀번호중복검사*/
			$("#pw").change(function(){
				var pw = $("#pw").val();
				var pw2 = $("#pw2").val();
				if( pw2 != "" ){
					$("#pw2").css("borderColor", "#86E57F");
					if(pw == pw2){
						$("#pw1").css("borderColor", "#86E57F");
						pwflag=1;
					}else{
						$("#pw1").css("borderColor", "red");
					}
				}else{
					$("#pw2").css("borderColor", "red");
				}
			})
			$("#pw2").change(function(){
				var pw = $("#pw").val();
				var pw2 = $("#pw2").val();
				if( pw != "" ){
					$("#pw").css("borderColor", "#86E57F");
					if(pw == pw2){
						$("#pw2").css("borderColor", "#86E57F");
						pwflag=1;
					}else{
						$("#pw2").css("borderColor", "red");
					}
				}else{
					$("#pw").css("borderColor", "red");
				}
			});
			
			$("#create").click(function(){
				console.log("zzzz", idflag,"--id",pwflag, "--pw")
				
				var re = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	       		// 이메일이 적합한지 검사할 정규식
				var email = $("#email").val();
				
				if(idflag ==1 && pwflag ==1){
					console.log(email)
					if(email=="") {
				           alert("이메일을 입력해 주세요");
				           return false;
				       }else{
				    	   
						$.ajax({
							url:"/createuser",
							type:"POST",
							data:{"user_id": $("#id").val(),
								  "user_pw": $("#pw").val(),
								  "user_email": $("#email").val()
							}
						}).done(function(data){
							console.log(data);
							if( data == "1"){
								alert("회원가입성공");
								location.href="/";
							}else{
								alert("회원가입실패")
								location.href="/c_user";
							}
						});
				    	   
				       }
					
				}else{
					alert("회원정보를 확인해주세요");
				}
			});
			
		})
	
	
	</script>
</body>
</html>