<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<link rel="stylesheet" href="/static/admincss/css/reset.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="/static/admincss/css/style.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="/static/admincss/css/invalid.css" type="text/css" media="screen" />
	
	<script type="text/javascript" src="/static/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="/static/js/simpla.jquery.configuration.js"></script>
	
	<script type="text/javascript">
	    function logout()
		{
		   if(confirm("确定要退出本系统吗??"))
		   {
			   window.parent.location="${ctx}/huiyuanreg/leave";
		   }
		}
	</script>
	
  </head>
  
<body>
    <div id="sidebar">
	    <div id="sidebar-wrapper">
		      <div id="profile-links">
		           <br /><br /><br />
		           <a href="#" style="font-family: 微软雅黑;font-size: 15px;">你好：管理员</a>&nbsp;&nbsp;&nbsp;
		           <a href="#" style="font-family: 微软雅黑;font-size: 15px;" onclick="logout()">注销退出</a> 
		      </div>
		      <ul id="main-nav">
		           <li><a href="#" class="nav-top-item" style="font-family: 微软雅黑;font-size: 15px;">公告</a>
			           <ul>
			            <li><a href="${ctx}/gonggao/list" target="rightFrame" style="font-family: 微软雅黑;font-size: 13px;">删除新增公告</a></li>
			           </ul>
		           </li>
			       <li><a href="#" class="nav-top-item" style="font-family: 微软雅黑;font-size: 15px;">物品类别</a>
			          <ul>
			            <li><a href="${ctx}/leibie/list"  target="rightFrame"style="font-family: 微软雅黑;font-size: 13px;">物品类别管理</a></li>
			          </ul>
			       </li>
			       <li><a href="#" class="nav-top-item" style="font-family: 微软雅黑;font-size: 15px;">商品信息</a>
			          <ul>
			            <li><a href="${ctx}/goods/goodsList"  target="rightFrame"style="font-family: 微软雅黑;font-size: 13px;">物品信息管理</a></li>
			          </ul>
			       </li>
			       <li><a href="#" class="nav-top-item" style="font-family: 微软雅黑;font-size: 15px;">会员信息</a>
			          <ul>
			            <li><a href="${ctx}/huiyuanGL/list"  target="rightFrame"style="font-family: 微软雅黑;font-size: 13px;">会员信息管理</a></li>
			          </ul>
			       </li>
			       <li><a href="#" class="nav-top-item" style="font-family: 微软雅黑;font-size: 15px;">订单信息</a>
			          <ul>
			            <li><a href="${ctx}/order/list"  target="rightFrame"style="font-family: 微软雅黑;font-size: 13px;">订单信息管理</a></li>
			          </ul>
			       </li>
	          </ul>    
	    </div>
	    <!-- <div id="main-content">
	    </div> -->
    </div>
</body>
</html>
