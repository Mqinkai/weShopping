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
<div>
	<a href="${ctx}/message/show"><img alt="logo" style="height: 80px;width: 160px;" src="/static/images/logobig.png" /></a>
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
							<div class="verification">
								<label for="code"><i class="am-icon-code-fork"></i></label>
								<input type="email" name="code" id="emailCode" placeholder="请输入验证码">
								<a class="btn" href="javascript:void(0);" onclick="sendEmailCode();" id="sendMEmailCode">
									<span id="dyMobileButton">获取</span></a>
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
								<input id="reader-me" type="checkbox"> 点击表示您同意mingjie平台<a href="javascript:void(0);" id="xieyi">《服务协议》</a>
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
								<input id="reader-me1" type="checkbox"> 点击表示您同意mingjie平台<a href="javascript: void(0)" id="xieyi2">《服务协议》</a>
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
				<a href="http://www.qtech.edu.cn/">青岛理工</a>
				<b>|</b>
				<a href="${ctx}/message/show">平台首页</a>
				<b>|</b>
				<a href="${ctx}/personCenter/">个人中心</a>
			</p>
		</div>
		<div class="footer-bd ">
			<p>
				<em>(c) 2014-2018 青岛理工毕设 版权所有. <a href="javascript: void(0)" target="_blank" title="宋明杰">宋明杰</a> - </em>
			</p>
		</div>
	</div>
