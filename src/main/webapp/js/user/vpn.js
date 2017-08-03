//开通vpn
function startvpn(vpn){
	var btn = $("#"+vpn);
    btn.button('loading');
    setTimeout(function () { btn.button('reset'); },3000);
	$.ajax({
		url:"startvpn",
		dataType:"text",
		type:"post",
		async : false,
		data:{
			"cn":vpn
		},
		success:function(data){
			$("#"+vpn+"a").html("");
			var button="<button type='button' id="+vpn+" onclick=offvpn('"+vpn+"') class='btn btn-danger' data-loading-text='Loading'>停用</button>";
			$("#"+vpn+"a").html(button);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			alert(XMLHttpRequest.status);
			alert(XMLHttpRequest.readyState);
			alert(textStatus);
		}
		
	});
}		
//关闭vpn账号
function offvpn(vpn){
	var btn = $("#"+vpn);
    btn.button('loading');
    setTimeout(function () { btn.button('reset'); },3000);
	$.ajax({
		url:"offvpn",
		dataType:"text",
		type:"post",
		async : false,
		data:{
			"cn":vpn
		},
		success:function(data){
			$("#"+vpn+"a").html("");
			var button="<button type='button' id="+vpn+" onclick=startvpn('"+vpn+"')  class='btn btn-success' data-loading-text='Loading'>启用</button>";			
			$("#"+vpn+"a").html(button);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			alert(XMLHttpRequest.status);
			alert(XMLHttpRequest.readyState);
			alert(textStatus);
		}
	})
}



