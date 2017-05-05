<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/5/3
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript">
    function tabAddHandler(mid,mtitle,murl){
        tab.add({
            id :mid,
            title :mtitle,
            url :murl,
            isClosed :true
        });
        tab.update({
            id :mid,
            title :mtitle,
            url :murl,
            isClosed :true
        });
        tab.activate(mid);
    }
    var tab;
    $( function() {
        tab = new TabView( {
            containerId :'tab_menu',
            pageid :'page',
            cid :'tab1',
            position :"top"
        });
        <%--tab.add( {--%>
            <%--id :'tab1_index1',--%>
            <%--title :"主页",--%>
            <%--url :"<%=basePath%>login_default.do",--%>
            <%--isClosed :false--%>
        <%--});--%>
    function cmainFrameT(){
        var hmainT = document.getElementById("page");
        var bheightT = document.documentElement.clientHeight;
        hmainT .style.width = '100%';
        hmainT .style.height = (bheightT  - 51) + 'px';
    }
    cmainFrameT();
    window.onresize=function(){
        cmainFrameT();
    };
</script>
<body>
<div style="width:100%;">
    <div id="page" style="width:100%;height:100%;"></div>
</div>
</body>

<script type="text/javascript" charset="utf-8" src="/static/js/framework.js"></script>
</html>
