<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US">
<head profile="http://gmpg.org/xfn/11">
<title>门户首页</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/mc-login.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/base.css" />

<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.default2.css"/>
	
</head>
<body>
<!--门户首页头部E-->
<div class="header">
<div  class="T-mc-home">
    <h1><img src="${ctx}/images/new/logo.png" alt="美菜网"/><span class="T-home-text">欢迎您使用系统，当前用户：${givenName}
    <c:if test="${unreadMsgCount!=null && unreadMsgCount !='' }"><a href="javascript:;" onclick="window.open('${ctx}/autologin?systemcode=webmsg&systemurl=')" style="width:20px"><B>(${unreadMsgCount})</B></a></c:if>
<a id="danger" class="login-out" href="${ctx}/logout"><i class="fa fa-sign-out"></i>[退出]</a></span></h1>
</div> 
</div>
<!--门户首页头部S-->
<!--门户导航S-->
<div class="T-home-nav">
	<ul>
		<li class="acitve"><a href="javascript:;">门户中心</a></li>
		
		<c:forEach var="systeminfo" items="${systeminfo}">
			<c:if test="${systeminfo.url!=null &&systeminfo.url !='' }">
				<li><a href="javascript:;" onclick="window.open('${ctx}/autologin?systemcode=${systeminfo.systemcode}&systemurl=${systeminfo.url}')">${systeminfo.systemName}</a></li>
				
			</c:if>
		</c:forEach>
		
		
	</ul>
</div>
<!--门户首页头部E-->
<div class="T-Content-c T-home-banner">
	<img src="${ctx}/images/new/home-banner.jpg"/>
</div>

<input id="userCode" type="hidden" value="${userCode}"/>
<!-- 退票列表 -->
<div class="backticket_container" id="backticket_container">
	<h2><span>银行退票</span> 您的报销单出现银行退票，请及时处理！</h2>
	<ul class="news" id="backtick_list_ul"> 
	    <!-- <li><a href="#">报销单1</a><span class="time">2016-12-12</span></li>  -->
	</ul> 
</div>

<!-- 资产盘点结果核对列表 -->
<%-- <c:if test="${!empty assetPlanEntity }">
	<div class="backticket_container" id="assets_container" style="height: 105px;display: block;">
		<h2><span>资产盘点结果核对</span> </h2>
		<ul class="news" id="assets_container_list_ul"> 
		    <li style="width: inherit;"><a href="javascript:;" onClick="toAssets('${assetUrl}','${username}',${assetPlanEntity.id})">${assetPlanEntity.plan_name }</a><span class="time">${assetPlanEntity.plan_start_time }至${assetPlanEntity.plan_stop_time }</span></li> 
		</ul> 
	</div>
</c:if> --%>

<!-- 退票弹窗start -->
<div class="opacity_bg"></div>
<div class="back_container ball_city clearfix">
		<div class="back_rows">
			<h2>银行退票 <img class="close_rt" src="${ctx}/images/tip-icon.png"/></h2>
			<div class="in-list">
			
				<label class="back_lable">收款户名：</label>
				<div class="back_input">
					<input type="text" id="toAccountName" class="form-control" value=""/>
					<input type="hidden" id="toAccountName_hidden" value=""/>
					<input type="hidden" id="userCode" value=""/>
					<input type="hidden" id="msgdtoId" value=""/>
				</div>
			
				<div class="back_rows">
					<label class="control-label back_lable">收款账号：</label>
					<div class="back_input">
						<input type="text" id="toAccountCode" class="form-control" value=""/>
						<input type="hidden" id="toAccountCode_hidden" value=""/>
					</div>
				</div>
				<div class="back_rows">
					<label class="control-label back_lable">收款开户行：</label>
					<div class="back_input">
						<input type="text" id="toBankBranch" class="form-control" value=""/>
						<input type="hidden" id="toBankBranch_hidden" value=""/>
					</div>
				</div>
				
				<div class="back_rows">
					<label class="control-label back_lable">退票日期：</label>
					<div class="back_input">
						<label id="dateStr" class="back_lable_text"></label>
					</div>
				</div>
				<div class="back_rows">
			<label class="control-label back_lable">说明：</label>
			<div class="back_input">
				<textarea id="remark" class="back_lable_text" name="yoursuggest" cols ="50" rows = "3"></textarea>
			
			</div>
		</div>
		</div>
		<div class="back_rows back_rows_submit">
			<div class="back_submit">
					<button type="button" class="btn btn-default" id="back_cancel">取消</button>
				<%-- <c:if test="${result =='BACK_TICKET_FINISH'}">
					<button type="button" class="btn btn-primarya" disabled="disabled">已修改</button>
				</c:if>
				<c:if test="${result !='BACK_TICKET_FINISH'}"> --%>
					<button type="button" class="btn btn-primarya" id="back_submit">提交</button>
				<%-- </c:if> --%>
			</div>
		</div>
		
	</div>
</div>  
<!-- 退票弹窗end -->







<%-- <script src="${ctx}/js/jquery-1.10.2.min.js"></script> --%>
<script src="${ctx}/bootstrap/js/jquery-1.11.0.min.js"></script>

<spring:theme code="cas.javascript.file" var="casJavascriptFile" text="" />
<script type="text/javascript" src="<c:url value="${casJavascriptFile}" />"></script>

<script type="text/javascript" src="${ctx}/js/user/sys-back-ticket.js"></script>
<script type="text/javascript">

	$(function(){
		<c:if test="${!empty assetPlanEntity }">
			setCookie("MnWDklDyTnyQ","${username}"+","+"${assetPlanEntity.id}");
		</c:if>
		<c:if test="${empty assetPlanEntity }">
			setCookie("MnWDklDyTnyQ","${username}");
		</c:if>
	});
	
	//资产盘点跳转并使用cookie
	function toAssets(assetUrl,username,planId){
		//setCookie("MnWDklDyTnyQ",username+","+planId);
		window.open(assetUrl);
	}
	
	//存cookie的方法
	function setCookie(name,value) {
	   document.cookie = name + "="+ value +";path=/;domain=yunshanmeicai.com";
	}
</script>
</body>
</html>