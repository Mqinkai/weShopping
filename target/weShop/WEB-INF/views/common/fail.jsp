<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/14
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>失败</title>
    <style>
        .fail {
            width: 700px;
            height: 400px;
            position: fixed;
            left: 50%;
            top: 50%;
            z-index: 11;
            /*设定这个div的margin-top的负值为自身的高度的一半,margin-left的值也是自身的宽度的一半的负值.*/
            /*宽为400,那么margin-top为-200px*/
            /*高为200那么margin-left为-100px;*/
            margin: -200px 0 0 -350px;
        }
    </style>
</head>
<body>
<div class="fail"> <img src="/static/img/fail.gif"><h1>${message}</h1></div>
</body>
</html>
