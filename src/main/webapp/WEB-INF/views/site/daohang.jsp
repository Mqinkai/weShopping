<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <link rel="stylesheet" href="/static/css/global.css">
      <link rel="stylesheet" href="/static/css/dialog.css">
      <script src="/static/js/dialog.js"></script>
	<script type="text/javascript" src="<%=path%>/static/js/popup_shuaxin.js"></script>

  </head>
  <body>
  <!--顶部导航条 -->
  <div class="am-container header">
      <ul class="message-l">
          <div class="topMessage">
              <input id="log" type="hidden" value="${login}"/>
              <c:choose>
                  <c:when test="${login=='1'}">
                      <div class="menu-hd">
                          <a style="font: '微软雅黑', 'Microsoft Yahei';font-size: 14px;" href="${ctx}/personCenter/" target="_top" class="h">您好，${huiyuan.userName}  |</a>

                          <a style="font: '微软雅黑', 'Microsoft Yahei';font-size: 14px;" href="${ctx}/huiyuanreg/leave" target="_top"><i class="am-icon-circle-o-notch am-icon-spin"></i>退出</a>
                      </div>
                  </c:when>
                  <c:otherwise>
                      <div class="menu-hd">
                          <a style="font: '微软雅黑', 'Microsoft Yahei';font-size: 14px;" href="${ctx}/login/" target="_top" class="h">亲，请登录</a>
                          <a style="font: '微软雅黑', 'Microsoft Yahei';font-size: 14px;" href="${ctx}/huiyuanreg/tz" target="_top">注册|</a>
                          <a style="font: '微软雅黑', 'Microsoft Yahei';font-size: 14px;" href="<%=path %>/admin/adminLog" target="_top"><i class="am-icon-unlock-alt am-icon-fw"></i>我是管理员</a>
                      </div>
                  </c:otherwise>
              </c:choose>
          </div>
      </ul>
      <ul class="message-r">
          <div class="topMessage home">
              <div class="menu-hd"><a style="font: '微软雅黑', 'Microsoft Yahei';font-size: 14px;" href="${ctx}/message/show" target="_top" class="h">平台首页</a></div>
          </div>
          <div class="topMessage my-shangcheng">
              <div class="menu-hd MyShangcheng"><a style="font: '微软雅黑', 'Microsoft Yahei';font-size: 14px;" href="javascript:void(0);" onclick="grzx()" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
          </div>
      </ul>
  </div>
  <script type="text/javascript">
      function grzx() {
          var log = $("#log").val();
          if (log=='1'){
             window.location.href='${ctx}/personCenter/';
          }else {
              $('').dailog({type:'defalut',title:'提示',discription:'用户未登陆！',bottons: ['确定'],showBoxShadow:true});
          }
      }
  </script>
  </body>
</html>
