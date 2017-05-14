<%--
  Created by IntelliJ IDEA.
  User:   WJ
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
<body>
<%--提示信息：${result}<br>--%>
<%--信息：${message}<br>--%>

<%--引入顶部导航jsp  --%>
<%@ include file="/WEB-INF/jsp/index_top_header.jsp" %>

<%--引入左侧菜单栏--%>
<%@ include file="index_siderbar.jsp" %>

<%--页面主体切换模式开始--%>

<!--main-container-part-->
<div id="content">

    <!--breadcrumbs 面包屑导航-->
    <div id="content-header">
        <div id="breadcrumb"><a href="<%=request.getContextPath()%>/mvc/home" title="欢迎回来" class="tip-bottom"><i
                class="icon-home"></i>
            首页</a></div>
    </div>
    <!--End-breadcrumbs-->

    <!--Action boxes  快捷图标导航（包含基本功能）-->
    <div class="container-fluid">
        <div class="quick-actions_homepage">
            <ul class="quick-actions">
                <li class="bg_lb"><a href="<%=request.getContextPath()%>/mvc/home"> <i class="icon-dashboard"></i> <span
                        class="label label-important">20</span> 首页</a></li>
                <li class="bg_lg span3"><a href="#"> <i class="icon-signal"></i> 图形和数据</a></li>
                <li class="bg_ly span3"><a href="#"> <i class="icon-inbox"></i><span
                        class="label label-success">101</span> 账号管理</a></li>
                <li class="bg_lo"><a href="#"> <i class="icon-th"></i> 售货机管理</a></li>
                <li class="bg_lo span3"><a href="#"> <i class="icon-th-list"></i> 报表统计</a></li>
                <li class="bg_ls span3"><a href="#"> <i class="icon-tint"></i>登陆</a></li>
                <li class="bg_lg"><a href="#"> <i class="icon-calendar"></i> 日历</a></li>
                <li class="bg_lr"><a href="#"> <i class="icon-info-sign"></i> 备注</a></li>
            </ul>
        </div>
        <!--End-Action boxes-->

        <!--Chart-box  主要功能箱子start-->
        <div class="row-fluid">

            <div class="widget-box">

                <div class="widget-title bg_lg"><span class="icon"><i class="icon-signal"></i></span>
                    <h5>数据分析</h5>
                </div>

                <div class="widget-content">
                    <div class="row-fluid">
                        <div class="span9">
                            <div class="chart"></div>
                        </div>
                        <div class="span3">
                            <ul class="site-stats">
                                <li class="bg_lh"><i class="icon-user"></i> <strong>2540</strong>
                                    <small>总用户数量</small>
                                </li>
                                <li class="bg_lh"><i class="icon-plus"></i> <strong>120</strong>
                                    <small>增加用户</small>
                                </li>
                                <li class="bg_lh"><i class="icon-shopping-cart"></i> <strong>656</strong>
                                    <small>今日销售额</small>
                                </li>
                                <li class="bg_lh"><i class="icon-tag"></i> <strong>9540</strong>
                                    <small>今日销售数量</small>
                                </li>
                                <li class="bg_lh"><i class="icon-repeat"></i> <strong>10</strong>
                                    <small>缺货机器数量</small>
                                </li>
                                <li class="bg_lh"><i class="icon-globe"></i> <strong>8540</strong>
                                    <small>报警机器数量</small>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <%--End widget-box--%>

        </div>

        <!--End-Chart-box-->
        <hr/>
    </div>
</div>
<!--end-main-container-part-->

<%--1.四月 简单页面切换--%>


<%--2.五月更进页面切换模式,使用的是 easyUI 的 tab.js--%>
<%--<div id="mainPanle" region="center">--%>
<%--<div id="tabs" border="false" fit="true"></div>--%>
<%--</div>--%>

<!-- 引入页面底部文件Footer-part-->
<%@ include file="/WEB-INF/jsp/index_footer.jsp" %>
<!--end-Footer-part-->

<%--引入公共的js脚本，防止页面部分功能冲突--%>
<%@ include file="/WEB-INF/jsp/common_js.jsp" %>
<!--end-javascript-part-->

<%--单独引用js脚本--%>

<%--利用IE支持的VML对象来模拟Canvas的绘图的，home首页图表需要--%>
<script type="text/javascript" src="<c:url value='/static/js/canvas/excanvas.min.js'/>"></script>
<%--图表插件以及响应式图标插件 脚本引用--%>
<script type="text/javascript" src="<c:url value='/static/js/canvas/jquery.flot.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/canvas/jquery.flot.resize.min.js'/>"></script>
<%--Peity是一个jQuery插件，它利用HTML5 <canvas>标签来创建微型图表（sparklines）。--%>
<%--它支持柱状、线状和饼图，图的颜色、宽度、半径、分隔符都可以修改。当数据变化时，图形也立即重新生成。--%>
<%--只能用于支持<canvas>标签的浏览器包括： Chrome、 Firefox、IE9、Opera和Safari。--%>
<script type="text/javascript" src="<c:url value='/static/js/canvas/jquery.peity.min.js'/>"></script>

<%--home首页进度条，快捷菜单，按钮分类等--%>
<script type="text/javascript" src="<c:url value='/static/js/matrix.interface.js'/>"></script>



</body>
<script type="application/javascript">
    $.ajax({
        type: "GET",
        url: '<%=request.getContextPath()%>/actionLog/findLogList?pageNum=1&pageSize=10',
        dataType: 'json', //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
        cache: false,
        success: function(data) {
            if(data.code == 1) {
                for(var i = 0; i < 10; i++) {
                    $("#log-table-body").append("<tr><td>" + data.data[i].id + "</td><td>" +
                        data.data[i].ipAddrV4 + "</td><td>01/01/2016</td><td>" +
                        data.data[i].osName + "</td><td><span class=\"label label-danger\">" +
                        data.data[i].description + "</span></td><td>" +
                        data.data[i].sessionId + "</td><td>" +
                        data.data[i].broName + "</td></tr>");
                }
            }
        }
    });
</script>

</html>