<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" pageEncoding="UTF-8"%>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>结算页面</title>

    <link href="/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

    <link href="/static/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="/static/css/cartstyle.css" rel="stylesheet" type="text/css" />

    <link href="/static/css/jsstyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="/static/js/address.js"></script>

</head>

<body>

<!--顶部导航条 -->
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
<div class="clear"></div>
<div class="concent">
    <!--地址 -->
    <div class="paycont">
        <div class="address">
            <h3>确认收货地址 </h3>
            <div class="control">
                <%--<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>--%>
            </div>
            <div class="clear"></div>
            <ul>

                <c:forEach items="${address}" var="addresslist" varStatus="var">
                    <c:if test="${addresslist.moren == '1'}">
                        <div class="per-border"></div>
                       <input type="hidden" value="${addresslist.addresslist}" id="addressId"/>
                        <li class="user-addresslist defaultAddr">

                            <div class="address-left">
                                <div class="user DefaultAddr">

										<span class="buy-address-detail">
                   <span class="buy-user">${addresslist.shName} </span>
										<span class="buy-phone">${addresslist.shTel}</span>
										</span>
                                </div>
                                <div class="default-address DefaultAddr">
                                    <span class="buy-line-title buy-line-title-type">收货地址：</span>
										<span class="buy--address-detail">
								   <span class="province">${addresslist.ssq}</span>
                                     <span class="street">${addresslist.xxdz}</span>
										</span>

                                    </span>
                                </div>
                                <ins class="deftip">默认地址</ins>
                            </div>
                            <div class="address-right">
                                <a href="javascript:void(0);" onclick="change(${addresslist.id})">
                                    <span class="am-icon-angle-right am-icon-lg"></span></a>
                            </div>
                            <div class="clear"></div>

                        </li>
                    </c:if>
                    <c:if test="${addresslist.moren != '1'}">
                        <div class="per-border"></div>
                        <input type="hidden" value="${addresslist.addresslist}" id="addressId"/>
                        <li class="user-addresslist">
                            <div class="address-left">
                                <div class="user DefaultAddr">

										<span class="buy-address-detail">
                   <span class="buy-user">${addresslist.shName} </span>
										<span class="buy-phone">${addresslist.shTel}</span>
										</span>
                                </div>
                                <div class="default-address DefaultAddr">
                                    <span class="buy-line-title buy-line-title-type">收货地址：</span>
										<span class="buy--address-detail">
								   <span class="province">${addresslist.ssq}</span>
										<span class="street">${addresslist.xxdz}</span>
										</span>

                                    </span>
                                </div>
                                <ins class="deftip hidden">默认地址</ins>
                            </div>
                            <div class="address-right">
                                <span class="am-icon-angle-right am-icon-lg"></span>
                            </div>
                            <div class="clear"></div>
                        </li>
                    </c:if>

                </c:forEach>
            </ul>

            <div class="clear"></div>
        </div>
        <!--物流 -->

        <div class="clear"></div>

        <!--支付方式-->
        <div class="logistics">
            <h3>选择支付方式</h3>
            <ul class="pay-list" style="height: 80px; padding: 20px; line-height: 80px;">
                <li class="pay card"><img src="/static/images/fkfs.jpg" />
                   ${goods.fkfs}</li>

            </ul>
        </div>
        <div class="clear"></div>

        <!--订单 -->
        <div class="concent">
            <div id="payTable">
                <h3>确认订单信息</h3>
                <div class="cart-table-th">
                    <div class="wp">

                        <div class="th th-item">
                            <div class="td-inner">商品信息</div>
                        </div>
                        <div class="th th-price">
                            <div class="td-inner">单价</div>
                        </div>
                        <div class="th th-amount">
                            <div class="td-inner">数量</div>
                        </div>
                        <div class="th th-sum">
                            <div class="td-inner">金额</div>
                        </div>
                        <div class="th th-oplist">
                            <div class="td-inner">配送方式</div>
                        </div>

                    </div>
                </div>
                <div class="clear"></div>

                <tr class="item-list">
                    <div class="bundle  bundle-last">

                        <div class="bundle-main">
                            <ul class="item-content clearfix">
                                <div class="pay-phone">
                                    <li class="td td-item">
                                        <div class="item-pic">
                                                <img style="height: 80px;" src="${goods.fujian}" class="itempic J_ItemImg">
                                        </div>
                                        <div class="item-info">
                                            <div class="item-basic-info">
                                                <a href="javascript:void(0);" class="item-title J_MakePoint" data-point="tbcart.8.11">${goods.mingcheng}</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="td td-info">
                                        <div class="item-props">
                                            <span class="sku-line"></span>
                                            <span class="sku-line"></span>
                                        </div>
                                    </li>
                                    <li class="td td-price">
                                        <div class="item-price price-promo-promo">
                                            <div class="price-content">
                                                <em class="J_Price price-now">${goods.jiage}</em>
                                            </div>
                                        </div>
                                    </li>
                                </div>
                                <li class="td td-amount">
                                    <div class="amount-wrapper ">
                                        <div class="item-amount ">
                                            <span class="phone-title">购买数量</span>
                                            <div class="sl">
                                                <input class="text_box" name="" type="text" value="1" style="width:30px;" readonly/>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="td td-sum">
                                    <div class="td-inner">
                                        <em tabindex="0" class="J_ItemSum number">${goods.jiage}</em>
                                    </div>
                                </li>
                                <li class="td td-oplist">
                                    <div class="td-inner">
                                        <span class="phone-title">配送方式</span>
                                        <div class="pay-logis">
                                            双方协议
                                        </div>
                                    </div>
                                </li>

                            </ul>
                            <div class="clear"></div>

                        </div>
                </div>
                </tr>
                <div class="clear"></div>
            </div>


        </div>
        <div class="clear"></div>
        <div class="pay-total">
            <!--留言-->
            <div class="order-extra">
                <div class="order-user-info">
                    <div id="holyshit257" class="memo">
                        <label>买家留言：</label>
                        <input type="text" title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）" placeholder="选填,建议填写和卖家达成一致的说明" class="memo-input J_MakePoint c2c-text-default memo-close">
                        <div class="msg hidden J-msg">
                            <p class="error">最多输入500个字符</p>
                        </div>
                    </div>
                </div>

            </div>
            <!--优惠券 -->
            <div class="clear"></div>
        </div>
        <!--含运费小计 -->
        <div class="buy-point-discharge ">
            <p class="price g_price ">
                合计 <span>￥</span><em class="pay-sum">${goods.jiage}</em>
            </p>
        </div>

        <!--信息 -->
        <div class="order-go clearfix">
            <div class="pay-confirm clearfix">
                <div class="box">
                    <div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
											<span class="price g_price ">
                                    <span>￥</span> <em class="style-large-bold-red " id="J_ActualFee">${goods.jiage}</em>
											</span>
                    </div>

                    <div id="holyshit268" class="pay-address">
                        <p class="buy-footer-address">
                        </p>
                        <p class="buy-footer-address">
                        </p>
                    </div>
                </div>

                <div id="holyshit269" class="submitOrder">
                    <div class="go-btn-wrap">
                        <a id="J_Go" href="javascript:void(0);" class="btn-go" tabindex="0" title="点击此按钮，提交订单" onclick="pay(${goods.id})">提交订单</a>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>

    <div class="clear"></div>
</div>
</div>
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
            <em>(c) 2015-2025 青岛理工毕设 版权所有. <a href="javascript:void(0);" target="_blank" title="宋明杰">宋明杰</a> - </em>
        </p>
    </div>
</div>
</div>
<div class="theme-popover-mask"></div>

<div class="clear"></div>
<script type="text/javascript">
function pay(id) {

    $.ajax({
        dataType: 'json', //服务器返回json格式数据
        type: 'get', //HTTP请求类型
        url: "${ctx}/pay/saveOrder?id="+id,
        success:function(result){

        }});
}
    function shuaxin() {
        window.location.reload();
    }

</script>
</body>

</html>