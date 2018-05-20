<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/16
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<%--<%@ include file="/WEB-INF/views/common/taglib.jsp"%>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
    <title>个人资料</title>
    <style type="text/css">

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
                        <li class="active"> <a href="${ctx}/personCenter/PersonInformation">个人信息</a></li>
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
                        <li> <a href="${ctx}/personCenter/omment">评价</a></li>
                        <li> <a href="${ctx}/personCenter/news">消息</a></li>
                        <li> <a href="${ctx}/personCenter/fbsp">发布二手</a></li>
                    </ul>
                </li>

            </ul>

        </aside>
        <div class="main-wrap">
            <div class="user-info" >
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
                </div>
                <hr/>

                <!--头像 -->
                <div class="user-infoPic">

                    <div class="filePic">
                       <%-- <input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="/static/img/*">--%>
                        <img id="img" class="am-circle am-img-thumbnail" src="${huiyuan.tx}" alt="" />

                    </div>
                    <div class="info-m">
                        <div><b>用户名：<i>${huiyuan.userName}</i></b></div>
                        <div class="u-level">
									<span class="rank r2">
							             <s class="vip1"></s><a class="classes" href="#">${huiyuan.code}</a>
						            </span>
                        </div>
                    </div>
                </div>
                <!--个人信息 -->
                <div class="info-main">
                    <form class="am-form am-form-horizontal" id="form" action="${ctx}/personCenter/save" method="post">
                       <input id="id" name="id" value="${huiyuan.id}" type="hidden">
                        <div class="am-form-group">
                            <label class="am-form-label">昵称</label>
                            <div class="am-form-content">
                                <input type="text" name="userName" id="userName" placeholder="必填" value="${huiyuan.userName}" required>

                            </div>
                        </div>

                        <div class="am-form-group">
                            <label  class="am-form-label">姓名</label>
                            <div class="am-form-content">
                                <input type="text" name="xingming" id="xingming" placeholder="必填" value="${huiyuan.xingming}" required>

                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-form-label">性别</label>
                            <div class="am-form-content sex">
                                <c:choose>
                                    <c:when test="${huiyuan.xingbie ==''}">
                                        <label class="am-radio-inline">
                                            <input type="radio" name="xingbie" value="1" data-am-ucheck> 男
                                        </label>
                                        <label class="am-radio-inline">
                                            <input type="radio" name="xingbie" value="2" data-am-ucheck> 女
                                        </label>
                                        <label class="am-radio-inline">
                                            <input type="radio" name="xingbie" value="0" data-am-ucheck> 保密
                                        </label>
                                    </c:when>
                                    <c:when test="${huiyuan.xingbie =='1'}">
                                        <label class="am-radio-inline">
                                            <input type="radio" name="xingbie" checked value="1" data-am-ucheck> 男
                                        </label>
                                        <label class="am-radio-inline">
                                            <input type="radio" name="xingbie" value="2" data-am-ucheck> 女
                                        </label>
                                        <label class="am-radio-inline">
                                            <input type="radio" name="xingbie" value="0" data-am-ucheck> 保密
                                        </label>
                                    </c:when>
                                    <c:when test="${huiyuan.xingbie =='2'}">
                                        <label class="am-radio-inline">
                                            <input type="radio" name="xingbie" value="1" data-am-ucheck> 男
                                        </label>
                                        <label class="am-radio-inline">
                                            <input type="radio" name="xingbie" checked value="2" data-am-ucheck> 女
                                        </label>
                                        <label class="am-radio-inline">
                                            <input type="radio" name="xingbie" value="0" data-am-ucheck> 保密
                                        </label>
                                    </c:when>
                                    <c:otherwise>
                                        <label class="am-radio-inline">
                                            <input type="radio" name="xingbie" value="1" data-am-ucheck> 男
                                        </label>
                                        <label class="am-radio-inline">
                                            <input type="radio" name="xingbie" value="2" data-am-ucheck> 女
                                        </label>
                                        <label class="am-radio-inline">
                                            <input type="radio" name="xingbie" checked value="0" data-am-ucheck> 保密
                                        </label>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-form-label">生日</label>
                            <div class="am-form-content birth">
                                <div class="birth-select">
                                    <input type="text" id="srup" name="srup" readonly="readonly" maxlength="20" class="cursorpointer datainput"
                                           value="<fmt:formatDate value="${huiyuan.sr}" pattern="yyyy-MM-dd"/>"
                                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});" required>
                                </div>
                            </div>

                        </div>

                        <div class="am-form-group">
                            <label class="am-form-label">所在地</label>
                            <div class="am-form-content address">
                                <select name="province" id="province"></select>
                                <select name="city" id="city"></select>
                                <select name="area" id="area"></select>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label  class="am-form-label">所在学校</label>
                            <div class="am-form-content">
                                <input type="text" name="school" id="school" placeholder="无学校可为空" value="${huiyuan.school}">

                            </div>
                        </div>
                        <div class="info-btn">
                            <input class="am-btn am-btn-danger" type="submit" id="submit" value="保存修改"></input>
                        </div>

                    </form>
                </div>

            </div>
            <!--底部-->
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

