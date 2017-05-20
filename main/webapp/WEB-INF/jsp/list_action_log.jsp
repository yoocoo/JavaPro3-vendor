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
    <%--引入公共CSS 样式--%>
    <%@ include file="/WEB-INF/jsp/common_css.jsp" %>

</head>
<%--单独引用js脚本--%>
<script type="text/javascript" src="<c:url value='/static/js/doT.min.js'/>"></script>
<%--<script type="text/javascript" src="<c:url value='/static/js/doT.min.js'/>"></script>--%>

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
        alert(pageNum);
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

<body>
<%--引入顶部导航jsp  --%>
<%@ include file="/WEB-INF/jsp/index_top_header.jsp" %>

<%--引入左侧菜单栏--%>
<%@ include file="index_siderbar.jsp" %>

<%--页面功能箱子--%>
<div id="content">
    <div id="content-header">
        <div id="breadcrumb"><a href="<%=request.getContextPath()%>/mvc/home" title="欢迎回来" class="tip-bottom"><i
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
                        </tr>
                        </thead>
                        <tbody id="log-table-body">

                        <script id="pagetmpl" type="text/x-dot-template">
                            {{for(var i=0; i < it.length; i++){ }}

                            <tr class="gradeX">
                                <td>{{=it[i].id}}</td>
                                <td>{{=it[i].ipAddrV4}}</td>
                                <td>{{=it[i].osName}}</td>
                                <td><span class="alert-danger"> {{=it[i].description}}</span></td>
                                <td>{{=it[i].sessionId}}</td>
                                <td>{{=it[i].broName}}</td>
                            </tr>
                            {{} }}
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

<!-- 引入页面底部文件Footer-part-->
<%@ include file="/WEB-INF/jsp/index_footer.jsp" %>
<!--end-Footer-part-->

<%--引入公共的js脚本，防止页面部分功能冲突--%>
<%@ include file="/WEB-INF/jsp/common_js.jsp" %>



<!--end-javascript-part-->
</body>
</html>
