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

	<thead>
	<tr align="center" bgcolor="#FAFAF1" height="22">
		<th>序号</th>
		<th>发布人</th>
		<th>商品名</th>
		<th>类别</th>
		<th>二级类别</th>
		<th>价格</th>
		<th>销售状态</th>
		<th>原价</th>
		<th>付款方式</th>
		<th>操作</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${goodsList}" var="goods" varStatus="ss">
		<tr>
			<td>
					${goods.id}
			</td>
			<td>
					${goods.fbid}
			</td>
			<td>
					${goods.mingcheng}
			</td>
			<td>
					${goods.leibieName}
			</td>
			<td>
					${goods.leibiexiashuId}
			</td>
			<td>
					${goods.jiage}
			</td>
			<td>
					${goods.saleflag}
			</td>
			<td>
					${goods.yuanjia}
			</td>
			<td>
					${goods.fkfs}
			</td>

			<td>
				<a href="javascript: void(0)" onclick="openmodel(${goods.id})"><i class="am-icon-eye"></i>查看商品详情</a>
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
</script>
</body>
</html>