<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/20
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>物品搜索</title>
</head>

<body>
<div class="hmtop">
    <jsp:include flush="true" page="${ctx}/WEB-INF/views/site/daohang.jsp"></jsp:include>
    <!--悬浮搜索框-->

    <div class="nav white">
        <div class="logo"><img src="/static/images/logo.png" /></div>
        <div class="logoBig">
            <li><img src="/static/images/logobig.png" /></li>
        </div>

        <div class="search-bar pr">
            <a name="index_none_header_sysc" href="#"></a>
            <form action="/message/search" method="get">
                <input id="searchInput" name="name" type="text" placeholder="搜索" autocomplete="off" value="${name}">
                <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
            </form>
        </div>
    </div>

    <div class="clear"></div>
</div>
<div class="banner">
    <!--轮播 -->
    <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
        <ul class="am-slides">
            <li class="banner1"><a><img src="/static/images/01.jpg" /></a></li>
            <li class="banner2"><a><img src="/static/images/02.jpg" /></a></li>
            <li class="banner3"><a><img src="/static/images/03.jpg" /></a></li>
            <li class="banner4"><a><img src="/static/images/04.jpg" /></a></li>

        </ul>
    </div>
    <div class="clear"></div>
</div>
<div class="shopNav">
    <div class="slideall">

        <div class="long-title"><span class="all-goods">全部分类</span></div>
        <div class="nav-cont">
            <ul>
                <li class="index"><a href="${ctx}/message/search?type=0">首页</a></li>
                <li class="qc"><a href="${ctx}/message/search?type=1">校园二手</a></li>
                <li class="qc"><a href="${ctx}/message/search?type=2">同城交易</a></li>
                <li class="qc last"><a href="${ctx}/message/search?type=3">超低价</a></li>
            </ul>
            <%-- <div class="nav-extra">
                 <i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
                 <i class="am-icon-angle-right" style="padding-left: 10px;"></i>
             </div>--%>
        </div>

        <!--侧边导航 -->
        <div id="nav" class="navfull">
            <div class="area clearfix">
                <div class="category-content" id="guide_2">

                    <div class="category">
                        <ul class="category-list" id="js_climit_li">
                            <c:forEach items="${leibieList}" var="leibieList" varStatus="status">
                                <li class="appliance js_toggle relative first">
                                    <div class="category-info">
                                        <h3 class="category-name b-category-name"><i><img src="${leibieList.tupian}"></i><a class="ml-22" title="${leibieList.mingcheng}">${leibieList.mingcheng}</a></h3>
                                        <em>&gt;</em></div>
                                    <div class="menu-item menu-in top">
                                        <div class="area-in">
                                            <div class="area-bg">
                                                <div class="menu-srot">
                                                    <div class="sort-side">
                                                        <dl class="dl-sort">
                                                            <dt><span title="类别">类别</span></dt>
                                                            <dd><a title="全部" href="${ctx}/message/search?leibieList=${leibieList.id}"><span>全部</span></a></dd>
                                                            <c:forEach items="${leibieList.leibieXiashus}" var="leibieXiashus" varStatus="stu">
                                                                <dd><a title="${leibieXiashus.name}" href="${ctx}/message/search?leibieXiashus=${leibieXiashus.id}"><span>${leibieXiashus.name}</span></a></dd>
                                                            </c:forEach>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <b class="arrow"></b>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

            </div>
        </div>


        <!--轮播-->

        <script type="text/javascript">
            (function() {
                $('.am-slider').flexslider();
            });
            $(document).ready(function() {
                $("li").hover(function() {
                    $(".category-content .category-list li.first .menu-in").css("display", "none");
                    $(".category-content .category-list li.first").removeClass("hover");
                    $(this).addClass("hover");
                    $(this).children("div.menu-in").css("display", "block")
                }, function() {
                    $(this).removeClass("hover")
                    $(this).children("div.menu-in").css("display", "none")
                });
            })
        </script>



        <!--小导航 -->
        <div class="am-g am-g-fixed smallnav">
            <div class="am-u-sm-3">
                <a href="sort.html"><img src="/static/images/navsmall.jpg" />
                    <div class="title">商品分类</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="#"><img src="/static/images/huismall.jpg" />
                    <div class="title">大聚惠</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="#"><img src="/static/images/mansmall.jpg" />
                    <div class="title">个人中心</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="#"><img src="/static/images/moneysmall.jpg" />
                    <div class="title">投资理财</div>
                </a>
            </div>
        </div>

        <!--走马灯 -->

        <div class="marqueen" style="height: 300px;">
            <span class="marqueen-title">公告栏</span>
            <div class="demo">

                <ul>
                    <li class="title-first"><a target="_blank">
                        <img src="/static/images/TJ2.jpg"></img>
                        <span>[公告]</span>用心打造美好生活细节
                    </a></li>
                    <li class="title-first"><a target="_blank">
                        <span>[公告]</span>闲置换钱，快速出手
                        <img src="/static/images/TJ.jpg"></img>
                    </a></li>

                    <div class="mod-vip">
                        <c:choose>
                            <c:when test="${login=='1'}">
                                <div class="m-baseinfo">
                                    <a href="/static/person/index.html">
                                        <img src="${huiyuan.tx}"/>
                                    </a>
                                    <em><span>Hi,${huiyuan.userName}</span>
                                        <c:choose>
                                            <c:when test="${huiyuan.userBz=='1'}">
                                                <a href="#"><p>个人信息还未完善</p></a>
                                            </c:when>
                                        </c:choose>
                                    </em>
                                </div>

                            </c:when>
                            <c:otherwise>
                                <div class="m-baseinfo">
                                    <a href="/static/person/index.html">
                                        <img src="/static/images/getAvatar.do.jpg"/>
                                    </a>
                                    <em>
                                        <span>Hi,小叮当</span>
                                    </em>
                                </div>
                                <div class="member-logout">
                                    <a class="am-btn-warning btn" href="${ctx}/login/">登录</a><a class="am-btn-warning btn" href="${ctx}/huiyuanreg/tz">注册</a>
                                </div>
                            </c:otherwise>
                        </c:choose>

                        <div class="clear"></div>
                    </div>

                    <li><a target="_blank"><span>[公告]</span>客服工作时间：全天</a></li>
                    <li><a target="_blank"><span>[公告]</span>平台将于******更新</a></li>
                    <li><a target="_blank"><span>[公告]</span>请遵循本平台各项规定</a></li>

                </ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <script type="text/javascript">
        if ($(window).width() < 640) {
            function autoScroll(obj) {
                $(obj).find("ul").animate({
                    marginTop: "-39px"
                }, 500, function() {
                    $(this).css({
                        marginTop: "0px"
                    }).find("li:first").appendTo(this);
                })
            }
            $(function() {
                setInterval('autoScroll(".demo")', 3000);
            })
        }
    </script>
