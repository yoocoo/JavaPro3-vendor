<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/6/29
  Time: 9:44
  说明： 该页面 包括顶端的 top  下拉列表  查看个人资料的模态弹窗页面
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle"><a id="menu_toggle"><i class="fa fa-bars"></i></a></div>
            <ul class="nav navbar-nav navbar-right">
                <li class=""><a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                                aria-expanded="false"> <img src="${userPath}" alt="">${userInfo.accountName}
                    <span class=" fa fa-angle-down"></span> </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a data-toggle="modal" data-target=".bs-example-modal-sm"> 个人资料</a></li>
                        <%--<li><a href="javascript:;"> <span class="badge bg-red pull-right">50%</span>--%>
                            <%--<span>设置</span> </a></li>--%>
                        <li><a href="/ssm_vendor/static/view/yoocoo.html">文档总结</a></li>
                        <li><a href="<%=request.getContextPath()%>/alarmAction/listAckedPage">确认故障</a></li>
                        <li><a href="<%=request.getContextPath()%>/mvc/login"><i
                                class="fa fa-sign-out pull-right"></i> 退出登录</a></li>
                    </ul>
                </li>
                <li  class=""><a href="<%=request.getContextPath()%>/alarmAction/listAckedPage"class="user-profile"
                                > <img src="/ssm_vendor/static/images/in1.jpg" alt="">报警次数<span class="badge bg-green">90</span> </a>
                    <%--<ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">--%>
                    <%--<li><a> <span class="image"><img src="images/img.jpg" alt="Profile Image"/></span>--%>
                    <%--<span> <span>John Smith</span> <span class="time">3 mins ago</span> </span> <span--%>
                    <%--class="message"> Film festivals used to be do-or-die moments for movie makers. They were where... </span>--%>
                    <%--</a></li>--%>
                    <%--<li>--%>
                    <%--<div class="text-center"><a> <strong>查看全部</strong> <i--%>
                    <%--class="fa fa-angle-right"></i> </a></div>--%>
                    <%--</li>--%>
                    <%--</ul>--%>
                </li>
            </ul>
        </nav>
    </div>
</div>
<%--查看个人资料  start====--%>

    <div class="modal fade bs-example-modal-sm  " tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">${userInfo.accountName}--信息卡</h4>
                </div>
                <%--modal-header end--%>
                <div class="modal-body">

                        <ul class="list-unstyled msg_list">
                            <li>
                                <span>
                          <span>用户密码 :</span>
                                </span>
                                <span class="message">
                                    ${userMess.password}
                                </span>
                            </li>
                            <li>
                                <span>
                          <span>真实姓名 :</span>
                                </span>
                                <span class="message">
                                    ${userMess.realName}
                                </span>
                            </li>
                            <li>
                                <span>
                          <span>电子邮箱 ：</span>
                                </span>
                                <span class="message">${userMess.email}
                                </span>
                            </li>
                            <li>
                                <span>
                          <span>移动电话 ：</span>
                                </span>
                                <span class="message">${userMess.mobilePhone}
                                </span>
                            </li>
                            <li>
                                <span>
                          <span>邮政编码 ：</span>
                                </span>
                                <span class="message">${userMess.postcode}
                                </span>
                            </li>
                            <li>
                                <span>
                          <span>QQ号码 ：</span>
                                </span>
                                <span class="message">${userMess.qq}
                                </span>
                            </li>
                            <li>
                                <span>
                          <span>身份证号 ：</span>
                                </span>
                                <span class="message">${userMess.idcard}
                                </span>
                            </li>
                            <li>
                                <span>
                          <span>通信地址 ：</span>

                                </span>
                                <span class="message">${userMess.postAdress}
                                </span>
                            </li>


                        </ul>


                </div>
                <%--modal-body end--%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                </div>

                <%--modal-footer--%>
            </div>
            <%--modal-content end --%>
        </div>
        <%--moadal-dialog end--%>
    </div>
    <%--modal end--%>

<%--=======    查看个人资料  end   --%>
<!-- /top navigation -->
</body>
</html>
