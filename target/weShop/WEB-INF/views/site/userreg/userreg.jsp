<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<head lang="en">
	<meta charset="UTF-8">
	<title>注册</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />

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
<div class="login-boxtitle">
	<a href="${ctx}/message/show"><img alt="" src="/static/images/logobig.png" /></a>
</div>
<div class="res-banner">
	<div class="res-main">
		<div class="login-banner-bg"><span></span><img src="/static/images/big.jpg" /></div>
		<div class="login-box">

			<div class="am-tabs" id="doc-my-tabs">
				<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
					<li class="am-active"><a href="">邮箱注册</a></li>
					<li><a href="">手机号注册</a></li>
				</ul>
				<div class="am-tabs-bd">
					<div class="am-tab-panel am-active">
						<form id="eForm" method="post" action="${ctx}/huiyuanreg/regForm">
							<div class="user-email">
								<label for="email"><i class="am-icon-envelope-o"></i></label>
								<input type="email" name="email" id="email" placeholder="请输入邮箱账号">
							</div>
							<div class="user-pass">
								<label for="password"><i class="am-icon-lock"></i></label>
								<input type="password" name="password" id="password" placeholder="设置密码">
							</div>
							<div class="user-pass">
								<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								<input type="password" name="passwordRepeat" id="passwordRepeat" placeholder="确认密码">
							</div>

						</form>

						<div class="login-links">
							<label for="reader-me">
								<input id="reader-me" type="checkbox"> 点击表示您同意mingjie平台<a href="#" style="color: blue">《服务协议》</a>
							</label>
						</div>
						<div class="am-cf">
							<input type="submit" name="esubmit" id="esubmit" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
						</div>
					</div>
					<div class="am-tab-panel">
						<form id="tForm" method="post" action="${ctx}/huiyuanreg/regForm">
							<div class="user-phone">
								<label for="tel"><i class="am-icon-mobile-phone am-icon-md"></i></label>
								<input type="tel" name="tel" id="tel" placeholder="请输入手机号">
							</div>
							<div class="verification">
								<label for="code"><i class="am-icon-code-fork"></i></label>
								<input type="tel" name="code" id="code" placeholder="请输入验证码">
								<a class="btn" href="javascript:void(0);" onclick="sendMobileCode();" id="sendMobileCode">
									<span id="dyMobileButton">获取</span></a>
							</div>
							<div class="user-pass">
								<label for="password"><i class="am-icon-lock"></i></label>
								<input type="password" name="password" id="password1" placeholder="设置密码">
							</div>
							<div class="user-pass">
								<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								<input type="password" name="passwordRepeat" id="passwordRepeat1" placeholder="确认密码">
							</div>
						</form>
						<div class="login-links">
							<label for="reader-me1">
								<input id="reader-me1" type="checkbox"> 点击表示您同意mingjie平台<a href="#" style="color: blue">《服务协议》</a>
							</label>
						</div>

						<div class="am-cf">
							<input type="submit" name="submit" id="submit" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
						</div>
						<a style="color: red">${message}</a>
						<hr>
					</div>

					<script>
						$(function() {
							$('#doc-my-tabs').tabs();
						})
					</script>

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
	var yzm="";
	var isEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/; //邮箱格式校验
	var isTel = /^1[3|4|5|8|9][0-9]\d{8}$/;
	$('#esubmit').click(function () {
		var email = $("#email").val();
		var password = $("#password").val();
		var passwordRepeat = $("#passwordRepeat").val();
		if (email == '' || email == undefined) {
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '请输入邮箱!'
			});
			return false;
		} else if (!isEmail.test(email)) {
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '邮箱格式不正确!'
			});
			return false;
		}
		if (password == '' || password == undefined) {
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '请输入密码!'
			});
			return false;
		}
		if (passwordRepeat == '' || passwordRepeat == undefined) {
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '请输入确认密码!'
			});
			return false;
		}
		if (passwordRepeat != password) {
		$("").dailog({
			type: 'danger',
			showBoxShadow: true,
			animateStyle: 'none',
			bottons: ['确定'],
			discription: '两次输入密码不一致!'
		});
			return false;
	}
		if(!$('#reader-me').is(':checked')) {
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '未勾选同意《服务协议》!'
			});
			return false;
		}
		//校验通过
		$("#eForm").submit();
	})
	$('#submit').click(function () {
		var tel = $("#tel").val();
		var password = $("#password1").val();
		var passwordRepeat = $("#passwordRepeat1").val();
		var code = $("#code").val();
		if (tel == '' || tel == undefined) {
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '请输入手机号!'
			});
			return false;
		} else if (!isTel.test(tel)) {
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '手机格式不正确!'
			});
			return false;
		}
		if (code=='' || code==undefined){
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '请输入验证码!'
			});
			return false;
		}else if (code!=yzm){
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '验证码错误!'
			});
			return false;
		}
		if (password == '' || password == undefined) {
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '请输入密码!'
			});
			return false;
		}
		if (passwordRepeat == '' || passwordRepeat == undefined) {
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '请输入确认密码!'
			});
			return false;
		}
		if (passwordRepeat != password) {
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '两次输入密码不一致!'
			});
			return false;
		}
		if(!$('#reader-me1').is(':checked')) {
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '未勾选同意《服务协议》!'
			});
			return false;
		}
		//校验通过
		$("#tForm").submit();
	});
	//获取验证码
	function sendMobileCode() {
		$.ajax({
			dataType: 'json', //服务器返回json格式数据
			type: 'post', //HTTP请求类型
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			url: "${ctx}/huiyuanreg/sendMobileCode",
			success:function(result){
				yzm=result.message;
				$("").dailog({
					type: 'primary',
					showBoxShadow: true,
					animateStyle: 'none',
					bottons: ['确定'],
					discription: '验证码：'+result.message
				});
			},
			error:function(){
				$("").dailog({
					type: 'danger',
					showBoxShadow: true,
					animateStyle: 'none',
					bottons: ['确定'],
					discription: '获取失败'
				});
			}
		});
	}
</script>
</body>

</html>