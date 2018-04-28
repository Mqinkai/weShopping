
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>跳转</title>
</head>
<body>
<script language = "javascript" type = "text/javascript">
    var url="${ctx}/message/show";

    setTimeout("javascript:clearInterval(mytime); window.location.href=url;",5000);//延迟5秒跳转，clearInterval() 方法可取消由 setInterval() 设置的 timeout。
    function changeSec(){
        document.getElementById("myspan").innerText =
                parseInt(document.getElementById("myspan").innerText) - 1;
    }
    var mytime = setInterval("changeSec()",1000);//setInterval() 方法可按照指定的周期（以毫秒计）来调用函数或计算表达式。
</script>
登陆成功 <span id = "myspan">5</span> 秒钟后自动跳转至<a href="/message/show">首页</a>
</body>
</html>
