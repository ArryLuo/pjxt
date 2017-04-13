$(function () {
	var $leftMenu = $("#leftMenu");
    var $tabs = $("#tabs");
    var $closemenu = $("#closemenu");
        
    //初始化主菜单
    initLeftMenu();

    //退出系统
    $("#logout").click(function(){
    	$.messager.confirm("安全退出","您确定要退出系统吗？",function(r){
    		if(r){
    			window.location.href = path+"/exit.action";
    		}
    	});
    });
    
    //修改密码
    $("#paswd").click(function(){
    	addItem({
			obj_dialog : $('#updatepwd'),
			obj_form : $("pwdft"),
			title : "修改密码"
		});
    });
    
    $("#pwd-buttons .closedlg").click(function() {
		$('#updatepwd').dialog("close");
	});

	$("#pwd-buttons .saveuser").click(function() {
		$('#pwdft').form('submit', {
			url : path + "/system/operator!changePwd.action",
			onSubmit : function() {
				var isValid = $(this).form('validate');
				if ($("#userpwd").val() != $("#reuserpwd").val()) {
					isValid == false;
					$.messager.alert("提示", "两次密码不一致");
				}
				return isValid;
			},
			success : function(data) {
				data = $.parseJSON(data);
				if (data.result == "true") {
					$.messager.alert("提示", "修改成功");
				} else {
					$.messager.alert("提示", "修改失败");
				}
				$('#updatepwd').dialog('close');
			}
		});

	});
	
  //添加tab
    function addPanel($tabs,$closemenu,subtitle,url) {
        if (!$tabs.tabs('exists', subtitle)) {
            $tabs.tabs('add', {
                title: subtitle,
                content: createFrame(url),
                closable: true
            });
        } else {
            $tabs.tabs('select', subtitle);           
            //刷新tab
            refreshTab($tabs);
        }
        tabClose($tabs,$closemenu);
    }
  //关闭tab绑定事件
    function tabClose($tabs,$closemenu) {
        var $tabsInner = $(".tabs-inner");
        $tabsInner.bind('contextmenu', function (e) {
            $closemenu.menu('show', {
                left: e.pageX,
                top: e.pageY
            });

            var subtitle = $(this).children(".tabs-closable").text();

            $closemenu.data("currtab", subtitle);
            $tabs.tabs('select', subtitle);
            return false;
        });

        $closemenu.menu({
            onClick: function (item) {
                closeTab($tabs,item.id);
            }
        });
    }
    function initLeftMenu(){
    	$.ajax({
    		url:path+"/system/operator!selectPermissionByID.action",
            type: "get",
            success:function(data){
            	//初始时先清空菜单数据
            	$leftMenu.empty();
            	
            	//加载和设置菜单数据
                var menulist = "";
            
                menulist+='<ul class="nav_left">';
                $.each(data, function(i, n) {
                	menulist +='<li><strong>'+n.text+'<span class="fh_jia ' + n.iconCls + '"></span></strong>';
                	menulist +='<ul class="er_nav">';
                	$.each(n.children, function(j, o) {
                		menulist +='<li><a  href="javascript:;" data-url="' + o.url + '?menuid='+o.id+'" data-target="mainFrame">'+o.text+'<i class="jt_box"></i></a></li>';
                	});
                	menulist +='</ul>';
                	menulist +='</li>';
                });
                menulist+='</ul>';
            
                $leftMenu.append(menulist);

                //设置点击事件及点击菜单样式
                $('li a[data-target="mainFrame"]',$leftMenu).click(function() {
                    var tabTitle = $(this).text();
                    var url = $(this).attr("data-url");
                    addPanel($tabs,$closemenu,tabTitle, url);
                    
                    $('li div',$leftMenu).removeClass("selected");
                    $(this).parent().addClass("selected");
                    return false;
                }).hover(function() {
                        $(this).parent().addClass("hover");
                    }, function() {
                        $(this).parent().removeClass("hover");
                });
                
                $(".nav_left li strong").click(function(){
                	if($(this).hasClass("cur")){
                		$(this).parent("li").children(".er_nav").slideUp("slow",function(){
                			$("#leftMenu").getNiceScroll().resize();
                		});
                		$(this).removeClass("cur");
                	}else{
                		$(this).parent("li").children(".er_nav").slideDown("slow",function(){
                			$("#leftMenu").getNiceScroll().resize();
                		});
                		$(this).addClass("cur");
                		
                		$(this).parent("li").siblings().children(".er_nav").slideUp("slow",function(){
                			$("#leftMenu").getNiceScroll().resize();
                		});
                		$(this).parent("li").siblings().children("strong").removeClass("cur");
                	}   
            	});
                
            	$(".er_nav li a").click( function(){
            		$(this).addClass("nav_cur").parent("li").siblings().children("a").removeClass("nav_cur");
            		$(this).parent("li").parent(".er_nav").parent("li").siblings().children(".er_nav").children("li").children("a").removeClass("nav_cur");
            		
            	});
            	
            	$("#leftMenu").niceScroll({cursorcolor:"#337ab7",cursorwidth:"2px"}); 
            }
    	});
    }
    window.dialog=dialog;
});
