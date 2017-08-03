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
		      
		      <form class="searchform" action="${ctx}/index" method="post">
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
				<div class="panel panel-default">
		        <div class="panel-heading">
		          <h4 class="panel-title"><spring:message code="screen.useredit.paneltitle"/></h4>
		        </div>
		        <div class="panel-body panel-body-nopadding">
					<form class="form-horizontal form-bordered" action="${ctx}/usersave" method="post">
			            <c:forEach var="employee" items="${enableitems}">
				            <div class="form-group">
								<label class="col-sm-3 control-label">${employee.key}</label>
								<c:if test="${employee.key=='enablestate'}">
									<div class="col-sm-6">
						                <select class="form-control mb15" name="${employee.key}" id="${employee.key}">
						                	<c:if test="${employee.value=='2'}">
						                		<option selected="selected" value="2"><spring:message code="screen.index.message.employeestatus.validate"/></option>
						                		<option value="3"><spring:message code="screen.index.message.employeestatus.unvalidate"/></option>
						                	</c:if>
						                	<c:if test="${employee.value!='2'}">
						                		<option value="2"><spring:message code="screen.index.message.employeestatus.validate"/></option>
						                		<option selected="selected" value="3"><spring:message code="screen.index.message.employeestatus.unvalidate"/></option>
						                	</c:if>
						                </select>
									</div>
								</c:if>
								<c:if test="${employee.key!='enablestate'}">
									<c:if test="${employee.key!='systemcode'}">
										<div class="col-sm-6">
											<input type="text" value="${employee.value}" name="${employee.key}" id="${employee.key}" class="form-control" />
										</div>
									</c:if>
									<c:if test="${employee.key=='systemcode'}">
										<div class="col-sm-6">
									    	<div class="input-group mb15">
												<input type="text" class="form-control" value="" id="${employee.key}view" 
													style="text-overflow:ellipsis;" readonly="readonly">
												<input type="hidden" value="${employee.value}" id="${employee.key}">
												<span class="input-group-btn">
													<button type="button" onclick="clickchoince()" class="btn btn-info" data-toggle="modal" data-target="#systemcodemodal">
								                    	<spring:message code="screen.common.choince"/>
													</button>
												</span>
							                </div>
									    </div>
									</c:if>
								</c:if>
				            </div>
			            </c:forEach>
			            <c:forEach var="employee" items="${disableitems}">
				            <div class="form-group">
								<label class="col-sm-3 control-label" for="disabledinput">${employee.key}</label>
								<div class="col-sm-6">
									<input type="text" value="${employee.value}" id="disabledinput" name="${employee.key}" class="form-control" disabled="disabled" />
								</div>
							</div>
			            </c:forEach>
			            <input type="hidden" value="${cn}" name="cn" id="cn">
			            <input type="hidden" value="${cn}" name="sn" id="sn">
					</form>
		        </div><!-- panel-body -->
		        
		        <div class="panel-footer">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
						  <button type="button" class="btn btn-primary" onclick="usersave()"><spring:message code="screen.useredit.submit"/></button>&nbsp;
						  <button type="button" class="btn btn-default" onclick="cancel()"><spring:message code="screen.useredit.cancel"/></button>
						</div>
					</div>
				</div><!-- panel-footer -->
		      </div><!-- panel -->
			</div><!-- contentpanel -->
		</div>
	</section>
	<!-- system choince -->
	<div class="modal fade bs-example-modal-lg" id="systemcodemodal" tabindex="-1" role="dialog" aria-labelledby="systemcodeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="systemcodeModalLabel"><spring:message code="screen.lable.choincesystemcode"/></h4>
				</div>
				<div class="modal-body">
					<c:forEach var="displaySystemCodes" items="${displaySystemCodes}">
						<div class="form-group">
							<div class="row">
								<div class="col-sm-6">
									<div class="ckbox ckbox-default">
										<c:if test="${displaySystemCodes.systemcodeLeft!=null}">
											<input type="checkbox" value="${displaySystemCodes.systemcodeLeft.systemcode}" 
												id="${displaySystemCodes.systemcodeLeft.systemcode}" name="systemcodecheckbox" 
												title="${displaySystemCodes.systemcodeLeft.systemName}">
				                        	<label for="${displaySystemCodes.systemcodeLeft.systemcode}">
				                        		${displaySystemCodes.systemcodeLeft.systemName}
				                        	</label>
										</c:if>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="ckbox ckbox-default">
										<c:if test="${displaySystemCodes.systemcodeRight!=null}">
											<input type="checkbox" value="${displaySystemCodes.systemcodeRight.systemcode}" 
												id="${displaySystemCodes.systemcodeRight.systemcode}" name="systemcodecheckbox" 
												title="${displaySystemCodes.systemcodeRight.systemName}">
				                        	<label for="${displaySystemCodes.systemcodeRight.systemcode}">
				                        		${displaySystemCodes.systemcodeRight.systemName}
				                        	</label>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="screen.common.close"/></button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="choincesystemcode()"><spring:message code="screen.common.choince"/></button>
				</div>
			</div>
		</div>
	</div>

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
	jQuery(document).ready(function() {
		var systemcodename = '${systemcodename}';
		var systemcodes = $("#systemcode").val();
		if (systemcodes != "") {
			var systemcodeArray = new Array();
			systemcodeArray = systemcodes.substring(1,systemcodes.length-1).split("@@");
			var systemcodenameArray = new Array();
			systemcodenameArray = systemcodename.split(";");
			var systemcodeview = "";
			for (i=0; i<systemcodeArray.length; i++) {
				for (j=0; j<systemcodenameArray.length; j++) {
					if (systemcodenameArray[j].indexOf(systemcodeArray[i]+":") != -1) {
						var cursystemname = new Array();
						cursystemname = systemcodenameArray[j].split(":");
						systemcodeview += cursystemname[1] + " ";
					}
				}
			}
			$("#systemcodeview").val(systemcodeview);
		}
	});
	function usersave(){
		$.ajax({
			url:"${ctx}/usersave",
			dataType:"text",
			type:"post",
			async : false,
			data:{
				"cn":$("#cn").val(),
				"sn":$("#sn").val(),
				"enablestate":$("#enablestate").val(),
				"tqnumber":$("#tqnumber").val(),
				"systemcode":$("#systemcode").val(),
				"telephoneNumber":$("#telephoneNumber").val()
			},
			success:function(data){
				if (data=='success') {
					alert('<spring:message code="code.message.process.success"/>');
				} else {
					alert('<spring:message code="code.message.process.failed"/>');
				}
				window.location='${ctx}/index';
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}
	function cancel(){
		window.location='${ctx}/index';
	}
	function choincesystemcode(){
		var selectsystemcode = "";
		var selectsystemlabel = "";
        $("input:checkbox[name=systemcodecheckbox]:checked").each(function(i){
        	selectsystemcode += "@" + $(this).val() + "@";
        	selectsystemlabel +=  $(this).attr("title") + " ";
        });
		$("#systemcode").val(selectsystemcode);
		$("#systemcodeview").val(selectsystemlabel);
	}
	function clickchoince(){
		var cursystemcode = $("#systemcode").val();
		$("input:checkbox[name=systemcodecheckbox]").each(function(i){
        	if (cursystemcode.indexOf("@"+$(this).val()+"@") != -1) {
	        	$(this).attr("checked","checked");
        	}
        });
	}
</script>

</body>
</html>
