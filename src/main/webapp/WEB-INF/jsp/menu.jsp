<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
			<div class="leftpanel">
			<div class="logopanel">
		        <h1><span>[</span> <spring:message code="screen.index.header" /> <span>]</span></h1>
		    </div><!-- logopanel -->
		    
		    <div class="leftpanelinner">
				<h5 class="sidebartitle"><spring:message code="screen.index.common.navigation" /></h5>
				<ul class="nav nav-pills nav-stacked nav-bracket">
					<!-- 
			        <li><a href="email.html"><span class="pull-right badge badge-success">2</span><i class="fa fa-envelope-o"></i> <span>Email</span></a></li>
			        <li class="nav-parent"><a href=""><i class="fa fa-suitcase"></i> <span>UI Elements</span></a>
			          <ul class="children">
			            <li><a href="buttons.html"><i class="fa fa-caret-right"></i> Buttons</a></li>
			            <li><a href="icons.html"><span class="pull-right badge badge-danger">updated</span><i class="fa fa-caret-right"></i> Icons</a></li>
			            <li><a href="typography.html"><i class="fa fa-caret-right"></i> Typography</a></li>
			            <li><a href="alerts.html"><i class="fa fa-caret-right"></i> Alerts &amp; Notifications</a></li>
			            <li><a href="modals.html"><i class="fa fa-caret-right"></i> Modals</a></li>
			            <li><a href="tabs-accordions.html"><i class="fa fa-caret-right"></i> Tabs &amp; Accordions</a></li>
			            <li><a href="sliders.html"><i class="fa fa-caret-right"></i> Sliders</a></li>
			            <li><a href="graphs.html"><i class="fa fa-caret-right"></i> Graphs &amp; Charts</a></li>
			            <li><a href="widgets.html"><i class="fa fa-caret-right"></i> Panels &amp; Widgets</a></li>
			            <li><a href="extras.html"><i class="fa fa-caret-right"></i> Extras</a></li>
			          </ul>
			        </li>
					-->
					<li>
			        	<a href="${ctx}/index"><i class="fa fa-th-list"></i> <span><spring:message code="screen.index.part.accountmanager" /></span></a>
			        </li>
			        <li>
			        	<a href="${ctx}/authority/list"><i class="fa fa-th-list"></i> <span><spring:message code="screen.index.authority" /></span></a>
			        </li>
			        <li>
			        	<a href="${ctx}/vpn"><i class="fa fa-th-list"></i> <span>VPN<spring:message code="screen.index.part.accountmanager" /></span></a>
			        </li>
			        <li id="ss">
			        	<a href="${ctx}/systemcode/system" ><i class="fa fa-th-list"></i> <span><spring:message code="screen.index.systemcode"/></span></a>
			        </li>
			        <li >
			        	<a href="${ctx}/search/searchText" ><i class="fa fa-th-list"></i> <span><spring:message code="screen.index.peoplesearch"/></span></a>
			        </li>
			        <li >
			        	<a href="${ctx}/accessOptLog/list?type=searchinfo" ><i class="fa fa-th-list"></i> <span><spring:message code="Search.for.historical.statistics"/></span></a>
			        </li>
			        <li >
			        	<a href="${ctx}/synData" ><i class="fa fa-th-list"></i> <span><spring:message code="screen.syn.index"/></span></a>
			        </li>
			        <li>
			        	<a href="${ctx}/accountmonitor/index"><i class="fa fa-th-list"></i> <span><spring:message code="screen.monitor.index"/></span></a>
			        </li>
			        <li>
			        	<a href="${ctx}/clearPasswdResetLock/index"><i class="fa fa-th-list"></i> <span><spring:message code="screen.clearlock.index"/></span></a>
			        </li>
			        <li>
			        	<a href="${ctx}/emailProps/index"><i class="fa fa-th-list"></i> <span><spring:message code="screen.emailprops.index"/></span></a>
			        </li>
			        <li>
			        	<a href="${ctx}/acctWeakPwdRule/index"><i class="fa fa-th-list"></i> <span><spring:message code="screen.weakpwdrule.index.rule"/></span></a>
			        </li>
			        <li>
			        	<a href="${ctx}/acctWeakPwdCfg/index"><i class="fa fa-th-list"></i> <span><spring:message code="screen.weakpwdcfg.index.title"/></span></a>
			        </li>
				</ul>
		    </div><!-- leftpanelinner -->
		</div><!-- leftpanel -->
</body>
</html>