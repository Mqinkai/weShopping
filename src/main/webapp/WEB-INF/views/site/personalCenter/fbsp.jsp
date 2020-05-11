<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/11
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" pageEncoding="UTF-8"%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="robots" content="all">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="stylesheet" type="text/css" href="/static/fbfengmian/css/ycbootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/fbfengmian/css/reset.css"/>

    <script src="/static/fbfengmian/plugins/cover_js/iscroll-zoom.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/fbfengmian/plugins/cover_js/hammer.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/fbfengmian/plugins/cover_js/lrz.all.bundle.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/fbfengmian/plugins/cover_js/jquery.photoClip.min.js" type="text/javascript" charset="utf-8"></script>
    <title>发布商品</title>
<style type="text/css">
    .parent{
        position:relative;
        height:600px;//高度根据需求自行设定
    }
    .child{
        position:absolute;
        left:0;
        top:0;
        right:0;
        bottom:0;  //left,top,right,bottom都为0，充满真个页面
    overflow-y:auto;
        overflow-x:hidden; //设置Y轴出现滚动条，X轴隐藏
    }

</style>
</head>

<body>
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!--顶部导航条 -->
            <jsp:include flush="true" page="/WEB-INF/views/site/daohang.jsp"></jsp:include>

            <!--悬浮搜索框-->

            <div class="nav white">
                <div class="logoBig">
                    <li><img src="/static/images/logobig.png" /></li>
                </div>

                <div class="search-bar pr">
                    <a name="index_none_header_sysc" href="#"></a>
                    <form>
                        <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
                        <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
                    </form>
                </div>
            </div>

            <div class="clear"></div>
        </div>
        </div>
    </article>