</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="upload-form"   method="post" enctype="multipart/form-data" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <div class="h4">图片预览</div>
                    <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload">
                        <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                            <img id='picImg' style="width: 100%;height: auto;max-height: 180px;" src="${huiyuan.tx}" alt="" />
                        </div>
                        <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
                        <div>
                        <span class="btn btn-primary btn-file">
                            <span class="fileinput-new">选择文件</span>
                            <span class="fileinput-exists">换一张</span>
                            <input type="file" name="file" id="tx" accept="image/gif,image/jpeg,image/x-png"/>
                        </span>
                            <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
                        </div>
                    </div>
                </div>
                <button type="button" id="uploadSubmit" onclick="up()" class="btn btn-info">提交</button>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
        </div>
<div id="load-layout" style="position:fixed;width:100%;height:100%;top:0px;left:0px;opacity:0.4;background:#000;display:none;">
    <div style="position:absolute;left:49%;top:200px;">
        <img src="/static/img/load.gif">
    </div>
</div>
<script type="text/javascript">
 var path="";
$("#img").click(function () {
   /* var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
    pop.setContent("contentUrl","${ctx}/common/upFile.jsp");
    pop.setContent("title","文件上传");
    pop.build();
    pop.show();*/
    $('#myModal').modal('show')
});


 //设置模态框居中
 $('#myModal').on('show.bs.modal', centerModals);
 //禁用空白处点击关闭
/* $('#myModal').modal({
     backdrop: 'static',
     show:false
 });*/
 //页面大小变化是仍然保证模态框水平垂直居中
 $(window).on('resize', centerModals);

 function centerModals() {

     $('#myModal').each(function(i) {
         var $clone = $(this).clone().css('display','block').appendTo('body');
         var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
         top = top > 0 ? top : 0;
         $clone.remove();
         $(this).find('.modal-content').css("margin-top", top);
     });
 };

 function grzx() {
        var log = $("#log").val();
        if (log=='1'){
            window.location.href='${ctx}/personCenter/';
        }else {
            $('').dailog({type:'defalut',title:'提示',discription:'用户未登陆！',bottons: ['确定'],showBoxShadow:true});
        }
    }
//ajax上传头像，返回服务器头像url
    function up() {
        var f = document.getElementById("tx").files;
        var name = f[0].name; //文件名
        var type=(name.substr(name.lastIndexOf("."))).toLowerCase(); //截取字符串，substr() 方法可在字符串中抽取从 start 下标开始的指定数目的字符。转换成小写
        if(type!=".jpg" &&type!=".gif"&&type!=".jpeg"&& type!=".png"){
             //alert("您上传图片的类型不符合(.jpg|.jpeg|.gif|.png)！");
            $("").dailog({
                type: 'danger',
                showBoxShadow: true,
                animateStyle: 'none',
                bottons: ['确定'],
                discription: '您上传图片的类型不符合(.jpg|.jpeg|.gif|.png)！'
            });
             return false;
             }else {
            $('#load-layout').show();
            var formData = new FormData(document.getElementById("upload-form"));
            $.ajax({
                url:"${ctx}/personCenter/upFile",
                method: 'POST',
                data: formData,
                async: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data.code=='1'){
                        setTimeout(function(){
                            $('load-layout').hide();
                            window.location.reload();
                        },4000);

                    }
                    else {
                        $("").dailog({
                            type: 'danger',
                            showBoxShadow: true,
                            animateStyle: 'none',
                            bottons: ['确定'],
                            discription: '上传失败，请稍后重试。'
                        });
                    }
                    $('#myModal').modal('hide')
                },
                error: function (data) {
                    console.log(data);
                }
            });
/*            $.ajaxFileUpload({
                url: "${ctx}/personCenter/upFile",
                secureuri:false,
                async:false,
                fileElementId:"tx",    //上传文件选择框的id属性
                dataType: 'json',   //json，与后台对应，text和json
                success: function (data) {        // var readdata =  eval('(' + data.substring(59,data.length-6) + ')');    //text 格式自动加载标签，使用及去字符串
                    if (data.code=='1'){
                        window.location.reload();
                    }
                   else {
                        $("").dailog({
                            type: 'danger',
                            showBoxShadow: true,
                            animateStyle: 'none',
                            bottons: ['确定'],
                            discription: '上传失败，请稍后重试。'
                        });
                    }
                    $('#myModal').modal('hide')
                },
                error: function (data) {
                    console.log(data);
                }
            });*/
        }
    }
/* $("#submit").submit(function(){
     console.log("------");
     console.log($('#form').serialize());
     $.ajax({
         //几个参数需要注意一下
         type: "POST",//方法类型
         dataType: "json",//预期服务器返回的数据类型
         url: "${ctx}/personCenter/save" ,//url
         data: $('#form').serialize(),
         success: function (result) {
             console.log(result);//打印服务端返回的数据(调试用)
             if (result.code == '1') {
                 window.location.reload();
             }
             ;
         },
         error : function() {
             alert("异常！");
         }
     });
 });*/
    function saveInfo() {

    }
</script>
<script language="javascript" defer>
    new PCAS("province","city","area","山东省","青岛市","黄岛区");
</script>
</body>

</html>