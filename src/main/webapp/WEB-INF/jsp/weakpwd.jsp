<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta http-equiv="Cache-Control" content="max-age=1" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <link rel="shortcut icon" href="${ctx}/images/favicon.png" type="image/png">
  <title></title>
  <link rel="stylesheet" href="${ctx}/css/style.default.css">
  <link rel="stylesheet" href="${ctx}/css/jquery.datatables.css" >
  <link rel="stylesheet" href="${ctx}/css/bootstrap-timepicker.min.css" />
  <link rel="stylesheet" href="${ctx}/css/jquery.tagsinput.css" />
  <link rel="stylesheet" href="${ctx}/css/colorpicker.css" />
  <link rel="stylesheet" href="${ctx}/css/dropzone.css" />
  <link rel="stylesheet" href="${ctx}/css/bootstrap-datepicker3.css" rel="stylesheet">
</head>
<body class="notfound">
	<section>
	    <div class="lockedpanel">
	        <div class="locked">
	            <i class="fa fa-warning"></i>
	        </div>
	        <div class="logged">
	            <h3>密码强度不足，请重置密码后重新登录系统！</h3>
	        </div>
	        <div class="clearfix mb20"></div>
	        <button type="button" onclick="resetpwd();" class="btn btn-success btn-block">
				确定
			</button>
	    </div><!-- lockedpanel -->
	</section>
	<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
	<script src="${ctx}/js/jquery-ui-1.10.3.min.js"></script>
	<script src="${ctx}/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/modernizr.min.js"></script>
	<script src="${ctx}/js/jquery.sparkline.min.js"></script>
	<script src="${ctx}/js/toggles.min.js"></script>
	<script src="${ctx}/js/retina.min.js"></script>
	<script src="${ctx}/js/jquery.cookies.js"></script>
	<script src="${ctx}/js/bootstrap-editable.min.js"></script>
	<script src="${ctx}/js/jquery.autogrow-textarea.js"></script>
	<script src="${ctx}/js/bootstrap-timepicker.min.js"></script>
	<script src="${ctx}/js/jquery.maskedinput.min.js"></script>
	<script src="${ctx}/js/jquery.tagsinput.min.js"></script>
	<script src="${ctx}/js/jquery.mousewheel.js"></script>
	<script src="${ctx}/js/jquery.datatables.min.js"></script>
	<script src="${ctx}/js/select2.min.js"></script>
	<script type="text/javascript">
		function resetpwd(){
			window.location.href="${ctx}/resetpwd/resetpasswd";
		}
	</script>
</body>
</html>