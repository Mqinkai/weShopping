<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/21
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" pageEncoding="UTF-8"%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>安全设置</title>
  <%--  <link href="/static/css/infstyle.css" rel="stylesheet" type="text/css">--%>
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
                        <li class="active"> <a href="${ctx}/personCenter/safety">安全设置</a></li>
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
        <div class="mwrap">
            <!--标题 -->
            <div class="user-safety">
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账户安全</strong> / <small>Set&nbsp;up&nbsp;Safety</small></div>
                </div>
                <hr/>

                <!--头像 -->
                <div class="user-infoPic">

                    <div class="filePic">
                        <img class="am-circle am-img-thumbnail" src=${huiyuan.tx} alt="" />
                    </div>
                    <div class="info-m">
                        <div>${huiyuan.userName}：</div>
                        <div class="u-level">
									<span class="rank r2">
							             <s class="vip1"></s><a class="classes" href="#">${huiyuan.code}</a>
						            </span>
                        </div>
                        <div class="u-safety">
                            <a href="safety.html">
                                账户安全
                                <c:choose>
                                    <c:when test="${ huiyuan.email != null && huiyuan.tel != null} ">
                                        <span class="u-profile"><i class="bc_ee0000" style="width: 60px;" width="0">100分</i></span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="u-profile"><i class="bc_ee0000" style="width: 60px;" width="0">50分</i></span>
                                    </c:otherwise>
                                </c:choose>

                            </a>
                        </div>
                    </div>
                </div>

                <div class="check">
                    <ul>
                        <li>
                            <i class="i-safety-lock"></i>
                            <div class="m-left">
                                <div class="fore1">登录密码</div>
                                <div class="fore2"><small>为保证您购物安全，建议您定期更改密码以保护账户安全。</small></div>
                            </div>
                            <div class="fore3">
                                <a href="password.html">
                                    <div class="am-btn am-btn-secondary"><a style="color: white" href="${ctx}/safety/password">修改</a></div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <i class="i-safety-iphone"></i>
                            <div class="m-left">
                                <div class="fore1">手机验证</div>
                                <c:choose>
                                    <c:when test="${huiyuan.tel != null and huiyuan.tel != ''}">
                                        <div class="fore2"><small>您验证的手机：${huiyuan.tel} 若已丢失或停用，请立即更换</small></div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="fore2"><small>为了安全，请绑定手机号</small></div>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                            <div class="fore3">
                                <a href="bindphone.html">
                                    <c:choose>
                                        <c:when test="${huiyuan.tel != null and huiyuan.tel != ''}">
                                            <div class="am-btn am-btn-secondary"><a style="color: white" href="${ctx}/safety/bindphone">更改</a></div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="am-btn am-btn-secondary"><a style="color: white" href="${ctx}/safety/bindphone">绑定</a></div>
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                            </div>
                        </li>
                        <li>
                            <i class="i-safety-mail"></i>
                            <div class="m-left">
                                <div class="fore1">邮箱验证</div>
                                <c:choose>
                                    <c:when test="${huiyuan.email != null and huiyuan.email != ''}">
                                        <div class="fore2"><small>您验证的邮箱：${huiyuan.email} 若已丢失或停用，请立即更换</small></div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="fore2"><small>为了安全，请绑定邮箱</small></div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="fore3">
                                <a href="email.html">
                                    <c:choose>
                                        <c:when test="${huiyuan.email != null and huiyuan.email != ''}">
                                            <div class="am-btn am-btn-secondary"><a style="color: white" href="${ctx}/safety/email">更改</a></div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="am-btn am-btn-secondary"><a style="color: white" href="${ctx}/safety/email">绑定</a></div>
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                            </div>
                        </li>
                    </ul>
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

</div>

</body>

</html>
