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
        var roleid = $("select option:selected").val();
        var Email = $("#Email").val();
        var qq = $("#qq").val();
        var code = $("#code").val();
        var card = $("#card").val();
        var adress = $("#adress").val();
        //        ====================================================
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
        <div class="row-fluid">
            <div class="widget-box">
                <div class="widget-title">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab1">运营商管理用户</a></li>
                        <li><a data-toggle="tab" href="#tab2">生产商管理用户</a></li>
                        <li><a data-toggle="tab" href="#tab3">新增角色管理用户</a></li>

                    </ul>
                </div>
                <div class="widget-content tab-content">
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
                                                <%--<option value="5">运营商仓库员</option>--%>
                                                <%--<option value="6" id="3">生产商管理员</option>--%>
                                                <%--<option value="7">生产商操作员</option>--%>
                                                <option value="8" id="4">出租商管理员</option>
                                                <%--<option value="9">出租商操作员</option>--%>
                                                <option value="10" id="5"> 贸易商管理员</option>
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


                    <div id="tab2" class="tab-pane">
                        <p>新建运营商或出租商管理员</p>
                    </div>
                    <div id="tab3" class="tab-pane">
                        <p>新建谁谁表（待开发） </p>
                    </div>


                </div>
                <!-- span12-->
            </div>

        </div>
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
