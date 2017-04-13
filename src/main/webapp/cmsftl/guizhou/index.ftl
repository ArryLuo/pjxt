<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<title>贵州继续教育网</title>
<meta name="description" content="学习网是批省级继续教育基地,为专业技术人员提供简单易用、方便快捷、权威的在线学习、考核、交流的网络平台，提供全方位、一站式服务。"/>
<meta name="keywords" content="学习网_继续教育_学习网_省学习网_继续教育"/>
<link rel="stylesheet" href="/${res}/guizhou/simple.css" type="text/css"/>
<link href="/${res}/guizhou/public.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="/${res}/guizhou/login.css" type="text/css"/>

<script type="text/javascript" src="/${res}/guizhou/scrolltext.js"></script>
<script src="/${res}/guizhou/jquery-1.8.2.min.js" type="text/javascript" language="javascript"></script>
<script src="/${res}/guizhou/base.js" type="text/javascript" language="javascript"></script>
<script src="/${res}/guizhou/focus.js" type="text/javascript" language="javascript"></script>
<script type=text/javascript src="/${res}/guizhou/lanrentuku.js"></script>
<script type="text/javascript" src="/${res}/guizhou/jquery.artDialog.min.js"></script>
<script type="text/javascript" src="/${res}/guizhou/tops.js"></script>
<script type="text/javascript" src="/${res}/guizhou/loginByCart.js"></script>
</head>
<body>
<div id="adv" style="position: fixed;_position:absolute; left: 10px; float: right; top: 150px;_top:expression(eval(document.documentElement.scrollTop+150)); z-index: 9999;">
<div id="clos" style="width:20px; height:20px; text-align:right;position:absolute;cursor:pointer; right:-27px; background:url(about:blank);z-index:9999"></div>
</div>
<script>
$(document).ready(function() {
        $.ajax({
             type: "post",
	     url: "/user/loginStatus",
	     success: function(user){
		if(user.status==false){	
	              $("#unLogin_top").show();
                            $("#cartUrl_top").hide();
                            $("#topNavWel").show();
                            $("#loginUser").hide();
		      }else{
		            $("#hasLogin_top").show();
                            $("#loginUser").show();
                            $("#topNavWel").hide();
                            $("#username").text(user.username);
                            $("#cartCount_span").text(user.courseNum);
                            $("#cartUrl_top").attr("href", "/p/shop/shopCartList");
		       }
	        }
         });
});

$("#clos").click(function(){
   document.getElementById("adv").style.display="none";
});
</script>
<div class="topnav" id="topnav" style="margin-top:-51px;">
   <div class="wrap">
      <p class="L">学习网欢迎您！</p>
      <div id="topNavWel" class="wel">
         请 <a onfocus="this.blur();" href="/user/login" class="org" title="登录">[登录]</a>&nbsp; 或 &nbsp;<a onfocus="this.blur();" href="/user/register" class="org" title="注册">[免费注册]</a>
      </div>
      <div id="loginUser" class="wel">
         <a onfocus="this.blur();" href="/p/user/index" class="org" ><spane id='username'></spane></a>&nbsp; | &nbsp;<a onfocus="this.blur();" href="/user/logout" class="org" title="安全退出">安全退出</a>
      </div>
      <ul class="quick-menu R">
          <li><a id='cartUrl_top' href="/">购物车：(<span id='cartCount_span' class="red fB">0</span>)</a></li>
          <li><a onfocus="this.blur();" href="/p/user/index/" title="">我要买课</a></li>
          <li id="site"><a onfocus="this.blur();" href="/course/courseLists?course_type=all" title="" class="subli">学习中心</a>
             <div class="sub hide" id="sub">
               <p><a onfocus="this.blur();" href="/p/user/index/">继教课堂</a></p>
                <p><a onfocus="this.blur();" href="/p/pay/myOrder">我的订单</a></p>
            </div>
          </li>
          <li><a onfocus="this.blur();" href="/html/bzzx" title="">服务中心</a></li>
          <li><a onfocus="this.blur();" href="/" title="">关于我们</a></li>
      </ul>
   </div>
</div>
<div class="wrap header">
        <h1><a href="/" onfocus="this.blur();"><img src="/${res}/guizhou/logo.png"></a></h1>        
        <div class="search">
           <form id="searchForm" method="post" action="/course/dataSearch" target="_blank">
           <div class="condition" id="condition">
                <em class="con_em">课程</em><span class="con_span"></span>
           </div>
           <input type="text" name='key' value="请输入关键字…" id="searchKey" class="search_text" onmouseover="this.focus();" onclick="if(value==defaultValue){value=&#39;&#39;;this.style.color=&#39;#000&#39;}">
           <input type="submit" value="" id="btnSearch" class="btnSearch">
           </form>
        </div>
      <!--   <img src="/${res}/guizhou/phone.png" class="phone"/>  -->
