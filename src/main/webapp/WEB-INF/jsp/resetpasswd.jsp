<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US">
<head profile="http://gmpg.org/xfn/11">
<!-- <title>忘记密码</title> -->
<title><spring:message code="screen.resetpassword.reset" /></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/mc-login.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/base.css" />
<script src="${ctx}/bootstrap/js/jquery-1.11.0.min.js"></script>
<script src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
<SCRIPT LANGUAGE="JavaScript" src=http://float2006.tq.cn/floatcard?adminid=9685234&sort=0 ></SCRIPT>
<script type="text/javascript" src="${ctx}/js/md5.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/md5.js"></script>

</head>
<script type="text/javascript">
	var intervalProcess;
	// 下一步校验
	function check() {
		var f = document.reset;
		var account = f.account.value;
		var index = f.index.value;
		if (index == "" || index == null) {
			if (account == "" || account == null || $("#captcha").val() == null || $("#captcha").val() == "") {
				document.getElementById('index').value = "";
				document.getElementById('telephone-verifycode').style.display = "none";
				document.getElementById('resetform-telephone').style.display = "none";
				document.getElementById('resetform-verifycode').style.display = "none";
				document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.account.jspcheck' />";
			} else {
				//if(account.indexOf("@") > -1){
				//	document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.account.inputcheck' />";
				//	return;
				//}
				var msg = "{\"account\":\"" + account + "\",\"captcha\":\"" + $("#captcha").val() + "\"}";
				$
						.ajax({
							url : "${ctx}/resetpwd/getTelephone",
							contentType : 'application/json;charset=UTF-8',
							type : "POST",
							dataType : "json",
							data: msg,
							async : false,
							success : function(data) {
								var ret = data.ret;
								var telephone = data.telephoneNumber;
								if (ret=="success") {
									document.getElementById('telephone').value = telephone;
									document.getElementById('resetform-account').style.display = "none";
									document.getElementById('telephone-verifycode').style.display = "block";
									document.getElementById('resetform-telephone').style.display = "block";
									document.getElementById('resetform-verifycode').style.display = "block";
									document.getElementById('accountDiv').className = "T-green-bg";
									document.getElementById('verifycodeLi').className = "T-password-green";
									document.getElementById('resetform-errormsg').innerHTML = "";
									document.getElementById('index').value = "1";
// 									var barLength = document.getElementById('bar');
// 									barLength.style.width = "33%";
								} else if (ret=="error_nophone") {
									document.getElementById('index').value = "";
									document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.telephone.ldapcheck' />";
								} else if (ret=="error_noaccount"){
									document.getElementById('index').value = "";
									document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.error.noaccount' />";
								} else if (ret=="error_captcha") {
									$('#index').val();
									$('#resetform-errormsg').html("验证码不正确！");
								} else {
									document.getElementById('index').value = "";
									document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.connect.fail' />";
								}
							},
							error : function() {
								document.getElementById('index').value = "";
								document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.connect.fail' />";
							}
						});
			}
		}
		var verifycode = f.verifycode.value;
		var checkcode = f.checkcode.value;
		var account = f.account.value;
		if (index == "1") {
			//document.getElementById('accountmsg').innerHTML = "";
			if (checkcode == "" || checkcode == null) {
				document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.checkcode.jspcheck' />";
			}
		}
		if (index == "2") {
			if (verifycode == "" || verifycode == null) {
				document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.verifycode.jspcheck' />";
			} else {
				var msg = "{\"account\":\"" + account + "\",\"verifycode\":\""
						+ verifycode + "\"}";
				$.ajax({
							url : "${ctx}/resetpwd/checkCerifyCode",
							contentType : 'application/json;charset=UTF-8',
							type : "POST",
							dataType : "json",
							data : msg,
							async : false,
							success : function(data) {
								var ret = data.ret;
								if (ret == 2) {
									document.getElementById('index').value = "2";
									document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.resetpwd.fail2' />";
								} else if (ret == 3) {
									document.getElementById('index').value = "2";
									document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.resetpwd.fail3' />";
								} else if (ret == 1) {
									var tokenid = data.tokenid;
									document.getElementById('tokenid').value = tokenid;
									document.getElementById('newpwd-confirmpwd').style.display = "block";
									document.getElementById('resetform-newpwd').style.display = "block";
									document.getElementById('resetform-confirmpwd').style.display = "block";
									document.getElementById('resetform-submit').style.display = "block";
									document.getElementById('resetform-next').style.display = "none";
									document.getElementById('resetform-telephone').style.display = "none";
									document.getElementById('resetform-verifycode').style.display = "none";
									document.getElementById('telephone-verifycode').style.display = "none";
									document.getElementById('index').value = "3";
									document.getElementById('resetform-errormsg').innerHTML = "";
									document.getElementById('verifycodeDiv').className = "T-green-bg";
									document.getElementById('newpwdLi').className = "T-password-green";
// 									var barLength = document.getElementById('bar');
// 									barLength.style.width = "60%";
								}
							},
							error : function() {
								document.getElementById('index').value = "2";
								document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.connect.fail' />";
							}
						});
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
			// 启动倒数秒
			document.getElementById('timeout').value = "120";
			document.getElementById('verifycodebutton').className = "T-p-time";
			document.getElementById('verifycodebutton').disabled = true;
			intervalProcess = setInterval("myInterval()", 1000);// 1000为1秒钟
			var msg = "{\"account\":\"" + account + "\"}";
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
							document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.getverifycode.fail' />";
						} else {
							if ("HAVE_GET_VERIFYCODE_TOO_MUCH" == checkcode) {
								document.getElementById('index').value = "1";
								document.getElementById('resetform-errormsg').innerHTML = "您操作过于频繁,请明天再试!";
							} else {
								document.getElementById('checkcode').value = checkcode;
								document.getElementById('index').value = "2";
								document.getElementById('verifycodemsg').innerHTML = "";
								document.getElementById('resetform-errormsg').innerHTML = "";
							}
						}
					},
					error : function() {
						document.getElementById('index').value = "1";
						document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.connect.fail' />";
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
			document.getElementById('verifycodebutton').className = "T-p-Vcode";
			//document.getElementById('verifycodebutton').value = "<spring:message code='screen.resetpassword.verifycodebutton' />";
			//获取验证码
			document.getElementById('verifycodebutton').value = "获取验证码";
		} else {
			document.getElementById('timeout').value = timeout;
			document.getElementById('verifycodebutton').value = timeout + "s";
		}
	}
	
	//新密码泽恒表达式校验
	function newpwdCheck() {
		var f = document.reset;
		var newpwd = f.newpwd.value;
		var re = /^(?![\d]+$)(?![a-z]+$)(?![A-Z]+$)(?![\W]+$)[\da-zA-Z\W_]{8,}$/;
		if (newpwd == "" || newpwd == null) {
			document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.newpwd.check' />";
			return false;
		} else if (!re.test(newpwd)) {
			document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.pwd.check2' />";
			return false;
		} 
		document.getElementById('resetform-errormsg').innerHTML = "";
		return true;
	}
	
	//提交校验
	function commitCheck() {
		var f = document.reset;
		var account = f.account.value;
		var newpwd = f.newpwd.value;
		var confirmpwd = f.confirmpwd.value;
		if (!newpwdCheck()) {
			return false;
		}
		if (confirmpwd == "" || confirmpwd == null) {
			document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.confirmpwd.check' />";
			return false;
		} else if (confirmpwd != newpwd) {
			document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.pwd.check' />";
			return false;
		} else if (confirmpwd == newpwd) {
			document.getElementById('confirmpwdmsg').innerHTML = "";
			
		}
		document.getElementById('resetform-errormsg').innerHTML = "";
		return true;
	}
	
	// 提交校验
	function submitCheck() {
		var f = document.reset;
		var account = f.account.value;
		var newpwd = f.newpwd.value;
		var tokenid = f.tokenid.value;
		if (commitCheck()) {
			//重置密码按钮控制
			$("#submit").attr("disabled",true);
			//var md5 = hex_md5(newpwd);
			var msg = "{\"account\":\"" + account + "\",\"password\":\""
					+ newpwd + "\",\"tokenid\":\"" + tokenid + "\"}";
			$
					.ajax({
						url : "${ctx}/resetpwd/resetPassWord",
						contentType : 'application/json;charset=UTF-8',
						type : "POST",
						dataType : "json",
						data : msg,
						async : false,
						success : function(data) {
							var ret = data.ret;
							if (ret == 0 || ret == 2 || ret == 3 || ret == 4
									|| ret == 5 || ret == 6) {
								if (ret == 0) {
									document
											.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.resetpwd.fail' />";
								} else if (ret == 2) {
									document
											.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.resetpwd.fail4' />";
								} else if (ret == 3) {
									document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.resetpwd.fail5' />";
									document.getElementById('resetform-telephone').style.display = "none";
									document.getElementById('resetform-verifycode').style.display = "none";
									document.getElementById('resetform-newpwd').style.display = "block";
									document.getElementById('resetform-confirmpwd').style.display = "block";
									document.getElementById('resetform-submit').style.display = "block";
									document.getElementById('resetform-next').style.display = "none";
									clearInterval(intervalProcess);
									document.getElementById('verifycodebutton').disabled = false;
									document.getElementById('verifycodebutton').value = "<spring:message code='screen.resetpassword.verifycodebutton' />";
									document.getElementById('newpwd').value = "";
									document.getElementById('confirmpwd').value = "";
									document.getElementById('index').value = "2";
									document.getElementById('verifycodemsg').innerHTML = "";
// 									var barLength = document.getElementById('bar');
// 									barLength.style.width = "60%";
								} else if (ret == 4) {
									document
											.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.resetpwd.fail' />";
								} else if (ret == 5) {
									document
											.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.resetpwd.fail6' />";
								} else if (ret == 6) {
									var retMsg = data.retMsg;
									if (retMsg != "") {
										$("#resetform-errormsg").html(retMsg);
									} else {
										$("#resetform-errormsg").html("<spring:message code='screen.resetpassword.pwd.check2' />");
									}
									
									document.getElementById('resetform-telephone').style.display = "none";
									document.getElementById('resetform-verifycode').style.display = "none";
									document.getElementById('resetform-newpwd').style.display = "block";
									document.getElementById('resetform-confirmpwd').style.display = "block";
									document.getElementById('resetform-submit').style.display = "block";
									document.getElementById('resetform-next').style.display = "none";
									clearInterval(intervalProcess);
									document.getElementById('verifycodebutton').disabled = false;
									document.getElementById('verifycodebutton').value = "<spring:message code='screen.resetpassword.verifycodebutton' />";
									document.getElementById('newpwd').value = "";
									document.getElementById('confirmpwd').value = "";
									document.getElementById('index').value = "2";
									document.getElementById('verifycodemsg').innerHTML = "";
// 									var barLength = document.getElementById('bar');
// 									barLength.style.width = "60%";
								}
								if (ret != 3 && ret != 6) {
									document.getElementById('resetform-telephone').style.display = "block";
									document.getElementById('resetform-verifycode').style.display = "block";
									document.getElementById('resetform-newpwd').style.display = "none";
									document.getElementById('resetform-confirmpwd').style.display = "none";
									document.getElementById('resetform-submit').style.display = "none";
									document.getElementById('resetform-next').style.display = "block";
									clearInterval(intervalProcess);
									document.getElementById('verifycodebutton').disabled = false;
									document.getElementById('verifycodebutton').value = "<spring:message code='screen.resetpassword.verifycodebutton' />";
									document.getElementById('checkcode').value = "";
									document.getElementById('verifycode').value = "";
									document.getElementById('newpwd').value = "";
									document.getElementById('confirmpwd').value = "";
									document.getElementById('index').value = "1";
									document.getElementById('verifycodemsg').innerHTML = "";
// 									var barLength = document.getElementById('bar');
// 									barLength.style.width = "33%";
								}
							} else {
								//document.getElementById('resetform-errormsg').style.readOnly = "true";
								//document.getElementById('resetform-errormsg').style.color = "green";
								//document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.resetpwd.success' />";
								document.getElementById('resetform-errormsg').style.display = "none";
								if (account.indexOf("@") == -1) { 
									document.getElementById('resetform-success-email').innerHTML = account+"@meicai.cn";
								} else {
									document.getElementById('resetform-success-email').innerHTML = account;
								}
								//document.getElementById('resetform-account').style.display = "block";
								document.getElementById('resetform-success').style.display = "block";
								document.getElementById('captchadiv').style.display = "none";
								document.getElementById('resetform-telephone').style.display = "none";
								document.getElementById('resetform-verifycode').style.display = "none";
								document.getElementById('telephone-verifycode').style.display = "none";
								document.getElementById('resetform-newpwd').style.display = "none";
								document.getElementById('resetform-confirmpwd').style.display = "none";
								document.getElementById('newpwd-confirmpwd').style.display = "none";
								document.getElementById('resetform-submit').style.display = "none";
								document.getElementById('resetform-next').style.display = "none";
								document.getElementById('verifycodebutton').disabled = false;
								document.getElementById('verifycodebutton').value = "<spring:message code='screen.resetpassword.verifycodebutton' />";
								document.getElementById('checkcode').value = "";
								document.getElementById('verifycode').value = "";
								document.getElementById('newpwd').value = "";
								document.getElementById('confirmpwd').value = "";
								document.getElementById('tokenid').value = "";
								document.getElementById('index').value = "";
								//var barLength = document.getElementById('bar');
								$("#captchadiv").hide();
								//barLength.style.width = "100%";
								document.getElementById('newpwdDiv').className = "T-green-bg";
								document.getElementById('resetSuccessLi').className = "T-password-green";
								//document.getElementById('resetSuccessDiv').className = "T-green-bg";
							}
							$("#submit").attr("disabled",false);
						},
						error : function() {
							document.getElementById('resetform-errormsg').innerHTML = "<spring:message code='screen.resetpassword.connect.fail' />";
							document.getElementById('resetform-telephone').style.display = "block";
							document.getElementById('resetform-verifycode').style.display = "block";
							document.getElementById('resetform-newpwd').style.display = "none";
							document.getElementById('resetform-confirmpwd').style.display = "none";
							document.getElementById('resetform-submit').style.display = "none";
							document.getElementById('resetform-next').style.display = "block";
							clearInterval(intervalProcess);
							document.getElementById('verifycodebutton').disabled = false;
							document.getElementById('verifycodebutton').value = "<spring:message code='screen.resetpassword.verifycodebutton' />";
							document.getElementById('checkcode').value = "";
							document.getElementById('verifycode').value = "";
							document.getElementById('newpwd').value = "";
							document.getElementById('confirmpwd').value = "";
							document.getElementById('index').value = "1";
							document.getElementById('verifycodemsg').innerHTML = "";
							$("#submit").attr("disabled",false);
						}
					});
		}
	}
	
	function nextCaptcha(){
		$("#kaptcha").hide().attr('src','${ctx}/kaptcha.jpg?' + Math.floor(Math.random() * 100)).fadeIn();
	}
