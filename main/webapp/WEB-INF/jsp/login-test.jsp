<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<head>
    <meta charset="UTF-8">
    <title>账户登录(旧版本)</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/static/css/denglu.css'/>">
    <%--<link rel="stylesheet" href="/css/denglu.css">--%>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    <script type="text/javascript" src="<c:url value='/static/js/denglu.js'/>"></script>
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
<%--<script type="javascript">
function checkLoginInfo() {
if ("" == $("#u").val()) {  //u标签的值为空
$("#u").tips({ // .tips 是js提示标签的调用方法，具体的轮廓如上面的登陆页面的提示标签
side: 2,
msg: '用户名不得为空',//提示信息
bg: '#AE81FF',//提示的背景颜色
time: 3//提示呈现的时间
});
$("#u").focus();  //让u标签获取输入焦点
return false;  //返回false，打断js的执行
}
if ($("#p").val() == "") {

$("#p").tips({
side: 2,
msg: '密码不得为空',
bg: '#AE81FF',
time: 3
});
$("#p").focus();
return false;
}
return true;
}

function webLogin() {
if (checkLoginInfo()) {
var accountName = $("#u").val();
//                var是申明一个变量的关键字，accountName为变量名，
//                $("#u")是找到一个标签ID为"u"的标签，.val() 是获取对应ID标签的值
var password = $("#p").val();
$.ajax({   //使用jquery下面的ajax开启网络请求
type: "POST",  //http请求方式为POST
url: '<%=request.getContextPath()%>/userAction/login',   //请求接口的地址
data: {accountName: accountName, password: password},   //存放的数据，服务器接口字段为accountName和password，分别对应用户登录名和密码
dataType: 'json',   //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
cache: false,  //不用缓存
success: function (data) { //请求成功，http状态码为200。返回的数据已经打包在data中了
if (data.code == 1) {  //获判断json数据中的code是否为1，登录的用户名和密码匹配，通过效验，登陆成功
//                            window.location.href = data.data.nextUrl; //跳转到主页
window.location.href = "<%=request.getContextPath()%>/mvc/home";
} else {
alert(data.msg);
$("#u").focus();
}
}
});
}
}

</script>--%>