<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>环保协会</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<META name=keywords content="继续教育|继续教育网|继续教育公需课|继续教育专业课|广东公需课|广东继续教育-广东学习网">
<link rel="stylesheet" type="text/css" href="/res/v2/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/res/v2/css/index.css"/>
<link rel="stylesheet" type="text/css" href="/res/v2/css/ny_comming.css"/>
<script type="text/javascript" src="/res/v2/js/jquery.min.js"></script>
<script type="text/javascript" src="/res/v2/js/cg.min.js"></script>
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzkzODA2NDc3Nl8zMDA2NjFfNDAwMDcxMTY4OF8"></script>
<style type="text/css">
.tzxfk_box { position: fixed; z-index: 999; left: 20px; bottom: 30px; width: 200px; background: #fff; box-shadow: 0 1px 3px #ccc; border-radius: 5px; _border: 1px solid #ccc; *border:1px solid #ccc;
padding: 10px; font-family: "微软雅黑"; }
.tzxfk_box .colse_xx { display: block; width: 20px; text-align: center; font-size: 12px; height: 20px; line-height: 20px; float: right; color: #fff; background: #000; border-radius: 50%; text-decoration: none; }
.tzxfk_box .colse_xx:hover { background: #F00; }
.tzxfk_box .nt_zs { font-size: 12px; line-height: 20px; margin-top: 5px; }
</style>
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

function hideDiv(){
   $(".tzxfk_box").hide();
}

</script>
</head>

<body>
<div class="tzxfk_box"> <a href="javascript:hideDiv()" class="colse_xx">X</a>
  <div style="clear:right;"></div>
  <div class="nt_zs"> 
      <span style="font-weight:bold;color: red;">温馨提示：</span>
      <hr/>
      各位学员：广东环保教育网是环保领域专业的学习培训平台。本平台课件由省内外环保专家、教授、业内行家录制，内容围绕环保专业最新科技理论和方法，不断更新，力求打造优秀的环保专业培训平台。网络学习不受时间和地域的限制，学员可以根据实际需要和兴趣选择购买课程。欢迎广大环保从业人员、对环保有兴趣的人士学习、提高。需要课程、学时等相关证明的学员完成学习后需在本网站进行学时申报，并进行学时证明申请打印，学时证明由工作人员审核后快递给各学员。</div>
</div>

<!--右边漂浮-->
<div class="right_fix_box">
<a href="javascript:void(0);" class="goto" title="返回顶部"> </a>
<a href="tencent://message/?uin=98742031&Site=&Menu=yes" target="_blank" class="kfmm" title="在线咨询"><p>在线咨询</p></a>
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
    <div class="logo"> <a href="/"><span class="zzjj_fz"></span> <img src="/res/v2/images/logo.png" /></a>
      <h1>环保协会</h1>
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
    <div class="tell"> <img src="/res/v2/images/index/gd_21.png" /> </div>
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
        <li><a href="/cms/column/178">政策资讯</a></li>
        <li><a href="/p/user/index">学员中心</a></li>
        <li><a href="/cms/column/287">证书和发票</a></li>
        <li><a href="http://www.easypx.com/">职业教育</a></li>
      </ul>
    </div>
    <div class="banner">
      <div class="banner_scroll">
        <ul class="bs_img">
          [@cms_content_list type="cms_type_img" count='5']
	       [#list tag_list as a] 
				<li><a href="${a.url}" target="_blank"><img src="${a.imgurl!}"  alt="${a.title}" /></a></li>
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
            <li> <a href="#" class="login_bnt" onclick="dosubmit()">登录</a> <a href="/user/register" class="reg_bnt">注册</a> </li>
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
           [@cms_content_list channelId='180' count='4' orderBy='updatetime desc'] 
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
            	<li [#if a_index==3]class="pd_r_0"[#elseif a_index==7]class="pd_r_0"[/#if]>
            		<a href="${a.url!}">
               	    	<img style="width: 180px;height: 102px;" src="[#if a.imgurl??]${imgPrefix!}/${a.imgurl}[#else]${a.outjoinObject.cimage!}[/#if]"/>
                    	<span>[@text_cut s=a.title len=11 append='...'/]</span>
                	</a>
            	</li>
	       [/#list]
	  	[/@cms_content_list]
    </ul>
  </div>
  <div class="arrange">
    <h2> <span class="selected">专业排行榜</span> <span>专题排行榜</span> </h2>
    <div class="arrange_list">
      <ul>
        [@cms_course page=0 rows=10 orderStatus='2' courseType='gdhb8afd07a72607895e0126078d40bf']
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
        [@cms_course page=0 rows=10 orderStatus='2' courseType='gdhb8afd67u82607895e0126078dcf43']
	    [#if course_tag.rows??]
			[#list course_tag.rows as a]
				<li>[#if a_index==0]<i class="orange">[#elseif a_index>0&&a_index<3]<i class="yellow">[#elseif a_index>2]<i>[/#if]
					${a_index+1}</i><a href="/course/courseDetails/${a.id}" title="${a.cname}">[@text_cut s=a.cname len=14 append='...'/]</a>
				</li>
			[/#list]
	    [/#if]
		[/@cms_course]
      </ul>
    </div>
  </div>
  <div class="clear"></div>
</div>

<!--政策资讯和教师风采-->
<div class="w_1002">
  <div class="message">
    <h2> <span>政策资讯</span> <a href="#">more &gt;</a> </h2>
    <ul>
      <li class="fl">
        <h3><span class="fl"><a class="c_y" href="/html/zcfg/">政策法规</a></span><span class="fl">&nbsp;&nbsp;</span><span class="fr">2015.01.30</span></h3>
        <a href="/cms/content/1979"> <img src="${res}/new_test/images/index/gd_99.png" />
        <h4>关于做好2015年度专业技术资格评审工作的通知..</h4>
        <p>各地级以上市人力资源和社会保障（人力资源）局，顺德…</p>
        </a> </li>
      <li class="fr">
        <h3><span class="fl"><a class="c_y" href="/html/hyzx/">行业资讯</a></span><span class="fl">&nbsp;&nbsp;</span><span class="fr">2015.01.13</span></h3>
        <a href="/cms/content/1969"> <img src="${res}/new_test/images/index/gd_96.png" />
        <h4>关于发布2015年广东省专业技术人员继续教育...</h4>
        <p>关于发布2015年广东省专业技术人员继续教育公需科目学习指南的通知…</p>
        </a> </li>
      <li class="fl m_two">
        <h3><span class="fl"><a class="c_y" href="/html/zcfg/">政策法规</a></span><span class="fl">&nbsp;/&nbsp;policy</span><span class="fr">2015.01.13</span></h3>
        <a href="/cms/content/1970">
        <h4>关于增开一期广东省建设项目环境监理</h4>
        <p>关于增开一期广东省建设项目环境监理…</p>
        </a> </li>
      <li class="fr m_two">
        <h3><span class="fl"><a class="c_y" href="/html/hyzx/">行业资讯</a></span><span class="fl">&nbsp;&nbsp;</span><span class="fr">2015.01.13</span></h3>
        <a href="/cms/content/1617">
        <h4>关于适应我省加快转变经济发展方式要求大规模培...</h4>
        <p>关于适应我省加快转变经济发展方式要求大规模培…</p>
        </a> </li>
      <li class="fl m_two">
        <h3><span class="fl"><a class="c_y" href="/html/zcfg/">政策法规</a></span><span class="fl">&nbsp;&nbsp;</span><span class="fr">2015.01.13</span></h3>
        <a href="/cms/content/1620">
        <h4>2013—2017年全国干部培训规划...</h4>
        <p>2013—2017年全国干部培训规划…</p>
        </a> </li>
      <li class="fr m_two">
        <h3><span class="fl"><a class="c_y" href="/html/hyzx/">行业资讯</a></span><span class="fl">&nbsp;&nbsp;</span><span class="fr">2015.01.13</span></h3>
        <a href="/cms/content/1616">
        <h4>中办印发《2010－2020年干部教育培训改革纲要》</h4>
        <p>中办印发《2010－2020年干部教育培训改革纲要》…</p>
        </a> </li>
    </ul>
  </div>
  <div class="teacher">
    <h2><span>教师风采</span></h2>
    <ul>
      <li> <a href="#"> <img src="${res}/new_test/images/index/gd_94.png" />
        <h3>欧进萍</h3>
        <p>2003年12月当选中国工程院院士，2006年-2012年任大连理工大学...</p>
        </a> </li>
      <li> <a href="#"> <img src="${res}/new_test/images/index/gd_102.png" />
        <h3>彭晓春</h3>
        <p>目前是广东省生态学会、可持续发展学会会员，广东青年科...</p>
        </a> </li>
      <li> <a href="#"> <img src="${res}/new_test/images/index/gd_106.png" />
        <h3>邓茂枝</h3>
        <p>调研员，任省环保局环境监察分局副局长。既有丰富的理论知识...</p>
        </a> </li>
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
          <li><a href="#">2015学年</a></li>
          <li><a href="#">2014学年</a></li>
          <li><a href="#">2013学年</a></li>
          <li><a href="#">2012学年</a></li>
          <li><a href="#">2011学年</a></li>
        </ul>
      </li>
      <li> <span><a href="#">专业课指南</a></span>
        <ul>
          <li><a href="#">冶金工程</a></li>
          <li><a href="#">交通运输</a></li>
          <li><a href="#">电力生产</a></li>
          <li><a href="#">轻工行业</a></li>
          <li><a href="#">铁道工程</a></li>
          <li><a href="#">广播影视</a></li>
          <li><a href="#">艺术设计</a></li>
          <li><a href="#">石油化工</a></li>
          <li><a href="#">文学创作</a></li>
          <li><a href="#">药学专业</a></li>
          <li><a href="#">出版专业</a></li>
          <li><a href="#">地震系统</a></li>
          <li><a href="#">档案专业</a></li>
          <li><a href="#">体育系列</a></li>
          <li><a href="#">统计专业</a></li>
          <li><a href="#">海洋渔业</a></li>
          <li><a href="#">林业专业</a></li>
          <li><a href="#">审计专业</a></li>
          <li><a href="#">文化艺术</a></li>
          <li><a href="#">国际商务</a></li>
          <li><a href="#">社会科学</a></li>
          <li><a href="#">地质勘探</a></li>
          <li><a href="#">卫生专业</a></li>
          <li><a href="#">测绘国土</a></li>
          <li><a href="#">水利行业</a></li>
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
                              <img src="/r/cms/hbxh/default/images/grey_30x30/icon_tx.png" width="43" height="43" /><em></em>
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
        [@cms_content_list channelId='88' count='30'] 
             [#list tag_list as a]
                  <li><a href="${a.url}" title="${a.title}" target="_blank">${a.title}</a></li>
             [/#list]
        [/@cms_content_list]
    </ul>
    <div class="c_l"></div>
  </div>
</div>
<!--底部导航-->
[#include "footer.html"/]
</body>
</html>