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
    <style>
        .am-popover-inner {
            margin-left: 50px;
            width: 90%;
            position: relative;
            background: #333333;
            padding: 8px;
            z-index: 110;
        }
    </style>
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
                        <div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="javascript:void(0);" type="button"data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0, width: 800, height:500}">
                            购物保障
                        </a>，明确您的售后保障权益。</div>
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
                    <em>(c) 2015-2025 版权所有. <a href="" target="_blank" title="****">****</a> - </em>
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


<div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">购物保障
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
        </div>
        <div class="am-modal-bd">
            <p style="text-align: left">目前消费者保障服务分为：消费者保障服务、交易约定类服务。其中，消费者保障服务为基础消保服务，交易约定是指卖家在加入消费者保障服务的基础上，就其经营的商品或其服务自愿为买家提供的承诺服务。</p>
           <h3>一、消费者保障服务</h3>
            <p style="text-align: left">指在按本协议提出申请、并经mingjie二手交易平台接受其申请后，用户根据本协议及mingjie二手交易平台网其他公示规范的规定，按其选择参加的消费者保障服务项目（以下称“服务项目”），就其通过mingjie二手交易平台这一电子商务平台发布出售信息并利用支付宝服务向其他mingjie二手交易平台用户（下称“买家”）出售的商品，向买家提供的相应的售后服务。消费者保障服务是用户向买家提供的服务，用户是该服务责任者，mingjie二手交易平台不是相关的责任者。除本协议另有规定外，用户可根据其销售的商品种类及意愿选择参与特定的服务项目。mingjie二手交易平台可在mingjie二手交易平台网不时公示新增的服务项目或服务项目修改。</p>
            <h3>二、交易约定</h3>
            <p style="text-align: left">指用户（下称“卖家”）使用mingjie二手交易平台提供的技术支持及服务就其店铺经营的商品或服务自愿为买家提供的承诺服务。交易约定服务的类型包括但不限于发货时间承诺服务、品质承诺服务、破损补寄承诺服务、退货承诺服务等。使用交易约定服务的会员均应遵守《mingjie二手交易平台服务协议》及《mingjie二手交易平台规则》，如交易约定服务有特殊规定的应从其规定。
                （1）发货时间服务：卖家自主承诺向买家提供的特色服务之一。卖家就商品发货时间向买家作出承诺，在买家付款后，按照约定时间内完成发货；若未按约定时间发货，则按照该商品实际成交金额的5%给予赔付，且金额最低不少于1元，最高不超过30元
                （2）退货承诺服务：卖家自主承诺向买家提供的特色服务之一。卖家就该商品向买家作出承诺，自商品签收之日起至卖家承诺保障时间内，商品符合约定状态，如买家对购买的商品不满意可无理由申请退货，退货和第一次发货时产生的邮费，按照承诺约定的承担方来承担。
                （3）破损补寄服务：卖家自主承诺向买家提供的特色服务之一。卖家就该商品签收状态作出承诺，自商品签收之日起至卖家承诺保障时间内，如发现商品在运输途中出现破损，买家可申请破损部分商品补寄；卖家承诺提供1次补寄服务，补寄物流费由约定承担方承担；若补寄后的商品仍出现破损，卖家将提供退货退款服务。
                （4）品质承诺服务：卖家自主承诺向买家提供的特色服务之一。卖家就该商品质量作出承诺，自商品签收之日起至确认收货前，如买家发现商品材质或质量与网上描述不符，且与卖家协商未果，买家有权在mingjie二手交易平台指定期限内发起维权。mingjie二手交易平台网根据商品质检结果进行判定，如判定买家赔付申请成立，卖家应向买家退回其实际支付的商品价款，并补偿约定赔偿金。</p>
        </div>
    </div>
</div>
<script type="text/javascript">


   /*$("#contents").innerHTML=${goods.jieshao};*/
   function sendmessage(id,fbid) {
       var message ="";
       $("").dailog({
           type: 'defalut',
           title:'输入内容.',
           isInput:true
       },function(ret){
           if(ret.index===0){
               message=ret.input.value;
               console.log(message)
               if (message != null && message !=''){
                   $.ajax({
                       dataType: 'json', //服务器返回json格式数据
                       type: 'get', //HTTP请求类型
                       url: "${ctx}/order/sendmessage?goodsId="+id+"&message="+message+"&fbid="+fbid,
                       success:function(result){

                       }});
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

