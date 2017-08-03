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

  <link href="${ctx}/css/jquery.datatables.css" rel="stylesheet">
  
  <link href="${ctx}/css/animate.delay.css">	
  <link href="${ctx}/css/animate.min.css">
  <link href="${ctx}/css/bootstrap-override.css">
  <link href="${ctx}/css/bootstrap.min.css">
  <link href="${ctx}/css/font-awesome.min.css">
  <link href="${ctx}/css/jquery-ui-1.10.3.css">
  <link href="${ctx}/css/lato.css">	
  <link href="${ctx}/css/prettyPhoto.css">	
  <link href="${ctx}/css/style.default.css" rel="stylesheet">
</head>

<body>

	<!-- Preloader -->
	<div id="preloader">
	    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
	</div>

	<section>
	  
		<%@ include file="menu.jsp"%>
		<div class="mainpanel">
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
						  	<spring:message code="screen.system.liebiao"/>
						  </h3>
				        </div>
				        <div class="panel-body">
				          <div class="clearfix mb30">
				          <button type="button" class="btn btn-primary" data-toggle="modal" style="float:right"
																				data-target="#exampleModal" data-whatever="@mdo">
								<spring:message code="screen.system.addSystem"/>												
						  </button>
						</div>
				          
				          
				          <div class="row">
				          <div class="col-sm-9">
				            <div class="row filemanager">
					              	 <c:forEach var="systemcode" items="${systemcodeList}">
					              	 	<input hidden="true" id="hidden" value=""/>
					              	 	 <div class="col-xs-6 col-sm-4 col-md-3 image">
								              <div class="thmb">
								                <div class="btn-group fm-group" style="display: none;">
								                    <button type="button" class="btn btn-default dropdown-toggle fm-toggle" data-toggle="dropdown">
								                      <span class="caret"></span>
								                    </button>
								                    <ul class="dropdown-menu fm-menu" role="menu">
								                    <li  onclick="updateSystem('${systemcode.id}')">
									                    <a href="javascript:;">
									                      <i class="fa fa-pencil" data-toggle="modal" data-target="#updateModal"><spring:message code="screen.system.update"/></i>
									                    </a>
								                    </li>
								                    <li onclick="deleteSystem('${systemcode.id}')">
								                       <a href="javascript:;">
									                      <i  class="fa fa-trash-o"><spring:message code="screen.system.delete"/></i>
									                    </a>
								                    </li>
								                    </ul>
								                </div><!-- btn-group -->
								                <div class="thmb-prev">
								                  <a>
								                  <img style="height:100px;" src="data:image/jpg;base64,${systemcode.systemcodeImage}" class="img-responsive" title="${systemcode.systemName}"> 
								                  </a>
								                </div>
								                <!-- 
								                <h5 class="fm-title"><a href="http://${systemcode.url}">${systemcode.url}</a></h5>
								                 -->
								                <small class="text-muted">${systemcode.systemcode}</small><br>
								                <small class="text-muted">${systemcode.systemName}</small><br>
								                <small class="text-muted" data-toggle="tooltip" data-placement="top" title="${systemcode.description}">
								                	<c:choose>
								                		<c:when test="${fn:length(systemcode.description)>=10}">
										                	${fn:substring(systemcode.description,0,10)}...
								                		</c:when>
								                		<c:otherwise>
								                			${fn:substring(systemcode.description,0,10)}
								                		</c:otherwise>
								                	</c:choose>
								                </small><br>
								                <small class="text-muted"><spring:message code="screen.system.dengji1"/>:${systemcode.level} </small>
								              </div><!-- thmb -->
								            </div>
												
									 </c:forEach>
				          	</div>
				          </div>
				          </div>
				        </div><!-- panel-body -->
					</div><!-- panel -->
				</div><!-- contentpanel -->
			</div><!-- mainpanel -->
		</div>
		
		
		
		
			<!-- tanchu add-->
	<div class="modal fade bs-example-modal-lg" id="exampleModal"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">
						<spring:message code="screen.system.add"/>
					</h4>
				</div>
				<div class="modal-body" style="hight:900">
					<div class="form-group">
						<div>
							<spring:message code="screen.system.bianma"/>:
							<input type="text" style="width:200px" id="systemCodeCode">
							<span style="color:red" id="systemCodeCodeMsg"></span>
						</div>
						<div>
							<spring:message code="screen.system.name"/>:
							<input type="text" style="width:200px" id="systemCodeName">
						</div>
						
						<div>
							<spring:message code="screen.system.miaoshu"/>:
							<textarea class="form-control" rows="3" id="systemCodeMiao"></textarea>
							<span id="systemCodeMiaoMsg"></span>
						</div>
						<form id="myForm">
						<spring:message code="screen.system.pic"/>:
							<input name="pic" style="text-align:center" type="file" id="pic" title="Search for a file to add" class="btn-primary" onchange="shangChuan()">
						</form>	
							<span id="picMsg" style="color:red"></span>
						<div>
							<spring:message code="screen.system.url" />:
							<input type="text" style="width:200px" id="systemCodeUrl">
							<span id="systemCodeUrlMsg"></span>
						</div>
						<div>
							<spring:message code="screen.system.level"/>
							<select id="systemCodeLevel" >
								<option>0</option>
								<option>1</option>
							</select>
							<spring:message code="screen.system.dengji"/>
						</div>
						
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<spring:message code="screen.system.reset"/>
					</button>
					<button type="button" class="btn btn-primary" 
						id="ok" onclick="tijiao()">
						<spring:message code="screen.system.ok"/>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- tanchu update -->
		<div class="modal fade bs-example-modal-lg" id="updateModal"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">
						<spring:message code="screen.system.add"/>
					</h4>
				</div>
				<div class="modal-body" style="hight:900">
					<div class="form-group">
						<div>
							<spring:message code="screen.system.bianma"/>:
							<input type="text" style="width:200px" id="systemCodeUpdateCode">
							<span id="systemCodeUpdateNameMsg"></span>
						</div>
						<div>
							<spring:message code="screen.system.name"/>:
							<input type="text" style="width:200px" id="systemCodeUpdateName">
						</div>
						<div>
							<spring:message code="screen.system.miaoshu"/>:
							<textarea class="form-control" rows="3" id="systemCodeUpdateMiao"></textarea>
							<span id="systemCodeUpdateMiaoMsg"></span>
						</div>
						<form id="myForm1">
						<spring:message code="screen.system.pic"/>:
							<input name="pic1" style="text-align:center" type="file" id="pic1" title="Search for a file to add" class="btn-primary" onchange="shangChuan1()">
							<span id="picMsg"></span>
						</form>	
						<div>
							<spring:message code="screen.system.url" />:
							<input type="text" style="width:200px" id="systemCodeUpdateUrl">
							<span id="systemCodeUpdateUrlMsg"></span>
						</div>
						<div>
							<spring:message code="screen.system.level"/>
							<select id="systemCodeUpdateLevel" >
								<option>0</option>
								<option>1</option>
							</select>
							<spring:message code="screen.system.dengji"/>
						</div>
						
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<spring:message code="screen.system.reset"/>
					</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						id="updateOk" onclick="updateOk()">
						<spring:message code="screen.system.ok"/>
					</button>
				</div>
			</div>
		</div>
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
<script src="${ctx}/js/jquery.prettyPhoto.js"></script>
<script src="${ctx}/js/jquery.datatables.min.js"></script>
<script src="${ctx}/js/select2.min.js"></script>
<script src="${ctx}/js/custom.js"></script>
<script type="text/javascript" src="${ctx}/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.form.js"></script>
<script type="text/javascript" src="${ctx}/js/user/systemcode.js"></script>
<script type="text/javascript">