</div>
<div class="shopMainbg">
    <div class="shopMain" id="shopmain">
    <div class="am-container ">
        <div class="shopTitle ">
            <h4>搜索结果</h4>
            <h3>已为您找到本网站所有相关商品</h3>
        </div>
    </div>
    <div class="am-g am-g-fixed flood method3 ">
        <ul class="am-thumbnails ">
            <c:forEach items="${goodslist}" var="goods" varStatus="var">
                <li>
                    <div class="list ">
                        <a href="${ctx}/GoodsDetail/detail?id="+${goods.id}">
                            <img src="${goods.fujian} " />
                            <div class="pro-title ">${goods.mingcheng}</div>
                            <span class="e-price ">￥${goods.jiage}</span>
                        </a>
                    </div>
                </li>
            </c:forEach>
        </ul>

    </div>

        <div class="footer ">
            <div class="footer-hd ">
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

<!--菜单 -->
<div class=tip>
    <div id="sidebar">
        <div id="wrap">
            <div class="quick_toggle ">
                <!--二维码 -->
                <li class="qtitem ">
                    <a href="#none "><span class="mpbtn_qrcode "></span></a>
                    <div class="mp_qrcode " style="display:none; "><img src="/static/images/IMG_7162.png " /><i class="icon_arrow_white "></i></div>
                </li>
                <li class="qtitem ">
                    <a href="#top " class="return_top "><span class="top "></span></a>
                </li>
            </div>

            <!--回到顶部 -->
            <div id="quick_links_pop " class="quick_links_pop hide "></div>
        </div>
    </div>
</div>
<script>
    window.jQuery || document.write('<script src="/static/basic/js/jquery-1.9.min.js "><\/script>');
</script>
<script type="text/javascript " src="/static/basic/js/quick_links.js "></script>
</body>

</html>
