<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<link href="${ctx}/css/jquery.datatables.css" rel="stylesheet">

<link href="${ctx}/css/animate.delay.css">
<link href="${ctx}/css/animate.min.css">
<link href="${ctx}/css/bootstrap-override.css">
<link href="${ctx}/css/bootstrap.min.css">
<link href="${ctx}/css/font-awesome.min.css">
<link href="${ctx}/css/jquery-ui-1.10.3.css">
<link href="${ctx}/css/lato.css">
<link href="${ctx}/css/prettyPhoto.css">
<link href="${ctx}/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet" href="${ctx}/css/jquery.tagsinput.css" />
<link rel="stylesheet" href="${ctx}/css/colorpicker.css" />
<link rel="stylesheet" href="${ctx}/css/dropzone.css" />
<link href="${ctx}/css/style.default.css" rel="stylesheet">
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

				<form class="searchform" action="${ctx}/index" method="post">
					<input type="text" class="form-control" name="query"
						placeholder="<spring:message code="screen.index.searchhere" />" />
				</form>

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
									<!-- 
		                <li><a href="profile.html"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
		                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a></li>
		                <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
		              	-->
									<li><a href="${ctx}/logout"><i
											class="glyphicon glyphicon-log-out"></i> <spring:message
												code="screen.monitor.name" /></a></li>
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
					<i class="fa fa-home"></i><spring:message code="screen.monitor.name" /><span></span>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"> <spring:message
							code="screen.index.common.location.here" />
					</span>
					<ol class="breadcrumb">
						<li class="active"><spring:message code="screen.monitor.name" /></li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">
			<div class="row">
				<!-- all user -->
		        <div class="col-sm-6 col-md-4">
		          <div class="panel panel-success panel-stat">
		            <div class="panel-heading">
		              <div class="stat">
		                <div class="row">
		                  <div class="col-xs-4">
		                    <img src="${ctx}/images/is-user.png" alt="">
		                  </div>
		                  <div class="col-xs-8">
		                    <small class="stat-label"><spring:message code="screen.monitor.allcount"/></small>
		                    <h1 id="alluser">900k+</h1>
		                  </div>
		                </div><!-- row -->
		
		                <div class="mb15"></div>
		
		                <div class="row">
		                  <div class="col-xs-6">
		                    <small class="stat-label"><spring:message code="screen.monitor.qiyong"/> / <spring:message code="screen.monitor.tingyong"/></small>
		                    <h4 id="qiyonguser">7.80</h4>
		                  </div>
		
		                  <div class="col-xs-6">
		                    <small class="stat-label"><spring:message code="screen.monitor.qiyongbili"/></small>
		                    <h4 id="qiyongbili">76.43%</h4>
		                  </div>
		                </div><!-- row -->
		              </div><!-- stat -->
		
		            </div><!-- panel-heading -->
		          </div><!-- panel -->
		        </div><!-- col-sm-6 -->
				<!-- mima -->
		        <div class="col-sm-6 col-md-4">
		          <div class="panel panel-danger panel-stat">
		            <div class="panel-heading">
		
		              <div class="stat">
		                <div class="row">
		                  <div class="col-xs-4">
		                    <img src="${ctx}/images/is-document.png" alt="">
		                  </div>
		                  <div class="col-xs-8">
		                    <small class="stat-label"><spring:message code="screen.monitor.fuwucount"/></small>
		                    <h1 id="mimauser">54.40%</h1>
		                  </div>
		                </div><!-- row -->
		
		                <div class="mb15"></div>
		
		                 <div class="row">
		                  <div class="col-xs-6">
		                    <small class="stat-label"><spring:message code="screen.monitor.chongzhirenshu"/></small>
		                    <h4 id="chongzhiuser">7.80</h4>
		                  </div>
		
		                  <div class="col-xs-6">
		                    <small class="stat-label"><spring:message code="screen.monitor.chongzhirenshubili"/></small>
		                    <h4 id="chongzhibili">76.43%</h4>
		                  </div>
		                </div><!-- row -->
		              </div><!-- stat -->
		
		            </div><!-- panel-heading -->
		          </div><!-- panel -->
		        </div><!-- col-sm-6 -->
				<!--log -->
		        <div class="col-sm-6 col-md-4">
		          <div class="panel panel-primary panel-stat">
		            <div class="panel-heading">
		
		              <div class="stat">
		                <div class="row">
		                  <div class="col-xs-4">
		                    <img src="${ctx}/images/is-document.png" alt="">
		                  </div>
		                  <div class="col-xs-8">
		                    <small class="stat-label"><spring:message code="screen.monitor.nowcount"/></small>
		                    <h1 id="logincount">300k+</h1>
		                  </div>
		                </div><!-- row -->
		
		                <div class="mb15"></div>
		
		                <div class="row">
		                  <div class="col-xs-6">
		                    <small class="stat-label"><spring:message code="screen.monitor.huoyuerenshu"/></small>
		                    <h4 id="huoyueuser">7.80</h4>
		                  </div>
		
		                  <div class="col-xs-6">
		                    <small class="stat-label"><spring:message code="screen.monitor.huoyuerenshubili"/></small>
		                    <h4 id="huoyueuserbili">76.43%</h4>
		                  </div>
		                </div><!-- row -->
		
		              </div><!-- stat -->
		
		            </div><!-- panel-heading -->
		          </div><!-- panel -->
		        </div><!-- col-sm-6 -->
      		</div>
      
      
      
      
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="clearfix mb30"></div>
							<div class="table-responsive">
								<div class="row" id="indexbody">
									
									
									<!-- quxiantu -->
									<div class="col-md-6 mb30">
										<h5 class="subtitle mb5"><spring:message code="screen.monitor.youjianzhuangtai"/></h5>
										<p class="mb15"><spring:message code="screen.monitor.descs"/></p>
										<div id="barchart" style="width: 100%; height: 300px"></div>
									</div>
									<!-- col-md-6 -->
									
									
									
									<!--  zhuzhuangtu -->
									<div class="col-sm-4">
										<h5 class="subtitle mb5"><spring:message code="screen.monitor.youjianzhuangtai"/></h5>
										<p class="mb15"><spring:message code="screen.monitor.desc"/></p>
										<br><br>
										<span class="sublabel" id="ruzhi"></span>
											<a onclick="return false;" href="javascript:void(0)" id="ruzhia"> 
												<div class="progress progress-sm">
														<div id="ruzhidiv" style="width: 100%" aria-valuemax="100" aria-valuemin="0"
															aria-valuenow="40" role="progressbar"
															class="progress-bar progress-bar-primary">
														</div>
												</div>
											</a>	
										<!-- progress -->
	
										<span class="sublabel" id="lizhi"></span>
										<a onclick="return false;" href="javascript:void(0);" id="lizhia">
											<div class="progress progress-sm">
												<div id="lizhidiv" style="width: 32%" aria-valuemax="100" aria-valuemin="0"
													aria-valuenow="40" role="progressbar"
													class="progress-bar progress-bar-success"></div>
											</div>
										</a>
										<!-- progress -->
	
										<span class="sublabel" id="tiaopei"></span>
										<a onclick="return false;" href="javasrcipt:void(0)" id="tiaopeia">
											<div class="progress progress-sm">
												<div id="tiaopeidiv" style="width: 82%" aria-valuemax="100" aria-valuemin="0"
													aria-valuenow="40" role="progressbar"
													class="progress-bar progress-bar-danger"></div>
											</div>
										</a>
										<!-- progress -->
	
										<span class="sublabel" id="xiugai"></span>
										<a onclick="return false;" href="javasrcipt:void(0)" id="xiugaia">
											<div class="progress progress-sm">
												<div id="xiugaidiv" style="width: 63%" aria-valuemax="100" aria-valuemin="0"
													aria-valuenow="40" role="progressbar"
													class="progress-bar progress-bar-warning"></div>
											</div>
										</a>
										<!-- progress -->
	
										<span class="sublabel" id="yichang"></span>
										<a onclick="return false;" href="javasrcipt:void(0)" id="yichanga">
											<div class="progress progress-sm">
												<div id="yichangdiv" style="width: 20%" aria-valuemax="100" aria-valuemin="0"
													aria-valuenow="40" role="progressbar"
													class="progress-bar progress-bar-success"></div>
											</div>
										</a>
										<!-- progress -->
									</div>
									
									
									
									
								</div>
								<!-- row -->
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
<script src="${ctx}/js/jquery-ui-1.10.3.min.js"></script>
<script src="${ctx}/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${ctx}/js/bootstrap.min.js"></script>
<script src="${ctx}/js/modernizr.min.js"></script>
<script src="${ctx}/js/jquery.sparkline.min.js"></script>
<script src="${ctx}/js/toggles.min.js"></script>
<script src="${ctx}/js/retina.min.js"></script>
<script src="${ctx}/js/jquery.cookies.js"></script>