</header>
<b class="line"></b>
<div class="center">
    <div class="col-main">
        <aside class="menu" style="margin-top: 35px">
            <ul>
                <li class="person">
                    <a href="${ctx}/personCenter/">个人中心</a>
                </li>
                <li class="person">
                    <a>个人资料</a>
                    <ul>
                        <li> <a href="${ctx}/personCenter/PersonInformation">个人信息</a></li>
                        <li> <a href="${ctx}/personCenter/safety">安全设置</a></li>
                        <li> <a href="${ctx}/personCenter/address">收货地址</a></li>
                    </ul>
                </li>
                <li class="person">
                    <a>我的交易</a>
                    <ul>
                        <li><a href="${ctx}/personCenter/order">订单管理</a></li>
                    </ul>
                </li>

                <li class="person">
                    <a>我的小窝</a>
                    <ul>
                        <li> <a href="${ctx}/personCenter/comment">评价</a></li>
                        <li> <a href="${ctx}/personCenter/news">消息</a></li>
                        <li class="active"> <a href="${ctx}/personCenter/fbsp">发布二手</a></li>
                    </ul>
                </li>

            </ul>

        </aside>
        <div class="main-wrap">
        <div style="margin-left: 60px;margin-top: 70px;">

                     <div style="padding: 20px">
                         <span>类别选择：</span>
                         <select name="leibieId" id="leibieId" style="width: 200px;">
                             <option value="">请选择分类</option>
                             <c:forEach items="${leibieList}" var="leibie" varStatus="sta">
                                 <option value="${leibie.id}">${leibie.mingcheng}</option>
                             </c:forEach>
                        </select>
                         <select name="leibiexiashuId" id="leibiexiashuId" style="width: 200px;">
                             <option value="">请选择分类</option>
                         </select>
                     </div>
                     <div style="padding: 20px">
                         <span>物品名称：</span>
                        <input  style="border:1px solid;width: 200px;" type="text" name="mingcheng" id="mingcheng"/>
                     </div>


                         <div style="min-height:1px;line-height:160px;text-align:center;position:relative;padding: 30px" ontouchstart="">
                             <div class="cover-wrap" style="display:none;position:fixed;left:0;top:0;width:100%;height:100%;background: rgba(0, 0, 0, 0.4);z-index: 10000000;text-align:center;">
                                 <div class="" style="width:900px;height:600px;margin:100px auto;background-color:#FFFFFF;overflow: hidden;border-radius:4px;">
                                     <div id="clipArea" style="margin:10px;height: 520px;"></div>
                                     <div class="" style="height:56px;line-height:36px;text-align: center;padding-top:8px;">
                                         <button id="clipBtn" style="width:120px;height: 36px;border-radius: 4px;background-color:#ff8a00;color: #FFFFFF;font-size: 14px;text-align: center;line-height: 36px;outline: none;">保存封面</button>
                                     </div>
                                 </div>
                             </div>
                             <div id="view" style="width:214px;height:160.5px; margin-left: 20px" title="请上传 428*321 的封面图片"></div>
                             <div style="height:10px;"></div>
                             <div class="" style="width:140px;height:32px;border-radius: 4px;background-color:#ef6363;color: #FFFFFF;font-size: 14px;text-align:center;line-height:32px;outline:none;margin-left:55px;position:relative;">
                                 点击上传封面图
                                 <input type="file" id="file" style="cursor:pointer;opacity:0;filter:alpha(opacity=0);width:100%;height:100%;position:absolute;top:0;left:0;">
                             </div>
                         </div>
                        <%-- <input style="border:1px solid;width: 200px;" type="text" name="fujian" id="fujian" readonly="readonly"/>--%>
                         <%--<button class="am-btn am-btn-danger" value="上传" onclick="up()">上传</button>--%>
                         <input type="hidden" name="fujianYuanshiming" id="fujianYuanshiming"/>

                    <div style="padding: 20px">
                      <span>物品介绍：</span>
                      <script id="editor" type="text/plain" style="width:600px;height:500px;"></script>
                    </div>
                      <div style="padding: 20px">
                          <span>物品售价：</span>

                          <input  style="border:1px solid;width: 200px;" type="text" name="jiage" id="jiage" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>￥
                      </div>
                     <div style="padding: 20px">
                         <span>物品原价：</span>

                         <input  style="border:1px solid;width: 200px;" type="text" name="yuanjia" id="yuanjia" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>￥
                     </div>

            <div style="padding: 20px">
                <span>支持付款方式：</span>

                <input  style="border:1px solid;width: 200px;" type="text" name="fkfs" id="fkfs" />
            </div>
            <div style="padding: 20px">
                <span>账号：</span>

                <input  style="border:1px solid;width: 200px;" type="text" name="zh" id="zh"/>
            </div>
                           <div style="padding: 20px;margin-left: 100px">
                               <button class="am-btn am-btn-danger" value="提交" onclick="check()">提交</button>&nbsp;
                           </div>

</div>
        </div>
        <div class="footer"  style="margin-top: 50px">
            <div class="footer-hd">
                <p>
                    <a href="http://www.qtech.edu.cn/">青岛理工</a>
                    <b>|</b>
                    <a href="${ctx}/message/show">平台首页</a>
                    <b>|</b>
                    <a href="${ctx}/personCenter/">个人中心</a>
                </p>
            </div>
            <div class="footer-bd ">
                <p>
                    <em>(c) 2015-2025 青岛理工毕设 版权所有. <a href="" target="_blank" title="宋明杰">宋明杰</a> - </em>
                </p>
            </div>
        </div>
    </div>
</div>
<!--底部-->


