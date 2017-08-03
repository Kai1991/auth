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
			        <li>
			        	<a href="${ctx}/accountDisable/list"><i class="fa fa-th-list"></i> <span><spring:message code="screen.index.accountdisable" /></span></a>
			        </li>
			        <li>
			        	<a href="${ctx}/accountKeyMonitor/list"><i class="fa fa-th-list"></i> <span><spring:message code="screen.index.accountkeymonitor" /></span></a>
			        </li>			        
				</ul>
		    </div><!-- leftpanelinner -->
		</div><!-- leftpanel -->
</body>
</html>