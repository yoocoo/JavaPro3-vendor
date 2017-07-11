<%--
  Created by IntelliJ IDEA.
  User: 王娇
  Date: 2017/7/10
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 注册售货机 </title>
    <%--引入CSS 样式 start--%>
    <link rel="shortcut icon" href="<c:url value='/static/img/favicon.ico'/>"/>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/bootstrap/dist/css/bootstrap.min.css'/>">
    <!-- Font Awesome -->
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/font-awesome/css/font-awesome.min.css'/>">
    <!-- NProgress -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/nprogress/nprogress.css'/>">
    <!-- Custom Theme Style -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/build/css/custom.min.css'/>">
<body>










<%--==========================脚本开始===================================================--%>
<!-- jQuery -->
<script type="text/javascript" src="<c:url value='/static/vendors/jquery/dist/jquery.min.js'/>"></script>
<!-- Bootstrap -->
<script type="text/javascript" src="<c:url value='/static/vendors/bootstrap/dist/js/bootstrap.min.js'/>"></script>
<!-- FastClick -->
<script type="text/javascript" src="<c:url value='/static/vendors/fastclick/lib/fastclick.js'/>"></script>
<!-- NProgress -->
<script type="text/javascript" src="<c:url value='/static/vendors/nprogress/nprogress.js'/>"></script>
<!-- jQuery Smart Wizard -->
<%--比较有利用价值的系统后台模板的表单验证--%>
<script type="text/javascript" src="<c:url value='/static/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js'/>"></script>
<!-- validator -->
<%--<script type="text/javascript" src="<c:url value='/static/vendors/validator/validator.js'/>"></script>--%>
<!-- Custom Theme Scripts -->
<script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>
<%--判断消息提示脚本引用-公共引用 锁定焦点提示--%>
<script type="text/javascript" src="<c:url value='/static/js/common/jquery.tips.js'/>"></script>
</body>
</html>