<script language="javascript">
    var fujian = '';  //封面地址
    var ue = UE.getEditor('editor',{toolbars: [//初始化
        ['fullscreen', 'source', 'undo', 'redo'],
        ['bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'forecolor', 'fontsize', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'simpleupload', 'cleardoc']
    ]});
    UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
    UE.Editor.prototype.getActionUrl = function(action){
        if(action == '/resource/upload/images'){
            return '<%=basePath%>resource/upload/images';
        }else{
            return this._bkGetActionUrl.call(this, action);
        }
    }

    var clipArea = new bjj.PhotoClip("#clipArea", {
        size: [428, 321],// 截取框的宽和高组成的数组。默认值为[260,260]
        outputSize: [428, 321], // 输出图像的宽和高组成的数组。默认值为[0,0]，表示输出图像原始大小
        //outputType: "jpg", // 指定输出图片的类型，可选 "jpg" 和 "png" 两种种类型，默认为 "jpg"
        file: "#file", // 上传图片的<input type="file">控件的选择器或者DOM对象
        view: "#view", // 显示截取后图像的容器的选择器或者DOM对象
        ok: "#clipBtn", // 确认截图按钮的选择器或者DOM对象
        loadStart: function() {
            // 开始加载的回调函数。this指向 fileReader 对象，并将正在加载的 file 对象作为参数传入
            $('.cover-wrap').fadeIn();
            console.log("照片读取中");
        },
        loadComplete: function() {
            // 加载完成的回调函数。this指向图片对象，并将图片地址作为参数传入
            console.log("照片读取完成");
        },
        //loadError: function(event) {}, // 加载失败的回调函数。this指向 fileReader 对象，并将错误事件的 event 对象作为参数传入
        clipFinish: function(dataURL) {
            // 裁剪完成的回调函数。this指向图片对象，会将裁剪出的图像数据DataURL作为参数传入
            $('.cover-wrap').fadeOut();
            $('#view').css('background-size','100% 100%');
            console.log(dataURL);
            fujian = dataURL;
            //dataURLtoFile(fujian,"111.jpg");
        }
    });
    function init()
    {
        loginService.leibieSelect(callBack);
    }

    function callBack(data)
    {
        DWRUtil.addOptions("leibieId",data,"id","mingcheng");
    }

    function up()
    {
       /* var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
        pop.setContent("contentUrl","${ctx}/upload/upload.jsp");
        pop.setContent("title","文件上传");
        pop.build();
        pop.show();*/

    }



    function check()
    {
        var leibieId = $("#leibieId").val();
        var leibiexiashuId = $("#leibiexiashuId").val();
        var mingcheng = $("#mingcheng").val();
        //fujian
        var jieshao = UE.getEditor('editor').getContent();
        var jiage = $("#jiage").val();
        var yuanjia = $("#yuanjia").val();
        var fkfs = $("#fkfs").val();
        var zh =$("#zh").val();
        $.ajax({
                    dataType: 'json', //服务器返回json格式数据
                    type: 'post', //HTTP请求类型
                    data:{leibieId:leibieId,leibiexiashuId:leibiexiashuId,mingcheng:mingcheng,fujian:fujian,jieshao:jieshao,jiage:jiage,yuanjia:yuanjia,fkfs:fkfs,zh:zh},
                    url: "${ctx}/fbgoods/updata",
                    success:function(data){
                      if(data.code == '1'){
                          $('').dailog({type:'defalut',title:'提示',discription:'发布成功',bottons:['确定'],showBoxShadow:true},function(ret) {if(ret.index===0){window.location.reload()}});
                          //setTimeout(window.location.reload(),3000);
                        } else {
                          $('').dailog({type:'warning',title:'提示',discription:data.message,bottons: ['确定'],showBoxShadow:true});
                      }
                    }}
        )

    }
    function dataURLtoFile(dataurl, filename) {
        var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
                bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
        while(n--){
            u8arr[n] = bstr.charCodeAt(n);
        }
        return new File([u8arr], filename, {type:mime});
    }
    $("#leibieId").change(function () {
        var leibieid = $("#leibieId").find("option:selected").val();
        $.ajax(
                {
                    dataType: 'json', //服务器返回json格式数据
                    type: 'get', //HTTP请求类型
                    url: "${ctx}/fbgoods/findLbie?leibieid="+leibieid,
                    success:function(data){
                        $("#leibiexiashuId").find("option").remove();
                        for(var i in data){
                            $("#leibiexiashuId").append("<option value="+data[i].id+">"+data[i].mingcheng+"</option>")
                        }
                    }}
        )
    })
</script>
</body>

</html>
