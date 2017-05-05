<%--
  Created by IntelliJ IDEA.
  User: WJ
  Date: 2017/4/25
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>左侧菜单分角色</title>
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
<!--close-Header-part-->
<!--Header-part-->
<div id="header">
    <div class="img" id="admin-offcanvas">
        <img src="/static/images/avatar-1.jpg" alt="user-img" title="点击头像修改个人资料" onclick="changeImageInfo()"
             class="img-circle img-thumbnail img-responsive">修改头像
    </div>
</div>
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
</body>
</html>
