<!DOCTYPE html>

<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><spring:message code="screen.passwordchange.title" /></title>
<link href="${ctx}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${ctx}/css/changepassword.css" />
<script src="${ctx}/bootstrap/js/jquery-1.11.0.min.js"></script>
<script src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/js/md5.js"></script>
</head>
	
<script type="text/javascript"> 
function check(){
	var f = document.user;
	var oldPsw = f.pass.value;
	var newPsw1 = f.newPass1.value;
	var newPsw2 = f.newPass.value;
	if(oldPsw == "" || newPsw1 == "" || newPsw2 == ""){
		document.getElementById('pwdform-errormsg').innerHTML = "<spring:message code='screen.passwordchange.msg.emptypass' />";
		return false;
	}
	if(newPsw1 != newPsw2){
		document.getElementById('pwdform-errormsg').innerHTML = "<spring:message code='screen.passwordchange.msg.unequalpass' />";
		return false;
	}
	
	//document.getElementById("pass").value = hex_md5(document.getElementById("pass").value);
	//document.getElementById("newPass1").value = hex_md5(document.getElementById("newPass1").value);
	//document.getElementById("newPass").value = hex_md5(document.getElementById("newPass").value);
	return true;
}
</script>
<body id="cas">
	<div id="container">
		<div id="header">
			<h1><spring:message code="screen.passwordchange.header" /></h1>
		</div>
		<div id="content">
			<div id="welcomediv">
				<spring:message code="screen.passwordchange.welcome" />
				<%=session.getAttribute("userName")%>
			</div>
			<div id="pwdform">
				<form action="${ctx}/changepass" method="post" id="user" name="user">
					<div id="pwdform-oldpwd" style="margin-top: 50px;">
						<label class="updatePass"><spring:message code="screen.passwordchange.labelname.oldpass" /></label>
						<input type="password" class="form-control"  id="pass" name="pass" placeholder="当前的密码"/>
					</div>
					<div id="pwdform-newpwd">
						<label class="updatePass"><spring:message code="screen.passwordchange.labelname.newpass" /></label>
						<input type="password" class="form-control" id="newPass1" name="newPass1" placeholder="新密码"/>
					</div>
					<div id="pwdform-confirmpwd">
						<label class="updatePass"><spring:message code="screen.passwordchange.labelname.confirmpass" /></label>
						<input type="password" class="form-control" id="newPass" name="newPass" placeholder="重复新密码"/>
						<input type="submit" id="updataPassButton" onclick="return check()" value="<spring:message code="screen.passwordchange.button.submit" />" />
					</div>
					<div id="pwdform-errormsg" >
						<c:out value="${msg}"></c:out>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>