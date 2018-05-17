<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<head lang="en">
	<meta charset="UTF-8">
	<title>登录</title>
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
				<a href="javascript:void(0);" onclick="wjmm()" class="am-fr">忘记密码</a>
				<a href="${ctx}/huiyuanreg/tz" class="zcnext am-fr am-btn-default">注册</a>
				<br />
			</div>
			<div class="am-cf">
				<input type="submit" name="submit" id="submit" onclick="login()" value="登 录" class="am-btn am-btn-primary am-btn-sm">
			</div>

		</div>
	</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">修改密码</h4>
			</div>
			<div class="user-phone">
				<label>&nbsp;</label><input type="text" name="userName" id="userName2" placeholder="请输入用户名">
			</div>
			<div class="verification">
				<label>&nbsp;</label><input type="text" name="code" id="code2" placeholder="注册时的手机号或者邮箱">
			</div>
			<div class="verification">
				<label>&nbsp;</label><input type="tel" name="code" id="code" placeholder="请输入验证码">
				<a class="btn" href="javascript:void(0);" onclick="sendMobileCode();" id="sendMobileCode">
					<span id="dyMobileButton">获取</span></a>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="tj()">确认提交</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<div class="footer ">
	<div class="footer-hd ">
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
			<em>(c) 2014-2018 青岛理工毕设 版权所有. <a href="" target="_blank" title="宋明杰">宋明杰</a> - </em>
		</p>
	</div>
</div>
</div>
<script type="text/javascript">
	var  yzm='';
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
	function wjmm() {
		$('#myModal').modal('show');
	}
	function tj() {
		var username = $("#userName2").val();
		var code = $("#code2").val();
		var yzm1 = $("code").val();
		if (code != null && code != ''){
			if (code != yzm){
				$("").dailog({
					type: 'danger',
					showBoxShadow: true,
					animateStyle: 'none',
					bottons: ['确定'],
					discription: '验证码错误'
				});
			}else {
				$.ajax({
					dataType: 'json', //服务器返回json格式数据
					type: 'post', //HTTP请求类型
					contentType: "application/x-www-form-urlencoded; charset=utf-8",
					data:{userName:username,tel:code},
					url: "${ctx}/huiyuanreg/xgmm",
					success:function(result){
						if (result.code == '1'){
							var id = result.message;
							//输入新密码
							$("").dailog({
								type: 'defalut',
								title:'输入新密码',
								isInput:true
							},function(ret){
								if(ret.index===0){
									var m=ret.input.value;
									if (m != null && m !=''){
										$.ajax({
											dataType: 'json', //服务器返回json格式数据
											type: 'get', //HTTP请求类型
											url: "${ctx}/huiyuanreg/changPassword?id="+id+"&password="+m,
											success:function(result){
												$("").dailog({
													type: 'success',
													showBoxShadow: true,
													animateStyle: 'none',
													bottons: ['确定'],
													discription: '密码修改成功'
												});
											}});
									}else {
										$("").dailog({
											type: 'danger',
											showBoxShadow: true,
											animateStyle: 'none',
											bottons: ['确定'],
											discription: '新密码不能为空'
										});
									}

								}

							});
							//
						}else {
							$("").dailog({
								type: 'danger',
								showBoxShadow: true,
								animateStyle: 'none',
								bottons: ['确定'],
								discription: '该用户不存在'
							});
						}

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
		}
	}
	//获取验证码
	function sendMobileCode() {
		var username = $("#userName2").val();
		var code = $("#code2").val();
		if (username != null && username != '' & code != null && code != ''){
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
		}else {
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '输入有误'
			});
		}

	}
</script>
</body>

</html>