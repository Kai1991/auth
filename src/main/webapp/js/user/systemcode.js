//上传图片
function shangChuan(){
			var option = {
				url:"uploadF",//如果option中存在url那么就提交到url上，如果不存在url，提交到form表单的action上
				type:"post",
				dataType:"text",
				data:{
					fileName:"pic"
				},
				success:function(responseText){
					//把json字符串转换成json对象
				},
				error:function(){
					alert("异步上传错误");
				}
		};
		//通过ajax方式提交表单，页面没跳转 
		$("#myForm").ajaxSubmit(option);
}
function shangChuan1(){
	var option = {
		url:"uploadF1",//如果option中存在url那么就提交到url上，如果不存在url，提交到form表单的action上
		type:"post",
		dataType:"text",
		data:{
			fileName:"pic1"
		},
		success:function(responseText){
			//把json字符串转换成json对象
		},
		error:function(){
			alert("异步上传错误");
		}
};
//通过ajax方式提交表单，页面没跳转 
$("#myForm1").ajaxSubmit(option);
}
function tijiao(){
	var systemCodeCode=$("#systemCodeCode").val();
	var systemCodeMiao=$("#systemCodeMiao").val();
	var systemCodeUrl=$("#systemCodeUrl").val();
	var systemCodeLevel=$("#systemCodeLevel").val();
	var systemCodeName=$("#systemCodeName").val();
	var flag =true;
	if(systemCodeCode==null || systemCodeCode==""){
		$("#systemCodeCodeMsg").html("编码不能为空");
		flag =false;
	}else{
		$("#systemCodeCodeMsg").html("");
	}
	if($("#pic").val()==null || $("#pic").val()==""){
		$("#picMsg").html("图片不能为空");
		flag=false;
	}else{
		$("#picMsg").html("");
	}
	if(flag){
		$("#ok").attr("data-dismiss","modal");
	}
	if(flag){
		$.ajax({
			url:"addSystemCode",
			type:"post",
			data:{
				"systemCodeName":systemCodeName,
				"systemCodeUrl":systemCodeUrl,
				"systemCodeLevel":systemCodeLevel,
				"systemCodeMiao":systemCodeMiao,
				"systemCodeCode":systemCodeCode
			},
			dataType:"text",
			success:function(data){
				 location.reload();
			}
		})
	}
}


function updateSystem(data){
	$("#hidden").val(data);
	$.ajax({
		url:"selectSystemCodeById",
		type:"post",
		async:false,
		data:{
			"id":data
		},
		dataType:"json",
		success:function(text){
			$("#systemCodeUpdateCode").val(text.systemcode);
			$("#systemCodeUpdateUrl").val(text.url);
			$("#systemCodeUpdateLevel").val(text.level);
			$("#systemCodeUpdateMiao").val(text.description);
			$("#systemCodeUpdateName").val(text.systemName);
		}
	});


}

function updateOk(){
	var id =$("#hidden").val();
	var image;
	if($("#pic1").val()=="" || $("#pic1").val()==null){
		image=0;
	}else{
		image=1;
	}
	$.ajax({
		url:"updateSystemCodeById",
		type:"post",
		async:false,
		data:{
			"id":id,
			"systemcode":$("#systemCodeUpdateCode").val(),
			"url":$("#systemCodeUpdateUrl").val(),
			"level":$("#systemCodeUpdateLevel").val(),
			"systemName":$("#systemCodeUpdateName").val(),
			"systemcodeImage":image,
			"description":$("#systemCodeUpdateMiao").val()
		},
		dataType:"json",
		success:function(text){
			location.reload();
		}
	})	
}
function deleteSystem(data){
	var result=confirm("您确认要删除吗？");
	if(result){
		$.ajax({
			url:"deleteSystemCode",
			type:"POST",
			async:false,
			data:{
				"id":data
			},
			dataType:"json",
			success:function(data){
				if(data==1){
					location.reload();
				}else{
					alert("删除失败，联系管理员");
				}
			}
		})
	}
}












