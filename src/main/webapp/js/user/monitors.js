$(function(){
	//总人数
	//启用人数
	//启用人数比例
	function alluser(){
		$.ajax({
			url:"qiyonguser",
			data:{},
			dataType:"json",
			type:"POST",
			success:function(data){
				$("#alluser").text(data.totalCount);
				$("#qiyonguser").text(data.enableCount+"/"+data.unuseCount);
				$("#qiyongbili").text(((data.enableCount/data.totalCount)*100).toFixed(2)+"%");
			}
		})
	}
	
	alluser();
	
	//mimauser
	//重置人数
	//重置比例
	function chongzhi(){
		$.ajax({
			url:"resetuser",
			data:{},
			dataType:"json",
			type:"POST",
			success:function(data){
				$("#mimauser").text(data.resetPasswdTotalCount);
				$("#chongzhiuser").text(data.resetPasswdUserCount);
				$("#chongzhibili").text(((data.resetPasswdUserCount/data.totalUserCount)*100).toFixed(2)+"%");
			}
		})
	}
	chongzhi();
	
	//登录总次数
	var logincount;
	//活跃人数
	var huoyueuser;
	//活跃人数比例
	var huoyueuserbili;
	function loginuser(){
		$.ajax({
			url:"loguser",
			data:{},
			dataType:"json",
			type:"POST",
			success:function(data){
				$("#logincount").text(data.loginCount);
				$("#huoyueuser").text(data.loginUserCount);
				$("#huoyueuserbili").text(((data.loginUserCount/data.totalUserCount)*100).toFixed(2)+"%");
			}
		})
	}
	loginuser();
	
	
	
	//定时刷新
	setInterval(showalert, 1000*60*5); 
	function showalert() 
	{ 
		alluser();
		chongzhi();
		loginuser();
	} 
})