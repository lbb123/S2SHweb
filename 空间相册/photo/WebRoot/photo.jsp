<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>相册列表</title>
<link href="css/picture.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body style="background:#101010;">
<div class="pic-head">
<div class="picHeard-title">
<span class="spanleftpic l"><a href="#" >我的相册<label>&gt;</label>${photos1.name}</a><label>&gt;</label><label id="sssd">${photos1.id}</label>
</div>
</div>
<div class="indexBody">
  <div class="btn-float"><a class="maxBtn-l" href="javascript:void(0);"></a><a class="maxBtn-r" href="javascript:void(0);"></a></div>
  <div class="indexbody-main">
    <div class="indexbody-left"></div>
    <div class="indexbody-right"></div>
  </div>
  <div class="demo w990">
    <div class="maxPic-box">
      <div class="maxPic">
        <div class="maxPicBox"><span></span><img id="mainPic" src="${photos1.lastimage}"/></div>
      </div>
    </div>
    <div class="Pic-pageln">
        <span class="l">可用“<font>←</font>”或“<font>→</font>”方向键快速翻页</span>
        <span class="pic-r-span r">
            <a href="javascript:void(0);"  class="ico01" id="stop-on"><i class="ins1"></i>已暂停</a>
            <a href="photoslist" class="ico05"><i></i>返回图集</a>
        </span>
    </div>    
    <div id="tplist" class="w-width clearfix">
      <div class="Up-tuzu">
          <!--<a class="outpic" href="/" id="prevUrl"><span></span><img src="images/prev.jpg" /></a>
          <a class="inpic" href="/">上一组</a><span class="prevspan"></span>-->
      </div>
      
      <div class="bottom-lists l">
        <div class="PicBtn-a PicBtn-a-l"><a class="PicBtn-left" href="javascript:void(0);"></a></div>
        <div class="minPic l">
          <ul class="gallery_demo_unstyled">
          <s:iterator value="#request.photoList" var="s">
            <li><span></span><a href="javascript:void(0);" style="color: red">${s.name}</a></li><a href="#" style="color: red">${s.time}</a>
         </s:iterator>
          </ul>
        </div>
        <div class="PicBtn-a PicBtn-a-r"><a class="PicBtn-right" href="javascript:void(0);"></a></div>
      </div>
      
      <div class="Next-tuzu">
       </div>
    </div>
  </div>
</div>


<script type="text/javascript">
$(function(){
	var prevDiv = $(".Up-tuzu");
	var nextDiv = $(".Next-tuzu");
	//if(prevDiv.find("a").length<1){
	//	 prevDiv.html("<p style='line-height:120px;color:#666;'><a href='' id='prevUrl'>没有了</a></p>");
	//	}
	//if(nextDiv.find("a").length<1){
	// nextDiv.html("<p style='line-height:120px;color:#666;'><a href='' id='nextUrl'>没有了</a></p>");
	//}
	  
});
var id=$("#sssd").text();
var picList;
$(document).ready(function(){
	var url = "photolist23?photo.photosId="+id;
	$.ajax({
	type:'get',
	url:url,
	dataType: 'json',
	error:function(status){  
		  alert(status); 
        alert("error");  
    },  
	success:function(date){
    	picList = date
    	//alert(json);
    	$.each(date, function(i, item) {
      //alert(item.picPos);
    });
	},
	});
})
var selectKey = "1";

</script> 
<script type="text/javascript" >
$(function() {
	$(".gallery_demo_unstyled li:first").addClass("actives");
    $(".gallery_demo_unstyled").children("li").each(function(a) {
        $(this).bind("click",
        function() {
            controlPicture.changePic(1, (a + 1))
        })
    });
    $(".maxBtn-l").click(function() {
        controlPicture.changePic(0)
    });
    $(".maxBtn-r").click(function() {
        controlPicture.changePic(1)
    });
    $(".PicBtn-left").click(function() {
        controlPicture.changeList(0)
    });
    $(".PicBtn-right").click(function() {
        controlPicture.changeList(1)
    });
    $(".pic-r-span").children("a").each(function(a) {
        $(this).hover(function() {
            if ("stop-on" == $(this).attr("id")) {
                if ("" == $(this).children("i").attr("class")) {
                    $(this).children("i").attr("class", "ins")
                } else {
                    $(this).children("i").attr("class", "ins1")
                }
            } else {
                var b = $(this).attr("class");
                $(this).children("i").attr("class", "ins" + (b.substr(b.length - 1, 1)))
            }
        },
        function() {
            if ("stop-on" == $(this).attr("id")) {
                if ("ins" == $(this).children("i").attr("class")) {
                    $(this).children("i").attr("class", "")
                } else {
                    $(this).children("i").attr("class", "plays")
                }
            } else {
                $(this).children("i").attr("class", "")
            }
        })
    });
    $("#stop-on").live("click",
    function() {
        if ("ins" == $(this).children("i").attr("class")) {
            $(this).html('<i class="ins1"></i>已暂停');
            controlPicture.stopAutoPlay()
        } else {
            $(this).html('<i class="ins"></i>自动播放中');
            controlPicture.autoPlay()
        }
    });
    $(".indexbody-left").click(function() {
        controlPicture.changePic(0)
    });
    $(".indexbody-right").click(function() {
        controlPicture.changePic(1)
    })
});

