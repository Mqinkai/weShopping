<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/10
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" pageEncoding="UTF-8"%>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>评价管理</title>

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
                        <li class="active"> <a href="${ctx}/personCenter/comment">评价</a></li>
                        <li> <a href="${ctx}/personCenter/news">消息</a></li>
                    </ul>
                </li>

            </ul>

        </aside>
        <div class="main-wrap">

            <div class="user-comment">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">评价管理</strong> / <small>Manage&nbsp;Comment</small></div>
                </div>
                <hr/>

                <div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

                    <ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
                        <li class="am-active"><a href="#tab1">所有评价</a></li>
                        <li><a href="#tab2">有图评价</a></li>

                    </ul>

                    <div class="am-tabs-bd">
                        <div class="am-tab-panel am-fade am-in am-active" id="tab1">

                            <div class="comment-main">
                                <div class="comment-list">
                                    <ul class="item-list">


                                        <div class="comment-top">
                                            <div class="th th-price">
                                                <td class="td-inner">评价</td>
                                            </div>
                                            <div class="th th-item">
                                                <td class="td-inner">商品</td>
                                            </div>
                                        </div>
                                        <li class="td td-item">
                                            <div class="item-pic">
                                                <a href="#" class="J_MakePoint">
                                                    <img src="../images/kouhong.jpg_80x80.jpg" class="itempic">
                                                </a>
                                            </div>
                                        </li>

                                        <li class="td td-comment">
                                            <div class="item-title">
                                                <div class="item-opinion">好评</div>
                                                <div class="item-name">
                                                    <a href="#">
                                                        <p class="item-basic-info">美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="item-comment">
                                                宝贝非常漂亮，超级喜欢！！！ 口红颜色很正呐，还有第两支半价，买三支免单一支的活动，下次还要来买。就是物流太慢了，还要我自己去取快递，店家不考虑换个物流么？
                                            </div>

                                            <div class="item-info">
                                                <div>
                                                    <p class="info-little"><span>颜色：12#玛瑙</span> <span>包装：裸装</span> </p>
                                                    <p class="info-time">2015-12-24</p>

                                                </div>
                                            </div>
                                        </li>

                                    </ul>

                                </div>
                            </div>

                        </div>
                        <div class="am-tab-panel am-fade" id="tab2">

                            <div class="comment-main">
                                <div class="comment-list">
                                    <ul class="item-list">


                                        <div class="comment-top">
                                            <div class="th th-price">
                                                <td class="td-inner">评价</td>
                                            </div>
                                            <div class="th th-item">
                                                <td class="td-inner">商品</td>
                                            </div>
                                        </div>
                                        <li class="td td-item">
                                            <div class="item-pic">
                                                <a href="#" class="J_MakePoint">
                                                    <img src="../images/kouhong.jpg_80x80.jpg" class="itempic">
                                                </a>
                                            </div>
                                        </li>

                                        <li class="td td-comment">
                                            <div class="item-title">
                                                <div class="item-opinion">好评</div>
                                                <div class="item-name">
                                                    <a href="#">
                                                        <p class="item-basic-info">美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="item-comment">
                                                宝贝非常漂亮，超级喜欢！！！ 口红颜色很正呐，还有第两支半价，买三支免单一支的活动，下次还要来买。就是物流太慢了，还要我自己去取快递，店家不考虑换个物流么？
                                                <div class="filePic"><img src="../images/image.jpg" alt=""></div>
                                            </div>

                                            <div class="item-info">
                                                <div>
                                                    <p class="info-little"><span>颜色：12#玛瑙</span> <span>包装：裸装</span> </p>
                                                    <p class="info-time">2015-12-24</p>

                                                </div>
                                            </div>
                                        </li>

                                    </ul>

                                </div>
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
