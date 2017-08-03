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
  <link rel="stylesheet" href="${ctx}/css/bootstrap-timepicker.min.css" />
  <link rel="stylesheet" href="${ctx}/css/jquery.tagsinput.css" />
  <link rel="stylesheet" href="${ctx}/css/colorpicker.css" />
  <link rel="stylesheet" href="${ctx}/css/dropzone.css" />
  <link rel="stylesheet" href="${ctx}/css/jquery.tagsinput.css" />
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
					<form class="form-horizontal form-bordered" action="${ctx}/useradd" method="post">
						<div class="form-group">
							<label class="col-sm-3 control-label">CN</label>
							<div class="col-sm-6">
								<input type="text" name="cn" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><spring:message code="screen.lable.employeeuid"/></label>
							<div class="col-sm-6">
								<input type="text" name="uid" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><spring:message code="screen.lable.employeegivename"/></label>
							<div class="col-sm-6">
								<input type="text" name="givenName" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><spring:message code="screen.index.employeeorg"/></label>
						    <div class="col-sm-6">
				                <select class="select2" name="org" id="org" data-placeholder="<spring:message code="screen.index.searchorg"/>" onchange="orgchange()">
				                  <option value=""></option>
				                  <c:forEach var="org" items="${orgitems}">
				                  	<option value="${org.orgcode}">${org.orgname}</option>
				                  </c:forEach>
				                </select>
				            </div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><spring:message code="screen.index.employeedept"/></label>
						    <div class="col-sm-6">
				                <select class="select2" name="dept" id="dept" data-placeholder="<spring:message code="screen.index.searchdept"/>" onchange="deptchange()">
				                  <option value=""></option>
				                </select>
						    </div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><spring:message code="screen.lable.employeetelphone"/></label>
							<div class="col-sm-6">
								<input type="text" name="telephoneNumber" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><spring:message code="screen.lable.employeemail"/></label>
							<div class="col-sm-6">
								<input type="text" name="mail" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><spring:message code="screen.lable.employeepassword"/></label>
							<div class="col-sm-6">
								<input type="password" name="userPassword" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><spring:message code="screen.lable.employeepostname"/></label>
							<div class="col-sm-6">
								<input type="text" name="postname" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><spring:message code="screen.lable.employeeidnumber"/></label>
							<div class="col-sm-6">
								<input type="text" name="idnumber" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><spring:message code="screen.lable.employeesex"/></label>
							<div class="col-sm-6">
								<select class="form-control mb15" name="sex">
				                  <option selected="selected" value="2"><spring:message code="screen.index.employeesexman"/></option>
							      <option value="3"><spring:message code="screen.index.employeesexwoman"/></option>
				                </select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><spring:message code="screen.lable.employeetqnumber"/></label>
							<div class="col-sm-6">
								<input type="text" name="tqnumber" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><spring:message code="screen.lable.employeepsnclname"/></label>
							<div class="col-sm-6">
								<select class="form-control mb15" name="psnclname">
				                  <option value="<spring:message code="screen.lable.employeepsnclname1"/>"><spring:message code="screen.lable.employeepsnclname1"/></option>
							      <option value="<spring:message code="screen.lable.employeepsnclname1"/>"><spring:message code="screen.lable.employeepsnclname2"/></option>
							      <option value="<spring:message code="screen.lable.employeepsnclname1"/>"><spring:message code="screen.lable.employeepsnclname3"/></option>
				                </select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><spring:message code="screen.lable.employeesystemcode"/></label>
						    <div class="col-sm-6">
						    	<div class="input-group mb15">
				                  <input type="text" class="form-control" style="text-overflow:ellipsis;" id="choincesystemcodesview" readonly="readonly">
				                  <input type="hidden" name="systemcode" id="choincesystemcodes">
				                  <span class="input-group-btn">
				                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#systemcodemodal">
				                    	<spring:message code="screen.common.choince"/>
				                    </button>
				                  </span>
				                </div>
						    </div>
						</div>
						<div class="form-group">
			              <label class="col-sm-3 control-label"><spring:message code="screen.lable.employeeenablestate"/></label>
			              <div class="col-sm-6">
			                <select class="form-control mb15" name="enablestate">
			                  <option selected="selected" value="2"><spring:message code="screen.index.message.employeestatus.validate"/></option>
						      <option value="3"><spring:message code="screen.index.message.employeestatus.unvalidate"/></option>
			                </select>
			              </div>
			            </div>
					</form>
		        </div><!-- panel-body -->
		        
		        <div class="panel-footer">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
						  <button type="button" class="btn btn-primary" id="submit"><spring:message code="screen.useredit.submit"/></button>&nbsp;
						  <button type="button" class="btn btn-default" id="cancel"><spring:message code="screen.useredit.cancel"/></button>
						</div>
					</div>
				</div><!-- panel-footer -->
		      </div><!-- panel -->
			</div><!-- contentpanel -->
		</div>
	</section>
	<!-- dept choince -->
	<div class="modal fade bs-example-modal-lg" id="systemcodemodal" tabindex="-1" role="dialog" aria-labelledby="systemcodeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="systemcodeModalLabel"><spring:message code="screen.lable.choincesystemcode"/></h4>
				</div>
				<div class="modal-body">
			        <c:forEach var="systemcodename" items="${systemcodename}">
						<div class="form-group">
							<div class="row">
								<div class="col-sm-6">
									<div class="ckbox ckbox-default">
										<c:if test="${systemcodename.systemcodeLeft!=null}">
											<input type="checkbox" value="${systemcodename.systemcodeLeft.systemcode}" 
												id="${systemcodename.systemcodeLeft.systemcode}" name="systemcodecheckbox" 
												title="${systemcodename.systemcodeLeft.systemName}">
				                        	<label for="${systemcodename.systemcodeLeft.systemcode}">
				                        		${systemcodename.systemcodeLeft.systemName}
				                        	</label>
										</c:if>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="ckbox ckbox-default">
										<c:if test="${systemcodename.systemcodeRight!=null}">
											<input type="checkbox" value="${systemcodename.systemcodeRight.systemcode}" 
												id="${systemcodename.systemcodeRight.systemcode}" name="systemcodecheckbox" 
												title="${systemcodename.systemcodeRight.systemName}">
				                        	<label for="${systemcodename.systemcodeRight.systemcode}">
				                        		${systemcodename.systemcodeRight.systemName}
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

