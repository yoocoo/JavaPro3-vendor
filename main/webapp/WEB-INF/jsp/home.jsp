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
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>系统首页</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%--引入公共CSS 样式--%>
    <%@ include file="/WEB-INF/jsp/common_css.jsp" %>
</head>
<SCRIPT type="text/javascript">
    var tabOnSelect = function (title) {
        //根据标题获取tab对象
        var currTab = $('#tabs').tabs('getTab', title);
        var iframe = $(currTab.panel('options').content);//获取标签的内容

        var src = iframe.attr('src');//获取iframe的src
        //当重新选中tab时将ifram的内容重新加载一遍，目的是获取当前页面的最新内容
        if (src)
            $('#tabs').tabs('update', {
                tab: currTab,
                options: {
                    content: createFrame(src)//ifram内容
                }
            });

    };
    $('#tabs').tabs('add', {
        title: '欢迎使用',
        content: createFrame('WEB-INF/jsp/index_first.jsp')
    }).tabs({
        //当重新选中tab时将ifram的内容重新加载一遍
        onSelect: tabOnSelect
    });

    //帮助
    function showhelp() {
        window.open('#', '帮助文档');
    }


</SCRIPT>
<body>
<%--提示信息：${result}<br>--%>
<%--信息：${message}<br>--%>

<!-- navbar 顶部导航-->
<%--<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"--%>
<%--data-am-offcanvas="{target: '#admin-offcanvas'}">--%>
<%--<!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>--%>

<%--引入左侧菜单栏--%>
<%@ include file="index_menu.jsp" %>

<%--引入顶部导航jsp  --%>
<%@ include file="/WEB-INF/jsp/index_nav.jsp" %>


<%--页面主体切换模式开始--%>

<%--四月静态模式页面切换--%>
<%--<%@ include file="/WEB-INF/jsp/index_first.jsp" %>--%>
<%--<%@ include file="/WEB-INF/jsp/list_action_log.jsp" %>--%>

<%--五月更进页面切换模式--%>
<div id="mainPanle" region="center">
<div id="tabs" border="false" fit="true"></div>
</div>

<!-- 引入页面底部文件Footer-part-->
<%@ include file="/WEB-INF/jsp/index_footer.jsp" %>
<!--end-Footer-part-->

<%--引入公共的js脚本，防止页面部分功能冲突--%>
<%@ include file="/WEB-INF/jsp/common_js.jsp" %>
<!--end-javascript-part-->
<script type="text/javascript" src="<c:url value='/static/js/jquery.easyui.min.1.2.2.js'/>"></script>
</body>
</html>