<%--
  Created by IntelliJ IDEA.
  User: WJ
  Date: 2017/4/25
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>左侧菜单分角色</title>
</head>


<body>

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
    <ul>
        <li class="active"><a href="#"><i class="icon icon-home"></i>首页</a></li>
        <li><a href="charts.html"><i class="icon icon-signal"></i> <span>图形和数据</span></a></li>
        <li class="submenu"><a href="#"><i class="icon icon-inbox"></i> <span>账号管理</span><span
                class="label label-important"></span></a>
            <ul>
                <li><a href="account-user.html">用户管理</a></li>
                <li><a href="account-person.html">修改个人资料</a></li>
                <li><a href="<%=request.getContextPath()%>/mvc/listActionLog">日志列表</a></li>
            </ul>
        </li>
        <li class="submenu"><a href="#"><i class="icon icon-th"></i> <span>售货机管理</span><span
                class="label label-important"></span></a>
            <ul>
                <li><a href="vendor-tables.html">售货机数据</a></li>
                <li><a href="vendor-buyer-search.html">搜索</a></li>
            </ul>
        </li>
        <li class="submenu"><a href="#"><i class="icon icon-th-list"></i> <span>报表统计</span><span
                class="label label-important"></span></a>
            <ul>

                <li><a href="deal-sale.html">商品销售报表</a></li>
                <li><a href="deal-rent.html">租金查询与统计</a></li>
                <li><a href="deal-cash.html">现金交易统计</a></li>
                <li><a href="deal-no-cash.html">非现金交易统计</a></li>
            </ul>
        </li>
    </ul>
</div>
<!--sidebar-menu-->
</body>
</html>
