<%--
  Created by IntelliJ IDEA.
  User: WJ
  Date: 2017/4/26
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>

<!--Footer-part-->

<div class="row-fluid">
    <div id="footer" class="span12"> 2017 &copy; ZJNU.
        <div class="widget-content nopadding">
            <table class="table table-bordered data-table table-striped with-check">
                <thead>
                <tr>
                    <th><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox"/></th>
                    <th>名称</th>
                    <th>描述</th>
                </tr>
                </thead>
                <!-- ------------------ 开始  -->
                <tbody>
                <tr class="gradeX">
                    <td><input type="checkbox"/></td>
                    <td>打印treelist</td>
                    <td>
                        ${tree}
                    </td>
                </tr>
                <tr class="gradeX">
                    <td><input type="checkbox"/></td>
                    <td>打印menu</td>
                    <td>
                        ${menu}
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!--end-Footer-part-->
</body>
</html>
