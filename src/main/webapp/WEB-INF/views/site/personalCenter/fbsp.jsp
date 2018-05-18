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

    <title>发布商品</title>
<style type="text/css">
    .parent{
        position:relative;
        height:600px;//高度根据需求自行设定
    }
    .child{
        position:absolute;
        left:0;
        top:0;
        right:0;
        bottom:0;  //left,top,right,bottom都为0，充满真个页面
    overflow-y:auto;
        overflow-x:hidden; //设置Y轴出现滚动条，X轴隐藏
    }

</style>
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
                        <li> <a href="${ctx}/personCenter/news">消息</a></li>
                        <li class="active"> <a href="${ctx}/personCenter/fbsp">发布二手</a></li>
                    </ul>
                </li>

            </ul>

        </aside>
        <div class="main-wrap parent">
        <div style="margin-left: 60px;margin-top: 70px;" class="child">
            <form action="" name="formAdd" method="post" enctype="multipart/form-data">
                     <div style="padding: 20px">
                         <span>类别选择：</span>
                         <select name="leibieId" id="leibieId" style="width: 200px;padding: 10px">
                     </select>

                     </div>
                     <div style="padding: 20px">
                         <span>物品名称：</span>
                        <input  style="border:1px solid;width: 200px;" type="text" name="mingcheng"/>
                     </div>
                     <div style="padding: 20px">
                         <span>物品介绍：</span>
                         <script id="editor" type="text/plain" style="width:600px;height:500px;"></script>
                     </div>

                     <div style="padding: 20px">
                         <span>上传封面：</span>
                         <input style="border:1px solid;width: 200px;" type="text" name="fujian" id="fujian" readonly="readonly"/>
                         <button class="am-btn am-btn-danger" value="上传" onclick="up()">上传</button>
                         <input type="hidden" name="fujianYuanshiming" id="fujianYuanshiming"/>
                     </div>

                      <div style="padding: 20px">
                          <span>物品价格：</span>

                          <input  style="border:1px solid;width: 200px;" type="text" name="jiage" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>￥
                      </div>

                           <div style="padding: 20px;margin-left: 100px">
                               <button class="am-btn am-btn-danger" value="提交" onclick="check()">提交</button>&nbsp;
                           </div>
            </form>
</div>
        </div>
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
<!--底部-->

<script language="javascript">
    var ue = UE.getEditor('editor',{toolbars: [
        ['fullscreen', 'source', 'undo', 'redo'],
        ['bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'forecolor', 'fontsize', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'simpleupload', 'cleardoc']
    ]});

    function init()
    {
        loginService.leibieSelect(callBack);
    }

    function callBack(data)
    {
        DWRUtil.addOptions("leibieId",data,"id","mingcheng");
    }

    function up()
    {
        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
        pop.setContent("contentUrl","${ctx}/upload/upload.jsp");
        pop.setContent("title","文件上传");
        pop.build();
        pop.show();
    }


    function check()
    {
        if(document.formAdd.mingcheng.value=="")
        {
            alert("请填写物品名称");
            return false;
        }
        if(document.formAdd.jiage.value=="")
        {
            alert("请填写价格");
            return false;
        }
        document.formAdd.submit();
    }
</script>
</body>

</html>
