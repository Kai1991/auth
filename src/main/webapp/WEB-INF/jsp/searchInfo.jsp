<!DOCTYPE html>

<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${ctx}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>

<body id="findUser">
	<div style="margin: 5% auto;">
		<!-- 搜索框 -->
		<div class="row">
			<div class="col-lg-4 col-md-6 col-sm-8 col-xs-12 col-lg-offset-4 col-md-offset-3 col-sm-offset-2">
				<div class="input-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<input type="text" class="form-control input-lg" id="search-text" placeholder='<spring:message code='screen.user.search.info'/>' onkeydown="keydownSearch()">
					<div class="input-group-btn">
						<div class="btn btn-primary btn-lg" onclick="searchUser()">
							<span class="glyphicon glyphicon-search"></span>
						</div>
						<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 搜索结果 -->
		<div class="row" style="margin-top: 10px;">
			<div class="col-lg-4 col-md-6 col-sm-8 col-xs-12 col-lg-offset-4 col-md-offset-3 col-sm-offset-2">
				<form id="form1" class="form-horizontal panel panel-default panel-body panel-body-nopadding" style="background-color: #CAE9D3;">
					<div class="panel-body">
						<div class="form-group">
							<label id="a" class="col-sm-3 control-label"><spring:message
									code="screen.user.uid" /></label>
							<div class="col-sm-9">
								<span class="form-control" id="user_uid"></span>
							</div>
						</div>
						<div class="form-group">
							<label id="a" class="col-sm-3 control-label"><spring:message
									code="screen.user.givenName" /></label>
							<div class="col-sm-9">
								<span class="form-control" id="user_givenname"></span>
							</div>
						</div>
						<div class="form-group">
							<label id="a" class="col-sm-3 control-label"><spring:message
									code="screen.user.orgname" /></label>
							<div class="col-sm-9">
								<span class="form-control" id="user_orgname"></span>
							</div>
						</div>
						<div class="form-group">
							<label id="a" class="col-sm-3 control-label"><spring:message
									code="screen.user.deptpath" /></label>
							<div class="col-sm-9">
								<span class="form-control" id="user_deptpath"></span>
							</div>
						</div>
 						<%--<div class="form-group">
							<label id="a" class="col-sm-3 control-label"><spring:message
									code="screen.user.postname" /></label>
							<div class="col-sm-9">
								<span class="form-control" id="user_postname"></span>
							</div>
						</div> --%>
						<div class="form-group">
							<label id="a" class="col-sm-3 control-label"><spring:message
									code="screen.user.telephoneNumber" /></label>
							<div class="col-sm-9">
								<a id="tel" href="">
									<span class="form-control" id="user_telephoneNumber"></span>
								</a>
							</div>
						</div>
						<div class="form-group">
							<label id="a" class="col-sm-3 control-label"><spring:message
									code="screen.user.mail" /></label>
							<div id="a" class="col-sm-9">
								<a id="mail">
									<span class="form-control" id="user_mail"></span>
								</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div align="center" class="col-lg-4 col-md-6 col-sm-8 col-xs-12 col-lg-offset-4 col-md-offset-3 col-sm-offset-2">
				<spring:message	code="screen.user.service.times"/>
				<span id="searchtotal"></span>
			</div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div align="center" class="col-lg-4 col-md-6 col-sm-8 col-xs-12 col-lg-offset-4 col-md-offset-3 col-sm-offset-2">
				${warnmsg}
			</div>
		</div>
	</div>
	<!-- 模态对话框 old-->
	<!-- 
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
	 -->
	<!-- 模态对话框 new -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	        <div class="modal-header">
	            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
	            <h4 class="modal-title"><spring:message	code="screen.user.prompt"/></h4>
	        </div>
	        <div id="error" class="modal-body"></div>
	    </div>
	  </div>
	</div>
	<!-- js code -->
	<script src="${ctx}/bootstrap/js/jquery-1.11.0.min.js"></script>
	<script src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/md5.js"></script>
	<script type="text/javascript" src="${ctx}/js/searchInfo.js"></script>
	<script type="text/javascript" src="${ctx}/js/bootstrap-suggest.min.js"></script>
	<script type="text/javascript">
    /**
     * 提示查询
     */
    var baiduBsSuggest = $("#search-text").bsSuggest({
        allowNoKeyword: false,	//是否允许无关键字时请求数据。为 false 则无输入时不执行过滤请求
        multiWord: true,	//以分隔符号分割的多关键字支持
        separator: ",",	//多关键字支持时的分隔符，默认为空格
        getDataMethod: "url",	//获取数据的方式，总是从 URL 获取
        url: 'searchInfo1?search=',	/*优先从url ajax 请求 json 帮助数据，注意最后一个参数为关键字请求参数*/
        processData: function (json) {    // url 获取数据时，对数据的处理，作为 getData 的回调函数
        	var jsondata=json.ret;
        	if (jsondata.length<=2) {
        		return false;
        	}
        	var i, len, data = {value: []};
            if (!json || !json.ret || json.ret.length === 0) {
                return false;
            }
            
            var userInfos = eval("(" + json.ret + ")");
            for (var i = 0; i < userInfos.length; i++) {
            	data.value.push({
                    word: userInfos[i].name
                });
            }
            //字符串转化为 js 对象
            return data;
        }
    });
    $("form").submit(function(e) {
        return false;
    });
    $.ajax({
		type : "POST",
		url : "getTotalAccess",
		async : false,
		data : {
		},
		dataType : "json",
		success : function(msg) {
			var data = msg.ret;
			var accesscount = eval("(" + data + ")");
			$("#searchtotal").text(accesscount.countvalue);
		},
		error: function(data) {
			//
		}
	});
    </script>
</body>
</html>
