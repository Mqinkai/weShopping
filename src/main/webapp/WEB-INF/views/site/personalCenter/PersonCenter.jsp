<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>个人中心</title>

    <link href="/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="/static/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/static/css/systyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
    .span_position{

        padding-top: 1px;
        left: 65;
        text-align: center;
        position: absolute;
        border-radius: 50%;
        background-color: #ff2122;
        color: #fff;
        font-size: 1px;
        width: 0.7rem;
        height: 0.7rem;
        line-height: 0.4rem;
        top: -0.4rem;
        right: -0.3rem;
        z-index: 1;
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
        </div>

    </article>
</header>
<div class="center">
    <div class="col-main">
        <aside class="menu">
            <ul>
                <li class="person active">
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
            <div class="wrap-left">
                <div class="wrap-list">
                    <div class="m-user">
                        <!--个人信息 -->
                        <div class="m-bg"></div>
                        <div class="m-userinfo" style="height: 110px;">
                            <div class="m-baseinfo">
                                <a href="${ctx}/personCenter/PersonInformation">
                                   <img src="${huiyuan.tx}">
                                </a>
                                <em class="s-name">${huiyuan.userName}<span class="vip2"></span></em>

                            </div>
                            <div class="m-right">
                                <div class="m-new">
                                    <a href="${ctx}/personCenter/news"><i class="am-icon-bell-o"></i>消息<span style="display: none" class="span_position" id="cmporder"></span></a>
                                </div>
                                <div class="m-address">
                                    <a href="${ctx}/personCenter/address" class="i-trigger">我的收货地址</a>
                                </div>
                            </div>
                        </div>

                    <!--订单 -->
                    <div class="m-order">
                        <div class="s-bar">
                            <i class="s-icon"></i>我的订单
                            <a class="i-load-more-item-shadow" href="${ctx}/personCenter/order?type='0'">全部订单</a>
                        </div>
                        <ul>
                            <li><a href="${ctx}/personCenter/order?type='1'"><i><img src="/static/images/send.png"/></i><span>待发货<em class="m-num">${order.dfhsum}</em></span></a></li>
                            <li><a href="javascript:void(0);"></a></li>
                            <li><a href="${ctx}/personCenter/order?type='2'"><i><img src="/static/images/receive.png"/></i><span>待收货<em class="m-num">${order.dshsum}</em></span></a></li>
                            <li><a href="javascript:void(0);"></a></li>
                            <li><a href="${ctx}/personCenter/order?type='3'"><i><img src="/static/images/comment.png"/></i><span>待评价<em class="m-num">${order.dpj}</em></span></a></li>

                        </ul>
                    </div>
                    <!--物流 -->
                    <div class="m-logistics">

                        <div class="s-bar">
                            <i class="s-icon"></i>我发布的商品
                        </div>
                        <div class="s-content">
                            <ul class="lg-list">
                                 <c:forEach items="${orderList}" var="order" varStatus="sta">
                                         <li class="lg-item" onclick="findAddress(${order.id})">
                                             <div class="item-info">
                                                     <img src="${order.fujian}" alt="">
                                             </div>
                                             <div class="lg-info">

                                                 <p>${order.mingcheng}</p>
                                                 <time>${order.saleflag}</time>
                                             </div>
                                             <c:if test="${order.saleflag == '已完成'}">
                                             <div class="lg-confirm">
                                                 <a class="i-btn-typical"  href="javascript:void(0);" onclick="delOrder(${order.id})">删除记录</a>
                                             </div>
                                             </c:if>
                                             <c:if test="${order.saleflag == '待发货'}">
                                                 <div class="lg-confirm">
                                                     <a class="i-btn-typical"  href="javascript:void(0);" onclick="fahuo(${order.id})">确认发货</a>
                                                     <a class="i-btn-typical"  href="javascript:void(0);" onclick="close(${order.id})">关闭交易</a>
                                                 </div>
                                             </c:if>
                                             <c:if test="${order.saleflag == '在售'}">
                                                 <div class="lg-confirm">
                                                     <a class="i-btn-typical"  href="javascript:void(0);" onclick="delgoods(${order.id})">删除商品</a>
                                                 </div>
                                             </c:if>
                                         </li>
                                         <div class="clear"></div>

                                 </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <div class="wrap-right">
                <!-- 日历-->
                <div class="day-list">
                    <div class="s-bar">
                        <a class="i-history-trigger s-icon"></a>我的日历
                        <a class="i-setting-trigger s-icon"></a>
                    </div>
                    <div class="s-care s-care-noweather">
                        <div class="s-date">
                            <em>${day}</em>
                            <span>${week}</span>
                            <span>${ny}</span>
                        </div>
                    </div>
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
<%--模态框--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">订单地址</h4>
            </div>
            <div class="modal-body" id="atext1"></div>
            <div class="modal-body" id="atext2"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/javascript">
    $(function(){
        //$("#cmporder").css("display","none");
        var noticeCount = ${noticeCount}
                $("#cmporder").css("display","block");
        if(noticeCount<=0){
            $("#cmporder").css("display","none");
        }
        $("#cmporder").html(noticeCount);

    });
    function delOrder(id) {
        $.ajax({
            dataType: 'json', //服务器返回json格式数据
            type: 'get', //HTTP请求类型
            url: "${ctx}/order/delOrderByGoodsId?id="+id,
            success:function(result){
                window.location.reload();
            }})
    }
    function close(id) {
        $.ajax({
            dataType: 'json', //服务器返回json格式数据
            type: 'get', //HTTP请求类型
            url: "${ctx}/order/closeOrderByGoodsId?id="+id,
            success:function(result){
                window.location.reload();
            }})
    }
    function fahuo(id) {
        $.ajax({
            dataType: 'json', //服务器返回json格式数据
            type: 'get', //HTTP请求类型
            url: "${ctx}/order/fahuo?id="+id,
            success:function(result){
                window.location.reload();
            }})
    }
    function delgoods(id) {
        $.ajax({
            dataType: 'json', //服务器返回json格式数据
            type: 'get', //HTTP请求类型
            url: "${ctx}/message/delgoods?id="+id,
            success:function(result){
                window.location.reload();
            }})
    }
    function findAddress(id) {
        $.ajax({
            dataType: 'json', //服务器返回json格式数据
            type: 'get', //HTTP请求类型
            url: "${ctx}/order/findaddress?id="+id,
            success:function(result){
                $("#atext1").text(result.code);
                $("#atext2").text(result.message);
                $('#myModal').modal('show')
            }})
    }
</script>
</body>

</html>