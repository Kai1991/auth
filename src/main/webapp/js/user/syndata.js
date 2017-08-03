function synorg(){
	 $("#synorg").button('loading');
	 $("#syndept").button("loading");
	 $("#synuser").button("loading");
	 var myDate =new Date();
	 var starttime =myDate.getTime();
	$.ajax({
		url:"synOrg",
		data:{
		},
		dataType:"text",
		success:function(data){
			
			var syndata =data.substring(1,data.length)
			if(data.substring(0,1)==0){
				if(syndata!=""){
					var sss=data.split("$\n");
					var html="";
					for(var i=0;i<sss.length;i++){
						html+="<tr><td>"+sss[i]+"</td></tr>";
					}
					$("#table").html(html);
				}else{
					$("#orgmsg").html("同步数据成功");
					$("#table").html("");
				}
			}else{
				$("#orgmsg").html("同步数据失败");
			}
			var endtime =new Date().getTime();
			$("#orgtime").html("耗时："+((endtime-starttime)/1000)+"秒");
			 
			$("#synorg").button('reset');	
			 $("#syndept").button("reset");
			 $("#synuser").button("reset");

		}
	})
}
function checkorg(){
	 $("#checkorg").button('loading');
	 var myDate =new Date();
	 var starttime =myDate.getTime();
	$.ajax({
		url:"checkOrg",
		data:{
		},
		dataType:"text",
		success:function(data){
			var syndata =data.substring(1,data.length)
			if(data.substring(0,1)==0){
				if(syndata!=""){
					var sss=data.split("$\n");
					var html="";
					for(var i=0;i<sss.length;i++){
						html+="<tr><td>"+sss[i]+"</td></tr>";
					}
					$("#table").html(html);
				}else{
					$("#orgmsg").html("数据无异常");
					$("#table").html("");
				}
			}else{
				$("#orgmsg").html("同步数据失败");
			}
			var endtime =new Date().getTime();
			$("#orgtime").html("耗时："+((endtime-starttime)/1000)+"秒");
			 
			$("#checkorg").button('reset');	

		}
	})
}

function syndept(){
	 $("#syndept").button("loading");
	 $("#synorg").button('loading');
	 $("#synuser").button("loading");

	 var starttime1 =new Date().getTime();
	$.ajax({
		url:"synDept",
		data:{
		},
		dataType:"text",
		success:function(data){
			
			var syndata =data.substring(1,data.length)
			if(data.substring(0,1)==0){
				if(syndata!=""){
					var sss=data.split("$\n");
					var html="";
					for(var i=0;i<sss.length;i++){
						html+="<tr><td>"+sss[i]+"</td></tr>";
					}
					$("#table").html(html);
				}else{
					$("#deptmsg").html("同步数据成功 ");
				}
			}else{
				$("#deptmsg").html("同步数据失败");
			}
			var endtime1 =new Date().getTime();
			 $("#depttime").html("耗时："+((endtime1-starttime1)/1000)+"秒");
			 $("#synorg").button("reset");
			 $("#syndept").button("reset");
			 $("#synuser").button("reset");
		}
	})	
}
function checkdept(){
	 $("#checkdept").button("loading");

	 var starttime1 =new Date().getTime();
	$.ajax({
		url:"checkDept",
		data:{
		},
		dataType:"text",
		success:function(data){
			var syndata =data.substring(1,data.length)
			if(data.substring(0,1)==0){
				if(syndata!=""){
					var sss=data.split("$\n");
					var html="";
					for(var i=0;i<sss.length;i++){
						html+="<tr><td>"+sss[i]+"</td></tr>";
					}
					$("#table").html(html);
				}else{
					$("#deptmsg").html("数据无异常");
					$("#table").html("");
				}
			}else{
				$("#deptmsg").html("同步数据失败");
			}
			var endtime1 =new Date().getTime();
			 $("#depttime").html("耗时："+((endtime1-starttime1)/1000)+"秒");
			 $("#checkdept").button("reset");
		}
	})	
}
function synuser(){
	 $("#synorg").button('loading');
	 $("#syndept").button("loading");
	 $("#synuser").button("loading");

	 var starttime2 =new Date().getTime();
	$.ajax({
		url:"synUser",
		data:{
		},
		dataType:"text",
		success:function(data){
			if(data.substring(0,1)=="<"){
				$("#table").html("查看数据点击连接："+data);
			}else{
				var syndata =data.substring(1,data.length)
				if(data.substring(0,1)==0){
					if(syndata!=""){
						var sss=data.split("$\n");
						var html="";
						for(var i=0;i<sss.length;i++){
							html+="<tr><td>"+sss[i]+"</td></tr>";
						}
						$("#table").html(html);
					}else{
						$("#usermsg").html("同步数据成功");
					}
				}else{
					$("#usermsg").html("同步数据失败");
				}
			}
			var endtime2 =new Date().getTime();
			$("#usertime").html("耗时："+((endtime2-starttime2)/1000)+"秒");
			$("#synorg").button('reset');	
			 $("#syndept").button("reset");
			 $("#synuser").button("reset");
		}
	})
}
function checkuser(){
	 $("#checkuser").button("loading");

	 var starttime2 =new Date().getTime();
	$.ajax({
		url:"checkUser",
		data:{
		},
		dataType:"text",
		success:function(data){
			if(data.substring(0,1)=="<"){
				$("#table").html("查看数据点击连接："+data);
			}else{
				var syndata =data.substring(1,data.length)
				if(data.substring(0,1)==0){
					if(syndata!=""){
						var sss=data.split("$\n");
						var html="";
						for(var i=0;i<sss.length;i++){
							html+="<tr><td>"+sss[i]+"</td></tr>";
						}
						$("#table").html(html);
					}else{
						$("#usermsg").html("数据无异常");
						$("#table").html("");
					}
				}else{
					$("#usermsg").html("同步数据失败");
				}
			}
			var endtime2 =new Date().getTime();
			$("#usertime").html("耗时："+((endtime2-starttime2)/1000)+"秒");
			$("#checkuser").button("reset");
		}
	})
}