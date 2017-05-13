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
<script type="text/javascript">
    //菜单状态切换

    function siMenu(id, fid, MENU_NAME, MENU_URL) {
        //console.log(id);
        //console.log(fid);
        $("#" + fid).addClass("active open");
        $("#" + id).addClass("active");
        top.mainFrame.tabAddHandler(id, MENU_NAME, MENU_URL);
    }
</script>

<body>

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
    <ul>
        <li class="active"><a href="#"><i class="icon icon-home"></i>首页</a></li>

        <li class="submenu"><a href="#"><i class="icon icon-inbox"></i>
            <span>${tree[0].text}</span>
            <span class="label label-important"></span></a>
            <ul>
                <li><a href="account-user.html">子测试</a></li>
                <li><a href="account-person.html">子测试2</a></li>
                <li><a href="<%=request.getContextPath()%>/mvc/listActionLog">子测试3</a></li>
            </ul>
        </li>
        <c:forEach items="${tree}" var="Menu">
            <li    class="submenu" id="lm${Menu.id }" ><a href="#" ><i class="${Menu.iconCls}"></i>
                <span>${Menu.text}</span>
                <span class="label label-important"></span></a>
                <ul >
                    <c:forEach items="${Menu.children}" var="sub">
                        <li id="z${sub.id}">
                            <a  href="${sub.attributes.url }" ><i class="${sub.iconCls}"></i>${sub.text }</a></li>
                    </c:forEach>
                </ul>
            </li>
        </c:forEach>
    </ul>
</div>
<!--sidebar-menu-->
</body>
</html>
<%--<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>--%>
    <%--<ul>--%>
        <%--<li class="active"><a href="#"><i class="icon icon-home"></i>首页</a></li>--%>
        <%--<li><a href="charts.html"><i class="icon icon-signal"></i> <span>图形和数据</span></a></li>--%>
        <%--<li class="submenu"><a href="#"><i class="icon icon-inbox"></i> <span>账号管理</span><span--%>
                <%--class="label label-important"></span></a>--%>
            <%--<ul>--%>
                <%--<li><a href="account-user.html">用户管理</a></li>--%>
                <%--<li><a href="account-person.html">修改个人资料</a></li>--%>
                <%--<li><a href="<%=request.getContextPath()%>/mvc/listActionLog">日志列表</a></li>--%>
            <%--</ul>--%>
        <%--</li>--%>
        <%--<li class="submenu"><a href="#"><i class="icon icon-th"></i> <span>售货机管理</span><span--%>
                <%--class="label label-important"></span></a>--%>
            <%--<ul>--%>
                <%--<li><a href="vendor-tables.html">售货机数据</a></li>--%>
                <%--<li><a href="vendor-buyer-search.html">搜索</a></li>--%>
            <%--</ul>--%>
        <%--</li>--%>
        <%--<li class="submenu"><a href="#"><i class="icon icon-th-list"></i> <span>报表统计</span><span--%>
                <%--class="label label-important"></span></a>--%>
            <%--<ul>--%>

                <%--<li><a href="deal-sale.html">商品销售报表</a></li>--%>
                <%--<li><a href="deal-rent.html">租金查询与统计</a></li>--%>
                <%--<li><a href="deal-cash.html">现金交易统计</a></li>--%>
                <%--<li><a href="deal-no-cash.html">非现金交易统计</a></li>--%>
            <%--</ul>--%>
        <%--</li>--%>
    <%--</ul>--%>
<%--</div>--%>

=====================================
<%--<c:forEach items="${tree}" var="Menu">--%>
    <%--<li    class="submenu" id="lm${Menu.id }" ><a href="#" ><i class="${Menu.iconCls}"></i>--%>
        <%--<span>${Menu.text}</span>--%>
        <%--<span class="label label-important"></span></a>--%>
        <%--<ul >--%>
            <%--<c:forEach items="${Menu.children}" var="sub">--%>
                <%--<li id="z${sub.id}"&lt;%&ndash;class="${ sub.iconCls}"&ndash;%&gt;>--%>
                    <%--<a   onclick="siMenu('z${sub.id}','lm${Menu.id}','${sub.text}','${sub.attributes.url }')">${sub.text }</a></li>>--%>
            <%--</c:forEach>--%>
        <%--</ul>--%>
    <%--</li>--%>
<%--</c:forEach>--%>