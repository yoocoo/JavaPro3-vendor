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
    <%@ include file="/WEB-INF/jsp/common/common_css.jsp" %>

    <%--<link type="text/css" rel="stylesheet" href="<c:url value='/static/css/bootstraptable/bootstrap-table.css'/>">--%>
    <%--===6.26--"/static/css/bootstraptable/bootstrap-table.css "可有可无，样式还是那么丑--%>

    <%--======6.15jquery.min.js 版本问题测试=====--%>
    <%--<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>--%>
    <%--引用/static/js/jquery.js 数据不显示--%>

    <script type="text/javascript" src="<c:url value='/static/js/common/jquery.min.js'/>"></script>
    <%--<script type="text/javascript" src="<c:url value='/static/js/bootstraptable/jquery.min.js'/>"></script>--%>
    <%--======6.15jquery.min.js 版本问题测试=====--%>
    <%--<script type="application/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>--%>
    <script type="text/javascript" src="<c:url value='/static/js/doT.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value="/static/js/json2.js"/>"></script>


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
                class="icon-home"></i> 首页</a> <a href="<%=request.getContextPath()%>/mvc/listActionLog" class="current">日志列表</a>
        </div>
        <div class="container-fluid">
            <%--<hr>--%>
        </div>
    </div>
    <div class="container-fluid">
        <!-- <hr>-->
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
                        <h5>日志数据分析(doT.min.js版本 物理分页， 页面样式：需要解决)</h5>
                        <div align="right">
                            <i class="icon-arrow-left">
                                <a onclick="goToLastPage()" style="width: 110px;">上一页</a>
                            </i>
                            <i class="icon-map-marker">
                                <a id="log-controller-now">1</a>
                            </i>
                            <i class="icon-arrow-right">
                                <a title="下一页" onclick="goToNextPage()" style="width: 110px;">下一页</a>
                            </i>

                        </div>
                    </div>
                    <%--==========================================项目原版 6.22 丢了饭卡，纪念日===============--%>
                    <div class="widget-content nopadding">
                        <div id="blog-table-list" style="font-family: '微软雅黑';font-size: small">

                                <table class="table table-bordered  data-table">
                                    <script id="pagetmpl" type="text/x-dot-template">
                                    <thead>
                                    <tr>
                                        <th>日志id</th>
                                        <th>登陆者</th>
                                        <th>SessionId</th>
                                        <th>IP4地址</th>
                                        <th>IP6地址</th>
                                        <th>系统名称</th>
                                        <th>系统版本</th>
                                        <th>浏览器名</th>
                                        <th>浏览器版本</th>
                                        <%--<th>访问体</th>--%>
                                        <th>详细</th>
                                        <%--<th>其他</th>--%>
                                        <th>请求方式</th>
                                        <th>登录时间</th>
                                    </tr>
                                    </thead>
                                </hr>
                                    <tbody>
                                    {{for(var i=0; i < it.length; i++){ }}
                                    <tr >
                                        <td>{{=it[i].id}}</td>
                                        <td>{{=it[i].accountName}}</td>
                                        <td>{{=it[i].sessionId}}</td>
                                        <td>{{=it[i].ipAddrV4}}</td>
                                        <td>{{=it[i].ipAddrV6}}</td>
                                        <td>{{=it[i].osName}}</td>
                                        <td>{{=it[i].osVersion}}</td>
                                        <td>{{=it[i].broName}}</td>
                                        <td>{{=it[i].broVersion}}</td>
                                        <%--<td>{{=it[i].requestBody}}</td>--%>
                                        <td>{{=it[i].description}}</td>
                                        <%--<td>{{=it[i].other}}</td>--%>
                                        <td>{{=it[i].method}}</td>
                                        <td>{{=it[i].time}}</td>

                                    </tr>
                                    {{ } }}

                                    </tbody>
                            </script>
                                </table>



                        </div>

                    </div>
                </div>
                <!-- span12-->
            </div>
        </div>
    </div>
</div>
        <script type="text/javascript">
            var logJsonStr = JSON.stringify(${logJson});
            //    alert("获得的logJsonStr："+logJsonStr);
            var logJsonObj = JSON.parse(logJsonStr);
            //    alert("获得的logJsonObj："+logJsonObj);
            //    console.log(logJsonObj+"获得的logJsonObj");
            //    console.log("获得的logJsonObj.当前页码："+logJsonObj.pageNum);

            var pageNum = logJsonObj.pageNum;//获取当前页码
            //    alert("1获得的当前页码："+pageNum);
            var pageSize = logJsonObj.pageSize;//获取页面长度
            //    alert("2获取页面长度："+pageSize);
            var totalNum = logJsonObj.totalNum;//获取总的页码
            //    alert("3获取页面长度："+totalNum);
            //开始加载列表数据
            if (logJsonObj.code == 1) {//获取数据成功
                pagefn = doT.template($("#pagetmpl").html());   //初始化列表模板
                updateList(logJsonObj.data);   //更新数据
            } else {
                alert("获取数据失败！请联系管理员");
            }

            function updateList(data) {
                $("#pagetmpl").empty(); //清空模板数据
                $("#blog-table-list").html(pagefn(data));   //加入数据到模板
            }
            function goToNextPage() {
                pageNum = parseInt(pageNum) + 1;
//        pageNum =2;
                <%--var pageNum =parseInt( ${logJson.pageNum}) + 1;--%>
//        alert("下一页步骤：获得的当前页码："+pageSize);
                $.ajax({
                    type: "POST",
                    url: '<%=request.getContextPath()%>/actionLog/findLogList',
                    data: {pageNum: pageNum, pageSize: 10},
                    dataType: 'json', //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
                    cache: false,
                    success: function (data) {
                        if (data.code == 1) {
                            updateList(data.data);
                            pageNum = data.pageNum;
                            $("#log-controller-now").html(pageNum);
                        }
                    }
                });
            }

            function goToLastPage() {
                pageNum = parseInt(pageNum) - 1;

                <%--var pageNum = parseInt(${logJson.pageNum})-1;--%>
//        alert("上一页步骤：获得的当前页码："+pageNum);
                $.ajax({
                    type: "POST",
                    url: '<%=request.getContextPath()%>/actionLog/findLogList',
                    data: {pageNum: pageNum, pageSize: pageSize},
                    dataType: 'json', //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
                    cache: false,
                    success: function (data) {
                        if (data.code == 1) {
                            updateList(data.data);
                            pageNum = data.pageNum;
                            $("#log-controller-now").html(pageNum);
                        }
                    }
                });
            }

        </script>


    <%--============================================================--%>
    <!-- 引入页面底部文件Footer-part-->
    <%@ include file="/WEB-INF/jsp/index_body/index_footer.jsp" %>
    <!--end-Footer-part-->


    <%--引入公共的js脚本，防止页面部分功能冲突--%>
    <%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>

    <%--==========以下三种结合 使用第一种jquery.dataTables table表现形式--%>
    <script type="text/javascript" src="<c:url value='/static/js/select2.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/jquery.dataTables.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/matrix.tables.js'/>"></script>
    <%--==========以下三种结合 使用第一种bootstrap-table表现形式--%>
    <%--<script type="text/javascript" src="<c:url value='/static/js/bootstraptable/bootstrap-table.js'/>"></script>--%>
    <%--<script type="text/javascript" src="<c:url value='/static/js/bootstraptable/bootstrap-table-export.js'/>"></script>--%>
    <%--<script type="text/javascript" src="<c:url value='/static/js/bootstraptable/bootstrap-table-zh-CN.js'/>"></script>--%>
    <!--end-javascript-part-->
</body>
</html>