</div>
	<div class="am-popup" tabindex="-1" id="doc-modal-2">
		<div class="am-popup-inner">
			<div class="am-popup-title">《服务协议》
				<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
			</div>
			<div class="am-modal-bd">
				<p style="text-align: left">一、mingjie二手交易平台是由青岛理工大学宋明杰同学开发、运营的电子商务平台。本协议适用于使用浏览mingjie二手交易平台的所有用户。请您确认，在您使用或注册成为mingjie二手交易平台的服务之前，您已充分阅读、理解并接受本协议的全部内容，并同意遵循本协议的所有约定。您的使用行为将被视为对本用户协议全部内容的了解、认可与同意遵守。</p>
				<p style="text-align: left">二、mingjie二手交易平台有权随时对本协议进行单方面的变更，并予公布，而无需另行单独通知本网用户；若您在本协议内容公告变更后继续使用、接受mingjie二手交易平台的服务，表示您已充分阅读、理解并接受修改后的协议内容，并同意遵循修改后协议的约定；若您不同意修改后的协议内容，您应当立即停止使用mingjie二手交易平台的所有服务。</p>
				<p style="text-align: left">三、mingjie二手交易平台保留对网站结构、服务、功能、内容等随时进行调整的权利。本网所有新调整的功能、服务和内容均适用本协议。</p>
				<p style="text-align: left">四、本协议中的用户是指（但不限于）以任何形式接入、进入、浏览mingjie二手交易平台，或者使用mingjie二手交易平台的各项服务、功能等，能够独立承担法律责任的自然人、法人及其他组织。若您不具备此资格，请不要使用mingjie二手交易平台；否则，由此导致的一切后果由您或您的监护人承担。</p>
				<p style="text-align: left">五、本网站用户可根据自己的选择在使用mingjie二手交易平台的过程中注册成为mingjie二手交易平台会员。在申请会员时，您必须同意提供真实、准确、完整的个人或单位信息，包括但不限于您的姓名或名称、联系地址、联系电话、电子邮箱地址等；维护并及时更新个人或单位信息以保持其真实、准确、即时、完整。</p>
				<p style="text-align: left">六、注册过程中，您可自主选择一个登录名和密码。注册成功后，您有权使用该登录名及密码随时登陆mingjie二手交易平台。请妥善保管您在中国二手设备网的登录名和密码，以保障信息的安全、准确、真实、有效。如因某种原因致使登录名和密码受到危及，请立即与我们联系。</p>
				<p style="text-align: left">七、mingjie二手交易平台严格保障用户的隐私权，对用户的相关信息保密。除非得到您的许可或法律需要，mingjie二手交易平台不会泄露任何用户信息给任何第三方。</p>
				<p style="text-align: left">八、mingjie二手交易平台禁止任何未经许可的帐号出售或转让授权其他人使用；一经发现，mingjie二手交易平台有权随时停止违反本协议的用户继续使用本网的所有服务项目。</p>
				<p style="text-align: left">九、您在使用mingjie二手交易平台时，须保证遵守国家的法律法规和规章制度，遵守中国二手设备网的有关协议、规定、规则、程序，遵守互联网使用的惯例，不得利用本网从事任何非法活动。</p>
				<p style="text-align: left">十、您在mingjie二手交易平台发布的所有信息（内容包括但不限于个人信息、商业信息，形式包括但不限于文字、图片）的真实性、准确性、即时性、完整性和合法性独立承担所有责任。</p>
				<p style="text-align: left">十一、以下信息禁止在mingjie二手交易平台上发布：有关宗教、种族或性别等的贬损言辞，或含色情、侮辱、诽谤等内容的信息；侵犯任何第三方著作权、专利、商标、隐私权、名誉权或其它权利的信息；其它任何违反国家法律法规、规章制度等的信息。</p>
				<p style="text-align: left">十二、mingjie二手交易平台有权审核、发布或删除会员提交的信息。mingjie二手交易平台将尽力核查会员提交信息的真实性、合法性和准确性，但并不能完全保证，同时也不承担由此引起的任何法律责任。</p>
				<p style="text-align: left">十三、mingjie二手交易平台含有与其他网站的链接。mingjie二手交易平台并不能控制这些网站及其所提供的资源，因而对链接网站上的内容的真实、准确、即时、完整不做任何承诺，并且对链接网站不承担任何法律责任。</p>
				<p style="text-align: left">十四、用户同意在使用mingjie二手交易平台的过程中，发现任何可能侵害自己或mingjie二手交易平台权利的事实时，应及时通知mingjie二手交易平台并提供相应的证明材料。mingjie二手交易平台将根据实际情况和自身能力对有关问题进行处理、协调和修正。因mingjie二手交易平台并非国家权利机关，您应该完全理解：mingjie二手交易平台对证据的鉴别能力及对纠纷的处理能力有限，不能保证处理结果符合您的期望，亦不对处理结果承担任何责任。</p>
				<p style="text-align: left">十五、对于用户的以下行为，mingjie二手交易平台有权在告知或未告知的情况下中止或终止其相关服务或者拒绝其以任何形式使用mingjie二手交易平台，且不对因此给您造成的服务减少等承担任何责任：
					                          1.利用mingjie二手交易平台滥发重复信息，发布国家法律法规等禁止或限制发布的信息，发布不属于会员经营范围的信息，或与mingjie二手交易平台服务无关的信息；
					                          2.未经请求或授权向mingjie二手交易平台会员发送大量与业务不相关的信息；
					                          3.冒用其他企业的名义发布商业信息，进行商业活动；
					                          4.计划破坏、攻击mingjie二手交易平台网站电脑系统和网络，或者试图擅自进入mingjie二手交易平台网站电脑系统、网络；
					                          5.盗用他人在mingjie二手交易平台上的登录名和密码；
					                          6.未经mingjie二手交易平台同意的帐号转让、出售或授权使用行为；
					                          7.从事涉及mingjie二手交易平台的欺诈活动；
					                          8.通过或从事涉及mingjie二手交易平台的知识产权侵权行为；
					                          9.违反国家法律法规、规章制度、mingjie二手交易平台有关协议、规定、规则、程序和惯例的其他行为。</p>
				<p style="text-align: left">十六、mingjie二手交易平台不保证网站是不受干扰的、没有故障的，也不对使用效果做任何保证。mingjie二手交易平台不对因人为或非人为因素造成的用户与mingjie二手交易平台服务器之间的连接受阻而无法访问负责。您同意独立承担因网站意外中断、操作或传输的迟延、电脑病毒、网络连接故障、未经授权的进入等引起的损失。因不可抗力（包括但不限于自然灾害、罢工或骚乱、暴动、战争行为、政府行为、以及因互联网的特殊性而产生的包括黑客攻击、互联网连通中断或者系统故障、电信部门技术调整导致的影响、政府管制而造成的暂时性关闭等影响网络正常运营的因素）以及其他非本网原因，致使mingjie二手交易平台履行迟延或不能履行的，mingjie二手交易平台不承担任何责任。</p>
				<p style="text-align: left">十七、本网用户应对其在mingjie二手交易平台上公布的信息的真实性、即时性、有效性、安全性、正确性承担全部责任。用户可在mingjie二手交易平台上发布交易信息、查询商品和服务信息、达成交易意向并联系交易。mingjie二手交易平台仅作为信息平台为用户物色交易对象。mingjie二手交易平台不涉及用户间因交易而产生的法律关系及法律纠纷，不会且不能牵涉进交易各方的交易当中。敬请注意，mingjie二手交易平台不能控制或保证商贸信息的真实性、合法性、准确性，亦不能控制或保证交易所涉及的设备品质、安全或合法性，以及相关交易方履行贸易协议的能力。应注意到，与以欺诈手段行事的人进行交易的风险是客观存在的，用户需自己甄别，小心谨慎并运用常识。 不论什么情况下，mingjie二手交易平台对用户因使用mingjie二手交易平台而造成的损失（包括直接、间接、偶尔的、特殊的、惩罚性的损失或其他一切损失）不负法律责任。</p>
				<p style="text-align: left">十八、mingjie二手交易平台上所有内容的选材、整理、编排、排版、汇编，以及由mingjie二手交易平台创作的文字、图片等作品的著作权，无论是否明示，均属本网所有。任何自然人、法人及其他组织未经mingjie二手交易平台书面授权或许可，不得修改、出版、传播、参与传播、销售、制作衍生品，或以其他任何方式使用整体或部分的mingjie二手交易平台上的内容，包括但不限于公司信息、产品信息。mingjie二手交易平台将保留追究其法律责任的权利。</p>
				<p style="text-align: left">十九、本协议未尽事宜应参照通行的商业惯例和行业惯例，适用中华人民共和国民法和国家其他有关法律。</p>
				<p style="text-align: left">二十、如因本协议内容或其执行发生争议，双方应友好协商解决；协商不成时，可mingjie二手交易平台运营所在地人民法院提起诉讼。</p>
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
		var emailcode = $("#emailCode").val();
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
		if (emailcode=='' || emailcode==undefined){
			$("").dailog({
				type: 'danger',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '请输入验证码!'
			});
			return false;
		}else if (emailcode!=yzm){
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
		var tel = $("#tel").val();
		if (tel != null && tel != '' & isTel.test(tel)){
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
				discription: '请输入手机号'
			});
		}

	}
	function sendEmailCode() {
		var tel = $("#email").val();
		if (tel != null && tel != '' & isEmail.test(tel)){
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
				discription: '请输入邮箱'
			});
		}

	}
	$("#xieyi").click(function () {
		$("#doc-modal-2").modal('open');
	})
	$("#xieyi2").click(function () {
		$("#doc-modal-2").modal('open');
	})

</script>
</body>

</html>