<script src="${ctx}/js/flot/jquery.flot.min.js"></script>
<script src="${ctx}/js/flot/jquery.flot.resize.min.js"></script>
<script src="${ctx}/js/flot/jquery.flot.symbol.min.js"></script>
<script src="${ctx}/js/flot/jquery.flot.crosshair.min.js"></script>
<script src="${ctx}/js/flot/jquery.flot.categories.min.js"></script>
<script src="${ctx}/js/flot/jquery.flot.pie.min.js"></script>
<script src="${ctx}/js/morris.min.js"></script>
<script src="${ctx}/js/raphael-2.1.0.min.js"></script>
<script src="${ctx}/js/bootstrap-timepicker.min.js"></script>
<script src="${ctx}/js/jquery.tagsinput.min.js"></script>
<script src="${ctx}/js/jquery.mousewheel.js"></script>
<script src="${ctx}/js/jquery.datatables.min.js"></script>
<script src="${ctx}/js/select2.min.js"></script>
<script src="${ctx}/js/custom.js"></script>
<script src="${ctx}/js/user/monitor.js"></script>
<script src="${ctx}/js/user/monitors.js"></script>
<script type="text/javascript">
var leixingdata;
function pagefenye(page,data){
	leixingdata=data;
	var count;
	if(data.length>(page*5)){
		count=page*5;
	}else{
		count=data.length;
	}
	var html="";
	for(var i=((page-1)*5);i<count;i++){
		if(data[i].msg_fail_msg!="" && data[i].msg_fail_msg!=null){
			html+=
			"<tr>"+
				"<th>"+getFormatDateByLong(data[i].create_time*1000,"yyyy-MM-dd hh:mm:ss")+"</th>"+
				"<td>"+data[i].msg_state+"</td>"+
				"<td style='word-wrap:break-word;'>"+data[i].msg_content+"</td>"+
				"<td>"+data[i].msg_fail_msg+"</td>"+
				"<td><a class='btn btn-danger' onclick='updatestate("+data[i].id+")'><spring:message code="screen.monitor.caozuojieguo"  /></a></td>"+
			"</tr>";
		}else{
			html+=
				"<tr>"+
					"<th>"+getFormatDateByLong(data[i].create_time*1000,"yyyy-MM-dd hh:mm:ss")+"</th>"+
					"<td>"+data[i].msg_state+"</td>"+
					"<td style='word-wrap:break-word;'>"+data[i].msg_content+"</td>"+
					"<td>"+data[i].msg_fail_msg+"</td>"+
					"<td></td>"+
				"</tr>";
		}
		
	}
	$("#tbodys").html("");
	$("#tbodys").html(html);
   	var html1= " <li ><a href='javascript:;' aria-label='Previous' onclick='fenye(1)'><span aria-hidden='true'>«</span></a></li>";
    for(var j=0;j<Math.ceil(data.length/5);j++){
    	html1+=
    		"<li><a href='javascript:;' onclick='fenye("+(j+1)+")'>"+(j+1)+"</a></li>";
    }
   	 html1+=" <li><a href='javascript:;' aria-label='Next' onclick='fenye("+(Math.ceil(leixingdata.length/5))+")'><span aria-hidden='true'>»</span></a></li>";
   	 $("#fenyeul").html("");
   	 $("#fenyeul").html(html1);
}

