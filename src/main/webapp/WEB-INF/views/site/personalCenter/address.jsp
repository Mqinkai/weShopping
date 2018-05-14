<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/10
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" pageEncoding="UTF-8"%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>地址管理</title>

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
                        <li> <a href="${ctx}/personCenter/safety">安全设置</a></li>
                        <li class="active"> <a href="${ctx}/personCenter/address">收货地址</a></li>
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

            <div class="user-address">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
                </div>
                <hr/>
                <ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
                    <c:forEach items="${address}" var="addres" varStatus="stus">
                        <c:if test="${addres.moren == '1'}">
                            <li class="user-addresslist defaultAddr">
                            <span class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
                        </c:if>
                        <c:if test="${addres.moren != '1'}">
                            <li class="user-addresslist">
                            <span class="new-option-r" onclick="change(${addres.id})"><i class="am-icon-check-circle"></i>设为默认地址</span>
                        </c:if>
                              <input type="hidden" value="${addres.id}" id="id">
                            <p class="new-tit new-p-re">
                                <span class="new-txt">${addres.shName}</span>
                                <span class="new-txt-rd2">${addres.shTel}</span>
                            </p>
                            <div class="new-mu_l2a new-p-re">
                                <p class="new-mu_l2cw">
                                    <span class="title">地址：</span>
                                    <span class="province">${addres.ssq}</span>

                                    <span class="street">${addres.xxdz}</span></p>
                            </div>
                            <div class="new-addr-btn">
                                <a href="javascript:void(0);" onclick="edit(${addres.id},'${addres.shName}','${addres.shTel}','${addres.xxdz}');"><i class="am-icon-edit"></i>编辑</a>
                                <span class="new-addr-bar">|</span>
                                <a href="javascript:void(0);" onclick="delClick(${addres.id});"><i class="am-icon-trash"></i>删除</a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <div class="clear"></div>
                <a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
                <!--例子-->
                <div class="am-modal am-modal-no-btn" id="doc-modal-1">

                    <div class="add-dress">

                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg" id="titl">新增地址</strong><strong style="display: none" class="am-text-danger am-text-lg" id="titl2">修改收货地址</strong> </div>
                        </div>
                        <hr/>

                        <div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
                            <form class="am-form am-form-horizontal">

                                <div class="am-form-group">
                                    <label for="user-name" class="am-form-label">收货人</label>
                                    <div class="am-form-content">
                                        <input type="text" id="user-name" placeholder="收货人">
                                    </div>
                                    <input type="hidden" value="" id="thisId">
                                </div>

                                <div class="am-form-group">
                                    <label for="user-phone" class="am-form-label">手机号码</label>
                                    <div class="am-form-content">
                                        <input id="user-phone" placeholder="手机号必填" type="email">
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label class="am-form-label">所在地</label>
                                    <div class="am-form-content address">
                                        <select name="user.province" id="province"></select>
                                        <select name="user.city" id="city"></select>
                                        <select name="user.area" id="area"></select>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-intro" class="am-form-label">详细地址</label>
                                    <div class="am-form-content">
                                        <textarea class="" rows="3" id="user-intro" placeholder="100字以内写出你的详细地址..."></textarea>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <a class="am-btn am-btn-danger" onclick="save()">保存</a>
                                        <a href="javascript: void(0)" onclick="shuaxin()" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>

            </div>

            <script type="text/javascript">
                $(document).ready(function() {
                    $(".new-option-r").click(function() {
                        $(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
                    });

                    var $ww = $(window).width();
                    if($ww>640) {
                        $("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
                    }

                })
            </script>

            <div class="clear"></div>

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
    function save(){
        var getpro=document.getElementById("province").value;
        var getcity=document.getElementById("city").value;
        var getarea=document.getElementById("area").value;
        var ssq = getpro+getcity+getarea;
        var sh_name = $("#user-name").val();
        var sh_tel = $("#user-phone").val();
        var xxdz = $("#user-intro").val();
        var thisId = $("#thisId").val();
        if (sh_name != '' && sh_tel != '' && xxdz!= ''){
            $.ajax({
                type: 'post',
                url: '${ctx}/address/saveAddress',
                data: {ssq: ssq, shName: sh_name,shTel:sh_tel,xxdz:xxdz,id:thisId},
                dataType: 'json',
                success: function(data){
                   if (data.code =='1'){
                       $("").dailog({
                           type: 'success',
                           showBoxShadow: true,
                           animateStyle: 'none',
                           bottons: ['确定'],
                           discription: '保存成功'
                       });
                       window.location.reload();
                   }
                }
            });
        }
    }
    function shuaxin() {
        window.location.reload();
    }
    function edit(id,name,tel,xxdz) {
        $("#thisId").val(id);
       $("#user-name").val(name);
       $("#user-phone").val(tel);
       $("#user-intro").val(xxdz);
        document.getElementById('titl').innerHtml = '修改收货地址';
        $("#titl").hide();
        $("#titl2").show();
    }
    function delClick(id) {
        $.ajax({
            type: 'post',
            url: '${ctx}/address/delAddress',
            data: {id:id},
            dataType: 'json',
            success: function(data){
                if (data.code =='1'){
                    $("").dailog({
                        type: 'success',
                        showBoxShadow: true,
                        animateStyle: 'none',
                        bottons: ['确定'],
                        discription: '删除成功'
                    });
                    window.location.reload();;
                }
            }
        });
    }
    function change(id) {
        $.ajax({
            type: 'post',
            url: '${ctx}/address/change',
            data: {id:id},
            dataType: 'json',
            success: function(data){
                if (data.code =='1'){
                    window.location.reload();;
                }
            }
        });
    }
</script>

<script language="javascript" defer>
    new PCAS("user.province","user.city","user.area","山东省","济南市","济南市");
</script>

</body>

</html>
