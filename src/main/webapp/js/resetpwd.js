var intervalProcess;
var pubtelephone;
// 录入账户鼠标移动校验
function accountout() {
	var f = document.reset;
	var account = f.account.value;
	if (account == "" || account == null) {
		document.getElementById('accountmsg').innerHTML = "<spring:message code='screen.resetpassword.account.jspcheck' />";
	} else {
		document.getElementById('accountmsg').innerHTML = "";
	}
}
// 验证码鼠标移动校验
function verifycodeout() {
	var f = document.reset;
	var account = f.account.value;
	var verifycode = f.verifycode.value;
	var checkcode = f.checkcode.value;
	var cookiecode = getCookie(account+"_checkcode");
	if (checkcode == "" || checkcode == null) {
		document.getElementById('verifycodemsg').innerHTML = "<spring:message code='screen.resetpassword.checkcode.jspcheck' />";
	}else if (cookiecode == "" || cookiecode == null) {
		document.getElementById('verifycodemsg').innerHTML = "<spring:message code='screen.resetpassword.cookiecode.jspcheck' />";
	} else if (verifycode == "" || verifycode == null) {
		document.getElementById('verifycodemsg').innerHTML = "<spring:message code='screen.resetpassword.verifycode.jspcheck' />";
	} else if (verifycode != checkcode){
		document.getElementById('verifycodemsg').innerHTML = "spring:message code='screen.resetpassword.verifycode.checkcode.check' />";
	}else if (verifycode == "" || verifycode == null){
		document.getElementById('verifycodemsg').innerHTML = "";
	}
}
// 新密码鼠标移动校验
function newpwdout() {
	var f = document.reset;
	var newpwd = f.newpwd.value;
	if (newpwd == "" || newpwd == null) {
		document.getElementById('newpwdmsg').innerHTML = "<spring:message code='screen.resetpassword.newpwd.check' />";
	} else {
		document.getElementById('newpwdmsg').innerHTML = "";
	}
}
// 确认鼠标移动校验
function confirmpwdout() {
	var f = document.reset;
	var newpwd = f.newpwd.value;
	var confirmpwd = f.confirmpwd.value;
	if (confirmpwd == "" || confirmpwd == null) {
		document.getElementById('confirmpwdmsg').innerHTML = "<spring:message code='screen.resetpassword.confirmpwd.check' />";
	} else if (confirmpwd == newpwd) {
		document.getElementById('confirmpwdmsg').innerHTML = "";
	} else {
		document.getElementById('confirmpwdmsg').innerHTML = "<spring:message code='screen.resetpassword.pwd.check' />";
	}
}
// 下一步校验
function check() {
	var f = document.reset;
	var account = f.account.value;
	var index = f.index.value;
	if (index == "" || index == null) {
		if (account == "" || account == null) {
			document.getElementById('index').value = "";
			document.getElementById('resetform-telephone').style.display = "none";
			document.getElementById('resetform-verifycode').style.display = "none";
			document.getElementById('accountmsg').innerHTML = "<spring:message code='screen.resetpassword.account.jspcheck' />";
		} else {
			var msg = "{\"account\":" + account + "}";
			$.ajax({
				url : "${ctx}/resetpwd/getTelephone",
				contentType : 'application/json;charset=UTF-8',
				type : "POST",
				dataType : "json",
				data : msg,
				async : false,
				success : function(data) {
					var telephone = data.telephoneNumber;
					if (telephone == "" || telephone == null) {
						document.getElementById('index').value = "";
						document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.telephone.ldapcheck' />";
					} else {
						pubtelephone = telephone;
						var index = telephone.length;
						var start = telephone.substring(0, index - 8);
						var end = telephone.substring(index - 4, index);
						telephone = start + "****" + end;
						document.getElementById('telephone').value = telephone;
						document.getElementById('resetform-telephone').style.display = "block";
						document.getElementById('resetform-verifycode').style.display = "block";
						document.getElementById('resetform-errormsg').innerHTML = "";
						document.getElementById('index').value = "1";
					}
				},
				error : function() {
					document.getElementById('index').value = "";
					document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.query.telephonecheck' />";
				}
			});
		}
	}
	var verifycode = f.verifycode.value;
	var checkcode = f.checkcode.value;
	var account = f.account.value;
	var cookiecode = getCookie(account+"_checkcode");
	if (index == "1") {
		if (checkcode == "" || checkcode == null) {
			document.getElementById('verifycodemsg').innerHTML = "<spring:message code='screen.resetpassword.checkcode.jspcheck' />";
		}
	}
	if (index == "2") {
		if (verifycode == "" || verifycode == null) {
			document.getElementById('verifycodemsg').innerHTML = "<spring:message code='screen.resetpassword.verifycode.jspcheck' />";
		}else if (cookiecode == "" || cookiecode == null) {
			document.getElementById('verifycodemsg').innerHTML = "<spring:message code='screen.resetpassword.cookiecode.jspcheck' />";
		} else if (cookiecode == verifycode) {
			document.getElementById('resetform-newpwd').style.display = "block";
			document.getElementById('resetform-confirmpwd').style.display = "block";
			document.getElementById('resetform-submit').style.display = "block";
			document.getElementById('resetform-next').style.display = "none";
			document.getElementById('verifycodemsg').innerHTML = "";
		} else {
			document.getElementById('verifycodemsg').innerHTML = "<spring:message code='screen.resetpassword.verifycode.checkcode.check' />";
		}
	}
}
// 获取验证码
function getVerifyCode() {
	var f = document.reset;
	var telephone = f.telephone.value;
	var account = f.account.value;
	if (telephone == "" || telephone == null) {
		document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.telephone.jspcheck' />";
	} else {
		telephone = pubtelephone;
		// 启动倒数秒
		document.getElementById('timeout').value = "6";
		document.getElementById('verifycodebutton').disabled = true;
		intervalProcess = setInterval("myInterval()", 1000);// 1000为1秒钟
		var msg = "{\"account\":" + account + ",\"telephone\":" + telephone
				+ "}";
		$.ajax({
			url : "${ctx}/resetpwd/getVerifyCode",
			contentType : 'application/json;charset=UTF-8',
			type : "POST",
			dataType : "json",
			data : msg,
			async : false,
			success : function(data) {
				var checkcode = data.checkcode;
				if (checkcode == "" || checkcode == null) {
					document.getElementById('index').value = "1";
					document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.telephone.ldapcheck' />";
				} else {
					document.getElementById('checkcode').value = checkcode;
					setCookie(account+"_checkcode",checkcode);
					document.getElementById('resetform-errormsg').innerHTML = "";
					document.getElementById('index').value = "2";
				}
			},
			error : function() {
				document.getElementById('index').value = "1";
				document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.query.telephonecheck' />";
			}
		});
	}
}
// 执行倒数秒
function myInterval() {
	var f = document.reset;
	var timeout = f.timeout.value;
	timeout = timeout - 1;
	if (timeout == 0) {
		clearInterval(intervalProcess);
		document.getElementById('verifycodebutton').disabled = false;
		document.getElementById('verifycodebutton').value = "<spring:message code='screen.resetpassword.verifycodebutton' />";
	} else {
		document.getElementById('timeout').value = timeout;
		document.getElementById('verifycodebutton').value = timeout + "s";
	}

}

