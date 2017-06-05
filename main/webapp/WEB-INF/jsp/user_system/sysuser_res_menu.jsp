<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/6/4
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <title>菜单的编辑</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%--引入公共CSS 样式--%>
    <%@ include file="/WEB-INF/jsp/common/common_css.jsp" %>
</head>
<script type="application/javascript">
    function GetMenu() {
        $.ajax({
            type: "POST",  //http请求方式为POST
            url: "<%=request.getContextPath()%>/listMenu/getMenu",//请求
//            data: {
//                headImage: path
//            },
            dataType: 'json',//返回值类型 一般设置为json
            cache: false,
            success: function (data) {
                alert(data.msg);
                location.reload()
            }
        });
    }
</script>

<body>
<%--引入顶部导航jsp  --%>
<%@ include file="/WEB-INF/jsp/index_body/index_top_header.jsp" %>

<%--引入左侧菜单栏--%>
<%@ include file="../index_body/index_siderbar.jsp" %>
<%--页面功能箱子--%>
<div id="content">
    <div id="content-header">
        <div id="breadcrumb"><a href="<%=request.getContextPath()%>/mvc/home" title="欢迎回来" class="tip-bottom"><i
                class="icon-home"></i> 首页</a> <a href="<%=request.getContextPath()%>/mvc/listMenu/getMenu"
                                                 class="current">菜单管理</a>
        </div>
    </div>
    <%--container-fluid  start--%>
    <div class="container-fluid">
        <hr>
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-title"><span class="icon"> <i class="icon-th"></i> </span>
                        <h5>
                            <input type="button" value="更进菜单" id="btn_login"
                                   onclick="GetMenu();" class="btn-success btn-mini"/>
                        </h5>
                    </div>
                    <div class="widget-content nopadding">
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>菜单ID</th>
                                <th>菜单描述</th>
                                <th>菜单地址</th>
                                <th>父级ID</th>
                                <th>菜单顺序</th>
                                <th>菜单图标</th>
                                <th>菜单类型</th>
                                <th>操作</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <c:forEach items="${allMenu}" var="item">
                                <td><c:out value="${item.menuId}"/></td>
                                <td><c:out value="${item.menuName}"/></td>
                                <td><c:out value="${item.menuUrl}"/></td>
                                <td><c:out value="${item.parentId}"/></td>
                                <td><c:out value="${item.menuOrder}"/></td>
                                <td><i class=" <c:out value="${item.menuIcon}"/> "></i>

                                </td>
                                <td><c:out value="${item.menuType}"/></td>
                                <td onclick='goEdit(<c:out value="${item.menuId}"/>)'>编辑</td>
                                <td onclick='doDelete(<c:out value="${item.menuId}"/>)'>删除</td>
                            </tr>
                            </c:forEach>
                            <%--<tr>--%>
                                <%--&lt;%&ndash;<td><input type="checkbox" /></td>&ndash;%&gt;--%>
                                <%--<td>00</td>--%>
                                <%--<td>画板</td>--%>
                                <%--<td>/mvc/user/</td>--%>
                                <%--<td>/mvc/user/</td>--%>
                                <%--<td>/mvc/user/</td>--%>
                                <%--<td>/mvc/user/</td>--%>
                                <%--<td>/mvc/user/</td>--%>
                                <%--<td class="center"> 4</td>--%>
                                <%--<td class="center"> 4</td>--%>
                            <%--</tr>--%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="widget-box">
                    <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
                        <h5>权限菜单管理</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <table class="table table-bordered data-table table-striped with-check">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox"/></th>
                                <th>ID值</th>
                                <th>角色ID值</th>
                                <th>菜单ID值</th>
                                <th>操作</th>
                            </tr>
                            </thead>

                            <!-- ------------------遍历循环  开始  -->
                            <tbody>
                            <tr class="gradeX">
                                <td><input type="checkbox"/></td>
                                <td>沃尔玛</td>
                                <td>9527IG</td>
                                <td>100</td>

                                <td>
                                    <div class="dropdown">
                                        <!-- <button type="button" class="btn dropdown-toggle" id="dropdownMenu1"
                        data-toggle="dropdown">编辑
                        <span class="caret"></span>
                     </button>-->
                                        <i class="icon icon-folder-open" id="dropdownMenu1" data-toggle="dropdown"></i>
                                        <ul class="dropdown-menu pull-right" role="menu"
                                            aria-labelledby="dropdownMenu1">
                                            <li role="presentation"><a class="icon icon-edit" role="menuitem"
                                                                       tabindex="-1" href="#">编辑</a></li>
                                            <li role="presentation" class="divider"></li>
                                            <li role="presentation"><a class="icon icon-shopping-cart" role="menuitem"
                                                                       tabindex="-1" href="vendor-channel.html">货道管理</a>
                                            </li>
                                            <li role="presentation" class="divider"></li>
                                            <!-- <li role="presentation"> <a  class="icon icon-signal" role="menuitem" tabindex="-1" href="#">销售统计</a> </li>
                                             <li role="presentation" class="divider"></li>-->
                                            <li role="presentation"><a class="icon  icon-warning-sign" role="menuitem"
                                                                       tabindex="-1" href="vendor-test.html">审核</a></li>
                                            <li role="presentation" class="divider"></li>
                                            <li role="presentation"><a class="icon icon-trash" role="menuitem"
                                                                       tabindex="-1" href="#">删除</a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <!-- ------------------遍历循环  结束  -->
                            <tr class="gradeX">
                                <td><input type="checkbox"/></td>
                                <td>沃尔玛</td>
                                <td>9527IG</td>
                                <td>100</td>

                                <td> ---</td>
                            </tr>
                            <tr class="gradeX">
                                <td><input type="checkbox"/></td>
                                <td>沃尔玛</td>
                                <td>9527IG</td>
                                <td>100</td>

                                <td> ---</td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
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
<script type="text/javascript" src="<c:url value='/static/js/select2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.dataTables.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.tables.js'/>"></script>
<!--end-javascript-part-->
</body>
</html>
