<%--
  Created by IntelliJ IDEA.
  User: ThinkPad  WJ
  Date: 2017/4/9
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <title>系统首页</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="shortcut icon" href="<c:url value='/static/img/favicon.ico'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/bootstrap.min.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/bootstrap-responsive.min.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/fullcalendar.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/matrix-style.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/matrix-media.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/select2.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/font-awesome/css/font-awesome.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/jquery.gritter.css'/>">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>

<body>
<%--提示信息：${result}<br>--%>
<%--信息：${message}<br>--%>

<!-- navbar -->
<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
   data-am-offcanvas="{target: '#admin-offcanvas'}">
    <!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>

<%--引入左侧菜单栏--%>
<%@ include file="index-menu.jsp" %>
<%--引入顶部导航jsp  --%>
<%@ include file="/WEB-INF/jsp/index-nav.jsp" %>


<%--页面主体切换模式开始--%>

<%@ include file="/WEB-INF/jsp/index-first.jsp" %>
<%--<%@ include file="/WEB-INF/jsp/list_action_log.jsp" %>--%>

<%--<section id="main" class="column">--%>
<%--<div>--%>
<%--<iframe name="mainFrame" id="mainFrame" frameborder="0"--%>
<%--src="/index-first.do"></iframe>--%>
<%--></iframe>--%>
<%--</div>--%>
<%--</section>--%>


<!-- 引入页面底部文件Footer-part-->
<%@ include file="/WEB-INF/jsp/index-footer.jsp" %>
<!--end-Footer-part-->

<%--<script type="text/javascript" src="<c:url value='/static/js/jquery-3.1.1.min.js'/>"></script>--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.ui.custom.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/excanvas.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.flot.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.flot.resize.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.peity.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/fullcalendar.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.dashboard.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.gritter.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.interface.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.chat.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.validate.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.form_validation.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.wizard.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.uniform.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/select2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.popover.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.dataTables.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.tables.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.tips.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.ajaxfileupload.js'/>"></script>


</body>
</html>