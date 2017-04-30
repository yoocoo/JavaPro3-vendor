<%--
  Created by IntelliJ IDEA.
  User: ThinkPad  WJ
  Date: 2017/4/9
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <title>系统首页</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="shortcut icon" href="<c:url value='/static/img/favicon.ico'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/bootstrap.min.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/bootstrap-responsive.min.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/fullcalendar.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/matrix-style.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/matrix-media.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/select2.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/font-awesome/css/font-awesome.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/jquery.gritter.css'/>">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<script type="text/javascript">
    //   ============ 修改个人头像 start==========
    var fileName;
    function upLoadFile() {
        fileName = document.getElementById('changeHeadPic').value;
        $.ajaxFileUpload({
            url: "<%=request.getContextPath()%>/userAction/uploadHeadPic",
            secureuri: false,//是否需要安全协议，一般设置为false
            fileElementId: 'changeHeadPic',//文件上传域Id
            dataType: 'json',//返回值类型 一般设置为json
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function (data) {
                alert(data.msg);
//先根据返回的code确定文件是否上传成功
//文件上传失败，直接弹出错误提示，根据错误进行相应的事物处理（关闭Loading窗口，弹出提示对话框）
//文件上传成功后，继续实现loading窗口，接着执行上传表单信息等事物
            }

        });
    }

    function onConfirm() {
        upLoadFile();
    }
    function onCancel(e) {
    }

    //显示个人修改窗口
    function changeImageInfo() {
        $('#my-prompt').modal({
            relateTarge: this,
//            onConfirm: function () {
//                upLoadFile();
//            },
//            onCancel: function (e) {
//            }
        });


    }
</script>

<body>
<%--提示信息：${result}<br>--%>
<%--信息：${message}<br>--%>

<!-- navbar -->
<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
   data-am-offcanvas="{target: '#admin-offcanvas'}">
    <!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
<!--close-Header-part-->
<!--Header-part-->
<div id="header">
    <div class="img" id="admin-offcanvas">
        <img src="/static/images/avatar-1.jpg" alt="user-img" title="点击头像修改个人资料" onclick="changeImageInfo()"
             class="img-circle img-thumbnail img-responsive">修改头像
    </div>
</div>
<%--引入顶部导航jsp  --%>
<%@ include file="/WEB-INF/jsp/index-nav.jsp" %>

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


<%--页面主体切换模式开始--%>
<%@ include file="/WEB-INF/jsp/index-first.jsp" %>
<%--<%@ include file="/WEB-INF/jsp/list_action_log.jsp" %>--%>

<%--<section id="main" class="column">--%>
<%--<div>--%>
<%--<iframe name="mainFrame" id="mainFrame" frameborder="0"--%>
<%--src="/index-first.do"></iframe>--%>
<%--></iframe>--%>
<%--</div>--%>
<%--</section>--%>


<!-- 引入页面底部文件Footer-part-->
<%@ include file="/WEB-INF/jsp/index-footer.jsp" %>
<!--end-Footer-part-->

<%--<script type="text/javascript" src="<c:url value='/static/js/jquery-3.1.1.min.js'/>"></script>--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.ui.custom.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/excanvas.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.flot.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.flot.resize.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.peity.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/fullcalendar.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.dashboard.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.gritter.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.interface.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.chat.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.validate.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.form_validation.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.wizard.js'/>"></script>
<%--<script type="text/javascript" src="<c:url value='/static/js/jquery.uniform.js'/>"></script>--%>
<script type="text/javascript" src="<c:url value='/static/js/select2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.popover.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.dataTables.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.tables.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.tips.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.ajaxfileupload.js'/>"></script>


</body>
</html>