<script src="js/custom.js"></script>

<script>
	function orgchange(){
		var selectedOrg = $("#org").val();
		$.ajax({
			url:"${ctx}/getdepts",
			dataType:"text",
			type:"post",
			async : false,
			data:{
				"orgcode":selectedOrg
			},
			success:function(data){
				var realData = decodeURIComponent(data);
				$("#dept").html(realData.replace(/\+/g,' '));
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				//
			}
		});
	}
	function deptchange(){
		var selectdept = $("#dept").val();
	}
	function choincesystemcode(){
		var selectsystemcode = "";
		var selectsystemname = "";
        $("input:checkbox[name=systemcodecheckbox]:checked").each(function(i){
        	selectsystemcode += "@" + $(this).val() + "@";
        	selectsystemname +=  $(this).attr("title") + " ";
        });
		$("#choincesystemcodes").val(selectsystemcode);
		$("#choincesystemcodesview").val(selectsystemname);
	}
	jQuery(document).ready(function() {
	    // submit
		jQuery('#submit').click(function(){
			$('.form-horizontal').submit();
	        return false;
	    });
		// cancel
		jQuery('#cancel').click(function(){
			location.href = "${ctx}/index";
	        return false;
	    });
		//
		jQuery(".select2").select2({
		    width: '100%'
		});
	});
</script>
</body>
</html>
