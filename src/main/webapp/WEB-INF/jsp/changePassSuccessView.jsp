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
	<title><spring:message code="screen.passwordchange.title" /></title>
	<link rel="stylesheet" href="${ctx}/css/changepassword.css" />
</head>
<body id="cas">
	<div id="container">
		<div id="header">
			<h1 style="padding-top: 40px;"><spring:message code="screen.passwordchange.header" /></h1>
		</div>
		<div id="content" >
			<!-- 
			<div id="welcomediv">
				<spring:message code="screen.passwordchange.welcome" />
				<c:out value="${user.name}"></c:out>
			</div>
			-->
			<div id="msg" class="success">
				<h2 style="font-size: 2.5em;margin-left: 320px;margin-top: 100px;"><spring:message code="screen.passwordchange.success" /></h2>
			</div>
		</div>
	</div>
</body>
</html>