function calcPicHover() {
    $(".indexbody-right").mousemove(function() {
        $(this).css("cursor", "url(images/next.cur), auto");
        $(this).attr("title", "浏览下一张 支持键盘右→翻页")
    });
    $(".indexbody-left").mousemove(function() {
        $(this).css("cursor", "url(images/pre.cur),auto");
        $(this).attr("title", "浏览上一张 支持键盘左←翻页")
    })
}
var changeSt = false;
function getScrollTop() {
    if (!changeSt) {
        document.documentElement.scrollTop = 40;
        changeSt = true
    }
}
var controlPicture = {
    getPage: 1,
    curPic: selectKey,
    moveTimer: "",
    loadAllThumb: false,
    playTime: 10000,
    playState: true,
    isPlaying: false,
    changeList: function(f, c) {
        var b = this.getPage;
        var d = picList.length;
        if (d > 6) {
            var e = 111;
            b = parseInt(b);
            if (typeof(c) != "undefined") {
                b = parseInt(c);
                if (b < 1) {
                    b = 1
                }
                if (b > d - 5) {
                    b = d - 5
                }
            } else {
                if ("1" == f) {
                    b = b + 3;
                    if (b > (d - 5)) {
                        b = d - 5
                    }
                } else {
                    b = b - 3;
                    if (b < 1) {
                        b = 1
                    }
                }
            }
            this.getPage = b;
            var a = (b - 1) * e;
            $(".gallery_demo_unstyled").animate({
                left: -a
            },
            {
                queue: false
            });
            if (this.curPic > 5 || b > 3) {
                this.loadThumbPic()
            }
        }
    },
    changePic: function(f, a, c) {
        this.suspendPlay();
        var h = this.curPic;
        var e = picList.length;
        if (picList) {
            if (typeof(a) != "undefined") {
                h = parseInt(a);
                if (h < 1) {
                    h = 1
                }
                if (h > e) {
                    h = e
                }
            } else {
                if ("1" == f) {
                    h = parseInt(h) + 1;
                    if (h > e) {
                        var b = $("#nextUrl").attr("href");
                        if ("" != b) {
                            window.location.href = b
                        }
						else{
								alert("已经没有了！");
								return false;
							}
                    }
                } else {
                    h = parseInt(h) - 1;
                    if (h < 1) {
                        var g = $("#prevUrl").attr("href");
                        if ("" != g) {
                            window.location.href = g
                        }
						else{
								alert("已经没有了！");
								return false;
							}
                    }
                }
            }
            this.checkAndLoadImg(picList[h - 1].bigPic, document.getElementById("mainPic"));
            $("#showOriginal").attr("href", picList[h - 1].originalPic);
            $(".gallery_demo_unstyled").children("li").each(function() {
                $(this).attr("class", "")
            });
            $("#tu_" + h).attr("class", "actives");
            this.curPic = h;
            this.changeURl(h);
            this.preLoad(h);
            this.changeList(1, h - 2);
            $("#viewNum").html(h);
            this.playTime = 6000;
            getScrollTop();
            this.recoverPlay();
        }
    },
    preLoad: function(a) {
        controlPicture.superPreLoadImage(picList, parseInt(a))
    },
    autoPlay: function() {
        var a = this.playTime;
        this.isPlaying = true;
        this.moveTimer = setTimeout("controlPicture.autoPlay(1);controlPicture.changePic(1)", a)
    },
    suspendPlay: function() {
        this.playState = this.isPlaying;
        this.stopAutoPlay()
    },
    recoverPlay: function() {
        if (this.playState) {
            this.autoPlay()
        }
    },
    stopAutoPlay: function() {
        clearTimeout(this.moveTimer);
        this.playTime = 6000;
        this.isPlaying = false
    },
    turnPageOnkeyDown: function() {
        $(document).keydown(function(a) {
            if (a.keyCode == 37) {
                controlPicture.changePic(0)
            }
            if (a.keyCode == 39) {
                controlPicture.changePic(1)
            }
        })
    },
    loadThumbPic: function() {
        var e = parseInt(this.getPage) - 1 + 6;
        var b = parseInt(this.getPage);
        var f = 3;
        var a = 0;
        while (f && typeof picList[b + a - 1] != "undefined") {
            if (typeof($("#tu_" + (b + a)).find("img").attr("name")) != "undefined") {
                var d = picList[b + a - 1].thumbPic;
                if ($("#tu_" + (b + a)).find("img").attr("name") != $("#tu_" + (b + a)).find("img").attr("src")) {
                    controlPicture.checkAndLoadImg(d, document.getElementById("tu_" + (b + a)).getElementsByTagName("img")[0], 1)
                }
                var c = new Image();
                c.src = d;
                a++;
                if (!c.complete) {
                    if (b + a > e) {
                        f--
                    }
                }
            } else {
                a++
            }
        }
    },
    checkAndLoadImg: function(e, d, c, a) {
        var b = new Image();
        b.src = e;
        var f = c ? "images/grey1.gif": "images/loading2.gif";
        if (b.complete) {
            $(d).css("display", "none");
            d.src = e;
            $(d).fadeIn("normal");
            if (!c) {
                calcPicHover()
            }
        } else {
            d.src = f;
            $(b).load(function() {
                $(d).css("display", "none");
                d.src = e;
                $(d).fadeIn("normal");
                if (!c) {
                    calcPicHover()
                }
            })
        }
        return true
    },
    superPreLoadImage: function(d, c) {
        var e = 2;
        var a = 0;
        while (e && typeof d[c + a] != "undefined") {
            var b = new Image();
            b.src = d[c + a].bigPic;
            if (b.complete) {
                a++
            } else {
                a++;
                e--
            }
        }
    },
    selectByurl: function() {
        var b = window.location.href;
        var a = b.split("#");
        if (typeof(a[1]) != "undefined") {
            var c = a[1].split("=");
            if (typeof(c[1]) != "undefined") {
                if (c[1]) {
                    if (c[1] < 1 || c[1] > picList.length) {
                        c[1] = 1
                    }
                    return c[1]
                }
            }
        }
        return 0
    },
    changeURl: function(a) {
        if (a) {
            location.hash = "#pn=" + a
        }
    }
};
var curPicPos = controlPicture.selectByurl();
if (curPicPos) {
    selectKey = curPicPos
}
if (parseInt(selectKey) > 1) {
    controlPicture.changePic(1, parseInt(selectKey), 1)
} else {
    controlPicture.checkAndLoadImg($("#mainPic").attr("src"), document.getElementById("mainPic"));
}
controlPicture.turnPageOnkeyDown();
if (document.getElementById("prevUrl") != null) {
    controlPicture.checkAndLoadImg($("#prevUrl").children("img").attr("src"), document.getElementById("prevUrl").getElementsByTagName("img")[0], 1)
}
if (document.getElementById("nextUrl") != null) {
    controlPicture.checkAndLoadImg($("#nextUrl").children("img").attr("src"), document.getElementById("nextUrl").getElementsByTagName("img")[0], 1)
}
if (parseInt(selectKey) <= 5) {
    $(".gallery_demo_unstyled").children("li").each(function(a) {
        if (a < selectKey + 5) {
            controlPicture.checkAndLoadImg($(this).find("img").attr("src"), document.getElementById("tu_" + (a + 1)).getElementsByTagName("img")[0], 1)
        }
    })
}
getScrollTop();
$(document).ready(function() {
    if (1 == parseInt(selectKey)) {
        controlPicture.superPreLoadImage(picList, parseInt(selectKey))
    }
    //controlPicture.autoPlay();
});
</script> 
<div style="text-align:center;">
<p></a></p>
</div>
</body>
</html>
