<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
		<!-- 菜单 -->
		<%@ include file="menu.jsp"%>
	  
		<div class="mainpanel">
	    
		    <div class="headerbar">
		      
		      <!-- menu -->
		      <a class="menutoggle"><i class="fa fa-bars"></i></a>
		      
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
		          <li class="active"><spring:message code="screen.weakpwdrule.edit.title" /></li>
		        </ol>
		      </div>
		    </div>
	    
		    <div class="contentpanel">
				<div class="panel panel-default">
		        <div class="panel-heading">
		          <h4 class="panel-title"><spring:message code="screen.weakpwdrule.edit.title"/></h4>
		        </div>
		        <div class="panel-body panel-body-nopadding">
					<form class="form-horizontal form-bordered" action="${ctx}/acctWeakPwdRule/rulesave" method="post">
			            <div class="form-group">
								<label class="col-sm-3 control-label"><spring:message
										code="screen.weakpwdrule.index.rule" /></label>
								<div class="col-sm-6">
									<input type="text" name="weakpwdRule" id="weakpwdRule" maxlength="100"
										class="form-control" value="${acctWeakPwdRule.weakpwdRule}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><spring:message
										code="screen.weakpwdrule.index.ruledesc" /></label>
								<div class="col-sm-6">
									<input type="text" name="weakpwdDesc" id="weakpwdDesc" maxlength="100"
										class="form-control" value="${acctWeakPwdRule.weakpwdDesc}" />
								</div>
							</div>
							<input type="hidden" value="${acctWeakPwdRule.id}" name="id" id="id">
					</form>
		        </div><!-- panel-body -->
		        
		        <div class="panel-footer">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
						  <button type="button" class="btn btn-primary" onclick="ruleSave()"><spring:message code="screen.useredit.submit"/></button>&nbsp;
						  <button type="button" class="btn btn-default" onclick="cancel()"><spring:message code="screen.useredit.cancel"/></button>
						</div>
					</div>
				</div><!-- panel-footer -->
		      </div><!-- panel -->
			</div><!-- contentpanel -->
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
<script>
	function ruleSave(){
		var tmpWeakPwdRule = $("#weakpwdRule").val();
		var tmpWeakPwdDesc = $("#weakpwdDesc").val();
		if (tmpWeakPwdRule == "" || tmpWeakPwdDesc == ""){
			alert('<spring:message code="screen.weakpwdrule.edit.attnotnull"/>');
			return false;
		}
		tmpWeakPwdRule = $.trim(tmpWeakPwdRule);
		
		$.ajax({
			url:"${ctx}/acctWeakPwdRule/rulesave",
			dataType:"text",
			type:"post",
			async : false,
			data:{
				"id":$("#id").val(),
				"weakpwdRule":tmpWeakPwdRule,
				"weakpwdDesc":tmpWeakPwdDesc
			},
			success:function(data){
				var obj = eval("("+data+")");
				
				if (obj["reply"]=='success') {
					alert('<spring:message code="code.message.process.success"/>');
				} else {
					alert(obj["replyDesc"]);
				}
				window.location='${ctx}/acctWeakPwdRule/index';
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
	function cancel(){
		window.location='${ctx}/acctWeakPwdRule/index';
	}
	
</script>

</body>
</html>
