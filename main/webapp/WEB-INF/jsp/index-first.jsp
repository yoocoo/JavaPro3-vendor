<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/4/26
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
</head>
<body>
<!--main-container-part-->
<div id="content">
    <!--breadcrumbs-->
    <div id="content-header">
        <div id="breadcrumb"><a href="<%=request.getContextPath()%>/mvc/home" title="欢迎回来，竭诚为您服务" class="tip-bottom"><i
                class="icon-home"></i>
            首页</a></div>
    </div>
    <!--End-breadcrumbs-->

    <!--Action boxes-->
    <div class="container-fluid">
        <div class="quick-actions_homepage">
            <ul class="quick-actions">
                <li class="bg_lb"><a href="#"> <i class="icon-dashboard"></i> <span
                        class="label label-important">20</span> 首页</a></li>
                <li class="bg_lg span3"><a href="#"> <i class="icon-signal"></i> 图形和数据</a></li>
                <li class="bg_ly span3"><a href="#"> <i class="icon-inbox"></i><span
                        class="label label-success">101</span> 账号管理</a></li>
                <li class="bg_lo"><a href="#"> <i class="icon-th"></i> 售货机管理</a></li>
                <li class="bg_lo span3"><a href="#"> <i class="icon-th-list"></i> 报表统计</a></li>
                <li class="bg_ls span3"><a href="#"> <i class="icon-tint"></i>生产商管理员登陆</a></li>
                <li class="bg_lg"><a href="#"> <i class="icon-calendar"></i> 日历</a></li>
                <li class="bg_lr"><a href="#"> <i class="icon-info-sign"></i> 备注</a></li>
            </ul>
        </div>
        <!--End-Action boxes-->

        <!--Chart-box-->
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
        </div>
        <!--End-Chart-box-->
        <hr/>


    </div>
</div>

<script type="text/javascript" charset="utf-8" src="/static/js/tab.js"></script>
<!--end-main-container-part-->
</body>
</html>
