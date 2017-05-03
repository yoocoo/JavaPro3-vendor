<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/4/25
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<script type="text/javascript">

    //   ========== 修改个人资料 start========
    function webUpdate() {
        if (onChangeInfo()) {
            var loginId = $("#loginId").val();
            var username = $("#username").val();
            var pwd = $("#pwd").val();
            var Email = $("#Email").val();
//        var roleid = $("#roleid").val();
            var phone = $("#phone").val();
            var code = $("#code").val();
            var QQ = $("#QQ").val();
            var card = $("#card").val();
            var adress = $("#adress").val();
            $.ajax({   //使用jquery下面的ajax开启网络请求
                type: "POST",  //http请求方式为POST
                url: '<%=request.getContextPath()%>/userAction/update',   //请求修改个人资料的接口的地址
                data: {
                    password: pwd,
                    realName: username,
                    email: Email,
                    mobilePhone: phone,
                    postcode: code,
                    qq: QQ,
                    idcard: card,
                    postAdress: adress,
                    accountName: loginId
                },  // 存放数据服务接口字段为下面的字段，为别对应 修改的用户密码，真实姓名，邮箱，移动电话，邮编，qq号码，身份证号，家庭地址，指定的用户名
                dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
                cache: false,  //不用缓存
                success: function (data) { //请求成功，http状态码为200。返回的数据已经打包在data中了
                    if (data.code == 1) {  //获判断json数据中的code是否为1，登录的用户名和密码匹配，通过效验，登陆成功
                        window.location.href = data.data.nextUrl; //返回到主页
                        alert(data.msg);
                        // window.location.href = "<%=request.getContextPath()%>/mvc/home";//返回主页
                    } else {//更新不成功
                        alert(data.msg);//弹出对话框，提示返回错误信息
                        // $("#loginId").focus();
                    }
                }
            });
        }
    }
    function onChangeInfo() {
        //    判断修改的个人资料是否符合条件
        if ($('#username').val().length < 2 || $('#username').val().length > 4 || $('#username').val() == "") {
            $('#username').focus();
            $('#username').tips({
                side: 2,
                msg: "用户真实姓名必须为2-4个字符",
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }

//          判断新修改的手机号 是否符合手机号码规则
        var sqq = /^1[34578]\d{9}$/;
        if (!sqq.test($('#phone').val())
            || $('#phone').val().length < 11
            || $('#phone').val().length > 14
            || $('#phone').val() == "") {

            $('#phone').focus();
            $("#phone").tips({
                side: 2,
                msg: '手机号不正确',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        return true;
    }

</script>

<body>

<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
    <ul class="nav">
        <li class="dropdown" id="profile-messages">
            <a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i
                    class="icon icon-user"></i> <span class="text">欢迎用户</span><b class="caret"></b></a>
            <ul class="dropdown-menu">
                <%--modal弹窗触发的修改个人资料--%>
                <li><a data-toggle="modal" data-target="#my-prompt1" href="#"><i class="icon-user"></i> 个人资料</a></li>
                <li class="divider">
                <li><a href="<%=request.getContextPath()%>/mvc/login"><i class="icon-key"></i> 退出登录</a></li>
            </ul>
        </li>
        <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">设置</span> <span class="label label-important">3</span> <b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a class="sAdd" title="" href="javascript:alert('预留功能，待开发')"><i class="icon-plus"></i> 通知</a></li>
                <li class="divider"><>
                <li><a class="sInbox" title="" href="javascript:alert('预留功能，待开发')"><i class="icon-envelope"></i> 换肤</a></li>
                <li class="divider"><>
                <li><a class="sOutbox" title="" href="javascript:alert('预留功能，待开发')"><i class="icon-arrow-up"></i> ${userInfo.accountName}</a></li>
                <li class="divider"><>
                <li><a class="sTrash" title="" href="javascript:alert('预留功能，待开发')"><i class="icon-trash"></i> 切换菜单</a></li>
            </ul>
            </li>
        <li class=""><a title="" href="<%=request.getContextPath()%>/mvc/login"><i class="icon icon-share-alt"></i>
            <span class="text">安全退出</span></a></li>
    </ul>
</div>
<!--close-top-Header-menu-->
<!--start-top-search-->
<div id="search">
    <input type="text" placeholder="请在此处搜索部分功能"/>
    <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<!--close-top-search-->

<%--=修改个人资料  start====--%>

<div class="modal fade modal" id="my-prompt1" aria-labelledby="myModal-prompt1">
    <div class="modal-dialog " tabindex="-1">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModal-prompt1">${userInfo.accountName}--修改个人资料 </h4>
            </div>
            <%--modal-header end--%>
            <div id="web_update">
                <div class="modal-body ">
                    <%--enctype="multipart/form-data"--%>
                    <form id="formId"
                          enctype="multipart/form-data"
                          class="form-horizontal"
                          action=""
                          method="post"
                          accept-charset="utf-8">
                        <input type="hidden" id="loginId" name="accountName" value="${userInfo.accountName}">
                        <div class="control-group">
                            <label class="control-label">用户密码</label>
                            <div class="controls">
                                <input type="text" id="pwd" name="password"
                                       placeholder="待设置"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="请输入6-10位有效数字或字母">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">真实姓名</label>
                            <div class="controls">
                                <input id="username" type="text" name="realName"
                                       placeholder="待设置"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="请填写真实姓名">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">电子邮箱</label>
                            <div class="controls">
                                <input type="text" id="Email" name="email"
                                       placeholder="待设置"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="请填写真实有效邮箱，方便找回密码">
                            </div>
                        </div>
                        <%--<div class="control-group">--%>
                        <%--<label class="control-label">角色类型</label>--%>
                        <%--<div class="controls">--%>
                        <%--<div class="form-group span4 ">--%>
                        <%--<select class="form-control" id="roleid" name="roleId" placeholder="请选择角色种类"--%>
                        <%--aria-describedby="basic-addon1"--%>
                        <%--data-original-title="请务必选择真实有效角色,否则不予通过验证">--%>
                        <%--<option value="1"> 系统管理员</option>--%>
                        <%--<option value="2"> 系统操作员</option>--%>
                        <%--<option value="3">运营商管理员</option>--%>
                        <%--<option value="4">运营商配货员</option>--%>
                        <%--<option value="5">运营商仓库员</option>--%>
                        <%--<option value="6">生产商管理员</option>--%>
                        <%--<option value="7">生产商操作员</option>--%>
                        <%--<option value="8">出租商管理员</option>--%>
                        <%--<option value="9">出租商操作员</option>--%>
                        <%--<option value="10"> 贸易商管理员</option>--%>
                        <%--</select>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <div class="control-group">
                            <label class="control-label">移动电话</label>
                            <div class="controls">
                                <input type="text" id="phone" name="mobilePhone"
                                       placeholder="待设置"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="电话唯一">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">邮政编码</label>
                            <div class="controls">
                                <input type="text" id="code" name="postcode"
                                       placeholder="待设置"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="请输入6位有效数字的邮编">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">QQ号码</label>
                            <div class="controls">
                                <input type="text" id="QQ" name="qq"
                                       placeholder="待设置"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="QQ号码">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">身份证号</label>
                            <div class="controls">
                                <input type="text" id="card" name="idcard"
                                       placeholder="待设置"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="请输入有效位数二代身份证,18位数字号码">
                            </div>
                        </div>
                        <div class="control-group ">
                            <label class="control-label">家庭住址</label>
                            <div class="controls">
                                <input type="text" id="adress" name="postAdress"
                                       placeholder="待设置"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="建议字数不超过五十个字">
                            </div>
                        </div>
                        <hr>
                    </form>
                </div>

                <%--modal-body end--%>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-danger" data-dismiss="modal">返回
                    </button>
                    <input type="button" class="btn btn-success" id="update" onclick="webUpdate();"
                           data-dismiss="modal"
                           value=" 提交修改"/>
                </div>
                <%--modal-footer--%>
            </div>
            <%--modal-content end --%>
        </div>
        <%--moadal-dialog end--%>
    </div>
    <%--modal end--%>
</div>

<%--=======    修改个人资料  end   --%>


<%--=修改个人头像  start====--%>
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

                    <div class="modal-prompt-input span5">
                        <div class="control-group ">
                            <label class="control-label">上传头像</label>
                            <ul class="thumbnails">
                                <li class="span2"><a> <img src="/static/images/avatar-1.jpg" alt=""> </a>
                                    <div class="actions"><a title="编辑" href="#"><i class="icon-pencil"></i></a> <a
                                            class="lightbox_trigger" title="预览" href="/static/images/avatar-1.jpg"><i
                                            class="icon-search"></i></a></div>
                            </ul>
                            <div class="controls span3 ">
                                <input type="file" name="file" id="changeHeadPic" size="28"/>
                            </div>
                        </div>
                        <hr>
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
