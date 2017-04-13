jQuery.fn.extend({
	uploadPreview: function(opts) {
		var _0 = this,
			_1 = $(this);
		opts = jQuery.extend({
			Img: "ImgPr",
			Width: 100,
			Height: 100,
			ImgType: ["jpg"],
			Callback: function() {}
		}, opts || {});
		_0.getObjectURL = function(file) {
			var url = null;
			if (window.createObjectURL != undefined) {
				url = window.createObjectURL(file)
			} else if (window.URL != undefined) {
				url = window.URL.createObjectURL(file)
			} else if (window.webkitURL != undefined) {
				url = window.webkitURL.createObjectURL(file)
			}
			return url
		};
		_1.change(function() {
			if (this.value) {
				if (!RegExp("\.(" + opts.ImgType.join("|") + ")$", "i").test(this.value.toLowerCase())) {
					$.messager.alert("提示","消息提示:只能上传jpg类型的文件!");
					this.value = "";
					return false
				}
				//检测上传文件的大小        
			    var isIE = /msie/i.test(navigator.userAgent) && !window.opera;  
			    var fileSize = 0;           
			    if (isIE && !this.files){       
			        var filePath = this.value;       
			        var fileSystem = new ActiveXObject("Scripting.FileSystemObject");          
			        var file = fileSystem.GetFile (filePath);       
			        fileSize = file.Size;      
			    } else {      
			        fileSize = this.files[0].size;       
			    }     
			    var size = fileSize / 1024*1024;   
			    if(size>(1024*1024*2)){    
			    	$.messager.alert("提示","消息提示:文件大小不能超过2M!");
			    	this.value = "";
			    	return false
			    }
				if (navigator.userAgent.indexOf("MSIE") > -1) {
					try {
						$("#" + opts.Img).attr('src', _0.getObjectURL(this.files[0]))
					} catch (e) {
						var src = "";
						var obj = $("#" + opts.Img);
						var div = obj.parent("div")[0];
						_0.select();
						if (top != self) {
							window.parent.document.body.focus()
						} else {
							_0.blur()
						}
						src = document.selection.createRange().text;
						document.selection.empty();
						obj.hide();
						obj.parent("div").css({
							'filter': 'progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)',
							'width': opts.Width + 'px',
							'height': opts.Height + 'px'
						});
						div.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = src
					}
				} else {
					$("#" + opts.Img).attr('src', _0.getObjectURL(this.files[0]))
				}
				opts.Callback()
			}
		})
	}
});