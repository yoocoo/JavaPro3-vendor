<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/5/21
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <title>系统用户sysuser-res</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%--引入公共CSS 样式--%>
    <%@ include file="/WEB-INF/jsp/common_css.jsp" %>

</head>
<script>
    function webReg() {
        if ($('#user').val() == "") {
            $('#user').focus();
            $('#user').tips({
                side: 2,
                msg: '用户名不能为空',
                bg: '#AE81FF',
                time: 3,
            });
            return false;
        }
        if ($('#user').val().length < 4 || $('#user').val().length > 10) {
            $('#user').focus();
            $('#user').tips({
                side: 2,
                msg: '用户名位数建议4-10位',
                bg: '#AE81FF',
                time: 3,
            });
            return false;
        }
        if ($('#passwd').val().length < 6) {
            $('#passwd').focus();
            $("#passwd").tips({
                side: 2,
                msg: '密码不能小于6位',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        if ($('#passwd2').val() != $('#passwd').val()) {
            $('#passwd2').focus();
            $("#passwd2").tips({
                side: 2,
                msg: '两次密码不一致',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }


        var sqq = /^1[34578]\d{9}$/;
        if (!sqq.test($('#cellnumber').val())
            || $('#cellnumber').val().length < 11
            || $('#cellnumber').val().length > 14
            || $('#cellnumber').val() == "") {

            $('#cellnumber').focus();
            $("#cellnumber").tips({
                side: 2,
                msg: '手机号不正确',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        var loginname = $("#user").val();
        var password = $("#passwd").val();
        var cellnumber = $("#cellnumber").val();
//        var realname =  $("select option:selected").val();
//        alert($(":selected","#sel").attr("id"));
//        alert($(":selected","#sel").val();
//        alert($("select option:selected").attr("id"));//弹出Id的值
//        alert($("select option:selected").val());//弹出  存入数据库的值
//        var roleid = $(":selected","#sel").val();
//        var roleid = $("#roleid").val();
        var realname =$("#realname").val();
        var roleid =  $("select option:selected").val();
//        var roleid = "3";
        $.ajax({
            type: "POST",
            url: '<%=request.getContextPath()%>/userAction/sysuserRes',
            data: {accountName: loginname, password: password, mobilePhone: cellnumber,
                roleId:roleid, realName:realname},
            dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
            cache: false,
            success: function (data) {
                if (data.code == 1) {
//                    window.location.href = data.data.nextUrl;
                    alert(data.msg);
                    window.location.href = "<%=request.getContextPath()%>/mvc/home";//返回主页
                } else {
                    alert(data.msg);
                    $("#user").focus();
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
                class="icon-home"></i> 首页</a> <a href="<%=request.getContextPath()%>/mvc/userAction/sysuserRes"
                                                 class="current">一级用户管理</a>
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
                    <h5>用户创建</h5>
                </div>
                <div id="web_reg">

                    <form name="regform" id="regUser" class="form-horizontal"
                          action=""
                          accept-charset="utf-8"
                          method="post">
                        <%--<a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons">--%>
                            <%--&#xE5C4;</i></a>--%>
                            <div class="control-group">
                                <label class="control-label span4">账户名:</label>
                                <div class="controls">
                                    <input type="text" placeholder="" id="user" name="accountName"
                                           data-title=""
                                           class="span3 tip"
                                           data-original-title="请输入6-10位有效数字或字母" >
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label span4">用户密码:</label>
                                <div class="controls">
                                    <input type="password" placeholder="" id="passwd" name="password"
                                           data-title=""
                                           class="span3 tip"
                                           data-original-title="请输入小于6位密码" >
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label span4">确认密码:</label>
                                <div class="controls">
                                    <input type="password" placeholder="" id="passwd2" name="password"
                                           data-title=""
                                           class="span3 tip"
                                           data-original-title="请输入小于6位密码" >
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label span4">联系电话:</label>
                                <div class="controls">
                                    <input type="text" placeholder="" id="cellnumber" name="mobilePhone"
                                           data-title=""
                                           class="span3 tip"
                                           data-original-title="请输入6-10位有效数字或字母" >
                                </div>
                            </div>
                            <%--=======================================================--%>
                            <%--<div class="control-group">--%>
                                <%--<label class="control-label span4">角色id:</label>--%>
                                <%--<div class="controls">--%>
                                    <%--<input type="text" placeholder="" id="roleid" name="roleId"--%>
                                           <%--data-title=""--%>
                                           <%--class="span3 tip"--%>
                                           <%--data-original-title="请输入6-10位有效数字或字母" >--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <div class="control-group">
                                <label class="control-label span4">真实姓名:</label>
                                <div class="controls">
                                    <input type="text" placeholder="" id="realname" name="realName"
                                           data-title=""
                                           class="span3 tip"
                                           data-original-title="请输入6-10位有效数字或字母" >
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">角色类型</label>
                                <div class="controls">
                                    <div class="form-group span4 ">
                                        <select class="form-control" id="sel" name="roleId" placeholder="请选择角色种类"
                                                <%--aria-describedby="basic-addon1"--%>>
                                            <%--<option value="1" id="1"> 系统管理员</option>--%>
                                                <option value="1" id="1"> 系统管理员</option>
                                            <%--<option value="2"> 系统操作员</option>--%>
                                            <option value="3" id="2" >运营商管理员</option>
                                            <%--<option value="4">运营商配货员</option>--%>
                                            <%--<option value="5">运营商仓库员</option>--%>
                                            <option value="6" id="3">生产商管理员</option>
                                            <%--<option value="7">生产商操作员</option>--%>
                                            <option value="8" id="4">出租商管理员</option>
                                            <%--<option value="9">出租商操作员</option>--%>
                                            <option value="10" id="5"> 贸易商管理员</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <%--<div class="control-group">--%>
                                <%--<label class="control-label">真实姓名</label>--%>
                                <%--<div class="controls">--%>
                                    <%--<div class="form-group span4 ">--%>
                                        <%--<select class="form-control" id="realname" name="realName" placeholder="请选择"--%>
                                        <%--&lt;%&ndash;aria-describedby="basic-addon1"&ndash;%&gt;>--%>
                                            <%--&lt;%&ndash;<option value="1" id="1"> 系统管理员</option>&ndash;%&gt;--%>
                                            <%--<option value="系统管理员" id="1"> 系统管理员</option>--%>
                                            <%--&lt;%&ndash;<option value="2"> 系统操作员</option>&ndash;%&gt;--%>
                                            <%--<option value="运营商管理员" id="2" >运营商管理员</option>--%>
                                            <%--&lt;%&ndash;<option value="4">运营商配货员</option>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<option value="5">运营商仓库员</option>&ndash;%&gt;--%>
                                            <%--<option value="生产商管理员" id="3">生产商管理员</option>--%>
                                            <%--&lt;%&ndash;<option value="7">生产商操作员</option>&ndash;%&gt;--%>
                                            <%--<option value="出租商管理员" id="4">出租商管理员</option>--%>
                                            <%--&lt;%&ndash;<option value="9">出租商操作员</option>&ndash;%&gt;--%>
                                            <%--<option value="贸易商管理员" id="5"> 贸易商管理员</option>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
<%--=================================================================================--%>
                            <%--<div class="control-group">--%>
                                <%--<label class="control-label">角色类型</label>--%>
                                <%--<div class="controls">--%>
                                    <%--<label>--%>
                                        <%--<input  type="radio" name="roleId" value="3" />--%>
                                        <%--运营商管理员</label>--%>
                                    <%--<label>--%>
                                        <%--<input type="radio" name="roleId" value="6"/>--%>
                                        <%--生产商管理员</label>--%>
                                    <%--<label>--%>
                                        <%--<input type="radio" name="roleId" value="8"/>--%>
                                        <%--出租商管理员</label>--%>
                                    <%--<label>--%>
                                        <%--<input type="radio" name="roleId" value="10"/>--%>
                                        <%--贸易商管理员</label>--%>
                                <%--</div>--%>
                            <%--</div>--%>
<%--==================================================================================================--%>



                        <%--<input type="password" id="passwd" placeholder="密码" name="password"/>--%>
                        <%--<input type="password" id="passwd2" placeholder="确认密码" name="password"/>--%>
                        <%--<input type="text" id="cellnumber" placeholder="联系电话" name="mobilePhone"/>--%>
                            <label class="control-label center"></label>
                            <div class="controls">
                                <%--<button type="reset" class="btn btn-danger" >重置</button>--%>
                                <input type="button" class="btn btn-success" id="reg" onclick="webReg();"
                                       value="申请创建"/>
                            </div>
                        <%--<input class="btn_sign_up" type="button" id="reg" onclick="webReg();"--%>
                               <%--value="   创建"/>--%>
                        <%--<a href="#" target="_blank"> 注册协议</a>--%>
                    </form>
                </div>
                <%--注册结束--%>


            </div>
        </div>
        <!-- span12-->
    </div>

</div>
<!-- 引入页面底部文件Footer-part-->
<%@ include file="/WEB-INF/jsp/index_footer.jsp" %>
<!--end-Footer-part-->

<%--引入公共的js脚本，防止页面部分功能冲突--%>
<%@ include file="/WEB-INF/jsp/common_js.jsp" %>
<!--end-javascript-part-->
</body>

</html>
