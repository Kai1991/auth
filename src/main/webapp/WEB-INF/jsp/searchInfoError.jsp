<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<body>
	<c:if test="${msg!=''}">
		<h4 style="font-size: 2em;margin-top: 12px;">${msg}</h4>
	</c:if>
	<c:if test="${msg==''}">
		<h4 style="font-size: 2em;margin-top: 12px;">
			<spring:message code="screen.error"/>
		</h4>
	</c:if>
</body>
</html>