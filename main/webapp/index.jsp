<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2017/4/9
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>开发项目总结</title>
</head>
<body>
<h1>四月总结————-作者WJ</h1>
欢迎来到售货机系统编码平台！！！<br/>

<h2>(一)框架搭建完成后，打开日志调试来看信息，有这几点原则：</h2>
1.数据库链接正常
数据库驱动、数据库服务
数据库配置文件
数据库测试
2.网页资源访问正常
静态html、js、css、font、image、MP3等
动态的接口
动态页面如：jsp
3.提示信息正常
异常输出
log输出
等等···
<h2>(二)关于web只有大概下面几点：</h2>
1.减少每个页面的请求数。
2.js方法整合到页面，工具js封装成工具。
3.js方法一般写在页面头部
4.web页面除非整体刷新，其他情况考虑异步请求。
5.页面图片资源整合到一起，然后根据位置取图片
6.web页面良好体验可以考虑组件引入
7.页面需要大量重用的地方可以考虑模板完成
<h1>项目总结----五月（1） ----作者WJ</h1>
框架简介:
项目Maven构建，真实大型互联网架构，做到高并发，大数据处理，整个项目使用定制化服务思想，提供模块化、服务化、原子化的方案，将功能模块进行拆分，可以公用到所有的项目中。架构采用分布式部署架构，所有模块进行拆分，使项目做到绝对解耦，稳定压倒一切
框架整合:

[Springmvc] + [Mybatis] + Shiro（权限） + REST(服务) + WebService(服务) + JMS(消息) + Lucene(搜搜引擎) + Quartz(定时调度) + [Bootstrap Html5（支持PC、IOS、Android]

技术点：

1.  Springmvc + Mybatis集成、SpringSecurity权限控制、Spring AOP事务处理。
2.   Wink Rest服务、Webservice服务：jaxws、CXF等
3.  IO 流上传下载文件，多线程操作
4.  发送邮件，配置邮件服务器，发基于html、纯文本格式的邮件（可以免费赠送网络爬虫，使其群发邮件，做到广告推送等）
5.  MD5加密（登陆密码校验加密等），用户统一Session、Cookie管理，统一验证码校验等。
6.  数据库连接池统一配置
7.  Quartz定时调度任务集成（直接通过配置即可）
8.  Httpclient破解验证码，登陆联通充值平台
9.  汉字、英文拆分、可以用作文档关键字搜索等。
10.  Base64图片处理，支持PC，Android，IOS
11.  Service Socket 、Client Socket 通信技术(已经做过GPRS数据获取，并用到了项目中)
12.  提供大量工具类，可以直接使用
13.  Maven项目构建，您可以直接做架构，可以提升自己的学习能力，使您成为真正的架构师。
以上项目只实现了部分功能，后续待开发，fighting.....
<h1>项目总结----五月（2） ----作者WJ</h1>
（1）
   BootStrap-table客户端分页（模板网页：http://issues.wenzhixin.net.cn/bootstrap-table/）：后台一次性将数据推送到前台，由前台代码负责分页、排序等；（针对数据庞大的数据，不适用）
   服务端分页：一次只传当前页的数据，点上一页或下一页时再以ajax方式获取所对应的数据；
  1）. 可以考考虑 把用户表（数据较少的）使用 Bootstrap-table模板分页
  2）.
</body>
</html>
