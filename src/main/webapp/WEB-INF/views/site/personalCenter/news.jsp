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
                    <a href="${ctx}/personCenter/">个人中心</a>
                </li>
                <li class="person">
                    <a>个人资料</a>
                    <ul>
                        <li> <a href="${ctx}/personCenter/PersonInformation">个人信息</a></li>
                        <li> <a href="${ctx}/personCenter/Safety">安全设置</a></li>
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
                        <li class="am-active"><a href="#tab1">消息</a></li>

                    </ul>
                    <div class="am-tabs-bd">
                        <div class="am-tab-panel am-fade am-in am-active" id="tab1">

                                <!--消息 -->
                            <c:forEach items="${noticeList}" var="notice" varStatus="var">
                                <div class="s-msg-item s-msg-temp i-msg-downup">
                                    <h6 class="s-msg-bar"><span class="s-name">${notice.buyName}</span></h6>
                                    <div class="s-msg-content i-msg-downup-wrap">
                                <div class="i-msg-downup-con">
                                    <a class="i-markRead" target="_blank" onclick="hf(${notice.id})" href="javascript:void(0);">
                                        <div class="m-item">
                                            <div class="item-pic">
                                                <img src="${notice.good.fujian}" class="itempic J_ItemImg">
                                            </div>
                                            <div class="item-info">
                                                ${notice.message}</div>
                                        </div>
                                        <p class="s-row s-main-content">
                                            回复 <i class="am-icon-angle-right"></i>
                                        </p>
                                    </a>
                                </div>
                            </div>
                            <a class="i-btn-forkout" href="#"><i class="am-icon-close am-icon-fw"></i></a>
                              </div>
                            </c:forEach>

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
    function hf(id) {
        var pj ="";
        $("").dailog({
            type: 'defalut',
            title:'输入内容.',
            isInput:true
        },function(ret){
            if(ret.index===0){
                pj=ret.input.value;
                if (pj != null && pj !=''){
                    $.ajax({
                        dataType: 'json', //服务器返回json格式数据
                        type: 'get', //HTTP请求类型
                        url: "${ctx}/notice/hf?id="+id+"&message="+pj,
                        success:function(result){

                        }});
                }else {
                    $("").dailog({
                        type: 'danger',
                        showBoxShadow: true,
                        animateStyle: 'none',
                        bottons: ['确定'],
                        discription: '未填写内容'
                    });
                }

            }

        });

    }
</script>
</body>

</html>
