//银行退票
$(function(){
	var userCode = $("#userCode").val();
	var url = "/oafms/oafmsrestapi/user/getmsglist";
	$.ajax({
		url:url,
		type:"post",
		//async:false,
		dataType:"json",
		data:{
			"userCode":userCode
		},
		success:function(data){
			if (data == "") {
				return;
			}
			$("#backticket_container").show();
			//"<li><a href='#' target='_blank'>报销单1</a><span class='time'>2016-12-12</span></li>"
			var obj = data.backTicketList;
			$(obj).each(function(index) {
		        var val = obj[index];
		        if (typeof (val.sourceNo) == "string") {
		        	$("#backtick_list_ul").append("<li class=\"back_li back_pop_up\" onClick=\"back_pop_up("
		        			+val.oadataMsgDTO.id+")\">" 
//		        			+"<a href='"+edit_url+val.oadataMsgDTO.id+"' target='_blank'>"
		        			+val.sourceNo+
//		        			"</a>" +
		        			"<span class='time'>"
		        			+val.dateStr+"</span></li>");
			    }
			});
			//bind_back_pop_up();
		}
	});
	
	//提交按钮绑定事件
	bind_submit_button();
	
})

//退票_弹出窗绑定事件
function back_pop_up(id){
	$(".opacity_bg").fadeIn();
	$(".ball_city").fadeIn();
	
	$(".ball_city li").click(function() {
		$(this).addClass("check");
	})
	
	$(".close_rt").click(function() {
		back_cancel();
	})
	$("#back_cancel").click(function() {
		back_cancel();
	})
	
	//请求数据并为弹出框赋值
	post_pop_data(id);
}

//退票_取消
function back_cancel(){
	$(".opacity_bg").fadeOut();
	$(".ball_city").fadeOut();
	//清空内容
	$(".back_rows input").val("");
	$(".back_rows textarea").val("");
	$("#dateStr").html("");//退票日期
}

//退票_请求数据并为弹出框赋值
function post_pop_data(id){
	var url = "/oafms/oafmsrestapi/user/modify";
	$.ajax({
		url:url,
		type:"post",
//		async:false,
		dataType:"json",
		data:{
			"id":id
		},
		success:function(data){
			if (data == "") {
				return;
			}
			//填充数据
			input_data(data);
		}
	});
}

//退票_填充弹窗数据
function input_data(data){
	$("#toAccountName").val(data.backVO.toAccountName);
	$("#toAccountName_hidden").val(data.backVO.toAccountName);
	$("#userCode").val(data.userCode);
	$("#msgdtoId").val(data.msgdtoId);
	$("#toAccountCode").val(data.backVO.toAccountCode);
	$("#toAccountCode_hidden").val(data.backVO.toAccountCode);
	$("#toBankBranch").val(data.backVO.toBankBranch);
	$("#toBankBranch_hidden").val(data.backVO.toBankBranch);
	$("#dateStr").html(data.backVO.dateStr);//退票日期
	$("#remark").val(data.backVO.remark);
	//更新提交按钮状态
	if (data.result =='BACK_TICKET_FINISH') {
		$("#back_submit").text("已修改").attr("disabled",true);
	}else {
		$("#back_submit").text("提交").attr("disabled",false);
	}
}

//退票_提交按钮绑定事件
function bind_submit_button(){
	$("#back_submit").click(function(){
		$("#back_submit").attr("disabled","disabled");//$("#back_submit").removeAttr("disabled");
		if(checkparam()){//不通过
			$("#back_submit").removeAttr("disabled");
			return;
		}
		$("#back_submit").text("提交中...");
		var result = backSubmit();//提交
		if(result==true){
			$("#back_submit").text("已修改");
		}else if(result==false){
			$("#back_submit").removeAttr("disabled");
			$("#back_submit").text("提交");
		}
	});
}

//退票_弹窗参数校验
function checkparam(){debugger;
	var toAccountName = $("#toAccountName").val().trim();
	var toAccountCode = $("#toAccountCode").val().trim();
	var toBankBranch = $("#toBankBranch").val().trim();
	var toAccountName_hidden = $("#toAccountName_hidden").val().trim();
	var toAccountCode_hidden = $("#toAccountCode_hidden").val().trim();
	var toBankBranch_hidden = $("#toBankBranch_hidden").val().trim();
	if(toAccountName==""||toAccountCode==""||toBankBranch==""){
		alert("参数存在空值");
		return true;//不通过
	}
	if(toAccountName==toAccountName_hidden && toAccountCode==toAccountCode_hidden && toBankBranch==toBankBranch_hidden){
		alert("您没有修改任何项");
		return true;//不通过
	}
	return false;//通过
}

//退票_提交给后端
function backSubmit(){
	var result = false;
	var msgdtoId = $("#msgdtoId").val().trim();
	//var userCode = $("#userCode").val().trim();
	var toAccountName = $("#toAccountName").val().trim();
	var toAccountCode = $("#toAccountCode").val().trim();
	var toBankBranch = $("#toBankBranch").val().trim();
	
	var url = "/oafms/oafmsrestapi/user/edit";
	
	$.ajax({
		url:url,
		type:"post",
		async:false,
		dataType:"json",
		data:{
			"msgdtoId":msgdtoId,
			"toAccountName":toAccountName,
			"toAccountCode":toAccountCode,
			"toBankBranch":toBankBranch
		},
		success:function(data){
			if (data.status == 1) {
				result =  true;
			}else{
				alert("修改失败");
				result =  false;
			}
		}
	});
	return result;
//	return true;
}
