<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>广东学习网</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<META name=keywords content="继续教育|继续教育网|继续教育公需课|继续教育专业课|广东公需课|广东继续教育-广东学习网">
<link rel="stylesheet" type="text/css" href="/res/v2/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/res/v2/css/index.css"/>
<script type="text/javascript" src="/res/v2/js/jquery.min.js"></script>
<script type="text/javascript" src="/res/v2/js/cg.min.js"></script>
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzkzODA2NDc3Nl8zMDA2NjFfNDAwMDcxMTY4OF8"></script>
<script type="text/javascript">
jQuery(function($){
	$("body").cgChange({
		title:".arrange h2 span",
		content:".arrange_list ul",
		selectedClass:"selected"
	});	
	$(".banner").cgPictureEffect({
		picture:".banner_scroll",
		thumbPicture:".small-pic",
		prev:".pre_bnt",
		next:".next_bnt",
		disbledClass:"btn-disable",
		current:1,
		thumbEffect:{
			style:"icon",
			type:null,
			selectedClass:"small-hover"
		},
		effect:{
			type:"fade",
			speed:2000
		}
	});	
	$(".curse_comment").cgCarousel({type:null,speed:2000,scroll:1,vertical:true});
	//文本框聚焦失去焦点
	$(".ysbh_input").focus(function(){
		$(this).css({"color":"#333"});
    });
	$(".ysbh_input").blur(function(){
		$(this).css({"color":"#999"});
    });
	//下拉
	$(".xyzx_xl").hover(function(){
		$(this).find(".xwzx_erxl").show();     
		$(this).find(".top_jt_tb").attr("src","${res}/new_test/images/index/up_jt.png");
		},function(){
		$(this).find(".xwzx_erxl").hide();
		$(this).find(".top_jt_tb").attr("src","${res}/new_test/images/index/down_jt.png");	
			});
	//二维码		
	$(".saoyisao").hover(function(){
		$(this).find(".xzewm_box ").show();
		 
		},function(){
		$(this).find(".xzewm_box ").hide();
		 
			});		
			
			

	//返回顶部  
	 var fjx = $(".xxlc_box").offset().top;
	 $(".goto").click(function(){ 
	 $("html,body").animate({scrollTop:0},500);
	 });  			 
	  $(window).scroll(function(){
	   var win_scroll = $(this).scrollTop(); 
	   if(win_scroll>fjx){
	      $(".goto").show(500);
	     }else{
		$(".goto").hide(500);  
		}  
		});
 	
});

function dosubmit(){
   $("#loginform").submit();
}

$(document).ready(function() {
        $.ajax({
             type: "post",
	     url: "/user/loginStatus",
	     success: function(user){
		if(user.status==false){	
                      $(".lb_top").show();
	              $(".lb_top_later").hide();
                      $("#cartUrl_top").attr("href","#");
                      $("#unlogin").show();
                      $("#logined").hide();
		}else{
		      $(".lb_top").hide();
                      $(".lb_top_later").show();
                      if(user.realname!=null&& user.realname!=""){
                          $("#loginUserName").text(user.realname);
                          $("#reasname").text(user.realname);
                      }else{
                          $("#loginUserName").text(user.username);
                      }
                      $("#username").text(user.username);
                      $("#balance").text(user.balance);
                      userInventory();
                      $("#cartUrl_top").attr("href", "/p/shop/shopCartList");
                      $("#unlogin").hide();
                      $("#logined").show();
		}
	    }
        });
});
function userInventory(data){
        $.ajax({
		url : "/p/user/statinfo",
		dataType:"json",
		type: 'POST',
		success : function(data) {
	             if(data){
		         $("#dzf_idx").text(data.waitPay);
	                 $("#dxx_idx").text(data.waitStudy);
	                 $("#dks_idx").text(data.waitExamination);
	                 $("#dsb_idx").text(data.waitDeclare);
                     }
		}
	});
	
};
</script>
</head>

<body>
<!--左边二维码-->
<div class="wx_icon" style="position:fixed; top:145px; left:10px; width:98px; _position: absolute;">
  <div class="wx_icon_box" style="position:relative; width:100%; height:100%; padding-top:15px;"> <span class="wx_icon_colse" style=" position:absolute; right:0; top:0; cursor:pointer" onclick="$(this).parent().remove()">关闭</span> <img src="${res}/new_test/images/index/wx_icon.jpg" width="98">
    <h2 style="font-size:14px;font-weight:none">关注广东学习网官方微信平台</h2>
  </div>
