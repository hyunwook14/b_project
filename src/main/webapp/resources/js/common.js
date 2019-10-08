function myinfoload(id){
	if( id != ""){
		 if( id == "admin"){
				$("#admin").removeClass("hidden");	
			}
		html =`<form class="row form-group">
				<div class="col-sm-12 ">
					<div class="form-control text-center">${id}</div>
				</div>
				<div class="col-sm-6">
					<button type="button" id="myinfobtn" class=" btn form-control">내정보</button>
				</div>
				<div class="col-sm-6">
					<button class=" btn form-control" formaction="/logout">로그아웃</button>
				</div>
			   </form>	 `;
	}
	$("#myinfo").append(html);
}