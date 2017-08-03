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
						  	<spring:message code="screen.syn.index"/>
						  </h3>
				        </div>
				        <div class="panel-body">
				          <div class="clearfix mb30">
						</div>
				          
				          
				          <div class="row">
				          <div class="col-sm-9">
				            <div class="row filemanager">
				            			<input id="checkorg" onclick="checkorg()" type="button" value='<spring:message code="screen.check.org"/>' class="btn btn-success"/>
					            		<input id="synorg" onclick="synorg()" type="button" value='<spring:message code="screen.syn.org"/>' class="btn btn-success"/>
										<span id="orgmsg"></span>
										<span id="orgtime" style="color:red"></span>
										<div style="height:20px"></div>
										
										<br>
										<input id="checkdept" onclick="checkdept()" type="button" value="<spring:message code="screen.check.dept"/>" class="btn btn-success"/>										
										<input id="syndept" onclick="syndept()" type="button" value="<spring:message code="screen.syn.dept"/>" class="btn btn-success"/>
										<span id="deptmsg"></span>
										<span id="depttime" style="color:red"></span>
										<div style="height:20px"></div>
										
										
										<br>
										<input id="checkuser" onclick="checkuser()" type="button" value="<spring:message code="screen.check.user"/>" class="btn btn-success"/>
										<input id="synuser" onclick="synuser()" type="button" value="<spring:message code="screen.syn.user"/>" class="btn btn-success"/>
										<span id="usermsg"></span>
										<span id="usertime" style="color:red"></span>
				          	</div>
				          	<br>
				          	<div class="row filemanager"  style="overflow-x: auto;overflow-y: auto; height: 400px; width:1000px;">
				          		<table id="table" style="width:1000px">
				          		</table>
				          	</div>
				          	
				          </div>
				          </div>
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
<script src="${ctx}/js/jquery.prettyPhoto.js"></script>
<script src="${ctx}/js/jquery.datatables.min.js"></script>
<script src="${ctx}/js/select2.min.js"></script>
<script src="${ctx}/js/custom.js"></script>
<script type="text/javascript" src="${ctx}/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.form.js"></script>
<script type="text/javascript" src="${ctx}/js/user/syndata.js"></script>
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