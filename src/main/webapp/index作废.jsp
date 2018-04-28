<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<h2>Hello World!</h2>


<script type="text/javascript">
    var url="${ctx}/message/show";
    window.location.href=url;
</script>
</body>
</html>
