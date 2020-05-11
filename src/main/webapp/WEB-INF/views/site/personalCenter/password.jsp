<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/12
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" pageEncoding="UTF-8"%>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>修改密码</title>
    <style type="text/css">
        .am-form-group.code a.btn{
            right: -11px;!important;
            top: -7px;!important;
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
                        <li> <a href="${ctx}/personCenter/fbsp">发布二手</a></li>
                    </ul>
                </li>

            </ul>

        </aside>
        <div class="main-wrap">

            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
            </div>
            <hr/>
            <!--进度条-->
            <div class="m-progress">
                <div class="m-progress-list">
							<span id="step-1" class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">重置密码</p>
                            </span>
							<span id="step-2" class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
                    <span class="u-progress-placeholder"></span>
                </div>
                <div class="u-progress-bar total-steps-2">
                    <div class="u-progress-bar-inner"></div>
                </div>
            </div>
            <div id="secc" style="display:none; margin-left: 400px; margin-top: 100px;"><span>修改成功，请<a style="color: blue" href="${ctx}/login/userLogin">重新登录</a></span></div>
           <div id="yz2"style="display:none;" class="am-form am-form-horizontal">
               <div class="am-form-group code">
                   <label class="am-form-label">验证码</label>
                   <div class="am-form-content">
                       <input type="tel" id="user-code" readonly="readonly" placeholder="验证码">
                   </div>
                   <a class="btn" href="javascript:void(0);" onclick="sendMobileCode();" id="sendMobileCode">
                   <div class="am-btn am-btn-danger">发送手机验证码</div>
               </a>
                   <a class="btn" href="javascript:void(0);" onclick="sendEmailCode();" id="sendEmailCode" style="right:-150px;">
                       <div class="am-btn am-btn-danger">发送邮箱验证码</div>
                   </a>
               </div>
               <div class="info-btn" onclick="save2()">
                   <div class="am-btn am-btn-danger">提交</div>
               </div>
           </div>
            <div id="form_save" class="am-form am-form-horizontal">
                <div class="am-form-group">
                    <label for="user-old-password" class="am-form-label">原密码</label>
                    <div class="am-form-content">
                        <input type="password" id="user-old-password" placeholder="请输入原登录密码">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="user-new-password" class="am-form-label">新密码</label>
                    <div class="am-form-content">
                        <input type="password" id="user-new-password" placeholder="由数字、字母组合">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="user-confirm-password" class="am-form-label">确认密码</label>
                    <div class="am-form-content">
                        <input type="password" id="user-confirm-password" placeholder="请再次输入上面的密码">
                    </div>
                </div>
                <div class="info-btn" onclick="save()">
                    <div class="am-btn am-btn-danger">保存修改</div>
                </div>
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
<script type="text/javascript">
    var ymm='';
    var xmm ='';
    var qrmm = ''
    function sendMobileCode() {
        var tel = '${huiyuan.tel}';
        if (tel == ''){
            $("").dailog({
                type: 'danger',
                showBoxShadow: true,
                animateStyle: 'none',
                bottons: ['确定'],
                discription: '未绑定手机号'
            });
            return false;
        }else {
            $.ajax({
                dataType: 'json', //服务器返回json格式数据
                type: 'post', //HTTP请求类型
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                url: "${ctx}/huiyuanreg/sendMobileCode",
                success:function(result){
                    yzm=result.message;
                    $("").dailog({
                        type: 'primary',
                        showBoxShadow: true,
                        animateStyle: 'none',
                        bottons: ['确定'],
                        discription: '验证码：'+result.message
                    });
                    newCode = result.message;
                    $("#user-code").val(newCode);
                },
                error:function(){
                    $("").dailog({
                        type: 'danger',
                        showBoxShadow: true,
                        animateStyle: 'none',
                        bottons: ['确定'],
                        discription: '获取失败'
                    });
                }
            });
        }
        }
    function sendEmailCode() {
        var tel = '${huiyuan.email}';
        if (tel == ''){
            $("").dailog({
                type: 'danger',
                showBoxShadow: true,
                animateStyle: 'none',
                bottons: ['确定'],
                discription: '未绑定邮箱'
            });
            return false;
        }else {
            $.ajax({
                dataType: 'json', //服务器返回json格式数据
                type: 'post', //HTTP请求类型
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                url: "${ctx}/huiyuanreg/sendMobileCode",
                success:function(result){
                    yzm=result.message;
                    $("").dailog({
                        type: 'primary',
                        showBoxShadow: true,
                        animateStyle: 'none',
                        bottons: ['确定'],
                        discription: '验证码：'+result.message
                    });
                    newCode = result.message;
                    $("#user-code").val(newCode);
                },
                error:function(){
                    $("").dailog({
                        type: 'danger',
                        showBoxShadow: true,
                        animateStyle: 'none',
                        bottons: ['确定'],
                        discription: '获取失败'
                    });
                }
            });
        }
    }

    function save() {

         ymm = $("#user-old-password").val();
         xmm = $("#user-new-password").val();
         qrmm = $("#user-confirm-password").val();
        if (ymm != '' && xmm != '' && qrmm != ''){
            if (xmm != qrmm){
                $("").dailog({
                    type: 'danger',
                    showBoxShadow: true,
                    animateStyle: 'none',
                    bottons: ['确定'],
                    discription: '新密码与确认密码不一致!'
                });
            }else {
                $("#form_save").hide();
                $("#yz2").show();
/*                $.ajax({
                    url:"${ctx}/safety/save?ymm="+ymm+"&xmm="+xmm,
                    method: 'get',
                    success: function (data) {
                        if (data.code == '1'){
                            $("#step-1").removeClass("step-1").addClass("step-2");
                            $("#step-2").removeClass("step-2").addClass("step-1");
                            $("#form_save").hide();
                            $("#secc").show();
                        }else {
                            $("").dailog({
                                type: 'danger',
                                showBoxShadow: true,
                                animateStyle: 'none',
                                bottons: ['确定'],
                                discription: data.message
                            });
                        }
                    }});*/
            }
        }else {
            $("").dailog({
                type: 'danger',
                showBoxShadow: true,
                animateStyle: 'none',
                bottons: ['确定'],
                discription: '是不是忘了填什么!'
            });
        }

    }
    function save2() {
        var yz  = $("#user-code").val();
        if (yz !=''){
            $.ajax({
                url:"${ctx}/safety/save?ymm="+ymm+"&xmm="+xmm,
                method: 'get',
                success: function (data) {
                    if (data.code == '1'){
                        $("#step-1").removeClass("step-1").addClass("step-2");
                        $("#step-2").removeClass("step-2").addClass("step-1");
                        $("#form_save").hide();
                        $("#yz2").hide();
                        $("#secc").show();
                    }else {
                        $("").dailog({
                            type: 'danger',
                            showBoxShadow: true,
                            animateStyle: 'none',
                            bottons: ['确定'],
                            discription: data.message
                        });
                    }
                }});
        }else {
            $("").dailog({
                type: 'danger',
                showBoxShadow: true,
                animateStyle: 'none',
                bottons: ['确定'],
                discription: '请输入验证码'
            });
        }
    }
</script>
</body>

</html>
