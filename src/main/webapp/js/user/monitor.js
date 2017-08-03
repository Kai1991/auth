$(function(){
	
	var now = new Date();                    //当前日期
    var nowDayOfWeek = now.getDay();         //今天本周的第几天
    var nowDay = now.getDate();              //当前日
    var nowMonth = now.getMonth();           //当前月
    var nowYear = now.getYear();             //当前年
    nowYear += (nowYear < 2000) ? 1900 : 0;  //
	//格式化日期：yyyy-MM-dd   
	function formatDate(date) {   
	    var myyear = date.getFullYear();   
	    var mymonth = date.getMonth() + 1;   
	    var myweekday = date.getDate();   
	    if (mymonth < 10) {   
	        mymonth = "0" + mymonth;   
	    }   
	    if (myweekday < 10) {   
	        myweekday = "0" + myweekday;
	    }   
	    return (myyear + "-" + mymonth + "-" + myweekday);   
	}  
	//获得本周的开始日期   
	function getWeekStartDate() {   
	    var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);   
	    return formatDate(weekStartDate);   
	}   
	//获得本周的结束日期   
	function getWeekEndDate() {   
	    var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));   
	    return formatDate(weekEndDate);   
	} 
	//转换成时间戳
	var starttime=getWeekStartDate();
	var startstamp= Date.parse(new Date(starttime))/1000-(60*60*8);
	var endtime=getWeekEndDate();
	var endstamp=Date.parse(new Date(endtime))/1000+(60*60*16);
	//柱状图
	function zhuzhuang(){
		$.ajax({
			url:"accountqueryallcontent",
			dataType:"json",
			data:{
				"starttime":startstamp,
				"endtime":endstamp
			},
			type:"POST",
			success:function(data){
				var week1=new Array();
				var week2=new Array();
				var week3=new Array();
				var week4=new Array();
				var week5=new Array();
				var week6=new Array();
				var week7=new Array();
				for(var i=0;i<data.length;i++){
					var time =data[i].create_time;
					if(startstamp<=time && time<(startstamp+(24*60*60))){
						week1.push(data[i]);
					}else if((startstamp+(24*60*60))<=time && time<(startstamp+(24*60*60*2))){
						week2.push(data[i]);
					}else if((startstamp+(24*60*60*2))<=time && time<(startstamp+(24*60*60*3))){
						week3.push(data[i]);
					}else if((startstamp+(24*60*60*3))<=time && time<(startstamp+(24*60*60*4))){
						week4.push(data[i]);
					}else if((startstamp+(24*60*60*4))<=time && time<(startstamp+(24*60*60*5))){
						week5.push(data[i]);
					}else if((startstamp+(24*60*60*5))<=time && time<(startstamp+(24*60*60*6))){
						week6.push(data[i]);
					}else{
						week7.push(data[i]);
					}
				}
				/***** BAR CHART *****/
				var bardata = [ ["周日", week1.length], ["周一", week2.length], ["周二", week3.length], ["周三", week4.length], ["周四", week5.length], ["周五", week6.length], ["周六", week7.length] ];
				
				jQuery.plot("#barchart", [ bardata ], {
					series: {
						lines: {
							lineWidth: 1  
						},
						bars: {
							show: true,
							barWidth: 0.5,
							align: "center",
							lineWidth: 0,
							fillColor: "#428BCA"
						}
					},
					grid: {
						borderColor: '#ddd',
						borderWidth: 1,
						labelMargin: 10
					},
					xaxis: {
						mode: "categories",
						tickLength: 0
					}
				});
			}
		});
	}
	//加载柱状图
	zhuzhuang();
	
	//柱形图
	//查询总量
	var allcount;
	function zongliang(){
		$.ajax({
			url:"accountqueryAllCount",
			async:false,
			dataType:"json",
			type:"POST",
			data:{
				"starttime":startstamp,
				"endtime":endstamp
			},
			success:function(data){
				allcount=data;
			}
		});
	}
	zongliang();
	//异常总量
	function yichangzongliang(){
		$.ajax({
			url:"accountqueryExccount",
			async:false,
			dataType:"json",
			type:"POST",
			data:{
				"starttime":startstamp,
				"endtime":endstamp
			},
			success:function(data){
				var count=(parseInt(data)/parseInt(allcount))*100+"%";
				$("#yichang").text("异常邮件("+data+" 封)");
				$("#yichangdiv").attr("style","width:"+count);
				
				
				
			}
		});
	}
	yichangzongliang();
	$("#yichanga").click(function(){
		ajaxmethodExcContent();
	})
	//异常值
	function ajaxmethodExcContent(){
		$.ajax({
			url:"accountqueryExccontent",
			async:false,
			dataType:"json",
			type:"POST",
			data:{
				"starttime":startstamp,
				"endtime":endstamp
			},
			success:function(data){
				showHtml();
				pagefenye(1,data);
				//加载异常 
			    $("#queryneirong").click(function(){
			    	var start = Date.parse(new Date($("#choicetime1").val()))/1000;
			    	var end = Date.parse(new Date($("#choicetime2").val()))/1000;
			    	if(isNaN(start)){
			    		start=startstamp;
			    	}
			    	var end = Date.parse(new Date($("#choicetime2").val()))/1000;
			    	if(isNaN(end)){
			    		end=endstamp;
			    	}
			    	$.ajax({
			    		url:"accountqueryText",
			    		dataType:"json",
			    		async:false,
			    		data:{
			    			"starttime":start,
			    			"endtime":end,
			    			"msgType":null,
			    			"msgContent":$("#peoplename").val()
			    		},
			    		type:"POST",
			    		success:function(data){
//			    			$("#tbodys").html("");
//							var html1="";
//			    			for(var i=0;i<data.length;i++){
//								html1 +=
//								"<tr>"+
//									"<th>"+getFormatDateByLong(data[i].create_time*1000,"yyyy-MM-dd hh:mm:ss")+"</th>"+
//									"<td>"+data[i].msg_state+"</td>"+
//									"<td style='word-wrap:break-word;'>"+data[i].msg_content+"</td>"+
//									"<td>"+data[i].msg_fail_msg+"</td>"+
//									"<td></td>"+
//								"</tr>";
//							}
//							$("#tbodys").html(html1);
			    			pagefenye(1,data);
			    		}
			    	})
			    })
			}
		});
	}
	
	//各类型的比例
	//入职
	function ruzhi(){
		var ruzhicount=ajaxmethodcount("psn_rz_msg");
		$("#ruzhi").text("入职邮件("+ruzhicount+" 封)");
		var ruzhicount1=(parseInt(ruzhicount)/parseInt(allcount))*100+"%";
		$("#ruzhidiv").attr("style","width:"+ruzhicount1);
	}
	ruzhi();
	$("#ruzhia").click(function(){
		ajaxmethodcontent("psn_rz_msg");
	})
	
	//离职
	function lizhi(){
		var lizhicount=ajaxmethodcount("psn_lz_msg");
		$("#lizhi").text("离职邮件("+lizhicount+" 封)");
		var lizhicount1=(parseInt(lizhicount)/parseInt(allcount))*100+"%";
		$("#lizhidiv").attr("style","width:"+lizhicount1);
	}
	lizhi();
	$("#lizhia").click(function(){
		ajaxmethodcontent("psn_lz_msg");
	})
	
	//调配
	function tiaopei(){
		var tiaopeicount=ajaxmethodcount("psn_dd_msg");
		$("#tiaopei").text("调配邮件("+tiaopeicount+" 封)");
		var tiaopeicount1=(parseInt(tiaopeicount)/parseInt(allcount))*100+"%";
		$("#tiaopeidiv").attr("style","width:"+tiaopeicount1);
	}
	tiaopei();
	$("#tiaopeia").click(function(){
		ajaxmethodcontent("psn_dd_msg");
	})
	
	//其他
	function qita(){
		var xiugaicount=ajaxmethodcount("psn_qt_msg");
		$("#xiugai").text("其他邮件("+xiugaicount+" 封)");
		var xiugaicount1=(parseInt(xiugaicount)/parseInt(allcount))*100+"%";
		$("#xiugaidiv").attr("style","width:"+xiugaicount1);
	}
	qita();
	$("#xiugaia").click(function(){
		ajaxmethodcontent("psn_qt_msg");
	});
	//各类型的总量
	function ajaxmethodcount(msgType){
		var count;
		$.ajax({
			url:"accountquerycount",
			dataType:"json",
			async:false,
			type:"POST",
			data:{
				"starttime":startstamp,
				"endtime":endstamp,
				"msgType":msgType
			},
			success:function(data){
				count=data;
			}
		});
		return count;
	}
	//各类型值
	function ajaxmethodcontent(msgType){
		$.ajax({
			url:"accountquerycontent",
			dataType:"json",
			type:"POST",
			data:{
				"starttime":startstamp,
				"endtime":endstamp,
				"msgType":msgType
			},
			success:function(data){
				showHtml();
				pagefenye(1,data);
			    $("#queryneirong").click(function(){
			    	var start = Date.parse(new Date($("#choicetime1").val()))/1000;
			    	if(isNaN(start)){
			    		start=startstamp;
			    	}
			    	var end = Date.parse(new Date($("#choicetime2").val()))/1000;
			    	if(isNaN(end)){
			    		end=endstamp;
			    	}
			    	$.ajax({
			    		url:"accountqueryText",
			    		dataType:"json",
			    		async:false,
			    		data:{
			    			"starttime":start,
			    			"endtime":end,
			    			"msgType":msgType,
			    			"msgContent":$("#peoplename").val()
			    		},
			    		type:"POST",
			    		success:function(data){
//			    			$("#tbodys").html("");
//							var html1="";
//			    			for(var i=0;i<data.length;i++){
//								html1 +=
//								"<tr>"+
//									"<th>"+getFormatDateByLong(data[i].create_time*1000,"yyyy-MM-dd hh:mm:ss")+"</th>"+
//									"<td>"+data[i].msg_state+"</td>"+
//									"<td style='word-wrap:break-word;'>"+data[i].msg_content+"</td>"+
//									"<td>"+data[i].msg_fail_msg+"</td>"+
//									"<td></td>"+
//								"</tr>";
//							}
//							$("#tbodys").html(html1);
			    			pagefenye(1,data);
			    		}
			    	})
			    })
			}
		});
	}
	//显示html

	//定时刷新
	setInterval(showalert, 1000*60*5); 
	function showalert() 
	{ 
		zhuzhuang();
		zongliang();
		yichangzongliang();
		ruzhi();
		lizhi();
		tiaopei();
		qita();
	} 

})
function updatestate(id){
	$.ajax({
		url:"handlerexception",
		async:false,
		dataType:"json",
		type:"POST",
		data:{
			"id":id
		},
		success:function(data){
			if(data){
				location.reload();
			}
		}
	});
}













