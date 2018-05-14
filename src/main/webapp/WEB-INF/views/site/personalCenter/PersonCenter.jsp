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
                    </ul>
                </li>

            </ul>

        </aside>
        <div class="main-wrap">
            <div class="wrap-left" style="height: 800px;overflow:auto;!important;">
                <div class="wrap-list">
                    <div class="m-user">
                        <!--个人信息 -->
                        <div class="m-bg"></div>
                        <div class="m-userinfo" style="height: 110px;">
                            <div class="m-baseinfo">
                                <a href="information.html">
                                   <img src="${huiyuan.tx}">
                                </a>
                                <em class="s-name">${huiyuan.userName}<span class="vip2"></span></em>

                            </div>
                            <div class="m-right">
                                <div class="m-new">
                                    <a href="news.html"><i class="am-icon-bell-o"></i>消息</a>
                                </div>
                                <div class="m-address">
                                    <a href="address.html" class="i-trigger">我的收货地址</a>
                                </div>
                            </div>
                        </div>

                    <!--订单 -->
                    <div class="m-order">
                        <div class="s-bar">
                            <i class="s-icon"></i>我的订单
                            <a class="i-load-more-item-shadow" href="order.html">全部订单</a>
                        </div>
                        <ul>
                            <li><a href="order.html"><i><img src="/static/images/pay.png"/></i><span>待付款<em class="m-num">${order.dfksum}</em></span></a></li>
                            <li><a href="order.html"><i><img src="/static/images/send.png"/></i><span>待发货<em class="m-num">${order.dfhsum}</em></span></a></li>
                            <li><a href="order.html"><i><img src="/static/images/receive.png"/></i><span>待收货<em class="m-num">${order.dshsum}</em></span></a></li>
                            <li><a href="order.html"><i><img src="/static/images/comment.png"/></i><span>待评价<em class="m-num">${order.dpj}</em></span></a></li>
                        </ul>
                    </div>
                    <!--九宫格-->
                    <div class="user-patternIcon">
                        <div class="s-bar">
                            <i class="s-icon"></i>我的常用
                        </div>
                        <ul>
                            <a href="../home/shopcart.html"><li class="am-u-sm-4"><i class="am-icon-shopping-basket am-icon-md"></i><img src="/static/images/iconbig.png"/><p>购物车</p></li></a>
                            <a href="collection.html"><li class="am-u-sm-4"><i class="am-icon-heart am-icon-md"></i><img src="/static/images/iconsmall1.png"/><p>我的收藏</p></li></a>
                            <a href="../home/home.html"><li class="am-u-sm-4"><i class="am-icon-gift am-icon-md"></i><img src="/static/images/iconsmall0.png"/><p>为你推荐</p></li></a>
                            <a href="comment.html"><li class="am-u-sm-4"><i class="am-icon-pencil am-icon-md"></i><img src="/static/images/iconsmall3.png"/><p>好评宝贝</p></li></a>
                            <a href="foot.html"><li class="am-u-sm-4"><i class="am-icon-clock-o am-icon-md"></i><img src="/static/images/iconsmall2.png"/><p>我的足迹</p></li></a>
                        </ul>
                    </div>
                    <!--物流 -->
                    <div class="m-logistics">

                        <div class="s-bar">
                            <i class="s-icon"></i>我的物流
                        </div>
                        <div class="s-content">
                            <ul class="lg-list">

                                <li class="lg-item">
                                    <div class="item-info">
                                        <a href="#">
                                            <img src="/static/images/65.jpg_120x120xz.jpg" alt="抗严寒冬天保暖隔凉羊毛毡底鞋垫超薄0.35厘米厚吸汗排湿气舒适">
                                        </a>

                                    </div>
                                    <div class="lg-info">

                                        <p>快件已从 义乌 发出</p>
                                        <time>2015-12-20 17:58:05</time>

                                        <div class="lg-detail-wrap">
                                            <a class="lg-detail i-tip-trigger" href="logistics.html">查看物流明细</a>
                                            <div class="J_TipsCon hide">
                                                <div class="s-tip-bar">中通快递&nbsp;&nbsp;&nbsp;&nbsp;运单号：373269427686</div>
                                                <div class="s-tip-content">
                                                    <ul>
                                                        <li>快件已从 义乌 发出2015-12-20 17:58:05</li>
                                                        <li>义乌 的 义乌总部直发车 已揽件2015-12-20 17:54:49</li>
                                                        <li class="s-omit"><a data-spm-anchor-id="a1z02.1.1998049142.3" target="_blank" href="#">··· 查看全部</a></li>
                                                        <li>您的订单开始处理2015-12-20 08:13:48</li>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="lg-confirm">
                                        <a class="i-btn-typical" href="#">确认收货</a>
                                    </div>
                                </li>
                                <div class="clear"></div>

                                <li class="lg-item">
                                    <div class="item-info">
                                        <a href="#">
                                            <img src="/static/images/88.jpg_120x120xz.jpg" alt="礼盒袜子女秋冬 纯棉袜加厚 女式中筒袜子 韩国可爱 女袜 女棉袜">
                                        </a>

                                    </div>
                                    <div class="lg-info">

                                        <p>已签收,签收人是青年城签收</p>
                                        <time>2015-12-19 15:35:42</time>

                                        <div class="lg-detail-wrap">
                                            <a class="lg-detail i-tip-trigger" href="logistics.html">查看物流明细</a>
                                            <div class="J_TipsCon hide">
                                                <div class="s-tip-bar">天天快递&nbsp;&nbsp;&nbsp;&nbsp;运单号：666287461069</div>
                                                <div class="s-tip-content">
                                                    <ul>

                                                        <li>已签收,签收人是青年城签收2015-12-19 15:35:42</li>
                                                        <li>【光谷关山分部】的派件员【关山代派】正在派件 电话:*2015-12-19 14:27:28</li>
                                                        <li class="s-omit"><a data-spm-anchor-id="a1z02.1.1998049142.7" target="_blank" href="//wuliu.taobao.com/user/order_detail_new.htm?spm=a1z02.1.1998049142.7.8BJBiJ&amp;trade_id=1479374251166800&amp;seller_id=1651462988&amp;tracelog=yimaidaologistics">··· 查看全部</a></li>
                                                        <li>您的订单开始处理2015-12-17 14:27:50</li>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="lg-confirm">
                                        <a class="i-btn-typical" href="#">确认收货</a>
                                    </div>
                                </li>

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
        <!--底部-->
            <div class="footer"  style="margin-top: 800px">
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
<!--引导 -->
<div class="navCir">
    <li><a href="../home/home.html"><i class="am-icon-home "></i>首页</a></li>
    <li><a href="../home/sort.html"><i class="am-icon-list"></i>分类</a></li>
    <li><a href="../home/shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>
    <li class="active"><a href="index.html"><i class="am-icon-user"></i>我的</a></li>
</div>
</body>

</html>