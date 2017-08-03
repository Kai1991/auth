<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="${ctx}/images/favicon.png"
	type="image/png">

<title><spring:message code="screen.index.header" /></title>

<link href="${ctx}/css/style.default.css" rel="stylesheet">
<link href="${ctx}/css/jquery.datatables.css" rel="stylesheet">
<link rel="stylesheet" href="${ctx}/css/jquery.tagsinput.css" />
</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<div id="status">
			<i class="fa fa-spinner fa-spin"></i>
		</div>
	</div>
	<section>
		<%@ include file="menu.jsp"%>
		<div class="mainpanel">
			<div class="headerbar">
				<!-- menu -->
				<a class="menutoggle"><i class="fa fa-bars"></i></a>
				<div class="header-right">
					<ul class="headermenu">
						<li>
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown">
									<img src="${ctx}/images/photos/loggeduser.png" alt="" />
									<c:out value="${username}"></c:out>
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu dropdown-menu-usermenu pull-right">
									<li><a href="${ctx}/logout"><i
											class="glyphicon glyphicon-log-out"></i> <spring:message
												code="screen.common.logout" /></a></li>
								</ul>
							</div>
						</li>
						<li>
							<button id="chatview" class="btn btn-default tp-icon chat-icon">
								<i class="glyphicon glyphicon-comment"></i>
							</button>
						</li>
					</ul>
				</div>
				<!-- header-right -->
			</div>
			<!-- headerbar -->
			<div class="pageheader">
				<h2>
					<i class="fa fa-table"></i><span></span>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"> <spring:message
							code="screen.index.common.location.here" />
					</span>
					<ol class="breadcrumb">
						<li class="active"><spring:message
								code="screen.emailprops.index" /></li>
					</ol>
				</div>
			</div>
			<div class="contentpanel">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<spring:message code="screen.useredit.paneltitle" />
						</h4>
					</div>
					<div class="panel-body panel-body-nopadding">
						<form class="form-horizontal form-bordered"
							action="${ctx}/emailProps/propertyAdd" method="post">
							<div class="form-group">
								<label class="col-sm-3 control-label"><spring:message
										code="screen.emailprops.key" /></label>
								<div class="col-sm-6">
									<input type="text" name="id" maxlength="100"
										class="form-control" value="${emailProperties.id}" readOnly />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><spring:message
										code="screen.emailprops.key" /></label>
								<div class="col-sm-6">
									<input type="text" name="key" maxlength="100"
										class="form-control" value="${emailProperties.key}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><spring:message
										code="screen.emailprops.value" /></label>
								<div class="col-sm-6">
									<input type="text" name="value" maxlength="255"
										class="form-control" value="${emailProperties.value}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><spring:message
										code="screen.emailprops.comment" /></label>
								<div class="col-sm-6">
									<input type="text" name="comment" maxlength="255"
										class="form-control" value="${emailProperties.comment}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><spring:message
										code="screen.emailprops.isdeleted" /></label>
								<div class="col-sm-6">
									<select class="form-control mb15" name="is_deleted">
										<c:if test="${emailProperties.is_deleted==0}">
											<option selected="selected" value="0"><spring:message
													code="screen.emailprops.normal" /></option>
											<option value="1"><spring:message
													code="screen.emailprops.deleted" /></option>
										</c:if>
										<c:if test="${emailProperties.is_deleted==1}">
											<option value="0"><spring:message
													code="screen.emailprops.normal" /></option>
											<option selected="selected" value="1"><spring:message
													code="screen.emailprops.deleted" /></option>
										</c:if>
									</select>
								</div>
							</div>
						</form>
					</div>
					<!-- panel-body -->
					<div class="panel-footer">
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
								<button type="button" class="btn btn-primary" id="submit">
									<spring:message code="screen.emailprops.ok" />
								</button>
								&nbsp;
								<button type="button" class="btn btn-default" id="cancel">
									<spring:message code="screen.emailprops.cancel" />
								</button>
							</div>
						</div>
					</div>
					<!-- panel-footer -->
				</div>
				<!-- panel -->
			</div>
			<!-- contentpanel -->
		</div>
	</section>

	<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
	<script src="${ctx}/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="${ctx}/js/jquery-ui-1.10.3.min.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/modernizr.min.js"></script>
	<script src="${ctx}/js/jquery.sparkline.min.js"></script>
	<script src="${ctx}/js/toggles.min.js"></script>
	<script src="${ctx}/js/retina.min.js"></script>
	<script src="${ctx}/js/jquery.cookies.js"></script>


	<script src="${ctx}/js/jquery.autogrow-textarea.js"></script>
	<script src="${ctx}/js/bootstrap-timepicker.min.js"></script>
	<script src="${ctx}/js/jquery.maskedinput.min.js"></script>
	<script src="${ctx}/js/jquery.tagsinput.min.js"></script>
	<script src="${ctx}/js/jquery.mousewheel.js"></script>
	<script src="${ctx}/js/select2.min.js"></script>
	<script src="${ctx}/js/dropzone.min.js"></script>
	<script src="${ctx}/js/colorpicker.js"></script>
	<script src="${ctx}/js/custom.js"></script>
	<script>
		jQuery(document).ready(function() {
			// submit
			jQuery('#submit').click(function() {
				$('.form-horizontal').submit();
				return false;
			});
			// cancel
			jQuery('#cancel').click(function() {
				location.href = "${ctx}/emailProps/index";
				return false;
			});

		});
	</script>
</body>
</html>
