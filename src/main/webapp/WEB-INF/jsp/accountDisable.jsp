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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="${ctx}/images/favicon.png" type="image/png">
  <link href="${ctx}/bootstrap/css/bootstrap.min.css" rel="stylesheet">  

  <title><spring:message code="screen.index.accountdisable" /></title>

  <link href="${ctx}/css/style.default.css" rel="stylesheet">
  <link href="${ctx}/css/jquery.datatables.css" rel="stylesheet">
</head>

<body >

	<!-- Preloader -->
	<div id="preloader">
	    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
	</div>

	<section>
	  
		<%@ include file="accountDisableMenu.jsp"%>
	  
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

			<!-- 搜索部分 start-->
			<div style="margin: 5% auto; height: 40px;">
				<!-- 搜索框 -->
				<div class="row">
					<div
						class="col-lg-4 col-md-6 col-sm-8 col-xs-12 col-lg-offset-4 col-md-offset-3 col-sm-offset-2">
						<div class="input-group col-lg-12 col-md-12 col-sm-12 col-xs-12" style="width:550px;">
							<input type="text" class="form-control input-lg" id="search-text"
								placeholder='<spring:message code='screen.user.search.info'/>'
								onkeydown="keydownSearch()">
							<div class="input-group-btn">
								<div class="btn btn-primary btn-lg" onclick="searchUser()">
									<span class="glyphicon glyphicon-search"> 
									<spring:message	code="screen.join.submit" /></span>
								</div>
								<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 搜索部分 end-->
-			<!-- 分页列表 -->
		    <div class="contentpanel">
		        <div class="row">
					<div class="panel panel-default">
				        <div class="panel-heading">
				          <h3 class="panel-title">
						  	<spring:message code="screen.index.common.list"/>
						  </h3>
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
					                    <th><spring:message code="screen.index.employeeope"/></th>
					                 </tr>
					              </thead>
					              
					               <tbody>
					              	 <c:forEach var="employee" items="${employees}">
										<tr class="gradeA">
											<td>
											${employee.uid}
											</td>
											<td>
											${employee.givenName}
											</td>
											<td>
											${employee.orgname}
											</td>
											<td>
											${employee.deptname}
											</td>
											<td>
											${employee.postname}
											</td>
											<td>
												<a id="${employee.uid}" name="${employee.cn}" href="javascript:void(0)" class="delete-row" onclick="del(this)"><i class="deleterecord"></i></a>
											</td>
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
	<!-- 默认静态提示框 -->
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

<!-- js code -->
	<script type="text/javascript" src="${ctx}/js/md5.js"></script>
	<script type="text/javascript" src="${ctx}/js/bootstrap-suggest.min.js"></script>
	<script type="text/javascript">
	
	  jQuery(document).ready(function() {
		    
		    "use strict";
		    
		    jQuery('#table1').dataTable();
		    
		    jQuery('#table2').dataTable({
		    //"aaSorting": [[5, "desc"]] 指定分页降序排列。插件默认是按第一列升序排列
   	        "sPaginationType": "full_numbers","aaSorting": [[5, "desc"]]
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
		  
		  
		  });
  
	  /**
	     * 搜索部分 
	     * 提示查询
	  */
    var baiduBsSuggest = $("#search-text").bsSuggest({
        allowNoKeyword: false,	//是否允许无关键字时请求数据。为 false 则无输入时不执行过滤请求
        multiWord: true,		//以分隔符号分割的多关键字支持
        separator: ",",			//多关键字支持时的分隔符，默认为空格
        getDataMethod: "url",	//获取数据的方式，总是从 URL 获取
        url: '${ctx}/accountDisable/searchInfo1?search=',	/*优先从url ajax 请求 json 帮助数据，注意最后一个参数为关键字请求参数*/
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
    
 // 点击搜索按钮--start
    function searchUser() {
    	searchByCondtion();
    }

 	//最上方的搜索框鼠标按下事件
    function keydownSearch() {
    	var theEvent = window.event || e;
    	var code = theEvent.keyCode || theEvent.which;
    	if (code == 13) {
    		searchByCondtion();
    	}
    }
    

    function searchByCondtion() {
    	var searchText = document.getElementById('search-text').value;
    	if(searchText==""||searchText==null){
    		return false;
    	}
    	//var uid = null;
    	var usercode = null;
    	var beginIndex = searchText.indexOf("(");
    	var endIndex = searchText.indexOf(")");
    	if (searchText == null || searchText == "" || beginIndex < 0) {
    		return;
    	} else {
    		usercode = searchText.substring(beginIndex + 1, endIndex);
    	}
    	$.ajax({
    		type : "POST",
    		url : '${ctx}/accountDisable/addAccountDisable',
    		async : false,
    		data : {"usercode":usercode},
    		dataType : "json",
    		success : function(msg) {
    			window.location.reload();
    		},
    		error: function(data) {
    			$('#error').html(data.responseText);
    			$('#search-text').val("");
    			$('#myModal').modal({
    		        show:true,
    		        backdrop:true
    			});
    		}
    	});
    }    
	function del(obj){
		//var uid = obj.id;
		var usercode = obj.name;
		$.ajax({
			url: '${ctx}/accountDisable/deleteAccountDisable',
			data: {"usercode":usercode},
			type: 'POST',
			dataType : "json",
			success: function(data){
				window.location.reload();
			}
		});
	}
</script>
</body>
</html>
