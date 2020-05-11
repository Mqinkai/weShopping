<%--
  Created by IntelliJ IDEA.
  User: sure
  Date: 2016/8/19
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<html style="overflow-x:auto;overflow-y:auto;">
<head>
    <title><sitemesh:title/></title>
    <%@include file="/WEB-INF/views/include/ztreelayout.jsp" %>
    <sitemesh:head/>
</head>
<body>
<sitemesh:body/>
</body>
</html>