</script>
<body class="T-password-bg">
<!-- 头部S -->
<div  class="T-mc-Login">
  <h1>
  	<span class="T-mc-Login-i"><img src="${ctx}/images/new/logo.png" alt="美菜网"></span>统一登录中心<a class="T-z-password fr" id="login" href='${resetpasswordLoginUrl}'>账户登录</a>
  </h1>
</div> 
<!-- 头部E -->
<!-- 注册表单S -->
<div class="T-password-content">
  <div class="T-password-step clearfix">
      <ul>
        <li class="T-password-green" id="accountLi">
          <div class="T-gray-bg" id="accountDiv"></div>
          <div class="T-password-number">1</div>
          <div class="T-password-text">输入帐号</div>

        </li>
        <li id="verifycodeLi">
          <div class="T-gray-bg" id="verifycodeDiv"></div>
          <div class="T-password-number">2</div>
          <div class="T-password-text">手机验证</div>
        </li>
        <li id="newpwdLi">
          <div class="T-gray-bg" id="newpwdDiv"></div>
          <div class="T-password-number">3</div>
          <div class="T-password-text">设置新密码</div>
        </li>
        <li id="resetSuccessLi">
           <div class="T-gray-bg T-greenbg-width" id="resetSuccessDiv"></div>
          <div class="T-password-number">4</div>
          <div class="T-password-text">设置成功</div>
        </li>
      </ul>
  </div>
  <div id="resetform">
  <form action="#" method="post" id="reset"
					name="reset">
  <div id="resetform-account" class="T-password-form clearfix">
    <ul>
      <li>
      	<span class="T-p-text"><spring:message code="screen.resetpassword.account" /></span>
      	<input class="T-account-number" type="text" placeholder="用户名/邮箱" name="account"><!-- <span class="T-p-yzm">@meicai.cn</span> -->
      </li>
      <div id="captchadiv">
	      <li>
	      	<span class="T-p-text">验证码：</span>
	      	<input class="T-p-verification" type="text" placeholder="验证码" id="captcha"><img id="kaptcha" style="cursor:pointer" src="${ctx}/kaptcha.jpg" href="javascript:void(0);" 
	      	onclick="nextCaptcha();"><span><a class="T-hyz" id="changeCaptcha" href="javascript:void(0);" 
	      	onclick="nextCaptcha();" >换一张</a></span>
	      </li>
	      <!-- <a class="T-password-Button" href="输入验证码.html">下一步</a> -->
      </div>
      <li class="T-r-p-text" id="accountErroMsg"></li>
    </ul>
  </div>
  <div id="telephone-verifycode" class="T-password-form clearfix" style="display:none">
    <ul>
    	<div id="resetform-telephone">
    		<li style="width:500px;">
		      	<span class="T-p-text"><spring:message code="screen.resetpassword.telephone" /></span>
		      	<input class="T-account-mobile" type="text" id="telephone" name="telephone" readonly />
		      	
		      	<input type="button" class="T-p-Vcode" id="verifycodebutton" onclick="getVerifyCode()" value="获取验证码" /> 
		    </li>
    	</div>
      <div id="resetform-verifycode">
      	<li>
	      	<span class="T-p-text"><spring:message code="screen.resetpassword.verification.code" /></span>
	      	<input class="T-account-mobile" type="text" placeholder="验证码 " id="verifycode" name="verifycode" onmouseout="verifycodeout()">
	   		<input type="hidden" id="checkcode" name="checkcode" />
			<input type="hidden" id="timeout" name="timeout" />
			<label>&nbsp;&nbsp;</label>
			<label id="verifycodemsg" style="color: red">
				<c:out value="${verifycodemsg}"></c:out>
			</label>
	    </li>
      </div>
    </ul>
  </div>
  <div id="newpwd-confirmpwd" class="T-password-form T-reset-password clearfix" style="display:none">
    <ul>
      <!-- <li class="T-r-p-text" style="display:none">密码录入不一致，请重新录入</li> -->
      <div id="resetform-newpwd" style="display:none;">
      	<li>
      		<span class="T-p-text"><spring:message code="screen.resetpassword.newpwd" /></span>
      		<input class="T-account-mobile" type="password"  placeholder="新密码" id="newpwd" name="newpwd" onkeyup="newpwdCheck()" onmouseout="newpwdCheck()">
      		<label>&nbsp;&nbsp;</label>
			<label id="newpwdmsg" style="color: red;">
				<c:out value="${newpwdmsg}"></c:out>
			</label>
      	</li>
      </div>
      <div id="resetform-confirmpwd" style="display:none">
      	<li>
      		<span class="T-p-text"><spring:message code="screen.resetpassword.confirmpwd" /></span>
      		<input class="T-account-mobile" type="password" placeholder="确认密码" id="confirmpwd" name="confirmpwd" onkeyup="commitCheck()" onmouseout="commitCheck()">
      		<label>&nbsp;&nbsp;</label>
			<label id="confirmpwdmsg" style="color: red">
				<c:out value="${confirmpwdmsg}"></c:out>
			</label>
      	</li>
      </div>
    </ul>
  </div>
