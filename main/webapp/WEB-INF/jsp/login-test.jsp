<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 <%--！！！四月初 登录版本！！！--%>

<head>
    <meta charset="UTF-8">
    <title>账户登录(旧版本)</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/login/login.css'/>">
    <%--<link rel="stylesheet" href="/css/login.css">--%>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    <script type="text/javascript" src="<c:url value='/static/js/login/login.js'/>"></script>
</head>
<html>
<body>

<div class="cotn_principal">
    <div class="cont_centrar">
        <div class="cont_login">
            <div class="cont_info_log_sign_up">
                <div class="col_md_login">
                    <div class="cont_ba_opcitiy">
                        <h2>已注册用户登录</h2>
                        <p>遵守用户登录规则，保管好个人信息！</p>
                        <button class="btn_login" onclick="cambiar_login()">登 录</button>
                    </div>
                </div>
                <div class="col_md_sign_up">
                    <div class="cont_ba_opcitiy">
                        <h2>新用户注册</h2>
                        <p>新注册用户，请务必完善个人账户资料！</p>
                        <button class="btn_sign_up" onclick="cambiar_sign_up()">注 册</button>
                    </div>
                </div>
            </div>
            <div class="cont_back_info">
                <div class="cont_img_back_grey"><img src="<c:url value='/static/images/denglu.jpg'/>" alt=""/></div>
            </div>
            <div class="cont_forms">
                <div class="cont_img_back_"><img src="<c:url value='/static/images/denglu.jpg'/>" alt=""/></div>

                <form class="cont_form_login" action="<%=request.getContextPath()%>/userAction/login"
                      accept-charset="utf-8"
                      method="POST">
                    <a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
                    <h2>用户登录</h2>


                    <input type="text" name="accountName" placeholder="账号"/>
                    <input type="password" name="password" placeholder="密码"/>
                    <%--改造代码      1    --%>
                    <a href="javascript:document.forms[0].submit();">
                        <button class="btn_login" type="submit" class="btn_login">登 录</button>
                    </a>
                    <%--<button type="reset"  class="btn_login" >重置</button>--%>

                    <%--<button type="submit" class="btn_login"  href="javascript:void(0);"></button>--%>
                    <%--<button type="submit" class="btn_login" href="javascript:void(0);">登 录</button>--%>
                </form>

                <form class="cont_form_sign_up"
                      action="<%=request.getContextPath()%>/userAction/reg"
                      accept-charset="utf-8"
                      method="post">
                    <a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons">
                        &#xE5C4;</i></a>

                    <h2>注 册</h2>
                    <input type="text" placeholder="账号" name="accountName"/>
                    <input type="password" placeholder="密码" name="password"/>
                    <input type="password" placeholder="再输一次密码" name="password"/>
                    <input type="text" placeholder="联系电话" name="mobilePhone"/>

                    <%--<input type="hidden" value="0" name="nextUrl"/>--%>
                    <%--<input type="hidden" value="cdmin" name="userId"/>--%>
                    <%--<input type="hidden" value="0" name="realName"/>--%>
                    <%--<input type="hidden" value="0" name="roleId"/>--%>
                    <%--<input type="hidden" value="0" name="factoryId"/>--%>
                    <%--<input type="hidden" value="0" name="agencyId"/>--%>
                    <%--<input type="hidden" value="0" name="nickName"/>--%>
                    <%--<input type="hidden" value="0" name="email"/>--%>
                    <%--<input type="hidden" value="0" name="lastLoginTime"/>--%>
                    <%--<input type="hidden" value="0" name="fixPhone"/>--%>
                    <%--<input type="hidden" value="0" name="qq">--%>
                    <%--<input type="hidden" value="0" name="postcode"/>--%>
                    <%--<input type="hidden" value="0" name="loginCount"/>--%>
                    <%--<input type="hidden" value="0" name="postAdress"/>--%>
                    <%--<input type="hidden" value="0" name="password"/>--%>
                    <%--<input type="hidden" value="0" name="creatTime"/>--%>
                    <%--<input type="hidden" value="0" name="headImage"/>--%>
                    <%--<input type="hidden" value="1" name="approved"/>--%>


                    <a href="javascript:document.forms[1].submit();">
                        <button class="btn_sign_up" type="submit" class="btn_login">注 册</button>
                    </a>
                    <%--<button class="btn_sign_up">注 册</button>--%>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>