</div>
<div class="nav">
    <div class="wrap">
        <ul class="nav_ul">
        <li><a href="/" onfocus="this.blur();" class="cur2 cur2_select">首&nbsp;页</a></li>
        <li><a href="/html/zhinan" onfocus="this.blur();" class="cur2" target="_blank">学习指南</a></li>
        <li><a href="/course/courseLists?course_type=gzxxw8afd07a72607895e0126078e227" onfocus="this.blur();" class="cur2">初聘培训</a></li>
        <li><a href="/html/zczx" onfocus="this.blur();" class="cur2">行业资讯</a></li>
        <li><a href="/p/user/index" onfocus="this.blur();" class="cur2">学员中心</a></li>
        <li><a href="http://www.easypx.com/" onfocus="this.blur();" target="_blank" class="cur2">职业教育</a></li>
        <li class="tel"></li>
        </ul>
    </div>
</div>
<div class="wrap">
   <div class="box_left">
<div class="cppx_box">
    <div class="cppx_head">
        <h2>初聘培训</h2>
        <a class="cppx_more" href="/">more</a>
    </div>
    <ul>
    	[@cms_course page=0 rows=7 orderStatus='2']
             [#if course_tag.rows??]
	            [#list course_tag.rows as a]
                	<li><a onfocus="this.blur();" target="_blank" href="/course/courseDetails/${a.id}" title="${a.cname}" class="item">${a.cname}</a></li> 
                [/#list]
             [/#if]
        [/@cms_course]
    </ul>
</div>
<div class="cppx_banner"><a href="/"><img src="/${res}/guizhou/gg_img01.png" width="196"></a></div>
</div>
   <div class="adver">
        <div class="sub_box">
                <div class="sub_no" id="bd1lfsj">
                    <ul>
                    	[@cms_content_list channelId='279' count='5' orderBy='2' titLen='18' descLen='40' append='...' channelOption='1']
             			[#list tag_list as a] 
                  			<li class="show">${a_index+1}</li>
             			[/#list]
             			[/@cms_content_list]
                    </ul>
                </div>
                <div id="bd1lfimg">
                    <div>
                        <dl class="show"></dl>
                        [@cms_content_list channelId='279' count='5' orderBy='2' titLen='18' descLen='40' append='...' channelOption='1']
             			[#list tag_list as a] 
                  			<dl class="">
                            	<dt><a href="${a.url}" title="" target="_blank"><img style="cursor:pointer;" alt="${a.title}" src="${a.typeImg!site.defImg}" /></a></dt>
                        	</dl>
             			[/#list]
             			[/@cms_content_list]
                    </div>
                </div>
        </div>
     <script type="text/javascript">movec();</script>
     [@cms_content_list channelId='273' count='2' orderBy='4' descLen='40' channelOption='1' dateFormat='yyyy-MM-dd'] 
         [#list tag_list as a]
         <div class="guide bor-b-d">
         <h3><a href="${a.url}" onfocus="this.blur();" title="${a.title}" target="_blank">
		 [@text_cut s=a.title len=35 append='...'/]
     	 </a></h3>
     	 <p><a href="${a.url}" onfocus="this.blur();" title="${a.title}" target="_blank">
		 [@text_cut s=a.title len=35 append='...'/]
       	 </a></p>
       	 </div>
         [/#list]
     [/@cms_content_list]
   

   </div>
   <div class="course">
      <div class="fast">
        <h3><span class="org-bg"></span>快速通道</h3>
        <ul>
          <li>
            <p><a href="/course/courseLists?course_type=all" onfocus="this.blur();" title="购买课程" class="icon icon1"></a></p>
            <p><a href="/course/courseLists?course_type=all" onfocus="this.blur();" title="购买课程">购买课程</a></p>
          </li>
          <li class="pr0">
            <p><a onfocus="this.blur();" href="/p/course/uncompleted"  title="我的课程" class="icon icon2"></a></p>
            <p><a onfocus="this.blur();" href="/p/course/uncompleted" title="我的课程">我的课程</a></p>
          </li>
          <li>
            <p><a href="/p/course/completed" onfocus="this.blur();" title="在线考试" class="icon icon3"></a></p>
            <p><a href="/p/course/completed" onfocus="this.blur();" title="在线考试">在线考试</a></p>
          </li>
          <li>
            <p><a href="/p/archives/studyArchives" onfocus="this.blur();" title="学习档案" class="icon icon5"></a></p>
            <p><a href="/p/archives/studyArchives" onfocus="this.blur();" title="学习档案">学习档案</a></p>
          </li>
          <li class="pr0">
            <p><a href="/html/bzzx" onfocus="this.blur();" title="常见问题" class="icon icon6"></a></p>
            <p><a href="/html/bzzx" onfocus="this.blur();" title="常见问题">常见问题</a></p>
          </li>
        </ul>
        <div class="clear"></div>
     </div>
     <div class="new">
         <h3><span class="org-bg"></span>老师推荐</h3>
        <div class="x_exam_z">
            <ul id="jsfoot02" class="noticTipTxt scroll01 laoshitj">
            		
             <li><a onfocus="this.blur();" href="/" title="钟君">
              <img src="/${res}/guizhou/20140527174159235-zhongjun.jpg" />	
			</a>
			<h2>钟君</h2>
			<p>&nbsp;中国社会科学院马克思主义研究院经济与社会建设研究室主任。 </p>
			</li>         		
             <li><a onfocus="this.blur();" href="/" title="路甬祥">
              <img src="/${res}/guizhou/20140527174855016-luyongxiang.jpg" />	
			</a>
			<h2>路甬祥</h2>
			<p>&nbsp;十一届全国人大常委会副委员长，中国科学院院长。 </p>
			</li>         		
             <li><a onfocus="this.blur();" href="/" title="叶笃初">
              <img src="/${res}/guizhou/20140527175036810-yeduchu.jpg" />	
			</a>
			<h2>叶笃初</h2>
			<p>&nbsp;著名党建研究专家、中央党校党建研究部教授，高校任特约研究员、客座教授。 </p>
			</li>         		
             <li><a onfocus="this.blur();" href="/" title="高新民">
              <img src="/${res}/guizhou/20140527174718577-gaoxinmin.jpg" />	
			</a>
			<h2>高新民</h2>
			<p></p><p>中央党校党建教研部教授，长期研究执政党建设基本问题、党的建设史等。</p><p></p>
			</li>         		
             <li><a onfocus="this.blur();" href="/" title="刘春">
              <img src="/${res}/guizhou/20140527174039921-刘春.jpg" />	
			</a>
			<h2>刘春</h2>
			<p>&nbsp;中央党校研究生院副院长、教授、博导，中国政治学会理事。 </p>
			</li>       
             <li><a onfocus="this.blur();" href="/" title="钟君">
              <img src="/${res}/guizhou/20140527174159235-zhongjun.jpg" />	
			</a>
			<h2>钟君</h2>
			<p>&nbsp;中国社会科学院马克思主义研究院经济与社会建设研究室主任。 </p>
			</li>         		
             <li><a onfocus="this.blur();" href="/" title="路甬祥">
              <img src="/${res}/guizhou/20140527174855016-luyongxiang.jpg" />	
			</a>
			<h2>路甬祥</h2>
			<p>&nbsp;十一届全国人大常委会副委员长，中国科学院院长。 </p>
			</li>         		
             <li><a onfocus="this.blur();" href="/" title="叶笃初">
              <img src="/${res}/guizhou/20140527175036810-yeduchu.jpg" />	
			</a>
			<h2>叶笃初</h2>
			<p>&nbsp;著名党建研究专家、中央党校党建研究部教授，高校任特约研究员、客座教授。 </p>
			</li>         		
             <li><a onfocus="this.blur();" href="/" title="高新民">
              <img src="/${res}/guizhou/20140527174718577-gaoxinmin.jpg" />	
			</a>
			<h2>高新民</h2>
			<p></p><p>中央党校党建教研部教授，长期研究执政党建设基本问题、党的建设史等。</p><p></p>
			</li>         		
             <li><a onfocus="this.blur();" href="/" title="刘春">
              <img src="/${res}/guizhou/20140527174039921-刘春.jpg" />	
			</a>
			<h2>刘春</h2>
			<p>&nbsp;中央党校研究生院副院长、教授、博导，中国政治学会理事。 </p>
			</li>         		
            		
            </ul>
       </div>
       
     </div>
  
   </div>
   <div class="mb10 clear"><img src="/${res}/guizhou/ad1.png" /></div>
   <div class="content-left">
         <div class="recom">
        <h3><span>热门问题</span></h3>
         <div class="problem">
         		<p><a href="/html/bzzx?tag=12&channelId=12_1" title="如何购买课程？" target="_blank">如何购买课程？</a></p>
         		<p><a href="/html/bzzx?tag=7&channelId=7_3" title="学习的中途退出课程可以吗？" target="_blank">学习的中途退出课程可以吗？</a></p>
         		<p><a href="/html/bzzx?tag=10&channelId=10_1" title="无法播放视频怎么办？" target="_blank">无法播放视频怎么办？</a></p>
         		<p><a href="/html/bzzx?tag=3&channelId=3_3" title="账户无法正常登录？" target="_blank">账户无法正常登录？</a></p>
         		<p><a href="/html/bzzx?tag=8&channelId=8_1" title="课程考试未通过怎么办？" target="_blank">课程考试未通过怎么办？</a></p>
         		<p><a href="/html/bzzx?tag=9&channelId=9_1" title="怎么进行学时申报？" target="_blank">怎么进行学时申报？</a></p>
         		<p><a href="/html/bzzx?tag=12&channelId=12_4" title="在线支付需要注意什么？" target="_blank">在线支付需要注意什么？</a></p>
           
        </div>
      </div>
      <div class="sort">
         <div class="change">
             <ul>
               <li class="cur">初聘培训购买排行榜</li>
             </ul>
         </div>
         <ul class="order mt10">
                [@cms_course page=0 rows=7 orderStatus='2']
             	[#if course_tag.rows??]
	            [#list course_tag.rows as a]
                	<li>
                		<span class="classes">[@text_cut s=a.baseCourseTypeName len=6 append='...' /]</span>
            			<a onfocus="this.blur();" target="_blank" href="/course/courseDetails/${a.id}" title="${a.cname}" class="item">[@text_cut s=a.cname len=10 append='...' /]</a>
            			<span class="org teacher">${a.teachername}</span>
            			<span class="org lang">${a.creditnum}学时</span>
					</li> 
                [/#list]
                [/#if]
                [/@cms_course]
         </ul>
      </div>
      <div class="clear mb10"><a href="http://www.easypx.com/course/courseLists?coursetype=100102" target="_blank"><img src="/${res}/guizhou/ad3.jpg"></a></div>
   </div>
   <div class="content-right">
     <div class="new">
       <h3><span class="org-bg"></span>课程评论</h3>
        <div class="x_exam_z kcpl_box">
            <ul id="jsfoot01" class="noticTipTxt">
            	[@cms_course_comment page=0 rows=10 dateFormat='yyyy-MM-dd']
		    	[#if comment_tag.rows??]
		    	[#list comment_tag.rows as a]
		    	 	<li><span>${a.username}</span><a onfocus="this.blur();" target="_blank" href="/course/courseDetails/${a.courseid}" title="${a.content}">${a.content}</a></li>
            	        [/#list] 
		        [/#if]
		[/@cms_course_comment]
            </ul>
       </div>
     </div>
         
   </div>
   <div style="float: left;width: 960px;margin: 10px 0">  <div class="sort zcfg_box">
         <div class="change">
             <ul>
               <li class="cur">政策法规</li>
             </ul>
         </div>
         <ul class="message mt10">
                [@cms_content_list channelId='243' count='9' orderBy='4' titLen='18' descLen='40' append='...' channelOption='1' dateFormat='yyyy-MM-dd'] 
                 [#list tag_list as a]
                 <li><span class="R">
                 		[#if a.date??]
                          ${a.date?string(dateFormat)}
                         [/#if]
                     </span>
                     <a target="_blank" href="${a.url}" onfocus="this.blur();" title="${a.title}">
           				[@text_cut s=a.title len=25 append='...' /]
           			 </a>
           	 	 </li>
                 [/#list]
            [/@cms_content_list]
         </ul>
       
      </div>
          <div class="sort zcfg_box">
         <div class="change">
             <ul>
               <li class="cur">行业资讯</li>
             </ul>
         </div>
        <ul class="message mt10">
             [@cms_content_list channelId='244' count='9' orderBy='4' titLen='18' descLen='40' append='...' channelOption='1' dateFormat='yyyy-MM-dd'] 
                 [#list tag_list as a]
                 <li><span class="R">
                 		[#if a.date??]
                          ${a.date?string(dateFormat)}
                         [/#if]
                     </span>
                     <a target="_blank" href="${a.url}" onfocus="this.blur();" title="${a.title}">
           				[@text_cut s=a.title len=25 append='...' /]
           			 </a>
           	 	 </li>
                 [/#list]
            [/@cms_content_list]
         </ul>
      </div></div>
   <div class="clear" style="*margin-top:-10px;"><a href="http://www.easypx.com/r/cms/easypx/default/kaoqian/page/baodian/bd.html" target="_blank"><img src="/${res}/guizhou/ad2.jpg"></a></div>
   <div class="link">
      <div class="change">
          <p class="cur-defult">友情链接</p>
      </div>
      <div class="link-a">
	  <a href="http://www.mohrss.gov.cn/" onfocus="this.blur();" target="_blank">中华人民共和国人力资源和社会保障部</a>
	  <a href="http://gz.hrss.gov.cn/web/864691128455135232/index.html" onfocus="this.blur();" target="_blank">贵州人力资源社会保障网</a>
      </div>
   </div>
   <div class="ni_unit">
      <div class="ni_help L">
<div class="ni_help_con L">
            <span class="f14 fB">新手指南</span>
            <ul>
                <li><a target="_blank" href="/html/bzzx?tag=1&channelId=1_0">登录注册</a></li>
        		<li><a target="_blank" href="/html/bzzx?tag=16&channelId=16_0">账户充值</a></li>
       			<li><a target="_blank" href="/html/bzzx?tag=19&channelId=19_0">学习卡</a></li>
            </ul>
        </div>
          <div class="ni_help_con L">
            <span class="f14 fB">购课指南</span>
            <ul>
                <li><a target="_blank" href="/html/bzzx?tag=4&channelId=4_0">选课指南</a></li>
       		    <li><a target="_blank" href="/html/bzzx?tag=4&channelId=4_1">选课流程</a></li>
        		<li><a target="_blank" href="/html/bzzx?tag=5&channelId=5_0">开通课程</a></li>
        		<li><a target="_blank" href="/html/bzzx?tag=6&channelId=6_0">退课说明</a></li>
            </ul>
          </div>
          <div class="ni_help_con L">
            <span class="f14 fB">继续教育指南</span>
            <ul>
	        <li><a target="_blank" href="/html/bzzx?tag=7&channelId=7_0">在线学习</a></li>
	        <li><a target="_blank" href="/html/bzzx?tag=8&channelId=8_0">在线考试</a></li>
	        <li><a target="_blank" href="/html/bzzx?tag=9&channelId=9_0">学时申报</a></li> 
	        <li><a target="_blank" href="/html/bzzx?tag=9&channelId=9_3">打印证书</a></li>
	        </ul>
        </div>
        <div class="ni_help_con L">
            <span class="f14 fB">网络学习环境</span>
            <ul>
	        <li><a target="_blank" href="/html/bzzx?tag=10&channelId=10_0">软件下载</a></li>
	        <li><a target="_blank" href="/html/bzzx?tag=10&channelId=10_1">视频问题</a></li>
	        <li><a target="_blank" href="/html/bzzx?tag=10&channelId=10_2">播放器插件</a></li>
	        </ul>
        </div>
      </div>
      <div class="ni_help_tel L">
        <img src="/${res}/guizhou/touch.jpg">
      </div>
   </div>
</div>
[#include "../include/footer.html"/]
<script type="text/javascript">
if(document.getElementById("jsfoot01")){
	var scrollup = new ScrollText("jsfoot01");
	scrollup.LineHeight = 44; 
	scrollup.Amount = 1;
	scrollup.Delay = 20;  
	scrollup.Start(); 
	scrollup.Direction = "up";
}
if(document.getElementById("jsfoot02")){
	var scrollup = new ScrollText("jsfoot02");
	scrollup.LineHeight = 22; 
	scrollup.Amount = 1;
	scrollup.Delay = 20;  
	scrollup.Start(); 
	scrollup.Direction = "up";
}
</script> 

<script>$(function(){$("#hhService").fix({float:'right',minStatue:false,skin:'green',durationTime:1000})});</script>

<!-- 代码 开始 -->
<div class="scrollsidebar side_green" id="hhService" style="right: 0px; top: 320px;">
	<div class="side_content">
		<div class="side_list">
			<div class="side_title">
				<a title="隐藏" class="close_btn"><span>关闭</span></a></div>
			<div class="side_center">
				<div class="qqserver">
					<p style="text-align:center">
					<a title="" href="tencent://message/?uin=2231018167&Site=&Menu=yes">
					<img src="/${res}/guizhou/pa" /></a></p>
				
				</div>
				<div class="msgserver" style="text-align:center">
					<p><a href="tencent://message/?uin=2231018167&Site=&Menu=yes">2231018167</a></p>
				</div>
			</div>
			<div class="side_bottom">
			</div>
		</div>
	</div>
	<div class="show_btn"><span>在线咨询</span></div>
</div>
</body></html>