// 提交校验
function submitCheck() {
	var f = document.reset;
	var account = f.account.value;
	var newpwd = f.newpwd.value;
	var confirmpwd = f.confirmpwd.value;
	if (newpwd == "" || newpwd == null) {
		document.getElementById('newpwdmsg').innerHTML = "<spring:message code='screen.resetpassword.newpwd.check' />";
	} else {
		document.getElementById('newpwdmsg').innerHTML = "";
	}
	if (confirmpwd == "" || confirmpwd == null) {
		document.getElementById('confirmpwdmsg').innerHTML = "<spring:message code='screen.resetpassword.confirmpwd.check' />";
	} else {
		document.getElementById('confirmpwdmsg').innerHTML = "";
	}
	if (confirmpwd == newpwd) {
		var msg = "{\"account\":" + account + ",\"pwd\":" + newpwd + "}";
		$.ajax({
			url : "${ctx}/resetpwd/resetPassWord",
			contentType : 'application/json;charset=UTF-8',
			type : "POST",
			dataType : "json",
			data : msg,
			async : false,
			success : function(data) {
				var ret = data.ret;
				if (ret == "" || ret == null) {
					document.getElementById('resetform-errormsg').innerHTML = "";
				} else {
					document.getElementById('checkcode').value = checkcode;
					document.getElementById('resetform-errormsg').innerHTML = "";
				}
			},
			error : function() {
				document.getElementById('resetform-errormsg').innerHTML = "";
			}
		});
		document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.resetpwd.success' />";
	} else {
		document.getElementById('confirmpwdmsg').innerHTML = "<spring:message code='screen.resetpassword.pwd.check' />";
	}
}
//写cookies
function setCookie(name,value){
	var Days = 5;
	var exp = new Date(); 
	exp.setTime(exp.getTime() + Days*1000);
	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

//读取cookies
function getCookie(name){
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg)) return unescape(arr[2]);
	else return null;
}