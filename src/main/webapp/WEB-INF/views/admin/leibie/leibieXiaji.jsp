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

        <th width="10%">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${xiajiList}" var="leibie" varStatus="ss">
        <tr>
            <td>
                    ${leibie.id}
            </td>
            <td>
                    ${leibie.mingcheng}
            </td>

            <td>
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
            url: '${ctx}/leibie/delXs?id='+id,
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
        var leibieId = ${leibieId};
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
                url: '${ctx}/leibie/saveXs',
                data:{mingcheng:mingcheng,id:leibieId},
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