<%--
  Created by IntelliJ IDEA.
  User: 王娇
  Date: 2017/6/29
  Time: 10:10
  说明： 后台首页（新版）
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>系统首页</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/bootstrap/dist/css/bootstrap.min.css'/>">
    <!-- Font Awesome -->
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/font-awesome/css/font-awesome.min.css'/>">
    <!-- NProgress -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/nprogress/nprogress.css'/>">
    <!-- iCheck -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/iCheck/skins/flat/green.css'/>">

    <!-- bootstrap-progressbar -->
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css'/>">
    <!-- JQVMap -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/vendors/jqvmap/dist/jqvmap.min.css'/>">
    <!-- bootstrap-daterangepicker -->
    <link type="text/css" rel="stylesheet"
          href="<c:url value='/static/vendors/bootstrap-daterangepicker/daterangepicker.css'/>">
    <!-- Custom Theme Style -->
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/build/css/custom.min.css'/>">
    <%--引入CSS 样式 end --%>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">

        <%--引入左部内容，包括左侧权限菜单，以及修改个人头像模态弹窗--%>
        <%--引入顶部导航jsp  --%>
        <%@ include file="/WEB-INF/jsp/index_body/index_left_col.jsp" %>

        <%--引入顶部导航栏，包括下拉菜单，以及查看个人资料模态弹窗--%>
        <!-- top navigation -->
        <%@ include file="/WEB-INF/jsp/index_body/index_top_nav.jsp" %>
        <!-- /top navigation -->

        <%--右侧Tab主要内容--%>

            <!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                <!-- top tiles -->
                <div class="row tile_count">
                    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                        <span class="count_top"><i class="fa fa-user"></i> 总用户</span>
                        <div class="count">2500</div>
                        <span class="count_bottom"><i class="green">4% </i> From last Week</span>
                    </div>
                    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                        <span class="count_top"><i class="fa fa-clock-o"></i> 统计 二</span>
                        <div class="count">123.50</div>
                        <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
                    </div>
                    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                        <span class="count_top"><i class="fa fa-user"></i> 统计 二</span>
                        <div class="count green">2,500</div>
                        <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
                    </div>
                    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                        <span class="count_top"><i class="fa fa-user"></i> 统计 二</span>
                        <div class="count">4,567</div>
                        <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> From last Week</span>
                    </div>
                    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                        <span class="count_top"><i class="fa fa-user"></i> 统计 二</span>
                        <div class="count">2,315</div>
                        <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
                    </div>
                    <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                        <span class="count_top"><i class="fa fa-user"></i> 统计 二</span>
                        <div class="count">7,325</div>
                        <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
                    </div>
                </div>
                <!-- /top tiles -->

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="dashboard_graph">

                            <div class="row x_title">
                                <div class="col-md-6">
                                    <h3>网络统计 <small>---数据图</small></h3>
                                </div>
                                <div class="col-md-6">
                                    <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                                        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                        <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div id="chart_plot_01" class="demo-placeholder"></div>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-12 bg-white">
                                <div class="x_title">
                                    <h2>数据走势</h2>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="col-md-12 col-sm-12 col-xs-6">
                                    <div>
                                        <p>1</p>
                                        <div class="">
                                            <div class="progress progress_sm" style="width: 76%;">
                                                <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="80"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <p>2</p>
                                        <div class="">
                                            <div class="progress progress_sm" style="width: 76%;">
                                                <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="60"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12 col-xs-6">
                                    <div>
                                        <p>3</p>
                                        <div class="">
                                            <div class="progress progress_sm" style="width: 76%;">
                                                <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="40"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <p>4</p>
                                        <div class="">
                                            <div class="progress progress_sm" style="width: 76%;">
                                                <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                    <br/>

                <div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="x_panel tile fixed_height_320">
                            <div class="x_title">
                                <h2>A图</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">设置 1</a>
                                            </li>
                                            <li><a href="#">设置 2</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <h4>A图介绍</h4>
                                <div class="widget_summary">
                                    <div class="w_left w_25">
                                        <span>0.1.5.2</span>
                                    </div>
                                    <div class="w_center w_55">
                                        <div class="progress">
                                            <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 66%;">
                                                <span class="sr-only">60% Complete</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="w_right w_20">
                                        <span>123k</span>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="widget_summary">
                                    <div class="w_left w_25">
                                        <span>0.1.5.3</span>
                                    </div>
                                    <div class="w_center w_55">
                                        <div class="progress">
                                            <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 45%;">
                                                <span class="sr-only">60% Complete</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="w_right w_20">
                                        <span>53k</span>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="widget_summary">
                                    <div class="w_left w_25">
                                        <span>0.1.5.4</span>
                                    </div>
                                    <div class="w_center w_55">
                                        <div class="progress">
                                            <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 25%;">
                                                <span class="sr-only">60% Complete</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="w_right w_20">
                                        <span>23k</span>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="widget_summary">
                                    <div class="w_left w_25">
                                        <span>0.1.5.5</span>
                                    </div>
                                    <div class="w_center w_55">
                                        <div class="progress">
                                            <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 5%;">
                                                <span class="sr-only">60% Complete</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="w_right w_20">
                                        <span>3k</span>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="widget_summary">
                                    <div class="w_left w_25">
                                        <span>0.1.5.6</span>
                                    </div>
                                    <div class="w_center w_55">
                                        <div class="progress">
                                            <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 2%;">
                                                <span class="sr-only">60% Complete</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="w_right w_20">
                                        <span>1k</span>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="x_panel tile fixed_height_320 overflow_hidden">
                            <div class="x_title">
                                <h2>B图</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">设置 1</a>
                                            </li>
                                            <li><a href="#">设置 2</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <table class="" style="width:100%">
                                    <tr>
                                        <th style="width:37%;">
                                            <p>前五</p>
                                        </th>
                                        <th>
                                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                                <p class="">详情</p>
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                <p class="">比率</p>
                                            </div>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <canvas class="canvasDoughnut" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas>
                                        </td>
                                        <td>
                                            <table class="tile_info">
                                                <tr>
                                                    <td>
                                                        <p><i class="fa fa-square blue"></i>IOS </p>
                                                    </td>
                                                    <td>30%</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <p><i class="fa fa-square green"></i>Android </p>
                                                    </td>
                                                    <td>10%</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <p><i class="fa fa-square purple"></i>Blackberry </p>
                                                    </td>
                                                    <td>20%</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <p><i class="fa fa-square aero"></i>Symbian </p>
                                                    </td>
                                                    <td>15%</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <p><i class="fa fa-square red"></i>Others </p>
                                                    </td>
                                                    <td>30%</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="x_panel tile fixed_height_320">
                            <div class="x_title">
                                <h2>快速定位</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">设置 1</a>
                                            </li>
                                            <li><a href="#">设置 2</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="dashboard-widget-content">
                                    <ul class="quick-list">
                                        <li><i class="fa fa-calendar-o"></i><a href="#">设置</a>
                                        </li>
                                        <li><i class="fa fa-bars"></i><a href="#">菜单五</a>
                                        </li>
                                        <li><i class="fa fa-bar-chart"></i><a href="#">菜单四</a> </li>
                                        <li><i class="fa fa-line-chart"></i><a href="#">菜单三</a>
                                        </li>
                                        <li><i class="fa fa-bar-chart"></i><a href="#">菜单二</a> </li>
                                        <li><i class="fa fa-line-chart"></i><a href="#">菜单一</a>
                                        </li>
                                        <li><i class="fa fa-area-chart"></i><a href="#">退出</a>
                                        </li>
                                    </ul>

                                    <div class="sidebar-widget">
                                        <h4>Profile Completion</h4>
                                        <canvas width="150" height="80" id="chart_gauge_01" class="" style="width: 160px; height: 100px;"></canvas>
                                        <div class="goal-wrapper">
                                            <span id="gauge-text" class="gauge-value pull-left">0</span>
                                            <span class="gauge-value pull-left">%</span>
                                            <span id="goal-text" class="goal-value pull-right">100%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Recent Activities <small>Sessions</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">Settings 1</a>
                                            </li>
                                            <li><a href="#">Settings 2</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="dashboard-widget-content">

                                    <ul class="list-unstyled timeline widget">
                                        <li>
                                            <div class="block">
                                                <div class="block_content">
                                                    <h2 class="title">
                                                        <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                                                    </h2>
                                                    <div class="byline">
                                                        <span>13 hours ago</span> by <a>Jane Smith</a>
                                                    </div>
                                                    <p class="excerpt">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and… <a>Read&nbsp;More</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="block">
                                                <div class="block_content">
                                                    <h2 class="title">
                                                        <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                                                    </h2>
                                                    <div class="byline">
                                                        <span>13 hours ago</span> by <a>Jane Smith</a>
                                                    </div>
                                                    <p class="excerpt">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and… <a>Read&nbsp;More</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="block">
                                                <div class="block_content">
                                                    <h2 class="title">
                                                        <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                                                    </h2>
                                                    <div class="byline">
                                                        <span>13 hours ago</span> by <a>Jane Smith</a>
                                                    </div>
                                                    <p class="excerpt">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and… <a>Read&nbsp;More</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="block">
                                                <div class="block_content">
                                                    <h2 class="title">
                                                        <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                                                    </h2>
                                                    <div class="byline">
                                                        <span>13 hours ago</span> by <a>Jane Smith</a>
                                                    </div>
                                                    <p class="excerpt">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and… <a>Read&nbsp;More</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8 col-sm-8 col-xs-12">


                        <div class="row">

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Visitors location <small>geo-presentation</small></h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#">Settings 1</a>
                                                    </li>
                                                    <li><a href="#">Settings 2</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <div class="dashboard-widget-content">
                                            <div class="col-md-4 hidden-small">
                                                <h2 class="line_30">125.7k Views from 60 countries</h2>

                                                <table class="countries_list">
                                                    <tbody>
                                                    <tr>
                                                        <td>United States</td>
                                                        <td class="fs15 fw700 text-right">33%</td>
                                                    </tr>
                                                    <tr>
                                                        <td>France</td>
                                                        <td class="fs15 fw700 text-right">27%</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Germany</td>
                                                        <td class="fs15 fw700 text-right">16%</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Spain</td>
                                                        <td class="fs15 fw700 text-right">11%</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Britain</td>
                                                        <td class="fs15 fw700 text-right">10%</td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div id="world-map-gdp" class="col-md-8 col-sm-12 col-xs-12" style="height:230px;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">


                            <!-- Start to do list -->
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>To Do List <small>Sample tasks</small></h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#">Settings 1</a>
                                                    </li>
                                                    <li><a href="#">Settings 2</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">

                                        <div class="">
                                            <ul class="to_do">
                                                <li>
                                                    <p>
                                                        <input type="checkbox" class="flat"> Schedule meeting with new client </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <input type="checkbox" class="flat"> Create email address for new intern</p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <input type="checkbox" class="flat"> Have IT fix the network printer</p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <input type="checkbox" class="flat"> Copy backups to offsite location</p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <input type="checkbox" class="flat"> Food truck fixie locavors mcsweeney</p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <input type="checkbox" class="flat"> Food truck fixie locavors mcsweeney</p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <input type="checkbox" class="flat"> Create email address for new intern</p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <input type="checkbox" class="flat"> Have IT fix the network printer</p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <input type="checkbox" class="flat"> Copy backups to offsite location</p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End to do list -->

                            <!-- start of weather widget -->
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Daily active users <small>Sessions</small></h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#">Settings 1</a>
                                                    </li>
                                                    <li><a href="#">Settings 2</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="temperature"><b>Monday</b>, 07:30 AM
                                                    <span>F</span>
                                                    <span><b>C</b></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="weather-icon">
                                                    <canvas height="84" width="84" id="partly-cloudy-day"></canvas>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="weather-text">
                                                    <h2>Texas <br><i>Partly Cloudy Day</i></h2>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="weather-text pull-right">
                                                <h3 class="degrees">23</h3>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>

                                        <div class="row weather-days">
                                            <div class="col-sm-2">
                                                <div class="daily-weather">
                                                    <h2 class="day">Mon</h2>
                                                    <h3 class="degrees">25</h3>
                                                    <canvas id="clear-day" width="32" height="32"></canvas>
                                                    <h5>15 <i>km/h</i></h5>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="daily-weather">
                                                    <h2 class="day">Tue</h2>
                                                    <h3 class="degrees">25</h3>
                                                    <canvas height="32" width="32" id="rain"></canvas>
                                                    <h5>12 <i>km/h</i></h5>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="daily-weather">
                                                    <h2 class="day">Wed</h2>
                                                    <h3 class="degrees">27</h3>
                                                    <canvas height="32" width="32" id="snow"></canvas>
                                                    <h5>14 <i>km/h</i></h5>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="daily-weather">
                                                    <h2 class="day">Thu</h2>
                                                    <h3 class="degrees">28</h3>
                                                    <canvas height="32" width="32" id="sleet"></canvas>
                                                    <h5>15 <i>km/h</i></h5>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="daily-weather">
                                                    <h2 class="day">Fri</h2>
                                                    <h3 class="degrees">28</h3>
                                                    <canvas height="32" width="32" id="wind"></canvas>
                                                    <h5>11 <i>km/h</i></h5>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="daily-weather">
                                                    <h2 class="day">Sat</h2>
                                                    <h3 class="degrees">26</h3>
                                                    <canvas height="32" width="32" id="cloudy"></canvas>
                                                    <h5>10 <i>km/h</i></h5>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- end of weather widget -->
                        </div>
                    </div>
                </div>

            </div>
            <!-- /page content -->

            <!-- footer content -->
            <footer>
                <div class="pull-right"> ZJNU - Bootstrap Admin -功夫不负有心人
                </div>
                <div class="clearfix"></div>
            </footer>
            <!-- /footer content -->
    </div>
