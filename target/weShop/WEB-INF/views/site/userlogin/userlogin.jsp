<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<head lang="en">
	<meta charset="UTF-8">
	<title>登录</title>
	<link href="/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="/static/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="/static/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
	<link href="/static/css/dlstyle.css" rel="stylesheet" type="text/css">
	<link href="/static/css/hmstyle.css" rel="stylesheet" type="text/css"/>
	<link href="/static/css/skin.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="/static/css/global.css">
	<link rel="stylesheet" href="/static/css/dialog.css">
	<script src="/static/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="/static/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<script src="/static/js/dialog.js"></script>
</head>
<body>
<div>
	<a href="${ctx}/message/show"><img alt="logo" style="height: 80px;width: 160px;" src="/static/images/logobig.png" /></a>
</div>
<div class="login-banner">
	<div class="login-main">
		<div class="login-banner-bg"><span></span><img src="/static/images/big.jpg" /></div>
		<div class="login-box">

			<h3 class="title">登录</h3>

			<div class="clear"></div>

			<div class="login-form">
				<form action="${ctx}/login/userLogin" id="loginForm">
					<div class="user-name">
						<label for="userName"><i class="am-icon-user"></i></label>
						<input type="text" name="userName" id="userName" placeholder="邮箱/手机/用户名">
					</div>
					<div class="user-pass">
						<label for="password"><i class="am-icon-lock"></i></label>
						<input type="password" name="password" id="password" placeholder="请输入密码">
					</div>
				</form>
			</div>
               <a style="color: red">${mesgess}</a>
			<div class="login-links">
				<label for="remember-me"><input id="remember-me" type="checkbox">记住密码</label>
				<a href="#" class="am-fr">忘记密码</a>
				<a href="${ctx}/huiyuanreg/tz" class="zcnext am-fr am-btn-default">注册</a>
				<br />
			</div>
			<div class="am-cf">
				<input type="submit" name="submit" id="submit" onclick="login()" value="登 录" class="am-btn am-btn-primary am-btn-sm">
			</div>
			<div class="partner">
				<h3>合作账号</h3>
				<div class="am-btn-group">
					<li><a href="javascript:" onclick="openBox()"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
					<li><a href="javascript:;" onclick="openBox()"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span> </a></li>
					<li><a href="javascript:;" onclick="openBox()"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span> </a></li>
				</div>
			</div>

		</div>
	</div>
</div>


<div class="footer ">
	<div class="footer-hd ">
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
			<em>(c) 2014-2018 青岛理工毕设 版权所有. <a href="" target="_blank" title="宋明杰">宋明杰</a> - </em>
		</p>
	</div>
</div>
</div>
<script type="text/javascript">
	function openBox() {
		$('').dailog({type:'defalut',title:'提示',discription:'该功能已暂停使用！',bottons: ['确定'],showBoxShadow:true})
	}
	function login() {
		var name = $("#userName").val();
		if (name ==''||name==undefined){
			$('').dailog({type:'defalut',title:'提示',discription:'请输入用户名！',bottons: ['确定'],showBoxShadow:true})
			return false;
		}
		var password = $("#password").val();
		if (password ==''||password==undefined){
			$('').dailog({type:'defalut',title:'提示',discription:'请输入密码！',bottons: ['确定'],showBoxShadow:true})
			return false;
		}
		$("#loginForm").submit();
	}
</script>
</body>

</html>