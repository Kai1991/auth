<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="${ctx}/images/favicon.png" type="image/png">

  <title><spring:message code="screen.index.header" /></title>

  <link href="${ctx}/css/style.default.css" rel="stylesheet">
  <link href="${ctx}/css/jquery.datatables.css" rel="stylesheet">
</head>

<body>

	<!-- Preloader -->
	<div id="preloader">
	    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
	</div>

	<section>
	  
		<%@ include file="menu.jsp"%>
	  
		<div class="mainpanel">
	    
		    <div class="headerbar">
		      
		      <!-- menu -->
		      <a class="menutoggle"><i class="fa fa-bars"></i></a>
		      
		      <form class="searchform" action="${ctx}/vpn" method="post">
		        <input type="text" class="form-control" name="query" placeholder="<spring:message code="screen.index.searchhere" />" />
		      </form>
		      
		      <div class="header-right">
				<ul class="headermenu">
		          <li>
		            <div class="btn-group">
		              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		                <img src="${ctx}/images/photos/loggeduser.png" alt="" />
		                <c:out value="${username}"></c:out>
		                <span class="caret"></span>
		              </button>
		              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
		              	<!-- 
		                <li><a href="profile.html"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
		                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a></li>
		                <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
		              	-->
		                <li><a href="${ctx}/logout"><i class="glyphicon glyphicon-log-out"></i><spring:message code="screen.common.logout"/></a></li>
		              </ul>
		            </div>
		          </li>
		          <li>
		            <button id="chatview" class="btn btn-default tp-icon chat-icon">
		                <i class="glyphicon glyphicon-comment"></i>
		            </button>
		          </li>
		        </ul>
		      </div><!-- header-right -->
		      
		    </div><!-- headerbar -->
	        
		    <div class="pageheader">
		      <h2><i class="fa fa-table"></i><span></span></h2>
		      <div class="breadcrumb-wrapper">
		        <span class="label">
					<spring:message code="screen.index.common.location.here" />
				</span>
		        <ol class="breadcrumb">
		          <li class="active"><spring:message code="screen.index.part.accountmanager" /></li>
		        </ol>
		      </div>
		    </div>
	    
		    <div class="contentpanel">
		        <div class="row">
					<div class="panel panel-default">
				        <div class="panel-heading">
				          <!-- 关闭和小化按钮
				          <div class="panel-btns">
				            <a href="" class="panel-close">&times;</a>
				            <a href="" class="minimize">&minus;</a>
				          </div>
				          -->
				          <h3 class="panel-title">
						  	VPN<spring:message code="screen.index.common.list"/>
						  </h3>
				        </div>
				        <div class="panel-body">
				          <div class="clearfix mb30"></div>
				          <div class="table-responsive">
					          <table class="table table-striped" id="table2">
					              <thead>
					                 <tr>
					                    <th><spring:message code="screen.index.employeeid"/></th>
					                    <th><spring:message code="screen.index.employeename"/></th>
					                    <th><spring:message code="screen.index.employeeorg"/></th>
					                    <th><spring:message code="screen.index.employeedept"/></th>
					                    <th><spring:message code="screen.index.employeepost"/></th>
					                    <th>VPN<spring:message code="screen.index.employeestatu"/></th>
					                 </tr>
					              </thead>
					              <tbody>
					              	 <c:forEach var="employee" items="${employees}">
										<tr class="gradeA">
											<td>
											${employee.uid}
											</td>
											<td>
											${employee.givenName}
											</td>
											<td>
											${employee.orgname}
											</td>
											<td>
											${employee.deptname}
											</td>
											<td>
											${employee.postname}
											</td>
											<td id="${employee.cn}a">
											<c:if test="${fn:containsIgnoreCase(employee.systemcode,'@vpn@')==true}">
												<button type="button" id="${employee.cn}" onclick="offvpn('${employee.cn}')" class="btn btn-danger" data-loading-text="Loading" autocomplete="off"><spring:message code="screen.index.message.employeestatus.unvalidate"/></button>
											</c:if>
											<c:if test="${fn:containsIgnoreCase(employee.systemcode,'@vpn@')==false}">
												<button type="button" id="${employee.cn}" onclick="startvpn('${employee.cn}')" class="btn btn-success" data-loading-text="Loading"><spring:message code="screen.index.message.employeestatus.validate"/></button>
											</c:if>
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
		</div>
	</section>


<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/modernizr.min.js"></script>
<script src="${ctx}/js/jquery.sparkline.min.js"></script>
<script src="${ctx}/js/toggles.min.js"></script>
<script src="${ctx}/js/retina.min.js"></script>
<script src="${ctx}/js/jquery.cookies.js"></script>

<script src="${ctx}/js/jquery.datatables.min.js"></script>
<script src="${ctx}/js/select2.min.js"></script>
<script src="${ctx}/js/custom.js"></script>
<script src="${ctx}/js/user/vpn.js"></script>
<script>
  jQuery(document).ready(function() {
    
    "use strict";
    
    jQuery('#table1').dataTable();
    
    jQuery('#table2').dataTable({
      "sPaginationType": "full_numbers"
    });
    
    // Select2
    jQuery('select').select2({
        minimumResultsForSearch: -1
    });
    
    jQuery('select').removeClass('form-control');
    
    // Delete row in a table
    jQuery('.delete-row').click(function(){
      var c = confirm("<spring:message code="screen.index.message.deleteconfirm" />");
      if(c)
        jQuery(this).closest('tr').fadeOut(function(){
          jQuery(this).remove();
        });
        
        return false;
    });
    
    // Show aciton upon row hover
    jQuery('.table-hidaction tbody tr').hover(function(){
      jQuery(this).find('.table-action-hide a').animate({opacity: 1});
    },function(){
      jQuery(this).find('.table-action-hide a').animate({opacity: 0});
    });
  
  
  });
</script>

</body>
</html>
