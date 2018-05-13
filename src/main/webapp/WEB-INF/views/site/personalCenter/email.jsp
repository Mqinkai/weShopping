<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/12
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" pageEncoding="UTF-8"%>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>绑定邮箱</title>
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
                    <a href="#">个人资料</a>
                    <ul>
                        <li> <a href="${ctx}/personCenter/PersonInformation">个人信息</a></li>
                        <li> <a href="${ctx}/personCenter/safety">安全设置</a></li>
                        <li> <a href="${ctx}/personCenter/address">收货地址</a></li>
                    </ul>
                </li>
                <li class="person">
                    <a href="#">我的交易</a>
                    <ul>
                        <li><a href="${ctx}/personCenter/order">订单管理</a></li>
                    </ul>
                </li>

                <li class="person">
                    <a href="#">我的小窝</a>
                    <ul>
                        <li> <a href="${ctx}/personCenter/comment">评价</a></li>
                        <li> <a href="${ctx}/personCenter/news">消息</a></li>
                    </ul>
                </li>

            </ul>

        </aside>
        <div class="main-wrap">

            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">绑定邮箱</strong> / <small>Bind&nbsp;email</small></div>
            </div>
            <hr/>
            <!--进度条-->
            <div class="m-progress">
                <div class="m-progress-list">
							<span id="step-1" class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">绑定邮箱</p>
                            </span>
							<span id="step-2"class="step-2 step">
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
            <div id="secc" style="display:none; margin-left: 400px; margin-top: 100px;"><span>修改成功</span></div>
            <div id="form_save" class="am-form am-form-horizontal">
                <c:if test="${huiyuan.tel !=null and huiyuan.tel != ''}">
                    <div class="am-form-group bind">
                        <label for="user-phone" class="am-form-label">验证邮箱</label>
                        <div class="am-form-content">
                            <span id="user-phone">${huiyuan.email}<a href="javascript:void(0);"  onclick="change()" style="font-size: 2px;color:#b6b6b6">&nbsp;&nbsp;无法接收验证码</a></span>
                        </div>
                    </div>
                    <div class="am-form-group code">
                        <label id="yzm" for="user-code" class="am-form-label">验证码</label>
                        <div class="am-form-content">
                            <input type="tel" id="user-code" readonly="readonly" placeholder="邮箱验证码">
                        </div>
                        <a class="btn" href="javascript:void(0);" onclick="sendOldMobileCode();" id="sendOldMobileCode">
                            <div class="am-btn am-btn-danger">验证码</div>
                        </a>
                    </div>
                </c:if>

                <div class="am-form-group">
                    <label for="user-new-phone" class="am-form-label">验证邮箱</label>
                    <div class="am-form-content">
                        <input type="tel" id="user-new-phone" placeholder="绑定新邮箱">
                    </div>
                </div>
                <div class="am-form-group code">
                    <label for="user-new-code" class="am-form-label">验证码</label>
                    <div class="am-form-content">
                        <input type="tel" id="user-new-code" readonly="readonly" placeholder="邮箱验证码">
                        <a class="btn" href="javascript:void(0);" onclick="sendNewMobileCode();" id="sendNewMobileCode">
                            <div class="am-btn am-btn-danger">验证码</div>
                        </a>
                    </div>
                </div>
                <div class="info-btn">
                    <div class="am-btn am-btn-danger" onclick="save()">保存修改</div>
                </div>

            </div>

        </div>
        <!--底部-->
        <div class="footer"  style="margin-top: 50px">
            <div class="footer-hd">
                <p>
                    <a href="# ">青岛理工</a>
                    <b>|</b>
                    <a href="# ">商城首页</a>
                    <b>|</b>
                    <a href="# ">支付宝</a>
                    <b>|</b>
                    <a href="# ">物流</a>
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
    var oldCode ='';
    var newCode ='';
    var flag = '${huiyuan.tel}';
    var isEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/; //邮箱格式校验
    function sendNewMobileCode() {
        if (oldCode == '' && flag !=''){
            $("").dailog({
                type: 'danger',
                showBoxShadow: true,
                animateStyle: 'none',
                bottons: ['确定'],
                discription: '请先输入旧邮箱验证码'
            });
            return false;
        }
        var newPhone = $("#user-new-phone").val();
        if (!isEmail.test(newPhone)){
            $("").dailog({
                type: 'danger',
                showBoxShadow: true,
                animateStyle: 'none',
                bottons: ['确定'],
                discription: '邮箱格式不正确！'
            });
            return;
        }
        if (newPhone != null && newPhone !=''){
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
                    $("#user-new-code").val(newCode);
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
        }else {
            $("").dailog({
                type: 'danger',
                showBoxShadow: true,
                animateStyle: 'none',
                bottons: ['确定'],
                discription: '请输入邮箱！'
            });
        }

    }
    function sendOldMobileCode() {
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
                oldCode = result.message;
                $("#user-code").val(oldCode);
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
    function save() {
        var tel = $("#user-new-phone").val();
        if (tel != ''){
            var id = ${huiyuan.id};
            console.log(tel);
            $.ajax({
                url:"${ctx}/safety/saveEmail?id="+id+"&email="+tel,
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
                }});
        }else {
            $("").dailog({
                type: 'danger',
                showBoxShadow: true,
                animateStyle: 'none',
                bottons: ['确定'],
                discription: '请输入邮箱号'
            });
        }

    }
    function change() {
        $("#yzm").html("手机验证码");
    }
</script>
</body>

</html>


