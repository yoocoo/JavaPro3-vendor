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
        <li class="active"><a href="/mvc/home"><i class="icon icon-home"></i>首页</a></li>

        <%--五月中旬 权限菜单标准--%>
        <%--======代码主次菜单参照标准================================--%>
        <%--<li class="submenu"><a href="#"><i class="icon icon-inbox"></i>--%>
        <%--<span>${tree[0].text}</span>--%>
        <%--<span class="label label-important"></span></a>--%>
        <%--<ul>--%>
        <%--<li><a href="account-user.html">子测试</a></li>--%>
        <%--<li><a href="account-person.html">子测试2</a></li>--%>
        <%--<li><a href="<%=request.getContextPath()%>/mvc/listActionLog">子测试3</a></li>--%>
        <%--</ul>--%>
        <%--</li>--%>
        <%--=============5.20日权限菜单修改完成===========================--%>
        <c:forEach items="${tree}" var="Menu">
            <li class="submenu" id="lm${Menu.id }"><a href="#"><i class="${Menu.iconCls}"></i>
                <span>${Menu.text}</span>
                <span class="label label-important"></span></a>
                <ul>
                    <c:forEach items="${Menu.children}" var="sub">
                        <li id="z${sub.id}">
                            <a href="${sub.attributes.url }"><i class="${sub.iconCls}"></i>${sub.text }</a></li>
                    </c:forEach>
                </ul>
            </li>
        </c:forEach>
        <%--================   =============================--%>
        <%--========== 五月中旬 ========不分主次菜单代码参照标准==========--%>
        <%--<li class="active"><a href="/mvc/home"><i class="icon icon-home"></i>首页</a></li>--%>
        <%--<c:forEach items="${menu}" var="MenuList">--%>
        <%--<li  id="lm${MenuList.menuId }" ><a href="${MenuList.menuUrl}">--%>
        <%--<i class="${MenuList.menuIcon}"></i>${MenuList.menuName}<span class="label label-important"></span></a>--%>
        <%--</li>--%>
        <%--&lt;%&ndash;<li class="divider"></li>&ndash;%&gt;--%>
        <%--</c:forEach>--%>
    </ul>
</div>
</body>
</html>

