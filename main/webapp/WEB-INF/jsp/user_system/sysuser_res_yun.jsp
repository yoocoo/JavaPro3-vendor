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
    <%@ include file="/WEB-INF/jsp/common/common_css.jsp" %>

</head>
<%--创建生产商管理 用户--%>
<script type="text/javascript">
    function webRes() {
        if ($('#user1').val() == "") {
            $('#user1').focus();
            $('#user1').tips({
                side: 2,
                msg: '用户名不能为空',
                bg: '#AE81FF',
                time: 3,
            });
            return false;
        }
        if ($('#user1').val().length < 4 || $('#user1').val().length > 10) {
            $('#user1').focus();
            $('#user1').tips({
                side: 2,
                msg: '用户名位数建议4-10位',
                bg: '#AE81FF',
                time: 3,
            });
            return false;
        }
        if ($('#passwd3').val().length < 6) {
            $('#passwd3').focus();
            $("#passwd3").tips({
                side: 2,
                msg: '密码不能小于6位',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        if ($('#passwd4').val() != $('#passwd3').val()) {
            $('#passwd4').focus();
            $("#passwd4").tips({
                side: 2,
                msg: '两次密码不一致',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }


        var sqq = /^1[34578]\d{9}$/;
        if (!sqq.test($('#cellnumber1').val())
            || $('#cellnumber1').val().length < 11
            || $('#cellnumber1').val().length > 14
            || $('#cellnumber1').val() == "") {

            $('#cellnumber1').focus();
            $("#cellnumber1").tips({
                side: 2,
                msg: '手机号不正确',
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        var loginname = $("#user1").val();
        var password = $("#passwd3").val();
        var cellnumber = $("#cellnumber1").val();
        var realname = $("#realname1").val();
        var roleid = $("select option:selected").val();
        //        alert($(":selected","#sel").attr("id"));
        alert("生产商 贸易商 管理员roleid=  6 和10 ");
        alert($(":selected", "#sel").val());
//        alert($("select option:selected").attr("id"));//弹出Id的值
//        alert($("select option:selected").val());//弹出  存入数据库的值
//        var roleid = $(":selected","#sel").val();
//        var roleid = $("#roleid").val();
//  测试用
        var roleid = $(":selected", "#sel1").val();

        var Email = $("#Email1").val();
        var qq = $("#qq1").val();
        var code = $("#code1").val();
        var card = $("#card1").val();
        var adress = $("#adress1").val();
        //        ==========================生产商信息=========================

        var factoryname = $("#factoryname").val();
        alert($(":selected", "#sel2").val());
        var factorytype = $(":selected", "#sel2").val()
//        var factorytype = $("select option:selected").val();

//        var cashtablename= $("#cashtablename").val();
//        var ordertablename= $("#ordertablename").val();
//        var saletablename= $("#saletablename").val();
//        var alarmtablename= $("#alarmtablename").val();
        var factorylogopath = $("#factorylogopath").val();
        var sfeereturnrate = $("#sfeereturnrate").val();
        var qrreturnrate = $("#qrreturnrate").val();
        alert($(":selected", "#sel3").val());
        var receiveaccount = $(":selected", "#sel3").val();
//        var receiveaccount = $("select option:selected").val();
        var openbankname = $("#openbankname").val();
        var openaccountname = $("#openaccountname").val();
        var factoryname = $("#factoryname").val();
        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/userAction/sysuserResSheng",
            data: {
                accountName: loginname,
                password: password,
                mobilePhone: cellnumber,
                roleId: roleid,
                realName: realname,
                email: Email,
                QQ: qq,
                postcode: code,
                idcard: card,
                postAdress: adress,
                factoryName: factoryname,
                factoryType: factorytype,
//                cashTableName:cashtablename,
//                orderTableName: ordertablename,
//                saleTableName:saletablename,
//                alarmTableName:alarmtablename,
                factoryLogoPath: factorylogopath,
                sfeeReturnRate: sfeereturnrate,
                qrReturnRate: qrreturnrate,
                receiveAccount: receiveaccount,
                openBankName: openbankname,
                openAccountName: openaccountname
            },
            dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
            cache: false,
            success: function (data) {
                if (data.code == 1) {
//                    window.location.href = data.data.nextUrl;
                    alert(data.msg);
                    window.location.href = "<%=request.getContextPath()%>/mvc/home";//返回到后台首页
                } else {
                    alert(data.msg);
                    $("#user").focus();
                    $("#factory").focus();
                }
            }
        })
        ;
    }
</script>
<script type="text/javascript">
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
        var realname = $("#realname").val();
        alert("检查运营商管理员roleid=  3 ");
        alert($(":selected", "#sel").val());
        var roleid = $(":selected", "#sel").val();
//        var roleid = $("select option:selected").val();
        var Email = $("#Email").val();
        var qq = $("#qq").val();
        var code = $("#code").val();
        var card = $("#card").val();
        var adress = $("#adress").val();

//        =========================
        var agencyname = $("#agencyname").val();

        $.ajax({
            type: "POST",
            url: '<%=request.getContextPath()%>/userAction/sysuserRes',
            data: {
                accountName: loginname,
                password: password,
                mobilePhone: cellnumber,
                roleId: roleid,
                realName: realname,
                email: Email,
                QQ: qq,
                postcode: code,
                idcard: card,
                postAdress: adress,
                agencyName: agencyname
            },
            dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
            cache: false,
            success: function (data) {
                if (data.code == 1) {
//                    window.location.href = data.data.nextUrl;
                    alert(data.msg);
                    window.location.href = "<%=request.getContextPath()%>/mvc/home";//返回到后台首页
                } else {
                    alert(data.msg);
                    $("#user").focus();
                    $("#agency").focus();
                }
            }
        })
        ;
    }
</script>
<body>
<%--引入顶部导航jsp  --%>
<%@ include file="/WEB-INF/jsp/index_body/index_top_header.jsp" %>

<%--引入左侧菜单栏--%>
<%@ include file="../index_body/index_siderbar.jsp" %>
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
        <div class="row-fluid">
            <div class="widget-box">
                <div class="widget-title">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab1">运营商管理用户</a></li>
                        <li><a data-toggle="tab" href="#tab2">生产商管理用户</a></li>
                        <li><a data-toggle="tab" href="#tab3">系统管理用户</a></li>

                    </ul>
                </div>
                <div class="widget-content tab-content">
                    <%--==========================tab 5.29  加长版本===========================================--%>
                    <div id="tab1" class="tab-pane active">
                        <p> 新建运营商管理员</p>
                        <div id="web_reg">
                            <form name="regform" id="regUser" class="form-horizontal"
                                  action=""
                                  accept-charset="utf-8"
                                  method="post">
                                <div class="control-group ">
                                    <label class="control-label span4">账户名:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="user" name="accountName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入6-10位有效数字或字母">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">用户密码:</label>
                                    <div class="controls">
                                        <input type="password" placeholder="" id="passwd" name="password"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入小于6位密码">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">确认密码:</label>
                                    <div class="controls">
                                        <input type="password" placeholder="" id="passwd2" name="password"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入小于6位密码">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">联系电话:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="cellnumber" name="mobilePhone"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的电话号码">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">真实姓名:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="realname" name="realName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入6-10位有效数字或字母">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">角色类型</label>
                                    <div class="controls">
                                        <div class="form-group span4 ">
                                            <select class="form-control" id="sel" name="roleId" placeholder="请选择角色种类"
                                            <%--aria-describedby="basic-addon1"--%>>
                                                <%--<option value="1" id="1"> 系统管理员</option>--%>
                                                <%--<option value="1" id="1"> 系统管理员</option>--%>
                                                <%--<option value="2"> 系统操作员</option>--%>
                                                <option value="3" id="2">运营商管理员</option>
                                                <%--<option value="4">运营商配货员</option>--%>
                                                <option value="5">运营商仓库员</option>
                                                <%--<option value="6" id="3">生产商管理员</option>--%>
                                                <%--<option value="7">生产商操作员</option>--%>
                                                <%--<option value="8" id="4">出租商管理员</option>--%>
                                                <%--<option value="9">出租商操作员</option>--%>
                                                <%--<option value="10" id="5"> 贸易商管理员</option>--%>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">用户邮箱:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="Email" name="email"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效邮箱，方便找回密码">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">QQ账号:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="qq" name="QQ"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效QQ号码，方便联系">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">邮政编码:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="code" name="postcode"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入6位有效邮编">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">身份证号:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="card" name="idcard"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的18位身份证信息">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">家庭住址:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="adress" name="postAdress"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的18位身份证信息">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">运营商单位名称:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="agencyname" name="agencyName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效信息">
                                    </div>
                                </div>
                                <label class="control-label center"></label>
                                <div class="controls">
                                    <%--<button type="reset" class="btn btn-danger" >重置</button>--%>
                                    <input type="button" class="btn btn-success" id="reg" onclick="webReg();"
                                           value="提交创建"/>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%--=========================tab1======5.30======双列版=======================================================--%>
                    <%--<div id="tab1" class="tab-pane active">--%>
                        <%--<p> 新建运营商组织</p>--%>
                        <%--<div id="web_reg">--%>
                            <%--<form name="regform" id="regUser"--%>
                                  <%--action=""--%>
                                  <%--accept-charset="utf-8"--%>
                                  <%--method="post">--%>
                                <%--<p> 用户信息</p>--%>
                                <%--<div class=" controls controls-row">--%>
                                    <%--&lt;%&ndash;<span class=""></span>&ndash;%&gt;--%>
                                    <%--<label class="span1 m-wrap">∗账户名:</label>--%>
                                    <%--<div class="span5 m-wrap">--%>
                                        <%--<input type="text" placeholder="" id="user" name="accountName"--%>
                                               <%--data-original-title="请输入6-10位有效数字或字母">--%>
                                    <%--</div>--%>
                                    <%--<label class="span1 m-wrap">∗联系电话:</label>--%>
                                    <%--<div class="span5 m-wrap">--%>
                                        <%--<input type="text" placeholder="" id="cellnumber" name="mobilePhone"--%>
                                               <%--data-original-title="请输入正确的电话号码">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="control-group">--%>
                                    <%--<div class=" controls controls-row">--%>
                                        <%--&lt;%&ndash;<span class=""></span>&ndash;%&gt;--%>
                                        <%--<label class="span1 m-wrap">∗用户密码:</label>--%>
                                        <%--<div class="span5 m-wrap">--%>
                                            <%--<input type="password" placeholder="" id="passwd" name="password"--%>
                                                   <%--data-original-title="请输入小于6位密码">--%>
                                        <%--</div>--%>
                                        <%--<label class="span1 m-wrap">∗确认密码:</label>--%>
                                        <%--<div class="span5 m-wrap">--%>
                                            <%--<input type="password" placeholder="" id="passwd2" name="password"--%>
                                                   <%--data-original-title="请输入小于6位密码">--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class=" controls controls-row">--%>
                                    <%--&lt;%&ndash;<span class=""></span>&ndash;%&gt;--%>
                                    <%--<label class="span1 m-wrap">∗真实姓名:</label>--%>
                                    <%--<div class="span5 m-wrap">--%>
                                        <%--<input type="text" placeholder="" id="realname" name="realName"--%>
                                               <%--data-original-title="请输入6-10位有效数字或字母">--%>
                                    <%--</div>--%>
                                    <%--<label class="span1 m-wrap">用户邮箱:</label>--%>
                                    <%--<div class="span5 m-wrap">--%>
                                        <%--<input type="text" placeholder="" id="Email" name="email"--%>
                                               <%--data-original-title="请输入有效邮箱，方便找回密码">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class=" controls controls-row">--%>
                                    <%--&lt;%&ndash;<span class=""></span>&ndash;%&gt;--%>
                                    <%--<label class="span1 m-wrap">∗QQ账号:</label>--%>
                                    <%--<div class="span5 m-wrap">--%>
                                        <%--<input type="text" placeholder="" id="qq" name="QQ"--%>
                                               <%--data-original-title="请输入有效QQ号码，方便联系">--%>
                                    <%--</div>--%>
                                    <%--<label class="span1 m-wrap">∗邮政编码:</label>--%>
                                    <%--<div class="span5 m-wrap">--%>
                                        <%--<input type="text" placeholder="" id="code" name="postcode"--%>
                                               <%--data-original-title="请输入6位有效邮编">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class=" controls controls-row">--%>
                                    <%--&lt;%&ndash;<span class=""></span>&ndash;%&gt;--%>
                                    <%--<label class="span1 m-wrap">∗身份证号:</label>--%>
                                    <%--<div class="span5 m-wrap">--%>
                                        <%--<input type="text" placeholder="" id="card" name="idcard"--%>
                                               <%--data-original-title="请输入正确的18位身份证信息">--%>
                                    <%--</div>--%>
                                    <%--<label class="span1 m-wrap">∗家庭住址:</label>--%>
                                    <%--<div class="span5 m-wrap">--%>
                                        <%--<input type="text" placeholder="" id="adress" name="postAdress"--%>
                                               <%--data-original-title="请输入正确的18位身份证信息">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class=" controls controls-row">--%>
                                    <%--&lt;%&ndash;<span class=""></span>&ndash;%&gt;--%>
                                    <%--<label class="span1 m-wrap">∗单位名称:</label>--%>
                                    <%--<div class="span5 m-wrap">--%>
                                        <%--<input type="text" placeholder="" id="agencyname" name="agencyName"--%>
                                               <%--data-original-title="请输入有效信息">--%>
                                    <%--</div>--%>
                                    <%--<label class="span1 m-wrap">∗角色类型</label>--%>
                                    <%--<div class="span5 m-wrap">--%>
                                        <%--<div class="form-group span4 m-wrap ">--%>
                                            <%--<select class="form-control" id="sel" name="roleId" placeholder="请选择角色种类"--%>
                                                    <%--aria-describedby="basic-addon1">--%>
                                                <%--<option value="3">运营商管理员</option>--%>
                                                <%--&lt;%&ndash;<option value="4" >运营商配货员</option>&ndash;%&gt;--%>
                                                <%--<option value="5">运营商仓库员</option>--%>
                                            <%--</select>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<label class="control-label center"></label>--%>
                                <%--<div class="controls">--%>
                                    <%--&lt;%&ndash;<button type="reset" class="btn btn-danger" >重置</button>&ndash;%&gt;--%>
                                    <%--<input type="button" class="btn btn-success" id="reg" onclick="webReg();"--%>
                                           <%--value="提交创建"/>--%>
                                <%--</div>--%>
                            <%--</form>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--=======================================5.30===============tab1======================================================================--%>

                    <div id="tab2" class="tab-pane">
                        <p> 新建生产商组织</p>
                        <div id="web_res">
                            <form name="regform" id="resUser" class="form-horizontal"
                                  action=""
                                  accept-charset="utf-8"
                                  method="post">
                                <p> 用户信息</p>
                                <div class="control-group ">
                                    <label class="control-label span4">账户名:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="user1" name="accountName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入6-10位有效数字或字母">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">用户密码:</label>
                                    <div class="controls">
                                        <input type="password" placeholder="" id="passwd3" name="password"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入小于6位密码">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">确认密码:</label>
                                    <div class="controls">
                                        <input type="password" placeholder="" id="passwd4" name="password"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入小于6位密码">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">联系电话:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="cellnumber1" name="mobilePhone"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的电话号码">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">真实姓名:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="realname1" name="realName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入6-10位有效数字或字母">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">角色类型</label>
                                    <div class="controls">
                                        <div class="form-group span4 ">
                                            <select class="form-control" id="sel1" name="roleId" placeholder="请选择角色种类"
                                                    aria-describedby="basic-addon1">
                                                <%--<option value="1" id="1"> 系统管理员</option>--%>
                                                <%--<option value="1" id="1"> 系统管理员</option>--%>
                                                <%--<option value="2"> 系统操作员</option>--%>
                                                <%--<option value="3" id="2">运营商管理员</option>--%>
                                                <%--<option value="4">运营商配货员</option>--%>
                                                <%--<option value="5">运营商仓库员</option>--%>

                                                <%--<option value="7">生产商操作员</option>--%>
                                                <option value="8">出租商管理员</option>
                                                <option value="6">生产商管理员</option>
                                                <%--<option value="9">出租商操作员</option>--%>
                                                <option value="10"> 贸易商管理员</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">用户邮箱:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="Email1" name="email"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效邮箱，方便找回密码">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">QQ账号:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="qq1" name="QQ"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效QQ号码，方便联系">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">邮政编码:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="code1" name="postcode"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入6位有效邮编">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">身份证号:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="card1" name="idcard"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的18位身份证信息">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">家庭住址:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="adress1" name="postAdress"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入正确的18位身份证信息">
                                    </div>
                                </div>
                                <%--=============================5.30填入生产商表内容============================--%>
                                <p> 生产商信息</p>
                                <div class="control-group">
                                    <label class="control-label span4">生产商名称:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="factoryname" name="factoryName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效信息">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">生产商类型</label>
                                    <div class="controls">
                                        <div class="form-group span4 ">
                                            <select class="form-control" id="sel2" name="factoryType"
                                                    placeholder="请选择生产商类型" aria-describedby="basic-addon1">
                                                <option value="生产商" id="0">生产商</option>
                                                <option value="贸易商" id="1">贸易商</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">生产商logo图片路径:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="factorylogopath" name="factoryLogoPath"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输路径/static/images/****.jpg...">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">服务费返回率:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="sfeereturnrate" name="sfeeReturnRate"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入小数位">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">非现金返回率:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="qrreturnrate" name="qrReturnRate"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入小数位">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">接受公司账号</label>
                                    <div class="controls">
                                        <div class="form-group span4 ">
                                            <select class="form-control" id="sel3" name="receiveAccount"
                                                    placeholder="是,否" aria-describedby="basic-addon1">
                                                <option value="接受">接受</option>
                                                <option value="不接受">不接受</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">开户行:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="openbankname" name="openBankName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效银行">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label span4">开户名:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" id="openaccountname" name="openAccountName"
                                               data-title=""
                                               class="span3 tip"
                                               data-original-title="请输入有效银行卡信息">
                                    </div>
                                </div>
                                <label class="control-label center"></label>
                                <div class="controls">
                                    <%--<button type="reset" class="btn btn-danger" >重置</button>--%>
                                    <input type="button" class="btn btn-success" id="reg" onclick="webRes();"
                                           value="提交创建生产商用户"/>
                                </div>
                            </form>

                        </div>
                    </div>
                    <div id="tab3" class="tab-pane">
                        <p> 新建系统管理员</p>
                    </div>


                </div>
                <!-- span12-->
            </div>

        </div>

    </div>
</div>
<!-- 引入页面底部文件Footer-part-->
<%@ include file="/WEB-INF/jsp/index_body/index_footer.jsp" %>
<!--end-Footer-part-->

<%--引入公共的js脚本，防止页面部分功能冲突--%>
<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>
<!--end-javascript-part-->
</body>

</html>