<c:set var="resetpasswordLoginUrl" value="${resetpasswordLoginUrl}" />
  <div id="resetform-success" class="T-Reset-success clearfix" style="display:none">
    <ul>
      <li class="T-r-p-text"><spring:message code="screen.resetpassword.account" /><span id="resetform-success-email" class="T-R-success-email"></span></li>
      <li class="T-rp-tips"><img src="${ctx}/images/new/icon3.png" alt="icon"><spring:message code='screen.resetpassword.resetpwd.success' /></li>
      <li class="T-rp-tips"><a class="T-hyz" href="${resetpasswordLoginUrl}">登录</a></li>
    </ul>
  </div> 
	<div class="T-password-form clearfix" style="margin-top:0px;">
		<div id="resetform-next" style="margin-top:0px;">
			<!-- <input type="button" id="next" class="T-password-Button" onclick="check()" value="<spring:message code="screen.resetpassword.next" />" /> -->
			<a class="T-password-Button" id="next" href="javascript:void(0);" onclick="check()">下一步</a>
			<input type="hidden" id="index" name="index" />
		</div>
		<div id="resetform-submit" style="display:none;margin-top:0px;">
			<!-- <input id="submit" type="button" class="T-password-Button" onclick="submitCheck()" value="<spring:message code="screen.resetpassword.submit" />" /> -->
			<a class="T-password-Button" id="submit" href="javascript:void(0);" onclick="submitCheck()">重置密码</a>
			<input type="hidden" id="tokenid" name="tokenid" />
		</div>
		<div id="resetform-errormsg" class="resetform-errormsg-tips" style="color:red;">
			<c:out value="${msg}"></c:out>
		</div>
	</div>  
    
  </form>
  </div>
</div>
<!-- 注册表单E -->
<!-- 温馨提示S -->
  <div class="T-reminder">
    <h2>温馨提示：</h2>
    <ol>
      <li>1、您修改的密码，将为 邮箱、OA、BSS、Home门户中心、AUTH、WMS、CRM等 共用。</li>
      <li>2、密码需满足：长度至少8位、且包含数字、大写字母、小写字母、特殊符号中的至少三种。</li>
      <li>3、如因手机号错误，无法收到验证码，请联系员工关系部的同事，帮您查询/修改您在人力系统中登记的手机号码。</li>
    </ol>
  </div>
<!-- 温馨提示E -->
</body>
</html>