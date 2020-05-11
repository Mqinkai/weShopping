<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<%
	String path = request.getContextPath();
%>

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
		<th>订单编号</th>
		<th>下单时间</th>
		<th>状态</th>
		<th>付款方式</th>
		<th>价格</th>
		<th>下单人</th>
		<th>购买商品</th>
		<th>操作</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${orderList}" var="order" varStatus="ss">
		<tr>
			<td>
					${order.id}
			</td>
			<td>
					${order.bianhao}
			</td>
			<td>
					${order.xiadanshi}
			</td>
			<td>
					${order.zt}
			</td>
			<td>
					${order.fukuanfangshi}
			</td>
			<td>
					${order.zongjia}
			</td>
			<td>
					${order.huiyuanId}
			</td>
			<td>
					${order.mingcheng}
			</td>
			<td>
				<c:choose>
					<c:when test="${order.del == '0'}">
						<a href="javascript: void(0)" onclick="openmodel(${order.id})"><i class="am-icon-trash"></i>删除订单</a>
					</c:when>
					<c:otherwise>
						<a href="javascript: void(0)" style="color: #595959">已删除</a>
					</c:otherwise>
				</c:choose>

			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<script type="text/javascript">

	function openmodel(id) {
		$("").dailog(
				{type:'warning',
				 title:'提示.'
				 ,discription:'订单删除后将无法恢复，继续吗？'
				},function(ret)
				{if(ret.index===0)
				{
					$.ajax({
						type: 'get',
						url: '${ctx}/orders/del?id='+id,
						dataType: 'json',
						success: function(data){
							if (data.code =='1'){
								window.location.reload();;

							}
						}
					});
				};})

	}
</script>
</body>
</html>