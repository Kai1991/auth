$(document).ready(function() {
	
	//点击添加城市
/*	$(".city_tj").click(function() {
		$(".opacity_bg").fadeIn();
		$(".ball_city").fadeIn();
		
		$(".ball_city li").click(function() {
			$(this).addClass("check");
		})
		
		$(".close_rt").click(function() {
			$(".opacity_bg").fadeOut();
			$(".ball_city").fadeOut();
		})
	})*/
	
	//点击添加城市
/*	$(".type_tj").click(function() {
		$(".opacity_bg").fadeIn();
		$(".food").fadeIn();
		$(".close_rt").click(function() {
			$(".opacity_bg").fadeOut();
			$(".food").fadeOut();
		})
	})
	
	//点击趋势选择
	$(".trend").click(function() {
		$(".opacity_bg").fadeIn();
		$(".trend_choice").fadeIn();
		$(".close_rt").click(function() {
			$(".opacity_bg").fadeOut();
			$(".trend_choice").fadeOut();
		})
	})
	
	 $("input").focus(function(){
	    $(this).css({"background-color":"#f1f3f8","border":"1px solid #424F63"});
	  });
	  $("input").blur(function(){
	    $(this).css({"background-color":"#FFFFFF","border":"1px solid #d4d4d4"});
	  });
	  
	  $(".cy_b").click(function(){
        $(".list").slideToggle("slow"); 
        $(".Listall").click(function() {
		var listtext = $(this).text();
		$(".tongji").text(listtext);
	})
    });
})

//勾选周内活跃

	function getBlock(ck,d){
	   var c = document.getElementById(ck);
	   var d = document.getElementById(d);
	   if(c.checked==true){
	    $("#div_hidden").fadeIn();
	   }
	   else{
	     $("#div_hidden").fadeOut();
	    }
	  }
	
//历史下单选中有

function test(str){
    if(str == 1){
        $("#ored_hidden").fadeIn();
    } else {
        $("#ored_hidden").fadeOut();
    }
}

$(function(){
	  laydate({
	    elem: '#control_date_1',
	    //istime : true,
	    istoday: true,
	    format: 'YYYY-MM-DD',
	    });
	  laydate({
	    elem: '#control_date_2',
	    //istime : true,
	    istoday: true,
	    format: 'YYYY-MM-DD',
	    });
	  laydate({
	    elem: '#control_date_3',
	    //istime : true,
	    istoday: true,
	    format: 'YYYY-MM-DD',
	    });
	  laydate({
	    elem: '#control_date_4',
	    //istime : true,
	    istoday: true,
	    format: 'YYYY-MM-DD',
	    });
	  laydate({
	    elem: '#control_date_5',
	    //istime : true,
	    istoday: true,
	    format: 'YYYY-MM-DD',
	    });
	    laydate({
	    elem: '#control_date_6',
	    //istime : true,
	    istoday: true,
	    format: 'YYYY-MM-DD',
	    });
	    laydate({
	    elem: '#control_date_7',
	    //istime : true,
	    istoday: true,
	    format: 'YYYY-MM-DD',
	    });
	    laydate({
	    elem: '#control_date_8',
	    //istime : true,
	    istoday: true,
	    format: 'YYYY-MM-DD',
	    });
	    laydate({
	    elem: '#control_date_9',
	    //istime : true,
	    istoday: true,
	    format: 'YYYY-MM-DD',
	    });
	
	    laydate({
	    elem: '#control_date_10',
	    //istime : true,
	    istoday: true,
	    format: 'YYYY-MM-DD',
	    });
	    laydate({
	    elem: '#control_date_11',
	    //istime : true,
	    istoday: true,
	    format: 'YYYY-MM-DD',
	    });
	*/
	});