function fenye(page){
	var count;
	if(leixingdata.length>(page*5)){
		count=page*5;
	}else{
		count=leixingdata.length;
	}
	var html="";
	for(var i=((page-1)*5);i<count;i++){
		if(leixingdata[i].msg_fail_msg!="" && leixingdata[i].msg_fail_msg!=null ){
			html+=
			"<tr>"+
				"<th>"+getFormatDateByLong(leixingdata[i].create_time*1000,"yyyy-MM-dd hh:mm:ss")+"</th>"+
				"<td>"+leixingdata[i].msg_state+"</td>"+
				"<td style='word-wrap:break-word;'>"+leixingdata[i].msg_content+"</td>"+
				"<td>"+leixingdata[i].msg_fail_msg+"</td>"+
				"<td><a class='btn btn-danger' onclick='updatestate("+leixingdata[i].id+")'><spring:message code="screen.monitor.caozuojieguo"/></td>"+
			"</tr>";
		}else{
			html+=
				"<tr>"+
					"<th>"+getFormatDateByLong(leixingdata[i].create_time*1000,"yyyy-MM-dd hh:mm:ss")+"</th>"+
					"<td>"+leixingdata[i].msg_state+"</td>"+
					"<td style='word-wrap:break-word;'>"+leixingdata[i].msg_content+"</td>"+
					"<td>"+leixingdata[i].msg_fail_msg+"</td>"+
					"<td></td>"+
				"</tr>";
		}
	}
	$("#tbodys").html("");
	$("#tbodys").html(html);
   	var html1= " <li><a href='javascript:;' aria-label='Previous' onclick='fenye(1)'><span aria-hidden='true'>«</span></a></li>";
    for(var j=0;j<Math.ceil(leixingdata.length/5);j++){
    	html1+=
    		"<li><a href='javascript:;' onclick='fenye("+(j+1)+")'>"+(j+1)+"</a></li>";
    }
   	 html1+=" <li><a href='javascript:;' aria-label='Next' onclick='fenye("+(Math.ceil(leixingdata.length/5))+")'><span aria-hidden='true'>»</span></a></li>";
   	 $("#fenyeul").html("");
   	 $("#fenyeul").html(html1);	
}




