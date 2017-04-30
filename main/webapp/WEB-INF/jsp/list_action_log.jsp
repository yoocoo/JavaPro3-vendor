<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/4/27
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <title>日志列表</title>
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

<script type="text/javascript" src="<c:url value='/static/js/doT.min.js'/>"></script>
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

<script type="text/javascript">
    var pageNum;
    function goToNextPage() {
        pageNum = parseInt(pageNum) + 1;
        $.ajax({
            type: "GET",
            url: '/actionLog/findLogList?pageNum=' + pageNum + '&pageSize=15',
            dataType: 'json', //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
            cache: false,
            success: function (data) {
                if (data.code == 1) {
                    updateList(data);
                    pageNum = data.pageNum;
                    $("#log-controller-now").html(pageNum);
                }
            }
        });
    }

    function goToLastPage() {
        pageNum = parseInt(pageNum) - 1;
        $.ajax({
            type: "GET",
            url: '/actionLog/findLogList?pageNum=' + pageNum + '&pageSize=15',
            dataType: 'json', //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
            cache: false,
            success: function (data) {
                if (data.code == 1) {
                    updateList(data);
                    pageNum = data.pageNum;
                    $("#log-controller-now").html(pageNum);
                }
            }
        });
    }
</script>
<script type="application/javascript">
    $.ajax({
        type: "GET",
        url: '/actionLog/findLogList?pageNum=1&pageSize=15',
        dataType: 'json', //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
        cache: false,
        success: function (data) {
            if (data.code == 1) {
                pagefn = doT.template($("#pagetmpl").html());   //初始化列表模板
                updateList(data);   //更新数据
                pageNum = data.pageNum;
            }
        }
    });

    function updateList(data) {
        $("#pagetmpl").empty(); //清空模板数据
        $("#log-table-body").html(pagefn(data.data));   //加入数据到模板
    }

</script>
<body>
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
<div id="content">
    <div id="content-header">
        <div id="breadcrumb"><a href="<%=request.getContextPath()%>/mvc/home" title="欢迎回来，竭诚为您服务" class="tip-bottom"><i
                class="icon-home"></i> 首页</a> <a href="<%=request.getContextPath()%>/mvc/listActionLog" class="current">日志列表</a>
        </div>
        <div class="container-fluid">
            <hr>
        </div>
    </div>
    <div class="container-fluid">
        <!-- <hr>-->
        <div class="row-fluid">
            <div class="widget-box">
                <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
                    <h5>数据分析</h5>
                </div>
                <div class="widget-content nopadding">
                    <table class="table table-bordered table-striped with-check">
                        <thead>
                        <tr>
                            <th>日志id</th>
                            <th>IP地址</th>
                            <th>系统名称</th>
                            <th>访问地址</th>
                            <th>SessionId</th>
                            <th>浏览器名</th>
                            <th>当前状态</th>
                            <th>备注</th>
                        </tr>
                        </thead>
                        <tbody id="log-table-body">
                        <tr class="gradeX">
                            <td>123me</td>
                            <td>食品售货机</td>
                            <td>沃尔玛1</td>
                            <td>200</td>
                            <td>2017.01.01</td>
                            <td>2018.01.01</td>
                            <td>租用期</td>
                            <td>有特殊情况可备注</td>
                        </tr>
                        <tr class="gradeX">
                            <td>123me</td>
                            <td>食品售货机</td>
                            <td>沃尔玛1</td>
                            <td>200</td>
                            <td>2017.01.01</td>
                            <td>2018.01.01</td>
                            <td>租用期</td>
                            <td>有特殊情况可备注</td>
                        </tr>
                        <tr class="gradeX">
                            <td>123me</td>
                            <td>食品售货机</td>
                            <td>沃尔玛1</td>
                            <td>200</td>
                            <td>2017.01.01</td>
                            <td>2018.01.01</td>
                            <td>租用期</td>
                            <td>有特殊情况可备注</td>
                        </tr>
                        <tr class="gradeX">
                            <td>123me</td>
                            <td>食品售货机</td>
                            <td>沃尔玛1</td>
                            <td>200</td>
                            <td>2017.01.01</td>
                            <td>2018.01.01</td>
                            <td>租用期</td>
                            <td>有特殊情况可备注</td>
                        </tr>
                        <tr class="gradeX">
                            <td>123me</td>
                            <td>食品售货机</td>
                            <td>沃尔玛1</td>
                            <td>200</td>
                            <td>2017.01.01</td>
                            <td>2018.01.01</td>
                            <td>租用期</td>
                            <td>有特殊情况可备注</td>
                        </tr>
                        <tr class="gradeX">
                            <td>123me</td>
                            <td>食品售货机</td>
                            <td>沃尔玛1</td>
                            <td>200</td>
                            <td>2017.01.01</td>
                            <td>2018.01.01</td>
                            <td>租用期</td>
                            <td>有特殊情况可备注</td>
                        </tr>
                        <tr class="gradeX">
                            <td>123me</td>
                            <td>食品售货机</td>
                            <td>沃尔玛1</td>
                            <td>200</td>
                            <td>2017.01.01</td>
                            <td>2018.01.01</td>
                            <td>租用期</td>
                            <td>有特殊情况可备注</td>
                        </tr>
                        <tr class="gradeX">
                            <td>123me</td>
                            <td>食品售货机</td>
                            <td>沃尔玛1</td>
                            <td>200</td>
                            <td>2017.01.01</td>
                            <td>2018.01.01</td>
                            <td>租用期</td>
                            <td>有特殊情况可备注</td>
                        </tr>
                        <tr class="gradeX">
                            <td>123me</td>
                            <td>食品售货机</td>
                            <td>沃尔玛1</td>
                            <td>200</td>
                            <td>2017.01.01</td>
                            <td>2018.01.01</td>
                            <td>租用期</td>
                            <td>有特殊情况可备注</td>
                        </tr>

                        <script id="pagetmpl" type="text/x-dot-template">
                            {{for(var i=0; i < it.length; i++){}}

                            <tr class="gradeX">
                                <td>{{=it[i].id}}</td>
                                <td>{{=it[i].ipAddrV4}}</td>
                                <td>{{=it[i].osName}}</td>
                                <td><span class="alert-danger"> {{=it[i].description}}</span></td>
                                <td>{{=it[i].sessionId}}</td>
                                <td>{{=it[i].broName}}</td>
                                <td>--</td>
                                <td>有特殊情况可备注</td>
                            </tr>
                            {{}}
                        </script>

                        </tbody>
                    </table>
                    <div class=" btn-icon-pg  text-center" id="log-table-page-controller">
                        <ul>
                            <li><i class="icon-arrow-left"></i> <a id="log-controller-last" onclick="goToLastPage();">上一页</a>
                            </li>
                            <li><i class="icon-map-marker"></i> <a id="log-controller-now">1</a></li>
                            <li><i class="icon-arrow-right"></i> <a id="log-controller-next" onclick="goToNextPage();">下一页</a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
        <!-- span12-->

    </div>

</div>


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