</div>


<!-- jQuery -->
<script type="text/javascript" src="<c:url value='/static/vendors/jquery/dist/jquery.min.js'/>"></script>
<!-- Bootstrap -->
<script type="text/javascript" src="<c:url value='/static/vendors/bootstrap/dist/js/bootstrap.min.js'/>"></script>
<!-- FastClick -->
<script type="text/javascript" src="<c:url value='/static/vendors/fastclick/lib/fastclick.js'/>"></script>
<!-- FastClick -->
<script type="text/javascript" src="<c:url value='/static/vendors/fastclick/lib/fastclick.js'/>"></script>
<!-- NProgress -->
<script type="text/javascript" src="<c:url value='/static/vendors/nprogress/nprogress.js'/>"></script>
<!-- Chart.js -->
<script type="text/javascript" src="<c:url value='/static/vendors/Chart.js/dist/Chart.min.js'/>"></script>

<!-- gauge.js -->
<script type="text/javascript" src="<c:url value='/static/vendors/gauge.js/dist/gauge.min.js'/>"></script>

<!-- bootstrap-progressbar -->
<script type="text/javascript"
        src="<c:url value='/static/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js'/>"></script>
<!-- iCheck -->
<script type="text/javascript" src="<c:url value='/static/vendors/iCheck/icheck.min.js'/>"></script>
<!-- Skycons -->
<script type="text/javascript" src="<c:url value='/static/vendors/skycons/skycons.js'/>"></script>
<!-- Flot -->
<script type="text/javascript" src="<c:url value='/static/vendors/Flot/jquery.flot.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/Flot/jquery.flot.pie.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/Flot/jquery.flot.time.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/Flot/jquery.flot.stack.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/Flot/jquery.flot.resize.js'/>"></script>
<!-- Flot plugins -->
<script type="text/javascript"
        src="<c:url value='/static/vendors/flot.orderbars/js/jquery.flot.orderBars.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/flot-spline/js/jquery.flot.spline.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/flot.curvedlines/curvedLines.js'/>"></script>
<!-- DateJS -->
    <%--<script type="text/javascript" src="<c:url value='/static/vendors/DateJS/build/date.js'/>"></script>--%>
<script type="text/javascript" src="<c:url value='/static/vendors/DateJS/build/date-zh-CN.js'/>"></script>

<!-- JQVMap -->
<script type="text/javascript" src="<c:url value='/static/vendors/jqvmap/dist/jquery.vmap.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/vendors/jqvmap/dist/maps/jquery.vmap.world.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js'/>"></script>
<!-- bootstrap-daterangepicker -->
<script type="text/javascript" src="<c:url value='/static/vendors/moment/min/moment.min.js'/>"></script>
    <script type="text/javascript"
            src="<c:url value='/static/vendors/bootstrap-daterangepicker/bootstrap-datepicker.zh-CN.js'/>"></script>
<script type="text/javascript"
        src="<c:url value='/static/vendors/bootstrap-daterangepicker/daterangepicker.js'/>"></script>

<!-- Custom Theme Scripts -->
<script type="text/javascript" src="<c:url value='/static/build/js/custom.min.js'/>"></script>

</body>
</html>
