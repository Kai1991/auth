<!DOCTYPE html>
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

<title><spring:message code="screen.emailprops.index" /></title>

<link href="${ctx}/css/style.default.css" rel="stylesheet">
<link href="${ctx}/css/jquery.datatables.css" rel="stylesheet">
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
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-btns">
								<a href="${ctx}/emailProps/toPropertyAdd" class="btn btn-white"><spring:message
										code="screen.emailprops.add" /></a>
							</div>
							<h3 class="panel-title">
								<spring:message code="screen.emailprops.index" />
							</h3>
						</div>
						<div class="panel-body">
							<div class="clearfix mb30"></div>
							<div class="table-responsive">
								<table class="table table-striped" id="table2">
									<thead>
										<tr>
											<th><spring:message code="screen.emailprops.id" /></th>
											<th><spring:message code="screen.emailprops.key" /></th>
											<th><spring:message code="screen.emailprops.value" /></th>
											<th><spring:message code="screen.emailprops.comment" /></th>
											<th><spring:message code="screen.emailprops.isdeleted" /></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="property" items="${properties}">
											<tr class="gradeA">
												<td style="width: 5">${property.id}</td>
												<td style="width: 20%">${property.key}</td>
												<td style="width: 30%">${property.value}</td>
												<td style="width: 30%">${property.comment}</td>
												<td style="width: 5%"><c:if
														test="${property.is_deleted==0}">
														<spring:message code="screen.emailprops.normal" />
													</c:if> <c:if test="${property.is_deleted==1}">
														<spring:message code="screen.emailprops.deleted" />
													</c:if></td>
												<td style="width: 10%"><a
													href="${ctx}/emailProps/propertyEdit?id=${property.id}"><i
														class="editrecord"></i></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- table-responsive -->
						</div>
						<!-- panel-body -->
					</div>
					<!-- panel -->
				</div>
				<!-- contentpanel -->
			</div>
			<!-- mainpanel -->
		</div>
	</section>

	<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
	<script src="${ctx}/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/jquery.datatables.min.js"></script>
	<script src="${ctx}/js/custom.js"></script>
	<script>
		jQuery(document).ready(function() {
			jQuery('.table-hidaction tbody tr').hover(function() {
				jQuery(this).find('.table-action-hide a').animate({
					opacity : 1
				});
			}, function() {
				jQuery(this).find('.table-action-hide a').animate({
					opacity : 0
				});
			});

		});
	</script>

</body>
</html>
