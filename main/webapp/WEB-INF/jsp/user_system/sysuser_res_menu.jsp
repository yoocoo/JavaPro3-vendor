<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/6/4
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>菜单的编辑</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%--引入公共CSS 样式--%>
    <%@ include file="/WEB-INF/jsp/common/common_css.jsp" %>
</head>
<body>
<%--引入顶部导航jsp  --%>
<%@ include file="/WEB-INF/jsp/index_body/index_top_header.jsp" %>

<%--引入左侧菜单栏--%>
<%@ include file="../index_body/index_siderbar.jsp" %>
<%--页面功能箱子--%>
<div id="content">
    <div id="content-header">
        <div id="breadcrumb"><a href="<%=request.getContextPath()%>/mvc/home" title="欢迎回来" class="tip-bottom"><i
                class="icon-home"></i> 首页</a> <a href="<%=request.getContextPath()%>/mvc/menuAction/manger"
                                                 class="current">菜单管理</a>
        </div>
    </div>
    <%--container-fluid  start--%>
    <div class="container-fluid">
        <hr>

        <%--================================开始发挥了=========--%>
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
                        <h5>菜单管理</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>菜单ID</th>
                                <th>菜单描述</th>
                                <th>菜单地址</th>
                                <th>Engine version</th>

                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <%--<td><input type="checkbox" /></td>--%>
                                <td>Trident</td>
                                <td>Internet
                                    Explorer 4.0</td>
                                <td>Win 95+</td>
                                <td class="center"> 4</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="widget-box">
                    <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
                        <h5>权限菜单</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <table class="table table-bordered data-table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>角色ID</th>
                                <th>菜单ID</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Firefox 1.0</td>
                                <td>Win 98+ / OSX.2+</td>
                                <td class="center">1.7</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Firefox 1.5</td>
                                <td>Win 98+ / OSX.2+</td>
                                <td class="center">1.8</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Firefox 2.0</td>
                                <td>Win 98+ / OSX.2+</td>
                                <td class="center">1.8</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Firefox 3.0</td>
                                <td>Win 2k+ / OSX.3+</td>
                                <td class="center">1.9</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Camino 1.0</td>
                                <td>OSX.2+</td>
                                <td class="center">1.8</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Camino 1.5</td>
                                <td>OSX.3+</td>
                                <td class="center">1.8</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Netscape 7.2</td>
                                <td>Win 95+ / Mac OS 8.6-9.2</td>
                                <td class="center">1.7</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Netscape Browser 8</td>
                                <td>Win 98SE+</td>
                                <td class="center">1.7</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Netscape Navigator 9</td>
                                <td>Win 98+ / OSX.2+</td>
                                <td class="center">1.8</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Mozilla 1.0</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td class="center">1</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Mozilla 1.1</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td class="center">1.1</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Mozilla 1.2</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td class="center">1.2</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Mozilla 1.3</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td class="center">1.3</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Mozilla 1.4</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td class="center">1.4</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Mozilla 1.5</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td class="center">1.5</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Mozilla 1.6</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td class="center">1.6</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Mozilla 1.7</td>
                                <td>Win 98+ / OSX.1+</td>
                                <td class="center">1.7</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Mozilla 1.8</td>
                                <td>Win 98+ / OSX.1+</td>
                                <td class="center">1.8</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Seamonkey 1.1</td>
                                <td>Win 98+ / OSX.2+</td>
                                <td class="center">1.8</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Gecko</td>
                                <td>Epiphany 2.20</td>
                                <td>Gnome</td>
                                <td class="center">1.8</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Webkit</td>
                                <td>Safari 1.2</td>
                                <td>OSX.3</td>
                                <td class="center">125.5</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Webkit</td>
                                <td>Safari 1.3</td>
                                <td>OSX.3</td>
                                <td class="center">312.8</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Webkit</td>
                                <td>Safari 2.0</td>
                                <td>OSX.4+</td>
                                <td class="center">419.3</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Webkit</td>
                                <td>Safari 3.0</td>
                                <td>OSX.4+</td>
                                <td class="center">522.1</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Webkit</td>
                                <td>OmniWeb 5.5</td>
                                <td>OSX.4+</td>
                                <td class="center">420</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Webkit</td>
                                <td>iPod Touch / iPhone</td>
                                <td>iPod</td>
                                <td class="center">420.1</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Webkit</td>
                                <td>S60</td>
                                <td>S60</td>
                                <td class="center">413</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Presto</td>
                                <td>Opera 7.0</td>
                                <td>Win 95+ / OSX.1+</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Presto</td>
                                <td>Opera 7.5</td>
                                <td>Win 95+ / OSX.2+</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Presto</td>
                                <td>Opera 8.0</td>
                                <td>Win 95+ / OSX.2+</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Presto</td>
                                <td>Opera 8.5</td>
                                <td>Win 95+ / OSX.2+</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Presto</td>
                                <td>Opera 9.0</td>
                                <td>Win 95+ / OSX.3+</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Presto</td>
                                <td>Opera 9.2</td>
                                <td>Win 88+ / OSX.3+</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Presto</td>
                                <td>Opera 9.5</td>
                                <td>Win 88+ / OSX.3+</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Presto</td>
                                <td>Opera for Wii</td>
                                <td>Wii</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Presto</td>
                                <td>Nokia N800</td>
                                <td>N800</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Presto</td>
                                <td>Nintendo DS browser</td>
                                <td>Nintendo DS</td>
                                <td class="center">8.5</td>
                            </tr>
                            <tr class="gradeC">
                                <td>KHTML</td>
                                <td>Konqureror 3.1</td>
                                <td>KDE 3.1</td>
                                <td class="center">3.1</td>
                            </tr>
                            <tr class="gradeA">
                                <td>KHTML</td>
                                <td>Konqureror 3.3</td>
                                <td>KDE 3.3</td>
                                <td class="center">3.3</td>
                            </tr>
                            <tr class="gradeA">
                                <td>KHTML</td>
                                <td>Konqureror 3.5</td>
                                <td>KDE 3.5</td>
                                <td class="center">3.5</td>
                            </tr>
                            <tr class="gradeX">
                                <td>Tasman</td>
                                <td>Internet Explorer 4.5</td>
                                <td>Mac OS 8-9</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeC">
                                <td>Tasman</td>
                                <td>Internet Explorer 5.1</td>
                                <td>Mac OS 7.6-9</td>
                                <td class="center">1</td>
                            </tr>
                            <tr class="gradeC">
                                <td>Tasman</td>
                                <td>Internet Explorer 5.2</td>
                                <td>Mac OS 8-X</td>
                                <td class="center">1</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Misc</td>
                                <td>NetFront 3.1</td>
                                <td>Embedded devices</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeA">
                                <td>Misc</td>
                                <td>NetFront 3.4</td>
                                <td>Embedded devices</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeX">
                                <td>Misc</td>
                                <td>Dillo 0.8</td>
                                <td>Embedded devices</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeX">
                                <td>Misc</td>
                                <td>Links</td>
                                <td>Text only</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeX">
                                <td>Misc</td>
                                <td>Lynx</td>
                                <td>Text only</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeC">
                                <td>Misc</td>
                                <td>IE Mobile</td>
                                <td>Windows Mobile 6</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeC">
                                <td>Misc</td>
                                <td>PSP browser</td>
                                <td>PSP</td>
                                <td class="center">-</td>
                            </tr>
                            <tr class="gradeU">
                                <td>Other browsers</td>
                                <td>All others</td>
                                <td>-</td>
                                <td class="center">-</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>




            </div>
        </div>

        <%--================================发挥结束了=========--%>

    </div>

    <%--container-fluid  end--%>
    </div>

    <%--页面功能箱子结束--%>
</div>

<%--====================到底了=============================--%>
<!-- 引入页面底部文件Footer-part-->
<%@ include file="/WEB-INF/jsp/index_body/index_footer.jsp" %>
<!--end-Footer-part-->

<%--引入公共的js脚本，防止页面部分功能冲突--%>
<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>

<%--引用自身需要的 表格 JS--%>
<%--<script type="text/javascript" src="<c:url value='/static/js/common/jquery.ui.custom.js'/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value='/static/js/jquery.uniform.js'/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value='/static/js/jquery.dataTables.min.js'/>"></script>--%>
<%--<script type="text/javascript" src="<c:url value='/static/js/matrix.tables.js'/>"></script>--%>
<!--end-javascript-part-->
</body>
</html>
