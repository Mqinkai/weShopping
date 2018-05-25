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

</head>

<body>
<div><br></br></div>
<table class="table table-hover">
	<caption style="padding: 8px"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">新增类别</button></caption>
	<thead>
	<tr align="center" bgcolor="#FAFAF1" height="22">
		<th width="5%">序号</th>
		<th width="65%">名称</th>
		<th width="20%">是否推荐</th>
		<th width="10%">操作</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${leibieList}" var="leibie" varStatus="ss">
		<tr>
			<td>
					${leibie.id}
			</td>
			<td>
					${leibie.mingcheng}
			</td>
			<td>
				<c:choose>
					<c:when test="${leibie.tuijian} =='1'">
						是
					</c:when>
					<c:otherwise>
						否
					</c:otherwise>
				</c:choose>
			</td>

			<td>
				<c:choose>
					<c:when test="${leibie.tuijian} =='1'">
						<a href="javascript: void(0)" onclick="qxtj(${leibie.id})"><i class="far fa-thumbs-down"></i>取消推荐 </a>|
					</c:when>
					<c:otherwise>
						<a href="javascript: void(0)" onclick="tuijian(${leibie.id})"><i class="far fa-thumbs-up"></i>推荐 </a>|
					</c:otherwise>
				</c:choose>

				<a href="${ctx}/leibie/xiaji?id=${leibie.id}"><i class="fas fa-bars"></i>查看下级</a> |
				<a href="javascript: void(0)" onclick="del(${leibie.id})"><i class="fas fa-trash-alt"></i>删除</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">新增类别</h4>
			</div>
			<div class="modal-body">
				<span class="input-group-addon">名称</span>
				<input type="text" class="form-control" placeholder="默认为不推荐，若要推荐请手动设置" id="mingcheng">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="save()">提交</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<script type="text/javascript">
	function del(id) {
		$.ajax({
			type: 'get',
			url: '${ctx}/leibie/del?id='+id,
			dataType: 'json',
			success: function(data){
				if (data.code =='1'){
					window.location.reload();;
				}
			}
		});
	}
	function tuijian(id) {
		$.ajax({
			type: 'get',
			url: '${ctx}/leibie/tuijian?id='+id,
			dataType: 'json',
			success: function(data){
				if (data.code =='1'){
					window.location.reload();
				}else {
					setTimeout(function () {
						window.location.reload();
					}, 3000);
				}
			}
		});
	}
	function qxtj(id) {
		$.ajax({
			type: 'get',
			url: '${ctx}/leibie/qxtj?id='+id,
			dataType: 'json',
			success: function(data){
				if (data.code =='1'){
					window.location.reload();;
				}
			}
		});
	}
	function save() {
		var mingcheng = $("#mingcheng").val();
		if (mingcheng ==null || mingcheng ==''){
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
				url: '${ctx}/leibie/save',
				data:{mingcheng:mingcheng},
				dataType: 'json',
				success: function(data){
					if (data.code =='1'){
						window.location.reload();;
					}
				}
			});
		}
	}

</script>
</body>
</html>