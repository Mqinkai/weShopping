<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/11
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" pageEncoding="UTF-8"%>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>我的消息</title>

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
                    <a href="${ctx}/personCenter/PersonalCenter">个人中心</a>
                </li>
                <li class="person">
                    <a href="#">个人资料</a>
                    <ul>
                        <li> <a href="${ctx}/personCenter/PersonInformation">个人信息</a></li>
                        <li> <a href="${ctx}/personCenter/Safety">安全设置</a></li>
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
                    <a href="#">我的资产</a>
                    <ul>
                        <li> <a href="bill.html">账单明细</a></li>
                    </ul>
                </li>

                <li class="person">
                    <a href="#">我的小窝</a>
                    <ul>
                        <li> <a href="${ctx}/personCenter/comment">评价</a></li>
                        <li class="active"> <a href="${ctx}/personCenter/news">消息</a></li>
                    </ul>
                </li>

            </ul>

        </aside>
        <div class="main-wrap">

            <div class="user-news">

                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的消息</strong> / <small>News</small></div>
                </div>
                <hr/>

                <div class="am-tabs am-tabs-d2" data-am-tabs>
                    <ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
                        <li class="am-active"><a href="#tab1">商城活动</a></li>
                        <li><a href="#tab2">物流助手</a></li>
                        <li><a href="#tab3">交易信息</a></li>

                    </ul>

                    <div class="am-tabs-bd">
                        <div class="am-tab-panel am-fade am-in am-active" id="tab1">

                            <div class="news-day">
                                <div class="goods-date" data-date="2015-12-21">
                                    <span><i class="month-lite">12</i>.<i class="day-lite">21</i>	<i class="date-desc">今天</i></span>
                                </div>

                                <!--消息 -->
                                <div class="s-msg-item s-msg-temp i-msg-downup">
                                    <h6 class="s-msg-bar"><span class="s-name">每日新鲜事</span></h6>
                                    <div class="s-msg-content i-msg-downup-wrap">
                                        <div class="i-msg-downup-con">
                                            <a class="i-markRead" target="_blank" href="blog.html">
                                                <img src="../images/TB102.jpg">
                                                <p class="s-main-content">
                                                    最特色的湖北年货都在这儿 ~快来囤年货啦！
                                                </p>
                                                <p class="s-row s-main-content">
                                                    <a href="blog.html">
                                                        阅读全文 <i class="am-icon-angle-right"></i>
                                                    </a>
                                                </p>
                                            </a>
                                        </div>
                                    </div>
                                    <a class="i-btn-forkout" href="#"><i class="am-icon-close am-icon-fw"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="am-tab-panel am-fade" id="tab2">
                            <!--消息 -->
                            <div class="s-msg-item s-msg-temp i-msg-downup">
                                <h6 class="s-msg-bar"><span class="s-name">订单已签收</span></h6>
                                <div class="s-msg-content i-msg-downup-wrap">
                                    <div class="i-msg-downup-con">
                                        <a class="i-markRead" target="_blank" href="logistics.html">
                                            <div class="m-item">
                                                <div class="item-pic">
                                                    <img src="../images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
                                                </div>
                                                <div class="item-info">
                                                    您购买的美康粉黛醉美唇膏已签收，
                                                    快递单号:373269427868
                                                </div>

                                            </div>

                                            <p class="s-row s-main-content">
                                                查看详情 <i class="am-icon-angle-right"></i>
                                            </p>
                                        </a>
                                    </div>
                                </div>
                                <a class="i-btn-forkout" href="#"><i class="am-icon-close am-icon-fw"></i></a>
                            </div>
                        </div>

                        <div class="am-tab-panel am-fade" id="tab3">
                            <!--消息 -->
                            <div class="s-msg-item s-msg-temp i-msg-downup">
                                <h6 class="s-msg-bar"><span class="s-name">卖家已退款&nbsp;yen12.90元</span></h6>
                                <div class="s-msg-content i-msg-downup-wrap">
                                    <div class="i-msg-downup-con">
                                        <a class="i-markRead" target="_blank" href="record.html">
                                            <div class="m-item">
                                                <div class="item-pic">
                                                    <img src="../images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
                                                </div>
                                                <div class="item-info">
                                                    <p class="item-comment">您购买的美康粉黛醉美唇膏卖家已退款</p>
                                                    <p class="item-time">2015-12-21&nbsp;17:38:29</p>
                                                </div>

                                            </div>

                                            <p class="s-row s-main-content">
                                                <a href="record.html">钱款去向</a> <i class="am-icon-angle-right"></i>
                                            </p>
                                        </a>
                                    </div>
                                </div>
                                <a class="i-btn-forkout" href="#"><i class="am-icon-close am-icon-fw"></i></a>
                            </div>
                        </div>
                    </div>
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

</body>

</html>