</div>


<!--右边漂浮-->
<div class="right_fix_box">
<a href="javascript:void(0);" class="goto" title="返回顶部"> </a>
 
<a href="javascript:void(0);" class="saoyisao" title="app下载">
<p>app下载</p>
<div class="xzewm_box"><img src="${res}/new_test/images/index/appxz.png" width="112" height="126" /></div>
</a>
 <!--
<a href="javascript:void(0);" class="fkuixx" title="用户反馈"><p>用户反馈</p></a>

<a href="javascript:pgvSendClick({hottag:'bqqv5.eimcrm.btn.commonWpa'});" target="_blank" class="kfmm" title="在线咨询"><p>在线咨询</p></a>
  -->
</div>

<!--兼容提示-->
<!--[if lt IE 8]>
<script type="text/javascript">
jQuery(function($){ 
	$(".wzjzgbann_but").click(function(){ 
		$(".browser-upgrade").remove();
 	}); 	
}); 
</script> 
<div class="browser-upgrade">
  <div class="wrapper">
    <div class="fl">您的浏览器版本过低，为了保证更好的安全性和浏览体验，建议更换高级浏览器，如：<a href="http://www.baidu.com/s?wd=谷歌浏览器"  target="_blank">谷歌浏览器</a><a href="http://www.baidu.com/s?wd=火狐浏览器"  target="_blank">火狐浏览器</a><a href="http://www.baidu.com/s?wd=360极速浏览器"  target="_blank">360 极速浏览器</a>  <a href="http://t.cn/RPrfSNj"  target="_blank">IE8浏览器</a>  </div>
    <a href="javascript:void(0);" class="wzjzgbann_but fr">x</a> </div>
