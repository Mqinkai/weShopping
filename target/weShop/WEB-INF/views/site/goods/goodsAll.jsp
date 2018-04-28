<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<link href="<%=path%>/static/css/qiantai.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript">
        function go(index)
        {
            window.location.href="/goodsAll.action?index="+index;
        }
    </script>
	  <style type="text/css">
		  .logo{
			  margin-left: -400px;
		  }
	  </style>
  </head>
  
<body>
<div class="main">
	  <div class="header">
		    <div class="header_resize">
			      <div class="logo"><br/><h1 style="font-size: 26px;">个人二手物品交易网站<small>&nbsp;</small></h1></div>
				      <jsp:include flush="true" page="${ctx}/WEB-INF/views/site/daohang.jsp"></jsp:include>
			      <div class="clr"></div>
		    </div>
	  </div>
	  <div class="content">
		    <div class="content_resize">
			      <div class="mainbar">
				        <!--  -->
				        <div class="article">
					          <h2>物品展示</h2><div class="clr"></div>
					          <div>

							     <TABLE class=main border=0 cellSpacing=2 cellPadding=2>
					                  <TR
						                 <c:forEach items="${message}" var="goods" varStatus="sta">
						                  <c:if test="${sta.index%4==0}">
						                       </tr><tr>
						                    </c:if>

							                  <TABLE onmouseover="this.style.backgroundColor='#FF6600'" onmouseout="this.style.backgroundColor=''" border=0 cellSpacing=1 cellPadding=2 width=98 bgColor=#e1e1e1 align=center height=100>
							                    <TR>
							                      <TD bgColor=#ffffff  align=left>
							                        <P align="center">
							                           <A href="<%=path %>/goodsDetailQian.action?id=${goods.id }"><IMG border=0 align=absMiddle src="<%=path %>${goods.fujian}" width=150 height=140></A>

							                           <center><A href="<%=path %>/goodsDetailQian.action?id=${goods.id }"><FONT color=#ff0000></FONT>${goods.mingcheng }</A></center>
							                        </P>
							                      </TD>
							                    </TR>
							                  </TABLE>
							                </TD>
						                  </c:forEach>
						              </TR>
					               </TABLE>
					               <div align="center">

				            </div>
					          </div>
					          <p class="spec"></p>
				        </div>
				        <!--  -->
			      </div>
			     <%-- <div class="sidebar">
				        <jsp:include flush="true" page="${ctx}/WEB-INF/views/site/left.jsp"></jsp:include>
			      </div>--%>
			      <div class="clr"></div>
		    </div>
	  </div>

	  <div class="fbg">
	    <div  align="center" style="
    margin-top: 700px;">
	         版权所有 @2014-2018 青岛理工大学 宋明杰
	    </div>
	  </div>
</div>


</body>
</html>
