<%--
  Created by IntelliJ IDEA.
  User: WJ
  Date: 2017/5/5
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>--%>
<%--bootstrap页面基础脚本--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.min.js'/>"></script>

<%--整体UI 界面公用--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.ui.custom.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
<%--利用IE支持的VML对象来模拟Canvas的绘图的，home首页图表需要--%>
<script type="text/javascript" src="<c:url value='/static/js/excanvas.min.js'/>"></script>

<%--图表插件以及响应式图标插件 脚本引用--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.flot.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery.flot.resize.min.js'/>"></script>

<%--Peity是一个jQuery插件，它利用HTML5 <canvas>标签来创建微型图表（sparklines）。--%>
<%--它支持柱状、线状和饼图，图的颜色、宽度、半径、分隔符都可以修改。当数据变化时，图形也立即重新生成。--%>
<%--只能用于支持<canvas>标签的浏览器包括： Chrome、 Firefox、IE9、Opera和Safari。--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.peity.min.js'/>"></script>

<%--日历脚本引用--%>
<script type="text/javascript" src="<c:url value='/static/js/fullcalendar.min.js'/>"></script>

<%--页面整体重要JS 脚本引用--%>
<script type="text/javascript" src="<c:url value='/static/js/matrix.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.dashboard.js'/>"></script>

<%--home高亮消息提示脚本引用--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.gritter.min.js'/>"></script>

<%--home首页进度条，快捷菜单，按钮分类等--%>
<script type="text/javascript" src="<c:url value='/static/js/matrix.interface.js'/>"></script>

<%--聊天窗口js 暂时未用到--%>
<script type="text/javascript" src="<c:url value='/static/js/matrix.chat.js'/>"></script>

<%--密码修改--%>
<%--<script type="text/javascript" src="<c:url value='/static/js/jquery.wizard.js'/>"></script>--%>

<%--表单特色脚本1 带有判空颜色预警脚本引用--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.validate.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.form_validation.js'/>"></script>

<%--表单公共引用--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.uniform.js'/>"></script>

<%--单选复选脚本引用--%>
<script type="text/javascript" src="<c:url value='/static/js/select2.min.js'/>"></script>

<script type="text/javascript" src="<c:url value='/static/js/matrix.popover.js'/>"></script>

<%--数据表格脚本引用--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.dataTables.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/matrix.tables.js'/>"></script>

<%--判断消息提示脚本引用-公共引用--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.tips.js'/>"></script>


<%--文件上传和下载 脚本引用--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.ajaxfileupload.js'/>"></script>