jQuery(document).ready(function(){
  
  "use strict";
  
  jQuery('.thmb').hover(function(){
    var t = jQuery(this);
    t.find('.btn-xs').show();
    t.find('.fm-group').show();
  }, function() {
    var t = jQuery(this);
    if(!t.closest('.thmb').hasClass('checked')) {
      t.find('.btn-xs').hide();
      t.find('.fm-group').hide();
    }
  });
  
  jQuery('.btn-xs').each(function(){
    var t = jQuery(this);
    var parent = t.parent();
    if(t.find('input').is(':checked')) {
      t.show();
      parent.find('.fm-group').show();
      parent.addClass('checked');
    }
  });
  
  
  jQuery('.btn-xs').click(function(){
    var t = jQuery(this);
    if(!t.find('input').is(':checked')) {
      t.closest('.thmb').removeClass('checked');
      enable_itemopt(false);
    } else {
      t.closest('.thmb').addClass('checked');
      enable_itemopt(true);
    }
  });
  
  jQuery('#selectall').click(function(){
    if(jQuery(this).is(':checked')) {
      jQuery('.thmb').each(function(){
        jQuery(this).find('input').attr('checked',true);
        jQuery(this).addClass('checked');
        jQuery(this).find('.btn-xs, .fm-group').show();
      });
      enable_itemopt(true);
    } else {
      jQuery('.thmb').each(function(){
        jQuery(this).find('input').attr('checked',false);
        jQuery(this).removeClass('checked');
        jQuery(this).find('.btn-xs, .fm-group').hide();
      });
      enable_itemopt(false);
    }
  });
  
  function enable_itemopt(enable) {
    if(enable) {
      jQuery('.itemopt').removeClass('disabled');
    } else {
      
      // check all thumbs if no remaining checks
      // before we can disabled the options
      var ch = false;
      jQuery('.thmb').each(function(){
        if(jQuery(this).hasClass('checked'))
          ch = true;
      });
      
      if(!ch)
        jQuery('.itemopt').addClass('disabled');
    }
  }
  
  jQuery("a[data-rel^='prettyPhoto']").prettyPhoto();
  
});


</script>
</body>
</html>
