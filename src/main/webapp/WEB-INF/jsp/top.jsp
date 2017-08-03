<!DOCTYPE html>

<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html lang="en">
<head>
<meta charset="UTF-8" />

<title><spring:message code="screen.sso.title" /></title>

<spring:message code="standard.custom.css.file" var="customCssFile" />
<link rel="stylesheet" href="<c:url value="${customCssFile}" />" />
<link rel="icon" href="<c:url value="/favicon.ico" />"
	type="image/x-icon" />
<script>
	$(function() {
		$("[data-toggle='tooltip']").tooltip();
	});
</script>
<style type="text/css">
#danger:hover {
	color: red;
}
#danger{font-size: 15px;}
p {
	text-indent: 2em;
}

.jpgLink {
	border: 1px solid #CBCBCB;
	text-align: left; .
	box-shadow: 0 0 3px #000;
	cursor: pointer;
	width: 180px;
	float: left;
 	margin:10px 40px;
}

.tab {
	border-collapse: separate;
	border-spacing: 20px;
}

#img {
	width: 180px;
	height: 100px;
	margin: 0px;
}

#msg>ol {
	list-style: none;
}

.jpgLink.oa:hover, .jpgLink.oa:active, .jpgLink.bss:hover, .jpgLink.bss:active,
	.jpgLink.mail:hover, .jpgLink.mail:active {
	box-shadow: 0 0 10px #000;
}

.tab td {
	border: solid 1px #C2E4DE;
	vertical-align: middle;
}

.detail {
	color: #928D8D;
	font-size: 12px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	display: block;
	width: 170px;
	margin: 0px 10px 0px 5px ;
}
.name{    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    display: block;
    margin:0px 10px -20px 5px;
    text-align: center;}
</style>
</head>
<body id="cas">
	<div id="container">
		<div id="header">
			<h1><spring:message code="screen.passwordchange.header" /></h1>
		</div>
		<div id="content">