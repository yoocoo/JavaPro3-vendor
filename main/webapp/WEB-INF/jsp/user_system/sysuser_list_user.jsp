<%--
  Created by IntelliJ IDEA.
  User: 王娇
  Date: 2017/6/15
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>系统用户列表</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%--引入公共CSS 样式 start--%>
    <%@ include file="/WEB-INF/jsp/common/common_css.jsp" %>
    <%--引入公共CSS 样式 end --%>
    <%--=================6.15研究bootstrap table 组件==引入的 css======= start =======--%>
    <%--<link type="text/css" rel="stylesheet" href="<c:url value='/static/css/bootstraptable/bootstrap-table.css'/>">--%>
    <%-- 6.26 日 注意：：：：引用 bootstrap-table.css 会导致 和matrix.js 冲突--%>


    <script type="text/javascript" src="<c:url value='/static/js/bootstraptable/jquery.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/common/jquery.ui.custom.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/jquery.uniform.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/common/bootstrap.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/bootstraptable/bootstrap-table.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/bootstraptable/bootstrap-table-export.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/bootstraptable/bootstrap-table-zh-CN.js'/>"></script>

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
                class="icon-home"></i> 首页</a> <a href="<%=request.getContextPath()%>/userAction/listpage"
                                                 class="current">普通用户管理</a>
        </div>
    </div>
    <%--content-header  end--%>

    <div class="container-fluid">
        <hr>
        <div class="row-fluid">
            <%--=======================================================--%>
            <div class="span12">
                <%--=====第一个表格  start======--%>
                <div class="widget-box">
                    <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
                        <h5>普通用户管理</h5>
                    </div>
                    <div class="widget-content nopadding">
                        <table
                                data-toggle="table"
                                data-url="<%=request.getContextPath()%>/userAction/listAllUser"
                                data-click-to-select="true"
                                data-search="true"
                                data-method="post"
                                data-side-pagination="server"
                                data-query-params-type="limit"
                                data-content-type="application/x-www-form-urlencoded"
                                data-pagination="true"
                                data-page-size="5"
                                data-page-list="[5,10]"
                                data-height="200"
                                data-toolbar="#toolbar"
                                data-single-select="true"
                        >
                            <thead>
                            <tr>

                                <th data-field="userId">ID</th>
                                <%--<th data-field="nextUrl" data-align="center">下一</th>--%>
                                <th data-field="accountName">账户名</th>
                                <%--<th data-field="password" data-align="center">密码</th>--%>
                                <th data-field="realName">姓名</th>
                                <th data-field="roleId">角色</th>
                                <%--<th data-field="nickName" data-align="center">昵称</th>--%>
                                <th data-field="email">电子邮箱</th>
                                <%--<th data-field="lastLoginTime" data-align="center">最近一次登录</th>--%>
                                <%--<th data-field="fixPhone" data-align="center">电话</th>--%>
                                <th data-field="mobilePhone">手机</th>
                                <th data-field="qq">QQ</th>
                                <th data-field="postcode">邮编</th>
                                <th data-field="idcard">身份证</th>
                                <%--<th data-field="loginCount" data-align="center">次数</th>--%>
                                <th data-field="postAdress">地址</th>
                                <th data-field="creatTime">创建时间</th>
                                <%--<th data-field="headImage" data-align="center">头像地址</th>--%>
                                <th data-field="approved">是否删除</th>
                                <td data-field="action" data-align="center" data-formatter="formatAction">操作</td>
                            </tr>
                            </thead>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>
<!-- 引入页面底部文件Footer-part-->
<%@ include file="/WEB-INF/jsp/index_body/index_footer.jsp" %>
<%--<!--end-Footer-part-->--%>
<%--====================到底部了=============================--%>

<%--注: 有时候 页面 带有冲突的时候，最好是不引入这个页面了，单独引入该需要的JS页面，引入公共的js脚本，防止页面部分功能冲突--%>
<%--<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>--%>

<script type="text/javascript" src="<c:url value='/static/js/common/jquery.peity.min.js'/>"></script>

<%--页面整体重要JS 脚本引用--%>
<script type="text/javascript" src="<c:url value='/static/js/common/matrix.js'/>"></script>
<%--home首页进度条，快捷菜单，按钮分类等--%>
<script type="text/javascript" src="<c:url value='/static/js/matrix.interface.js'/>"></script>

</body>
</html>