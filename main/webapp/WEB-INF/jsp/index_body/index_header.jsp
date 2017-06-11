<%--
  Created by IntelliJ IDEA.
  User: WJ
  Date: 2017/5/6
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>记住这是一个废弃的jsp  </title>
    <%--该页面使用的 图片裁剪css 样式--%>
    <link href="https://cdn.bootcss.com/cropper/3.0.0-rc.2/cropper.min.css" rel="stylesheet">
</head>
<script type="text/javascript">
    //   ============ 修改个人头像 start==========
    var loginId1 = $("#loginId1").val();
    alert("用户名"+loginId1);
    var fileName;
    function upLoadFile() {
        fileName = document.getElementById('changeHeadPic').value;
        $.ajaxFileUpload({
            url: "<%=request.getContextPath()%>/userAction/uploadHeadPic",
            data: {
                accountName: loginId1
            },
            secureuri: false,//是否需要安全协议，一般设置为false
            fileElementId: 'changeHeadPic',//文件上传域Id
            dataType: 'json',//返回值类型 一般设置为json
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function (data) {
                alert(data.msg);
//                $("#user").focus();
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

<!--Header-part-->
<div id="header">
    <div class="img" id="admin-offcanvas">
        <img src="/static/images/avatar-1.jpg" alt="user-img" title="点击头像查看" onclick="changeImageInfo()"
             class="img-circle img-thumbnail img-responsive">查看头像
    </div>
    <!--close-Header-part-->

    <%--=修改个人头像  模态触发 start====--%>
    <div class="modal fade modal" id="my-prompt" aria-labelledby="myModal-prompt">
        <div class="modal-dialog " tabindex="-1">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModal-prompt">修改个人头像</h4>
                </div>
                <%--modal-header end--%>

                <div class="modal-body ">
                    <form class="form-horizontal " enctype="multipart/form-data" accept-charset="utf-8">
                        <%--===============================================--%>
                        <div class="modal-prompt-input span5">
                            <div class="control-group ">
                                <label class="control-label">查看头像</label>
                                <ul class="thumbnails">
                                    <li class="span2"><a> <img src="/static/images/avatar-1.jpg" alt=""> </a>
                                        <div class="actions">
                                            <%--<a title="编辑" href="#"><i class="icon-pencil"></i></a> --%>
                                            <a class="lightbox_trigger" title="预览"
                                                href="/static/images/avatar-1.jpg"><i class="icon-search"></i></a>
                                        </div>
                                </ul>
                                <div class="controls span3 ">
                                    <input type="hidden" id="loginId1" name="accountName" value="${userInfo.accountName}">
                                    <input type="file" name="file" id="changeHeadPic" size="28"/>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <%--================================--%>

                    <%--</form>--%>
                </div>
                <%--modal-body end--%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" onclick="onCancel();" data-dismiss="modal">返回
                    </button>
                    <button type="button" class="btn btn-success" onclick="onConfirm();" data-dismiss="modal">上传
                    </button>
                </div>
                <%--modal-footer--%>
            </div>
            <%--modal-content end --%>
        </div>
        <%--moadal-dialog end--%>
    </div>
    <%--modal end--%>
    <%--=======    修改个人头像  end   --%>
</div>

<%--文件上传和下载 脚本引用--%>
<script type="text/javascript" src="<c:url value='/static/js/jquery.ajaxfileupload.js'/>"></script>

<%--该文件单独引用 cropper裁剪 的js 脚本--%>
<script src="https://cdn.bootcss.com/cropper/3.0.0-rc.2/cropper.min.js"></script>

</body>
</html>
