<%--
  Created by IntelliJ IDEA.
  User: 王娇
  Date: 2017/5/16
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <title>用户资料修改</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%--引入公共CSS 样式--%>
    <%@ include file="/WEB-INF/jsp/common/common_css.jsp" %>

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
                       // window.location.href = data.data.nextUrl; //返回到主页
                        alert(data.msg);
                         window.location.href = "<%=request.getContextPath()%>/mvc/home";//返回主页
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
<%--引入顶部导航jsp  --%>
<%@ include file="/WEB-INF/jsp/index_body/index_top_header.jsp" %>

<%--引入左侧菜单栏--%>
<%@ include file="index_body/index_siderbar.jsp" %>
<%--页面功能箱子--%>
<div id="content">
    <div id="content-header">
        <div id="breadcrumb"><a href="<%=request.getContextPath()%>/mvc/home" title="欢迎回来" class="tip-bottom"><i
                class="icon-home"></i> 首页</a> <a href="<%=request.getContextPath()%>/mvc/userAction/update" class="current">更改个人信息</a>
        </div>
        <div class="container-fluid">
            <hr>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span10">
                <div id="web_update">
                <div  class="widget-box">
                    <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
                        <h5>${userInfo.accountName}用户编辑</h5>
                    </div>
                    <form id="formId"
                          enctype="multipart/form-data"
                          class="form-horizontal"
                          action=""
                          method="post"
                          accept-charset="utf-8">
                        <input type="hidden" id="loginId" name="accountName" value="${userInfo.accountName}">
                        <div class="control-group">
                            <label class="control-label span4">原用户密码 :</label>
                            <div class="controls">
                                <input type="text" placeholder="${userMess.password}" id="pwd" name="password"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="请输入6-10位有效数字或字母" >
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label span4">原真实姓名 :</label>
                            <div class="controls">
                                <input id="username" type="text" name="realName"
                                       placeholder="${userMess.realName}"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="请填写真实姓名">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label span4">原电子邮箱 ：</label>
                            <div class="controls">
                                <input type="text" id="Email" name="email"
                                       placeholder="${userMess.email}"
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
                            <label class="control-label span4">原移动电话 ：</label>
                            <div class="controls">
                                <input type="text" id="phone" name="mobilePhone"
                                       placeholder="${userMess.mobilePhone}"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="电话唯一">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label span4">原邮政编码 ：</label>
                            <div class="controls">
                                <input type="text" id="code" name="postcode"
                                       placeholder="${userMess.postcode}"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="请输入6位有效数字的邮编">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label span4">原QQ号码 ：  </label>
                            <div class="controls">
                                <input type="text" id="QQ" name="qq"
                                       placeholder="${userMess.qq}"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="QQ号码">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label span4">身份证号 ：</label>
                            <div class="controls">
                                <input type="text" id="card" name="idcard"
                                       placeholder="${userMess.idcard}"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="请输入有效位数二代身份证,18位数字号码">
                            </div>
                        </div>
                        <div class="control-group ">
                            <label class="control-label span4">原家庭住址 ：</label>
                            <div class="controls">
                                <input type="text" id="adress" name="postAdress"
                                       placeholder="${userMess.postAdress}"
                                       data-title=""
                                       class="span3 tip"
                                       data-original-title="建议字数不超过五十个字">
                            </div>
                        </div>
                    </form>
                        <%--<div class="control-group">--%>
                            <%--<label class="control-label">权限审核</label>--%>
                            <%--<div class="controls">--%>
                                <%--<label class="checkbox-inline span3">--%>
                                    <%--<input type="radio" name="optionsRadiosinline" id="optionsRadios3" value="option1" checked>--%>
                                    <%--停用 </label>--%>
                                <%--<label class="checkbox-inline">--%>
                                    <%--<input type="radio" name="optionsRadiosinline" id="optionsRadios4" value="option2">--%>
                                    <%--启用</label>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                            <label class="control-label center"></label>
                            <div class="controls">
                                <%--<button type="reset" class="btn btn-danger" >重置</button>--%>
                                &emsp; &emsp; &emsp; &emsp; &emsp;&emsp; &emsp; &emsp; &emsp; &emsp;&emsp; &emsp; &emsp; &emsp; &emsp;
                                <input type="button" class="btn btn-success" id="update" onclick="webUpdate();"
                                       value="提交修改"/>
                            </div>
                </div> <!--widget-box end-->

                </div>
            </div>
        </div>
        <!-- row-fluid-->
    </div>
    <!--container-fluid end-->
</div>
<!-- 引入页面底部文件Footer-part-->
<%@ include file="/WEB-INF/jsp/index_body/index_footer.jsp" %>
<!--end-Footer-part-->

<%--引入公共的js脚本，防止页面部分功能冲突--%>
<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>

<%--单独引用js脚本--%>
<script type="text/javascript" src="<c:url value='/static/js/doT.min.js'/>"></script>

<!--end-javascript-part-->
</body>
</html>
