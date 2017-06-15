<%--
  Created by IntelliJ IDEA.
  User: 王娇  查看个人资料  修改个人头像 页面
  Date: 2017/4/25
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<%--定义退出系统--%>
<script type="text/javascript">
    function logout() {
        if (!confirm("您确定要退出吗？")) {
            location.href = '<%=request.getContextPath()%>/mvc/login';
        }
        else {
            return false;
        }
    }
</script>
<script type="text/javascript">
    //   ============ 修改个人头像 start==========


    //    var path = $("#path").val();

    function upLoadFile() {
        var loginId1 = $("#loginId1").val();
        fileName = document.getElementById('changeHeadPic').value;
        alert("打印新上传的地址"+fileName);
        alert("打印修改谁的头像地址"+loginId1);
        // var path = $("#headImage").val();
        $.ajaxFileUpload({
            url: "<%=request.getContextPath()%>/userAction/uploadHeadPic",//请求修改个人头像接口地址
            data: {
                //                headImage: path,
                accountName: loginId1
            },
            secureuri: false,//是否需要安全协议，一般设置为false
            fileElementId: 'changeHeadPic',//文件上传域Id
            dataType: 'json',//返回值类型 一般设置为json
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function (data) {
                alert(data.msg);
                alert("修改后，请重新登录");
//                location.reload() //点击按钮刷新页面
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

    //显示个人修改头像窗口
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
        <%--src="/static/images/avatar-1.jpg"--%>
        <img src="${userPath}" id="target" alt="user-img" title="点击头像" onclick="changeImageInfo()"
             class="img-circle img-thumbnail img-responsive">修改头像
    </div>
</div>
<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
    <ul class="nav">
        <li class="dropdown" id="profile-messages">
            <a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i
                    class="icon icon-user"></i> <span class="text">${userInfo.accountName}欢迎用户</span><b
                    class="caret"></b></a>
            <ul class="dropdown-menu">
                <%--modal弹窗触发的修改个人资料--%>
                <li><a data-toggle="modal" data-target="#my-prompt1" href="#"><i class="icon-user"></i> 个人资料</a></li>
                <li class="divider">
                <li><a href="<%=request.getContextPath()%>/mvc/login"><i class="icon-key"></i> 退出登录</a></li>
            </ul>
        </li>
        <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages"
                                                   class="dropdown-toggle"><i class="icon icon-envelope"></i> <span
                class="text">设置</span> <span class="label label-important">3</span> <b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a class="sAdd" title="" href="/ssm_vendor/static/view/yoocoo.html"><i class="icon-plus"></i> 总结</a></li>
                <li class="divider"></li>
                <li><a class="sInbox" title="" href="javascript:alert('预留功能，待开发')"><i class="icon-envelope"></i> 换肤</a>
                </li>
                <li class="divider"></li>
                <li><a class="sOutbox" title="" href="javascript:alert('预留功能，待开发')"><i
                        class="icon-arrow-up"></i> ${userInfo.accountName}</a></li>
                <li class="divider"></li>
                <li><a class="sTrash" title="" href="javascript:alert('预留功能，待开发')"><i class="icon-trash"></i> 切换菜单</a>
                </li>
            </ul>
        </li>
        <li class=""><a title="" href=javascript:logout()><i class="icon icon-share-alt"></i>
            <span class="text">退出系统</span></a></li>
    </ul>
</div>
<!--close-top-Header-menu-->
<!--start-top-search-->
<div id="search">
    <input type="text" placeholder="请在此处搜索部分功能"/>
    <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<!--close-top-search-->

<%--查看个人资料  start====--%>

<div class="modal hide modal" id="my-prompt1" aria-labelledby="myModal-prompt1">
    <div class="modal-dialog " tabindex="-1">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModal-prompt1">${userInfo.accountName}--个人资料 </h4>
            </div>
            <%--modal-header end--%>
            <div id="web_update">
                <div class="modal-body ">
                    <form id="formId" class="form-horizontal">
                        <%--<input type="hidden" id="loginId" name="accountName" value="${userInfo.accountName}">--%>
                        <div class="control-group">
                            <label class="control-label">用户密码 :</label>
                            <div class="controls"><span>${userMess.password}</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">真实姓名 :</label>
                            <div class="controls">
                                ${userMess.realName}
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">电子邮箱 ：</label>
                            <div class="controls">${userMess.email}
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">移动电话 ：</label>
                            <div class="controls">${userMess.mobilePhone}
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">邮政编码 ：</label>
                            <div class="controls">${userMess.postcode}
                            </div>
                        </div>
                            <div class="control-group">
                                <label class="control-label">角色ID ：</label>
                                <div class="controls">${userMess.roleId}
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">生产商ID ：</label>
                                <div class="controls">${userMess.factoryId}
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">运营商ID ：</label>
                                <div class="controls">${userMess.agencyId}
                                </div>
                            </div>
                        <div class="control-group">
                            <label class="control-label">QQ号码 ： </label>
                            <div class="controls">${userMess.qq}
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">身份证号 ：</label>
                            <div class="controls">${userMess.idcard}
                            </div>
                        </div>
                        <div class="control-group ">
                            <label class="control-label">家庭住址 ：</label>
                            <div class="controls">${userMess.postAdress}
                            </div>
                        </div>

                    </form>
                </div>

                <%--modal-body end--%>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-danger" data-dismiss="modal">返回
                    </button>
                </div>
                <%--modal-footer--%>
            </div>
            <%--modal-content end --%>
        </div>
        <%--moadal-dialog end--%>
    </div>
    <%--modal end--%>
</div>

<%--=======    查看个人资料  end   --%>


<%--=修改个人头像  start====--%>
<div class="modal hide modal" id="my-prompt" aria-labelledby="myModal-prompt">
    <div class="modal-dialog " tabindex="-1">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModal-prompt">修改个人头像</h4>
            </div>
            <%--modal-header end--%>

            <div class="modal-body ">
                <form class="form-horizontal "
                      enctype="multipart/form-data"
                      accept-charset="utf-8"
                <%--action=""--%>
                <%--method="post"--%>
                >
                    <input type="hidden" id="loginId1" name="accountName" value="${userInfo.accountName}">
                    <div class="modal-prompt-input span5">
                        <div class="control-group ">
                            <label class="control-label">上传头像</label>
                            <ul class="thumbnails">
                                <li class="span2"><a> <img src="/ssm_vendor/static/images/avatar-0.jpg" alt=""> </a>
                                    <div class="actions"><a title="编辑" href="#"><i class="icon-pencil"></i></a> <a
                                            class="lightbox_trigger" title="图片预览" href="${userPath} "><i
                                            class="icon-search"></i></a></div>
                            </ul>
                            <div class="controls span3 ">
                                <input type="file" name="file" id="changeHeadPic" size="28"/>
                                <%--<input type="text" id="path" name="headImage" value="${file}">--%>
                            </div>
                        </div>

                    </div>
                </form>
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

</body>
</html>