</div>
<style> 
.browser-upgrade {background-color: #DA7575;border-bottom: 1px solid #D65F39;color: #F0F0F0;padding: 10px 0; width: 100%; }
.browser-upgrade .wrapper {width: 1000px;margin: 0 auto; overflow:hidden;} 
.browser-upgrade a {color: yellow;margin-right: 10px;text-decoration: underline;}
.browser-upgrade a.wzjzgbann_but{ display:block; height:15px; width:15px; background:#000; color:#fff; font-size:14px; text-align: center; line-height:15px; text-decoration:none; margin-top: 2px; }
</style>
<![endif]-->
 
<div class="top">
  <div class="w_1002">
    <div class="login fl" id="unlogin"> <a href="/user/login">登录</a>|<a href="/user/register">注册</a> </div>
    <div class="login fl" id='logined' style="display:none"> <a  href="/p/user/index"  ><span id='loginUserName'></span></a>&nbsp;<a href="/user/logout">安全退出</a> </div>
    <div class="tag">
      <ul>
        <li><i class="cart_icon"></i><a href="#" id="cartUrl_top">购物车<span class="red">0</span>件</a></li>
        <li class="xyzx_xl"><i class="learn_icon"></i><a href="/p/user/index/">学员中心</a><img src="${res}/new_test/images/index/down_jt.png" width="8" height="8" class="top_jt_tb" />
          <div class="xwzx_erxl" > 
          	<a href="/p/pay/myOrder">我的订单</a>
          	<a href="/p/course/uncompleted">我的课程</a>
          	<a href="/p/course/completed">我的考试</a>
          	<a href="/p/exam/applyCreditList">我的申报</a>
          	<a href="/p/user/selectUserMessage">站内消息</a>
          </div>
        </li>
        <li><i class="bulb_icon"></i><a href="/html/bzzx">帮助中心</a></li>
        <li><i class="about_icon"></i><a title="" href="/html/gywm">关于我们</a></li>
      </ul>
    </div>
  </div>
</div>
<div class="head">
  <div class="w_1002">
    <div class="logo"> <a href="/"><span class="zzjj_fz"></span> <img src="${res}/new_test/images/logo.png" /></a>
      <h1>广东学习网</h1>
    </div>
    <div class="search_box">
      <div class="ss_box">
        <form action='/course/dataSearch' method='post'>
          <input type="text" name='key' class="search_text ysbh_input" value="课程名称" onblur="if(!this.value)this.value='课程名称'" onclick="if(this.value&&this.value=='课程名称' )  this.value=''"/>
          <input type="submit" class="search_bnt" value='搜  索' />
        </form>
      </div>
     <!-- <div class="hot_wen"><a href="#">2015公需科目</a><a href="#">创新理论与实践</a><a href="#">法制思维与法制风尚</a></div>-->
    </div>
    <div class="tell"> <img src="${res}/new_test/images/index/gd_21.png" /> </div>
  </div>
  <div class="clear"></div>
</div>
<script type="text/javascript">
(function(){
     var path=window.location.pathname;
     $("ul.nav_ul").find("a").each(function(i,n){
        var href = $(n).attr("href");
        if(href.indexOf(path)>-1){
        	$(n).addClass("selected");
        	return false;
        }
     }); 
})();
</script>

<div class="classfly">
  <div class="course_fl">
    <h2>继续教育课程</h2>
    [@cms_course_type parentid="0"]
	       [#list tag_list as a] 
				<ul>
      				<li>
        			<h3><a href="/course/courseLists?coursetype=${a.id!}">${a.text!}</a></h3>
        			[#if a.children?? && a.children?size>0]
        				[#list a.children as ctype]
        				<a href="/course/courseLists?coursetype=${ctype.id!}">${ctype.text!}</a>
        				[/#list]
        			[/#if]
        			</li>
    			</ul>
	       [/#list]
	[/@cms_course_type]
  </div>
  <div class="nav_banner_box"> 
    <!--导航-->
    <div class="nav">
      <ul>
        <li><a href="/" class="selected">首页</a></li>
        <li><a href="/course/courseLists?type=all">全部课程</a></li>
        <li><a href="/html/zcfg">政策法规</a></li>
        <li><a href="/html/hyzx/">行业资讯</a></li>
        <li><a href="/p/user/index">学员中心</a></li>
        <li><a href="/study/buyStudyCard">学习卡</a></li>
        <li><a href="http://www.easypx.com/">职业教育</a></li>
        <li class="sjapp_down"><a href="/html/mobile/mobile.html">下载APP</a></li>
      </ul>
    </div>
    [#list siteconfig?keys as itemKey]
    	${itemKey}||${siteconfig[itemKey].value}</br>
    [/#list]
    <div class="banner">
      <div class="banner_scroll">
        <ul class="bs_img">
          [@cms_content_list type="cms_type_img" count='5']
	       [#list tag_list as a] 
				<li><a href="${a.url}" target="_blank"><img src="${imgPrefix}/${a.imgurl!}"  alt="${a.title}" /></a></li>
	       [/#list]
	  	  [/@cms_content_list]
        </ul>
        <div class="small-pic" style="display:none;"></div>
        <div class="pre_bnt"><img src="${res}/new_test/images/index/gd_36.png" /></div>
        <div class="next_bnt"><img src="${res}/new_test/images/index/gd_39.png" /></div>
      </div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="ad_banner">
        <tr>
          <td align="left" width="50%"><a href="http://www.easypx.com/"><img src="${res}/new_test/images/index/ban_07.jpg" width="264" height="60" /></a></td>
          <td align="right" width="50%"><a href="/study/buyStudyCard"><img src="${res}/new_test/images/index/ban_09.jpg" width="264" height="60" /></a></td>
        </tr>
      </table>
    </div>
    <div class="login_box"> 
    <!-- 登陆前显示-->
      
      <div class="lb_top" >
      <form id="loginform" action="/user/login" method="post">
        <h2>用户登录</h2>
        
          <ul>
            <li class="login_text"> <span class="deluzc_name">帐 号</span>
              <input type="text" name='account' value="用户名/邮箱/手机号" onblur="if(!this.value)this.value='用户名/邮箱/手机号'" onclick="if(this.value&&this.value=='用户名/邮箱/手机号' )  this.value=''" class="ysbh_input" />
            </li>
            <li class="login_text"> <span class="deluzc_name">密 码</span>
              <input type="password" name='password' class="ysbh_input"  />
            </li>
            <li class="remember"> <span class="fl">
              <input type="checkbox" name="remberMe" value="1" />
              <em>记住密码</em></span> <span class="fr"><a href="/user/forgetPassword">忘记密码？</a></span> </li>
            <li   > <a href="#" class="login_bnt" onclick="dosubmit()">登录</a> <a href="/user/register" class="reg_bnt">注册</a> </li>
          </ul>
         </form>
      </div>
     
      <!-- 登陆后显示-->
      <div class="lb_top_later" style=" display:none;">
        <h2>个人中心</h2>
        <ul>
          <li>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="${res}/new_test/images/index/mrtx2.png" class="tx_index"/></td>
                <td><div class="zhmc_ye_box"> <span class="user_name"><em id='username'></em></span> <span class="reas_name"><em id='reasname'></em></span> <span class="user_balance">余额：<em id='balance'></em></span> </div></td>
              </tr>
            </table>
          </li>
         
        </ul>
        
         <div class="shortcut_sy">
            <div class="sy_kjfs_ny"><a href="/p/pay/myOrder?ordstatus=01">待支付（<span id="dzf_idx">0</span>）</a> <a href="/p/course/completed">待考试（<span id="dks_idx">0</span>）</a></div>
            <div class="sy_kjfs_ny_last"><a href="/p/course/uncompleted?studystatus=01">待学习（<span id="dxx_idx">0</span>）</a> <a href="/p/exam/applyCreditList">待申报（<span id="dsb_idx">0</span>）</a></div>
          </div>
      </div>
      <div class="inform">
        <h2>公告</h2>
        <ul>
           [@cms_content_list channelId='7741a187e37f4b958ebc1340882669ed' count='4' orderBy='updatetime desc'] 
			[#list tag_list as a]
				<li><a href="${a.url}" title="${a.title}">[@text_cut s=a.title len=25 append='...'/]</a></li>
			[/#list]
	   	   [/@cms_content_list]
        </ul>
      </div>
    </div>
  </div>
</div>
<!--学习流程-->
<div class="w_1002 xxlc_box" >
  <h2 >学习<br />
    流程</h2>
  <ul  class="sy_jxjylc_box">
    <li> <img src="${res}/new_test/images/index/xxzk_bt_32.png" width="33" height="33" />
      <div class="bzmc"><span>第一步</span>注册登录</div>
    </li>
    <li> <img src="${res}/new_test/images/index/xxzk_bt_34.png" width="33" height="33" />
      <div class="bzmc"><span>第二步</span>购买课程</div>
    </li>
    <li> <img src="${res}/new_test/images/index/xxzk_bt_36.png" width="33" height="33" />
      <div class="bzmc"><span>第三步</span>网上学习</div>
    </li>
    <li> <img src="${res}/new_test/images/index/xxzk_bt_38.png" width="33" height="33" />
      <div class="bzmc"><span>第四步</span>在线考试</div>
    </li>
    <li> <img src="${res}/new_test/images/index/xxzk_bt_41.png" width="33" height="33" />
      <div class="bzmc"><span>第五步</span>学时申报</div>
    </li>
    <li class="bg_none"> <img src="${res}/new_test/images/index/xxzk_bt_44.png" width="33" height="33" />
      <div class="bzmc"><span>第六步</span>审核认定</div>
    </li>
  </ul>
  <div class="c_l"></div>
</div>

<!--最新课程和排行榜-->
<div class="w_1002">
  <div class="course_list">
    <h2> <span>最新课程</span> <a href="/course/courseLists?type=all">more &gt;</a> </h2>
    <ul>
        [@cms_content_list type="cms_index_course" count='8']
	       [#list tag_list as a]
            	<li>
            		<a href="${a.url!}">
               	    	<img src="[#if a.outjoinObject??]${a.outjoinObject.cimage}[#else]${imgPrefix!}/${a.imgurl!}[/#if]"/>
                    	<span>[@text_cut s=a.title len=11 append='...'/]</span>
                	</a>
            	</li>
	       [/#list]
	  	[/@cms_content_list]
    </ul>
  </div>
  <div class="arrange">
    <h2> <span class="selected">公需排行榜</span> <span>专业排行榜</span> </h2>
    <div class="arrange_list">
      <ul>
        [@cms_course page=0 rows=10 orderStatus='2' courseType='gdxxw8afd07a72607895e0126078dcf4']
	     [#if course_tag.rows??]
		[#list course_tag.rows as a]
		<li>[#if a_index==0]<i class="orange">[#elseif a_index>0&&a_index<3]<i class="yellow">[#elseif a_index>2]<i>[/#if]
			${a_index+1}</i><a href="/course/courseDetails/${a.id}" title="${a.cname}">[@text_cut s=a.cname len=14 append='...'/]</a>
		</li>
		[/#list]
	     [/#if]
	[/@cms_course]
      </ul>
      <ul>
				<li><i class="orange">
					1</i><a href="/course/courseDetails/94493bcf327411e49c53653c98321507" title="食品加工过程中形成的有害物">食品加工过程中形成的有...</a>
				</li>
				<li><i class="yellow">
					2</i><a href="/course/courseDetails/7e4454ee327411e49c53653c98321507" title="转基因生物及其产品检测">转基因生物及其产品检测</a>
				</li>
				<li><i class="yellow">
					3</i><a href="/course/courseDetails/6920a64d327411e49c53653c98321507" title="质量管理">质量管理</a>
				</li>
				<li><i>
					4</i><a href="/course/courseDetails/51d7cdbc327411e49c53653c98321507" title="食品中的矿物质">食品中的矿物质</a>
				</li>
				<li><i>
					5</i><a href="/course/courseDetails/39fffb9b327411e49c53653c98321507" title="生物因素引起的食品安全问题">生物因素引起的食品安全...</a>
				</li>
				<li><i>
					6</i><a href="/course/courseDetails/1d966c5a327411e49c53653c98321507" title="工程振动与测试-实验模态分析">工程振动与测试-实验模...</a>
				</li>
				<li><i>
					7</i><a href="/course/courseDetails/f754b8d9327311e49c53653c98321507" title="模拟电子技术-实验仪器的使用和元器件识别">模拟电子技术-实验仪器...</a>
				</li>
				<li><i>
					8</i><a href="/course/courseDetails/e202c39e327211e49c53653c98321507" title="纺织纤维的形态及基本性质">纺织纤维的形态及基本性质</a>
				</li>
				<li><i>
					9</i><a href="/course/courseDetails/c4bb306d327211e49c53653c98321507" title="植物纤维">植物纤维</a>
				</li>
				<li><i>
					10</i><a href="/course/courseDetails/9b5e814c327211e49c53653c98321507" title="动物纤维">动物纤维</a>
				</li>
            </ul>
    </div>
  </div>
  <div class="clear"></div>
</div>

<!--政策资讯和教师风采-->
<div class="w_1002">
  <div class="message">
    <h2> <span>政策资讯</span> <a href="/html/zcfg/">more &gt;</a> </h2>
    <ul>
      <li class="fl">
        <h3><span class="fl"><a class="c_y" href="/html/zcfg/">政策法规</a></span><span class="fl">&nbsp;&nbsp;</span><span class="fr">2015.01.30</span></h3>
        <a href="/html/zcfg/20150130/1957.html"> <img src="${res}/new_test/images/index/gd_99.png" />
        <h4>继续教育证书</h4>
        <p>凡在广东学习网学习的用户在完成每门课程的学习且通过考核后…</p>
        </a> </li>
      <li class="fr">
        <h3><span class="fl"><a class="c_y" href="/html/hyzx/">行业资讯</a></span><span class="fl">&nbsp;&nbsp;</span><span class="fr">2015.01.13</span></h3>
        <a href="/html/zcfg/20150113/1777.html"> <img src="${res}/new_test/images/index/gd_96.png" />
        <h4>关于印发2014年广东省专业...</h4>
        <p>各地级以上市人力资源社会保障（人力资源）局，顺德区人力资源…</p>
        </a> </li>
      <li class="fl m_two">
        <h3><span class="fl"><a class="c_y" href="/html/zcfg/">政策法规</a></span><span class="fl">&nbsp;/&nbsp;policy</span><span class="fr">2015.01.13</span></h3>
        <a href="/html/zcfg/20150113/1777.html">
        <h4>2014年广东省卫生专业技术人员继续教育专业科目学习指南</h4>
        <p>为进一步完善和提高我省卫生专业技术人员的知识结构、自主创…</p>
        </a> </li>
      <li class="fr m_two">
        <h3><span class="fl"><a class="c_y" href="/html/hyzx/">行业资讯</a></span><span class="fl">&nbsp;&nbsp;</span><span class="fr">2015.01.13</span></h3>
        <a href="/html/hyzx/20150113/1708.html">
        <h4>2014年广东省文化艺术等29个行业专业技术人员...</h4>
        <p>省直各有关单位,各有关行业协会：根据《广东省专业技术人员…</p>
        </a> </li>
      <li class="fl m_two">
        <h3><span class="fl"><a class="c_y" href="/html/zcfg/">政策法规</a></span><span class="fl">&nbsp;&nbsp;</span><span class="fr">2015.01.13</span></h3>
        <a href="/html/zcfg/20150113/1775.html">
        <h4>2014年广东省文学创作专业技术人员继续教育专业...</h4>
        <p>为进一步完善和提高我省文学创作领域专业技术人员的知识结构…</p>
        </a> </li>
      <li class="fr m_two">
        <h3><span class="fl"><a class="c_y" href="/html/hyzx/">行业资讯</a></span><span class="fl">&nbsp;&nbsp;</span><span class="fr">2015.01.13</span></h3>
        <a href="/html/hyzx/20150113/1706.html">
        <h4>广东省专业技术人员远程继续教育网络平台指导标准</h4>
        <p>关于印发广东省专业技术人员远程继续教育网络平台指导标准…</p>
        </a> </li>
    </ul>
  </div>
  <div class="teacher">
    <h2><span>教师风采</span></h2>
     <ul>
     	[@cms_content_list type="cms_type_img" count='3']
	       [#list tag_list as a] 
				<li>
            		<a href="#"  title="${a.content!}">
                    	<img src="${imgPrefix!}/${a.imgurl!}"/>
                    	<h3>${a.title!}</h3>
                    	<p>${a.summary!}</p>
                	</a>
            	</li>
	       [/#list]
	  	[/@cms_content_list]
     </ul>
  </div>
  <div class="clear"></div>
</div>
<div class="w_1002 pd_20" style=" padding-bottom:10px;" > <a href="http://www.easypx.com/html/english/"><img src="${res}/new_test/images/index/gd_112.jpg" /></a> </div>
<div class="w_1002">
  <div class="fingerpost">
    <h2> <span>学习指南</span> </h2>
    <ul>
      <li> <span><a href="#">公需课指南</a></span>
        <ul>
          <li><a href="/course/courseLists?coursetype=1dd47be2d40f40f795aec7d7b3fd4045">2015学年</a></li>
          <li><a href="/course/courseLists?coursetype=gdxxw9276119ec13711e3809ea9ec189">2014学年</a></li>
          <li><a href="/course/courseLists?coursetype=gdxxw0040babdc77111e2b0a151f3e64">2013学年</a></li>
          <li><a href="/course/courseLists?coursetype=gdxxw6e8ac0c38abb11e19e337bde1d2">2012学年</a></li>
          <li><a href="/course/courseLists?coursetype=gdxxw4706a2328abb11e19e337bde1d2">2011学年</a></li>
        </ul>
      </li>
      <li> <span><a href="#">专业课指南</a></span>
        <ul>
          <li><a href="/html/zcfg/20150113/1772.html">冶金工程</a></li>
          <li><a href="/html/zcfg/20150113/1719.html">交通运输</a></li>
          <li><a href="/html/zcfg/20150113/1722.html">电力生产</a></li>
          <li><a href="/html/zcfg/20150113/1717.html">轻工行业</a></li>
          <li><a href="/html/zcfg/20150113/1711.html">铁道工程</a></li>
          <li><a href="/html/zcfg/20150113/1774.html">广播影视</a></li>
          <li><a href="/html/zcfg/20150113/1771.html">艺术设计</a></li>
          <li><a href="/html/zcfg/20150113/1714.html">石油化工</a></li>
          <li><a href="/html/zcfg/20150113/1775.html">文学创作</a></li>
          <li><a href="/html/zcfg/20150113/1775.html">药学专业</a></li>
          <li><a href="/html/zcfg/20150113/1748.html">出版专业</a></li>
          <li><a href="/html/zcfg/20150113/1724.html">地震系统</a></li>
          <li><a href="/html/zcfg/20150113/1725.html">档案专业</a></li>
          <li><a href="/html/zcfg/20150113/1712.html">体育系列</a></li>
          <li><a href="/html/zcfg/20150113/1710.html">统计专业</a></li>
          <li><a href="/html/zcfg/20150113/1728.html">海洋渔业</a></li>
          <li><a href="/html/zcfg/20150113/1718.html">林业专业</a></li>
          <li><a href="/html/zcfg/20150113/1740.html">审计专业</a></li>
          <li><a href="/html/zcfg/20150113/1776.html">文化艺术</a></li>
          <li><a href="/html/zcfg/20150113/1737.html">国际商务</a></li>
          <li><a href="/html/zcfg/20150113/1715.html">社会科学</a></li>
          <li><a href="/html/zcfg/20150113/1723.html">地质勘探</a></li>
          <li><a href="/html/zcfg/20150113/1777.html">卫生专业</a></li>
          <li><a href="/html/zcfg/20150113/1726.html">测绘国土</a></li>
          <li><a href="/html/zcfg/20150113/1734.html">水利行业</a></li>
        </ul>
      </li>
    </ul>
  </div>
  <div class="fingerpost comment">
    <h2> <span>课程评论</span> </h2>
    <div class="curse_comment">
      <ul>
        [@cms_course_comment page=0 rows=10 dateFormat='yyyy-MM-dd']
			[#if comment_tag.rows??] 
		        [#list comment_tag.rows as a]
			<li>
			      [#if a.uimage ??]
                              <img src="${a.uimage}" width="43" height="43" /><em></em>
                              [#else]
                              <img src="/${res}/images/grey_30x30/icon_tx.png" width="43" height="43" /><em></em>
                              [/#if]
                	      <p><i>${a.username}</i><em>评论</em><a href="/course/courseDetails/${a.courseid}">[#if a.cname??]${a.cname}[/#if]</a></p>
                              <span>
			      [#if a.createdate??]
			      [@text_cut s=a.createdate len=5 /]
                              [/#if]
			      </span>
                              <img src="/${res}/new/new_img/gd_201.png" />
			      <p class="comment_text">${a.content}</p>
                        </li>
			[/#list] 
			[/#if]
		[/@cms_course_comment]
      </ul>
    </div>
  </div>
  <div class="issue">
    <h2> <span>热门问题</span> </h2>
    <div class="issue_list">
      <ul>
        <li><i class="orange">1</i><a href="/html/bzzx?tag=12&channelId=12_1" title="如何购买课程？" target="_blank">如何购买课程？</a></li>
        <li><i class="yellow">2</i><a href="/html/bzzx?tag=7&channelId=7_3" title="学习的中途退出课程可以吗？" target="_blank">学习的中途退出课程可以吗？</a></li>
        <li><i class="yellow">3</i><a href="/html/bzzx?tag=10&channelId=10_1" title="无法播放视频怎么办？" target="_blank">无法播放视频怎么办？</a></li>
        <li><i>4</i><a href="/html/bzzx?tag=3&channelId=3_3" title="账户无法正常登录？" target="_blank">账户无法正常登录？</a></li>
        <li><i>5</i><a href="/html/bzzx?tag=7&channelId=7_0" title="如何学习？" target="_blank">如何学习？</a></li>
        <li><i>6</i><a href="/html/bzzx?tag=8&channelId=8_1" title="课程考试未通过怎么办？" target="_blank">课程考试未通过怎么办？</a></li>
        <li><i>7</i><a href="/html/bzzx?tag=9&channelId=9_1" title="怎么进行学时申报？" target="_blank">怎么进行学时申报？</a></li>
        <li><i>8</i><a href="/html/bzzx?tag=12&channelId=12_4" title="在线支付需要注意什么？" target="_blank">在线支付需要注意什么？</a></li>
      </ul>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!--友情链接-->
<div class="w_1002">
  <div class="gxkkm_head link_head">
    <h2><a href="http://site1.gdsjxjy.com/html/link/" target="_blank">友情链接</a></h2>
  </div>
  <div class="link_list">
    <ul>
        [@cms_content_list channelId='062485e6fe5846c78b3d3811f65ab47a' count='30'] 
             [#list tag_list as a]
                  <li><a href="${a.url}" title="${a.title}" target="_blank">${a.title}</a></li>
             [/#list]
        [/@cms_content_list]
    </ul>
    <div class="c_l"></div>
  </div>
</div>
<script type="text/javascript">kfguin="4000711688";eid="218808P8z8p8x8Q8y8y8x";ws="http://www.gdsjxjy.com/"; type="0";wpadomain="b";</script>
<script type="text/javascript" src="/r/cms/gdxxw/default/gdxxw/kf.js"></script>
<!--底部导航-->
[#include "footer.html"/]
</body>
</html>