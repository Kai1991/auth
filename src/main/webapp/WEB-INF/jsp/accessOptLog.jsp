<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="shortcut icon" href="${ctx}/images/favicon.png" type="image/png">
  <link href="${ctx}/bootstrap/css/bootstrap.min.css" rel="stylesheet">  
  <link href="${ctx}/css/style.default.css" rel="stylesheet">
  <link href="${ctx}/css/jquery.datatables.css" rel="stylesheet">
  <title><spring:message code="screen.index.authority" /></title>
      <style>
        *{margin:0px;padding:0px;}
        .checkbox,.radio{display: inline-block;*display: inline;*zoom:1;height: 24px; line-height: 24px; margin-right: 20px;}
        .checkbox ins,.radio ins{display: inline-block;*display: inline;*zoom:1; width: 23px; height: 22px; vertical-align: middle; background: url(http://www.bootcss.com/p/icheck/skins/square/blue.png) no-repeat; margin-right: 8px; -webkit-transition:all 0.1s linear; -moz-transition:all 0.1s linear; -o-transition:all 0.1s linear; -ms-transition:all 0.1s linear; transition:all 0.1s linear;vertical-align: middle;}
        .checkbox ins{background-position: 0px 0px; }
        .radio ins{background-position: -120px 0px; }
        .checkbox .hover{background-position: -24px 0px; }
        .checkbox .checked{background-position: -48px 0px; }
        .checkbox .enable{background-position: -96px 0px;}
        .checkbox .disabled{background-position: -72px 0px;}
        .radio .hover{background-position: -144px 0px;}
        .radio .checked{background-position: -168px 0px;}
        .radio .enable{background-position: -214px 0px;}
        .radio .disabled{background-position: -191px 0px;}
        .checkbox span,.radio span{display: inline-block;*display: inline;*zoom:1;vertical-align: middle; }
        .sport,.sex{width: 950px; margin: 100px auto;}
    </style>
</head>
<body >
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
		    
		    <div class="contentpanel">
		        <div class="row">
					<div class="panel panel-default">
				        <div class="panel-heading">
				        <div style="float:left;">
				          	<h3 class="panel-title" >
						  		<spring:message code="Search.for.historical.statistics"/>
						  	</h3>
						  	</div>
						  	<div style="float:right;">
								    <div class="radio" name="radio" value="searchinfo" id="radioDefault" checked="checked"><ins id="radioDefaultIns"></ins><span><spring:message code="screen.accessoptlog.searchinfo"/></span></div>
        							<div class="radio" name="radio" value="search" id="radioPrimary" checked="checked"><ins id="radioPrimaryIns"></ins><span><spring:message code="screen.accessoptlog.search"/></span></div>
								</div>
							<div class="clearfix mb10"></div>
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
					                    <th><spring:message code="screen.index.employeecount"/></th>
					                    <th><spring:message code="screen.index.employeeope"/></th>
					                 </tr>
					              </thead>
					              
					               <tbody>
					              	 <c:forEach var="employee" items="${employees}">
										<tr class="gradeA">
											<td class="sorting_1"style="padding-top: 13px;padding-bottom: 5px;border-top-width: 0px;">
											${employee.uid}
											</td>
											<td class="sorting_1"style="padding-top: 13px;padding-bottom: 5px;border-top-width: 0px;">
											${employee.givenName}
											</td>
											<td class="sorting_1"style="padding-top: 13px;padding-bottom: 5px;border-top-width: 0px;">
											${employee.orgname}
											</td>
											<td class="sorting_1"style="padding-top: 13px;padding-bottom: 5px;border-top-width: 0px;">
											${employee.deptname}
											</td>
											<td class="sorting_1"style="padding-top: 13px;padding-bottom: 5px;border-top-width: 0px;">
											${employee.postname}
											</td>
											<td class="sorting_1"style="padding-top: 13px;padding-bottom: 2.5px;border-top-width: 0px;">
						                    ${employee.count}
											</td>
											<td class="sorting_1"style="padding-top: 2.5px;padding-bottom: 2.5px;border-top-width: 0px;">
											<input type="hidden" id="currenttype" value="${employee.type}"/>
											<c:if test="${employee.type=='search'}">
						                    <button type="button" class="btn btn-primary" disabled="disabled">
											</c:if>
											<c:if test="${employee.type=='searchinfo'}">
											<button onclick="searchUser('${employee.cn}','${employee.type}','${employee.givenName}')" type="button" class="btn btn-primary" >
											</c:if>
						                    <spring:message code="screen.index.employeeope.query"/>
						                    </button>			                    
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
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="error" class="modal-body"></div>
				<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					<span class="glyphicon glyphicon-remove"></span>
				</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal  fade bs-example-modal-lg" id="systemcodemodal" tabindex="-1" role="dialog" aria-labelledby="systemcodeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" id="hintsmodel" role="document" >
		    
		</div>
	</div>    
<script src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/bootstrap/js/jquery-1.11.0.min.js"></script>
<script src="${ctx}/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/modernizr.min.js"></script>
<script src="${ctx}/js/jquery.sparkline.min.js"></script>
<script src="${ctx}/js/toggles.min.js"></script>
<script src="${ctx}/js/jquery.cookies.js"></script>

<script src="${ctx}/js/jquery.datatables.min.js"></script>
<script src="${ctx}/js/select2.min.js"></script>
<script src="${ctx}/js/custom.js"></script>
<script type="text/javascript" src="${ctx}/js/md5.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap-suggest.min.js"></script>
<script type="text/javascript" src="${ctx}/js/layer/layer.js"></script>
<script type="text/javascript">
		  jQuery(document).ready(function() {
		    
		    "use strict";
		    
		    //jQuery('#table1').dataTable();
		    
		    jQuery('#table2').dataTable({
		    //"aaSorting": [[5, "desc"]] 
		    "sPaginationType": "full_numbers", "aaSorting": [[5, "desc"]] 
		    });
		    
		    // Select2
		    jQuery('select').select2({
		        minimumResultsForSearch: -1
		    });
		    
		    jQuery('select').removeClass('form-control');
		    
		    // Show aciton upon row hover
		    jQuery('.table-hidaction tbody tr').hover(function(){
		      jQuery(this).find('.table-action-hide a').animate({opacity: 1});
		    },function(){
		      jQuery(this).find('.table-action-hide a').animate({opacity: 0});
		    });
/* 		    $("radioDefault").click(function(){
				window.location.href="${ctx}/accessOptLog/list?type="+$(this).val();
			}); */
		    $("#radioDefault").click(function(){
		    	if (!$("#radioDefaultIns").hasClass('checked')) {
					window.location.href="${ctx}/accessOptLog/list?type=searchinfo";
		    	}
			});
		    $("#radioPrimary").click(function(){
		    	if (!$("#radioPrimaryIns").hasClass('checked')) {
		    		window.location.href="${ctx}/accessOptLog/list?type=search";
		    	}
			});
		    var currentType = $("#currenttype").val();
		    if (currentType == 'searchinfo') {
		    	$("#radioDefaultIns").addClass('checked');
		    } else {
		    	$("#radioPrimaryIns").addClass('checked');
		    }
		  });
	  
		function searchUser(cn,type,givenName){
			 var index = layer.load(1, {
  			  shade: [0.1,'#fff'] 
			}); 
			$.ajax({
				url: '${ctx}/accessOptLog/searchHints',
				data: {cn: cn,type:type, givenName: givenName},
				type: 'post',
				success: function(data){
					$('#hintsmodel').html(data);
					$('#table4').dataTable();
					$('#systemcodemodal').modal({
				        show:true,
				        backdrop:true
					});
					//console.log(data);
					layer.closeAll('loading');
				}
			});
		}
 		function choincesystemcode(){
			$("#table4_body").html("");
		} 
		
	   	$("#systemcodemodal").modal({
				show:false,
				backdrop: 'static', keyboard: false
		}); 
	   	(function($) {
            $.icheck = {
                init: function() {
                    var _this = this;
                    _this._checkbox = "checkbox";
                    _this._radio = "radio";
                    _this._disabled = "disabled";
                    _this._enable = "enable";
                    _this._checked = "checked";
                    _this._hover = "hover";
                    _this._arrtype = [_this._checkbox, _this._radio];
                    _this._mobile = /ipad|iphone|ipod|android|blackberry|windows phone|opera mini|silk/i.test(navigator.userAgent);
                    $.each(_this._arrtype, function(k, v) {
                        _this.click(v);
                        if(!_this._mobile){
                            _this.mouseover(v);
                            _this.mouseout(v);
                        }
                    });
                },
                click: function(elem) {
                    var _this = this;
                    elem = "." + elem;
                    $(document).on("click", elem, function() {
                        var $this = $(this),
                            _ins = $this.find("ins");
                        if (!(_ins.hasClass(_this._disabled) || _ins.hasClass(_this._enable))) {
                            if ( !! _ins.hasClass(_this._checked)) {
                                _ins.removeClass(_this._checked).addClass(_this._hover);
                            } else {
                                if (/radio/ig.test(elem)) {
                                    var _name = $this.attr("name");
                                    $(elem + "[name=" + _name + "]").find("ins").removeClass(_this._checked);
                                }
                                $(elem).find("ins").removeClass(_this._hover);
                                _ins.addClass(_this._checked);
                            }
                        }
                    });
                },
                mouseover: function(elem) {
                    var _this = this;
                    elem = "." + elem;
                    $(document).on("mouseover", elem, function() {
                        var $this = $(this);
                        var _ins = $this.find("ins");
                        if (!(_ins.hasClass(_this._disabled) || _ins.hasClass(_this._enable) || _ins.hasClass(_this._checked))) {
                            _ins.addClass(_this._hover);
                            $this.css("cursor","pointer");
                        } else{
                            $this.css("cursor","default");
                        }
                    });
                },
                mouseout: function(elem) {
                    var _this = this;
                    elem = "." + elem;
                    $(document).on("mouseout", elem, function() {
                        $(elem).find("ins").removeClass(_this._hover);
                    });
                }
            };

            $.icheck.init();

        })(jQuery);
   	   
 </script>
</body>
</html>
