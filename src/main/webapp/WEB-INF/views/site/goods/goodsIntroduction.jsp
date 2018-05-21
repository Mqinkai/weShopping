<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/20
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@ include file="/WEB-INF/views/common/taglib.jsp"%>--%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>商品页面</title>
    <link href="/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
    <link href="/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="/static/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="/static/css/optstyle.css" rel="stylesheet" />
    <link type="text/css" href="/static/css/style.css" rel="stylesheet" />

    <script type="text/javascript" src="/static/basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="/static/basic/js/quick_links.js"></script>

    <script type="text/javascript" src="/static/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="/static/js/jquery.imagezoom.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="/static/js/list.js"></script>
</head>
<body>

<!--顶部导航条 -->
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
            <input id="searchInput" name="name" type="text" placeholder="搜索" autocomplete="off">
            <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
        </form>
    </div>
</div>

<div class="clear"></div>
<b class="line"></b>
<div class="listMain">

    <!--分类-->
    <div class="nav-table">
        <div class="long-title"><span class="all-goods">全部分类</span></div>
        <div class="nav-cont">
            <ul>
                <li class="index"><a href="${ctx}/message/search?type=0">首页</a></li>
                <li class="qc"><a href="${ctx}/message/search?type=1">校园二手</a></li>
                <li class="qc"><a href="${ctx}/message/search?type=2">同城交易</a></li>
                <li class="qc last"><a href="${ctx}/message/search?type=3">超低价</a></li>
            </ul>
        </div>
    </div>
    <ol class="am-breadcrumb am-breadcrumb-slash">
        <li><a>首页</a></li>
        <li><a>分类</a></li>
        <li class="am-active">内容</li>
    </ol>
    <script type="text/javascript">
        $(function() {});
        $(window).load(function() {
            $('.flexslider').flexslider({
                animation: "slide",
                start: function(slider) {
                    $('body').removeClass('loading');
                }
            });
        });
    </script>
    <div class="scoll">
        <section class="slider">
            <div class="flexslider">
                <ul class="slides">
                    <li>
                        <img src="${goods.fujian}" title="pic" />
                    </li>

                </ul>
            </div>
        </section>
    </div>

    <!--放大镜-->

    <div class="item-inform">
        <div class="clearfixLeft" id="clearcontent">

            <div class="box">
                <script type="text/javascript">
                    $(document).ready(function() {
                        $(".jqzoom").imagezoom();
                        $("#thumblist li a").click(function() {
                            $(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
                            $(".jqzoom").attr('src', $(this).find("img").attr("mid"));
                            $(".jqzoom").attr('rel', $(this).find("img").attr("big"));
                        });
                    });
                </script>

                <div class="tb-booth tb-pic tb-s310">
                    <a href="${goods.fujian}"><img src="${goods.fujian}" alt="细节展示放大镜特效" rel="${goods.fujian}" class="jqzoom" /></a>
                </div>

            </div>

            <div class="clear"></div>
        </div>

        <div class="clearfixRight">

            <!--规格属性-->
            <!--名称-->
            <div class="tb-detail-hd">
                <h1>
                    ${goods.mingcheng}
                </h1>
            </div>
            <div class="tb-detail-list">
                <!--价格-->
                <div class="tb-detail-price">
                    <li class="price iteminfo_price">
                        <dt>现价</dt>
                        <dd><b class="sys_item_price">${goods.jiage}</b> <em>￥</em> </dd>
                    </li>
                    <li class="price iteminfo_mktprice">
                        <dt>原价</dt>
                        <dd><b class="sys_item_mktprice">${goods.yuanjia}</b><em>￥</em></dd>
                    </li>
                    <div class="clear"></div>
                </div>
                <div class="tb-detail-price">
                    <li >
                        <dt>所在地</dt>
                        <em>${goods.address}</em>
                    </li>
                    <li style="padding-top: 20px">
                        <dt>学校</dt>
                        <em>${goods.school}</em>
                    </li>
                    <div class="clear"></div>
                </div>

             </div>
             </div>

<div class="pay">
    <div class="pay-opt">
        <a href="home.html"><span class="am-icon-home am-icon-fw">首页</span></a>
        <a><span class="am-icon-heart am-icon-fw">收藏</span></a>

    </div>
    <li>
        <div class="clearfix tb-btn tb-btn-buy theme-login">
            <a id="LikBuy" title="点此按钮到下一步确认购买信息" href="#">立即购买</a>
        </div>
    </li>
    <li>
        <div class="clearfix tb-btn tb-btn-basket theme-login">
            <a id="LikBasket" title="联系卖家" href="#"><i></i>联系卖家</a>
        </div>
    </li>
</div>

</div>

<div class="clear"></div>

</div>



<!-- introduce-->

<div class="introduce">
    <div class="introduceMain">
        <div class="am-tabs" data-am-tabs>
            <ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active">
                    <a href="#">

                        <span class="index-needs-dt-txt">宝贝详情</span></a>

                </li>
            </ul>

            <div class="am-tabs-bd">

                <div class="am-tab-panel am-fade am-in am-active">

                    <div class="details">
                        <div>
                            ${goods.jieshao}
                        </div>
                    </div>

                    <div class="clear"></div>
                </div>

                <div class="am-tab-panel am-fade">

                    <div class="actor-new">
                        <div class="rate">
                            <strong>100<span>%</span></strong><br> <span>好评度</span>
                        </div>
                        <dl>
                            <dt>买家印象</dt>
                            <dd class="p-bfc">
                                <q class="comm-tags"><span>味道不错</span><em>(2177)</em></q>
                                <q class="comm-tags"><span>颗粒饱满</span><em>(1860)</em></q>
                                <q class="comm-tags"><span>口感好</span><em>(1823)</em></q>
                            </dd>
                        </dl>
                    </div>
                    <div class="clear"></div>
                    <div class="tb-r-filter-bar">
                        <ul class=" tb-taglist am-avg-sm-4">
                            <li class="tb-taglist-li tb-taglist-li-current">
                                <div class="comment-info">
                                    <span>全部评价</span>
                                    <span class="tb-tbcr-num">(32)</span>
                                </div>
                            </li>

                            <li class="tb-taglist-li tb-taglist-li-1">
                                <div class="comment-info">
                                    <span>好评</span>
                                    <span class="tb-tbcr-num">(32)</span>
                                </div>
                            </li>

                            <li class="tb-taglist-li tb-taglist-li-0">
                                <div class="comment-info">
                                    <span>中评</span>
                                    <span class="tb-tbcr-num">(32)</span>
                                </div>
                            </li>

                            <li class="tb-taglist-li tb-taglist-li--1">
                                <div class="comment-info">
                                    <span>差评</span>
                                    <span class="tb-tbcr-num">(32)</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="clear"></div>

                    <ul class="am-comments-list am-comments-list-flip">
                        <li class="am-comment">
                            <!-- 评论容器 -->
                            <a href="">
                                <img class="am-comment-avatar" src="../images/hwbn40x40.jpg" />
                                <!-- 评论者头像 -->
                            </a>

                            <div class="am-comment-main">
                                <!-- 评论内容容器 -->
                                <header class="am-comment-hd">
                                    <!--<h3 class="am-comment-title">评论标题</h3>-->
                                    <div class="am-comment-meta">
                                        <!-- 评论元数据 -->
                                        <a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
                                        <!-- 评论者 -->
                                        评论于
                                        <time datetime="">2015年11月02日 17:46</time>
                                    </div>
                                </header>

                                <div class="am-comment-bd">
                                    <div class="tb-rev-item " data-id="255776406962">
                                        <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                            摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
                                        </div>
                                        <div class="tb-r-act-bar">
                                            颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                        </div>
                                    </div>

                                </div>
                                <!-- 评论内容 -->
                            </div>
                        </li>

                    </ul>

                    <div class="clear"></div>

                    <!--分页 -->
                    <ul class="am-pagination am-pagination-right">
                        <li class="am-disabled"><a href="#">&laquo;</a></li>
                        <li class="am-active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>
                    <div class="clear"></div>

                    <div class="tb-reviewsft">
                        <div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。</div>
                    </div>

                </div>

                <div class="am-tab-panel am-fade">
                    <div class="like">

                    </div>
                    <div class="clear"></div>

                    <!--分页 -->
                    <ul class="am-pagination am-pagination-right">
                        <li class="am-disabled"><a href="#">&laquo;</a></li>
                        <li class="am-active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>
                    <div class="clear"></div>

                </div>

            </div>

        </div>

        <div class="clear"></div>

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

</body>

</html>

