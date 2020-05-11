<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link rel="stylesheet" href="/static/ios/honeySwitch.css">

	<script src="/static/ios/honeySwitch.js"></script>

</head>

<body>
<div><br></br></div>
<table class="table table-hover">

	<thead>
	<tr align="center" bgcolor="#FAFAF1" height="22">
		<th>序号</th>
		<th>用户名</th>
		<th>姓名</th>
		<th>性别</th>
		<th>地址</th>
		<th>电话</th>
		<th>邮箱</th>
		<th>启/停用</th>
		<th>操作</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${huiyuanList}" var="huiyuan" varStatus="ss">
		<tr>
			<td>
					${huiyuan.id}
			</td>
			<td>
					${huiyuan.userName}
			</td>
			<td>
					${huiyuan.xingming}
			</td>
			<td>
				<c:choose>
					<c:when test="${huiyuan.xingbie == '1'}">
						男
					</c:when>
					<c:when test="${huiyuan.xingbie == '2'}">
						女
					</c:when>
					<c:when test="${huiyuan.xingbie == '3'}">
						保密
					</c:when>
				</c:choose>
			</td>
			<td>
					${huiyuan.address}
			</td>
			<td>
					${huiyuan.tel}
			</td>
			<td>
					${huiyuan.email}
			</td>

			<td>
				<c:choose>
					<c:when test="${huiyuan.code == '最高管理员'}">
						<c:choose>
							<c:when test="${huiyuan.del == '0'}">
								<div class="cell-right"><span class="switch-on switch-disabled" id="${huiyuan.id}"></span></div>
							</c:when>
							<c:otherwise>
								<div class="cell-right"><span class="switch-off switch-disabled" id="${huiyuan.id}"></span></div>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:when test="${huiyuan.code == '管理员'}">
						<c:choose>
							<c:when test="${admin.code == '最高管理员'}">
								<c:choose>
									<c:when test="${huiyuan.del == '0'}">
										<div class="cell-right"><span class="switch-on" id="${huiyuan.id}"></span></div>
									</c:when>
									<c:otherwise>
										<div class="cell-right"><span class="switch-off" id="${huiyuan.id}"></span></div>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${huiyuan.del == '0'}">
										<div class="cell-right"><span class="switch-on switch-disabled" id="${huiyuan.id}"></span></div>
									</c:when>
									<c:otherwise>
										<div class="cell-right"><span class="switch-off switch-disabled" id="${huiyuan.id}"></span></div>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>

					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${huiyuan.del == '0'}">
								<div class="cell-right"><span class="switch-on" id="${huiyuan.id}"></span></div>
							</c:when>
							<c:otherwise>
								<div class="cell-right"><span class="switch-off" id="${huiyuan.id}"></span></div>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>


			</td>

			<td>
				<c:choose>
					<c:when test="${admin.code == '最高管理员'}">
						<c:choose>
							<c:when test="${huiyuan.code=='普通会员'}">
								<a href="javascript: void(0)" onclick="admin(${huiyuan.id})"><i class="am-icon-user"></i>设为管理员</a>
							</c:when>
							<c:otherwise>
								<a href="javascript: void(0)" onclick="qxadmin(${huiyuan.id})"><i class="am-icon-ban"></i>取消管理员</a>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<a href="javascript: void(0)" style="color: slategray"><i class="am-icon-exclamation"></i>（无权操作）</a>
					</c:otherwise>
				</c:choose>

			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">商品详情</h4>
			</div>
			<div class="modal-body" id="detail"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<script type="text/javascript">
	var ctx = "${ctx}";
	function delgonggao(id) {
		$.ajax({
			type: 'get',
			url: '${ctx}/gonggao/delgonggao?id='+id,
			dataType: 'json',
			success: function(data){
				if (data.code =='1'){
					window.location.reload();;
				}
			}
		});
	}
	function save() {
		var gonggao = $("#gonggao").val();
		if (gonggao ==null || gonggao ==''){
			$("").dailog({
				type: 'warning',
				showBoxShadow: true,
				animateStyle: 'none',
				bottons: ['确定'],
				discription: '请填写内容'
			});
		}else {
			$.ajax({
				type: 'post',
				url: '${ctx}/gonggao/save',
				data:{lable:gonggao},
				dataType: 'json',
				success: function(data){
					if (data.code =='1'){
						window.location.reload();;
					}
				}
			});
		}
	}
	function openmodel(id) {
		$.ajax({
			type: 'get',
			url: '${ctx}/goods/openDetail?id='+id,
			dataType: 'json',
			success: function(data){
				if (data.code =='1'){
					//window.location.reload();;
					$("#detail").html(data.message);
					$('#myModal').modal('show');
				}
			}
		});
	}
	function admin(id) {
		$.ajax({
			type: 'get',
			url: '${ctx}/huiyuanGL/admin?id='+id,
			dataType: 'json',
			success: function(data){
				if (data.code =='1'){
					window.location.reload();

				}
			}
		});
	}
	function qxadmin(id) {
		$.ajax({
			type: 'get',
			url: '${ctx}/huiyuanGL/qxadmin?id='+id,
			dataType: 'json',
			success: function(data){
				if (data.code =='1'){
					window.location.reload();

				}
			}
		});
	}
</script>
</body>
</html>