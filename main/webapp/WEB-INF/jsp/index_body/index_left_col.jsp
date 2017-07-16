<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: 王娇
  Date: 2017/6/29
  Time: 9:43
  说明： 该页面，包括左侧菜单，和 头像  以及头像的模态弹窗的头像上传
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="<%=request.getContextPath()%>/mvc/home" class="site_title"><i class="fa fa-paw"></i> <span>智能售货机后台</span></a></div>
        <div class="clearfix"></div>
        <!-- menu profile quick info -->
        <div class="profile clearfix">
            <div class="profile_pic"><a href="<%=request.getContextPath()%>/mvc/userAction/updateImg" > <img src="${userPath}" alt="哎呀，缺失啦" title="点击头像，修改图像"
                                                                                                           class="img-circle profile_img"></a>
            </div>
            <%--<div class="profile_info">--%>
                <%--<span>欢迎回来:${userInfo.accountName}</span><br/>--%>
                <%--&lt;%&ndash;<h2>账户名：${userInfo.accountName}</h2> <br/>&ndash;%&gt;--%>
                <%--<c:if test="${userMess.roleId ==1}">--%>
                    <%--<span>角色：系统管理员</span>--%>
                <%--</c:if>--%>
                <%--<c:if test="${userMess.roleId ==3}">--%>
                    <%--<span>角色：运营商管理员</span>--%>
                <%--</c:if>--%>
                <%--<c:if test="${userMess.roleId ==4}">--%>
                    <%--<span>角色：运营商配货员</span>--%>
                <%--</c:if>--%>
                <%--<c:if test="${userMess.roleId ==5}">--%>
                    <%--<span>角色：运营商仓库员</span>--%>
                <%--</c:if>--%>
                <%--<c:if test="${userMess.roleId ==6}">--%>
                    <%--<span>角色：生产商管理员</span>--%>
                <%--</c:if>--%>
                <%--<c:if test="${userMess.roleId ==8}">--%>
                    <%--<span>角色：出租商管理员</span>--%>
                <%--</c:if>--%>
                <%--<c:if test="${userMess.roleId ==10}">--%>
                    <%--<span>角色：贸易商管理员</span>--%>
                <%--</c:if>--%>
            <%--</div>--%>
        </div>

        <!-- /menu profile quick info -->


        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <%--<div class="clearfix"></div>--%>
                <%--<h3>菜单栏</h3>--%>
                <ul class="nav side-menu">
                    <c:forEach items="${tree}" var="Menu">
                        <li id="lm${Menu.id }"><a><i class="${Menu.iconCls}"></i> ${Menu.text} <span
                                class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <c:forEach items="${Menu.children}" var="sub">
                                    <li id="z${sub.id}"><a href="${sub.attributes.url}"><i
                                            class="${sub.iconCls}"></i>${sub.text }</a></li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                </ul>
            </div>

        </div>
        <!-- /sidebar menu -->

        <!-- /menu footer 菜单底部的开关开始  buttons -->
        <div class="sidebar-footer hidden-small"><a data-toggle="tooltip" data-placement="top" title="设置"> <span
                class="glyphicon glyphicon-cog" aria-hidden="true"></span> </a> <a data-toggle="tooltip"
                                                                                   data-placement="top"
                                                                                   title="全屏"> <span
                class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span> </a> <a data-toggle="tooltip"
                                                                                          data-placement="top"
                                                                                          title="锁定"> <span
                class="glyphicon glyphicon-eye-close" aria-hidden="true"></span> </a> <a data-toggle="tooltip"
                                                                                         data-placement="top"
                                                                                         title="退出登录"
                                                                                         href="<%=request.getContextPath()%>/mvc/login">
            <span class="glyphicon glyphicon-off" aria-hidden="true"></span> </a></div>
        <!-- /menu footer buttons 结束 -->
    </div>
</div>

</body>
</html>