function showHtml(){
	$("#indexbody").html("");
	var html="<div class='form-group'>" +
				"<div class='col-sm-2'>" +
					"<input type='text' placeholder='<spring:message code="screen.monitor.uid"/>' class='form-control' id='peoplename'>" +
				"</div>" +
				"<div class='col-sm-2'>" +
					"<input type='text' placeholder='<spring:message code="screen.monitor.starttime"/>' class='form-control' id='choicetime1'>" +
			    "</div>" +
				"<div class='col-sm-2'>" +
					"<input type='text' placeholder='<spring:message code="screen.monitor.endtime"/>' class='form-control'  id='choicetime2'>" +
				"</div>" +
				"<div class='col-sm-2'>" +
					"<a class='btn btn-primary' id='queryneirong'><spring:message code="screen.monitor.search"/></a>" +
				"</div>" +
				"<div class='col-sm-1' style='float:right;'>" +
				"<a class='btn btn-primary' id='fanhui'><spring:message code="screen.monitor.fanhui"/></a>" +
				"</div>" +
			"</div>";
	html +=
	"<table class='table table-striped' style='table-layout:fixed;'>"+
      "<thead>"+
        "<tr>"+
          "<th  width='10%'><spring:message code="screen.monitor.time"/></th>"+
          "<th  width='6%'><spring:message code="screen.monitor.fasongstatus"/></th>"+
          "<th width='60%'><spring:message code="screen.monitor.content"/></th>"+
          "<th width='16%'><spring:message code="screen.monitor.jieguo"/></th>"+
          "<th width='8%'><spring:message code="screen.monitor.caozuo"/></th>"+
        "</tr>"+
      "</thead>"+
      "<tbody id='tbodys'>";

    html+=    
      "</tbody>"+
    "</table>";
	html +=
	 "<div class='bs-example' data-example-id='disabled-active-pagination'>"+
	   " <nav>"+
	     " <ul class='pagination' id='fenyeul'>";
	      
   	html+=
	     "</ul>"+
	  " </nav>"+
	 " </div>";      
	$("#indexbody").html(html);
    $('#choicetime1').datepicker();
    $('#choicetime2').datepicker();
    $("#fanhui").click(function(){
    	location.reload();
    });
}
Date.prototype.format = function (format) { 
	var o = { 
		"M+": this.getMonth() + 1, 
		"d+": this.getDate(), 
		"h+": this.getHours(), 
		"m+": this.getMinutes(), 
		"s+": this.getSeconds(), 
		"q+": Math.floor((this.getMonth() + 3) / 3), 
		"S": this.getMilliseconds() 
	} 
	if (/(y+)/.test(format)) { 
		format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length)); 
	} 
	for (var k in o) { 
		if (new RegExp("(" + k + ")").test(format)) { 
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length)); 
		} 
	} 
	return format; 
}
function getFormatDateByLong(l, pattern) { 
	return getFormatDate(new Date(l), pattern); 
} 
function getFormatDate(date, pattern) { 
	if (date == undefined) { 
		date = new Date(); 
	} 
	if (pattern == undefined) { 
		pattern = "yyyy-MM-dd hh:mm:ss"; 
	} 
	return date.format(pattern); 
} 



</script>
</body>
</html>