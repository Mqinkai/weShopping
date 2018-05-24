<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/20
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
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
                <li class="index"><a href="${ctx}/message/show">首页</a></li>
                <li class="qc"><a href="${ctx}/message/search?type=1">校园二手</a></li>
                <li class="qc"><a href="${ctx}/message/search?type=2">同城交易</a></li>
                <li class="qc last"><a href="${ctx}/message/search?type=3">超低价</a></li>
            </ul>
        </div>
    </div>
    <ol class="am-breadcrumb am-breadcrumb-slash">
        <li><a href="${ctx}/message/show">首页</a></li>
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
    <c:choose>
        <c:when test="${login=='1' and huiyuan.id != goods.fbid and huiyuan.userBz != '1'}">
            <li>
                <div class="clearfix tb-btn tb-btn-buy theme-login">
                    <a id="LikBuy" title="点此按钮到下一步确认购买信息" href="${ctx}/pay/pay?id=${goods.id}">立即购买</a>
                </div>
            </li>
            <li>
                <div class="clearfix tb-btn tb-btn-basket theme-login">
                    <a id="LikBasket" title="联系卖家" href="javascript:void(0)" onclick="sendmessage(${goods.id},${goods.fbid})"><i></i>联系卖家</a>
                </div>
            </li>
        </c:when>
        <c:when test="${login=='1' and huiyuan.id == goods.fbid}">
            <li>
                <div class="clearfix tb-btn tb-btn-buy theme-login">
                    <a id="LikBuy" title="点此按钮到下一步确认购买信息" href="javascript:void(0)" onclick="not()">立即购买</a>
                </div>
            </li>
            <li>
                <div class="clearfix tb-btn tb-btn-basket theme-login">
                    <a id="LikBasket" title="联系卖家" href="javascript:void(0)" onclick="not()"><i></i>联系卖家</a>
                </div>
            </li>
        </c:when>
        <c:when test="${login=='1' and huiyuan.id != goods.fbid and huiyuan.userBz == '1'}">
            <li>
                <div class="clearfix tb-btn tb-btn-buy theme-login">
                    <a id="LikBuy" title="点此按钮到下一步确认购买信息" href="javascript:void(0)" onclick="grxx()">立即购买</a>
                </div>
            </li>
            <li>
                <div class="clearfix tb-btn tb-btn-basket theme-login">
                    <a id="LikBasket" title="联系卖家" href="javascript:void(0)" onclick="grxx()"><i></i>联系卖家</a>
                </div>
            </li>
        </c:when>
        <c:otherwise>
            <li>
                <div class="clearfix tb-btn tb-btn-buy theme-login">
                    <a id="LikBuy"  title="点此按钮到下一步确认购买信息" href="javascript:void(0)" onclick="dl()">立即购买</a>
                </div>
            </li>
            <li>
                <div class="clearfix tb-btn tb-btn-basket theme-login">
                    <a id="LikBasket"  title="联系卖家" href="javascript:void(0)" onclick="dl()"><i></i>联系卖家</a>
                </div>
            </li>
        </c:otherwise>
    </c:choose>

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

                <li>
                    <a href="#">

                        <span class="index-needs-dt-txt">对卖家的评价</span></a>

                </li>
            </ul>

            <div class="am-tabs-bd">

                <div class="am-tab-panel am-fade am-in am-active">

                    <div class="details" id="contents">
                        <%--<P>
                            ${goods.jieshao}
                        </P>--%>
                            <c:out value="  ${goods.jieshao} "  escapeXml="false" />
                    </div>

                    <div class="clear"></div>
                </div>
                <div class="am-tab-panel am-fade">

                    <div class="actor-new">
                        <dl>
                        </dl>
                    </div>
                    <div class="clear"></div>
                    <div class="tb-r-filter-bar">
                        <ul class=" tb-taglist am-avg-sm-4">
                            <li class="tb-taglist-li tb-taglist-li-current">
                                <div class="comment-info">
                                    <span>全部评价</span>
                                    <span class="tb-tbcr-num">(<c:out value="${fn:length(pjlist)}"></c:out>)</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="clear"></div>

                    <ul class="am-comments-list am-comments-list-flip">
                        <c:forEach items="${pjlist}" var="pj" varStatus="var">
                            <li class="am-comment">
                                <!-- 评论容器 -->
                                <a href="">
                                    <img class="am-comment-avatar" src="/static/images/hwbn40x40.jpg" />
                                    <!-- 评论者头像 -->
                                </a>

                                <div class="am-comment-main">
                                    <!-- 评论内容容器 -->
                                    <header class="am-comment-hd">
                                        <!--<h3 class="am-comment-title">评论标题</h3>-->
                                        <div class="am-comment-meta">
                                            <!-- 评论元数据 -->
                                            <a href="#link-to-user" class="am-comment-author">${pj.pjName} (匿名)</a>
                                            <!-- 评论者 -->
                                            评论于
                                            <time datetime="">${pj.date}</time>
                                        </div>
                                    </header>

                                    <div class="am-comment-bd">
                                        <div class="tb-rev-item " data-id="255776406962">
                                            <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                ${pj.neirong}
                                            </div>
                                        </div>

                                    </div>
                                    <!-- 评论内容 -->
                                </div>
                            </li>
                        </c:forEach>

                    </ul>

                    <div class="clear"></div>

                    <!--分页 -->

                    <div class="clear"></div>

                    <div class="tb-reviewsft">
                        <div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。</div>
                    </div>

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
<script type="text/javascript">
   /* $("#contents").innerHTML=${goods.jieshao};*/
   function sendmessage(id,fbid) {
       var message ="";
       $("").dailog({
           type: 'defalut',
           title:'输入内容.',
           isInput:true
       },function(ret){
           if(ret.index===0){
               message=ret.input.value;
               if (message != null && message !=''){
                   $.ajax({
                       dataType: 'json', //服务器返回json格式数据
                       type: 'get', //HTTP请求类型
                       url: "${ctx}/order/sendmessage?goodsId="+id+"&message="+message+"&fbid="+fbid,
                       success:function(result){

                       }});
               }else {
                   $("").dailog({
                       type: 'danger',
                       showBoxShadow: true,
                       animateStyle: 'none',
                       bottons: ['确定'],
                       discription: '未填写评价内容'
                   });
               }

           }

       });
   }
    function dl() {
        $("").dailog({
            type: 'danger',
            showBoxShadow: true,
            animateStyle: 'none',
            bottons: ['确定'],
            discription: '请登录'
        });
    }
   function not() {
       $("").dailog({
           type: 'danger',
           showBoxShadow: true,
           animateStyle: 'none',
           bottons: ['确定'],
           discription: "不能对自己发布的商品进行该操作！"
       });
   }
   function grxx() {
       $("").dailog({
           type: 'danger',
           showBoxShadow: true,
           animateStyle: 'none',
           bottons: ['确定'],
           discription: "个人信息及收货地址为完善！"
       });
   }
</script>
</body>

</html>

