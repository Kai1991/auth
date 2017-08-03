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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body >
    <!-- 搜索提示框列表 -->
		    <div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="choincesystemcode()"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="systemcodeModalLabel">
						<spring:message code="screen.lable.seeker"/>
						 <c:out value="${GivenName}"></c:out>
						<span id="systemcodeModalLabelSpan"></span>
					</h4>
				</div>
				<!-- 分页start¨ -->
				<section>
					<div class="contentpanel">
				        <div class="row">
							<div class="panel panel-default">
		  						<div class="panel-body" style="padding-top: 0px; padding-bottom: 0px;">
									<div class="clearfix mb30"></div>										
										<div class="table-responsive">
											<table class="table table-striped" id="table4">
												<thead>
													<tr>
												    	<th><spring:message code="screen.index.employeeid"/></th>
												        <th><spring:message code="screen.index.employeename"/></th>
												        <th><spring:message code="screen.index.employeeorg"/></th>
												        <th><spring:message code="screen.index.employeedept"/></th>
												        <th><spring:message code="screen.index.employeepost"/></th>
												        <th><spring:message code="screen.index.searchInfoTime"/></th>
													</tr>	                 
												</thead>
									<tbody>
					              	 	<c:forEach var="searchEmployees" items="${searchEmployees}">
											<tr class="gradeA">
											<td>
											${searchEmployees.uid}
											</td>
											<td>
											${searchEmployees.givenName}
											</td>
											<td>
											${searchEmployees.orgname}
											</td>
											<td>
											${searchEmployees.deptname}
											</td>
											<td>
											${searchEmployees.postname}
											</td>
											<td>
											${searchEmployees.createTime}
											</td>
											</tr>
											</c:forEach>
										</tbody>
											    </table>
											</div><!-- table-responsive -->
									      </div><!-- panel-body -->
									</div><!-- panel -->
								</div><!-- contentpanel -->
							</div><!-- mainpanel -->
						</section>
						<!-- 分页end -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="choincesystemcode()">
					<spring:message code="screen.common.close"/></button>
				</div>
			</div>
</body>
</html>