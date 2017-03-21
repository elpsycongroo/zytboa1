<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

      <title>My JSP 'userList.jsp' starting page</title>


  </head>
  
  <body>
    This is my JSP page. <br>
    <c:forEach items="${userList}" var="u">
    	用户编号：${u.id}<br/>
    	用户名称：${u.name}<hr/>
    </c:forEach>
    
  </body>
</html>
