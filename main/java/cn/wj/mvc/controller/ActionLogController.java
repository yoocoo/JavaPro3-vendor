package cn.wj.mvc.controller;

import cn.wj.domain.PageSplit;
import cn.wj.domain.ResponseList;
import cn.wj.domain.ResponseObj;
import cn.wj.domain.UserActionLog;
import cn.wj.service.ActionLogService;
import cn.wj.utils.GsonUtils;
import cn.wj.utils.PublicUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * web服务的动态资源
 * (1)当请求的解析方法中有基本数据类型（无论个数）时候，MVC框架会自动把请求数据存储为名称相同的变量的值
 * 比如说下面我们访问为：http://域名、actionLog/findLogList?pageNum=10&pageSize=10
 * (2)当请求的解析方法中有封装数据类型的参数（无论个数）时候，MVC框架会自动根据请求数据的名字查找封装数据的对应字段并且自动存储，且无论该数据使用了几次
 * 比如说网页登陆的时候有两个用户体系，但是他们是通过用户名关联在一起的，那么如下：
 * 请求为：http://wj.cn/user/login?accountName=wj&password=123456
 * <p>
 * 请求解析的方法是：
 *
 * @ r equest Mapping( value="/login", produces = "application/json;charset = utf-8")
 * @ R esponseBody //表明 该方法直接返回的是响应体的内容
 * public Object findLog(User user, Person person) {
 * System.out.printf("log:\t"+user.toString());
 * System.out.printf("log:\t"+person.toString());
 * return json数据;
 * ....
 * ...//代码省略}
 * 我们可以看到输出的日志为：
 * User{"accountName=wj, pwd=123456, xxx=xxx···"}
 * Person{"accountName=wj, pwd=123456, xxx=xxx···"}
 * 所以当你后端接收这里无论你又多少实体，但是只要包含对应的字段，那么就会自动赋值。
 * <p>
 * Created by ThinkPad  WJ on 2017/4/26.
 */
//行为日志的调用接口，ActionLogController.java

@Controller
//表明这个是Controller,只要这个类放在Spring配置文件指定的Controller路径中就能自动装载
@RequestMapping("/actionLog")
//域名后面跟着最外层地址
public class ActionLogController {
	@Autowired
	ActionLogService actionLogService;//自动注入ActionLogService

	@RequestMapping(value = "/logMain")
	public ModelAndView logMain(HttpServletRequest request, UserActionLog userActionLog) throws Exception {
		ModelAndView mav = new ModelAndView("user_system/list_action_log");

		mav.addObject("logJson", getLogJson(userActionLog, request, 1, 10));
		//把首页需要的json数据直接扔到 view里面，在js代码中，可以看到如何使用

		return mav;
	}

	/**
	 * 分页查找行为日志，其实druidd 里面已经包含了行为日志
	 * 获取日志列表
	 * 获取日志主页的JSON  按照道理讲这里应该根据页面结构拆分组合的
	 * 作者自己的写的手动分页，靠上一页和下一页进行数据翻页
	 *
	 * @param
	 * @return 返回日志首页JSON
	 */

	@RequestMapping(value = "/findLogList1"
			, produces = "application/json;charset=utf-8"
			//, produces = {APPLICATION_JSON_UTF8_VALUE}
			//, method = {RequestMethod.GET, RequestMethod.POST}
	)
	//设置其访问地址形式：http://xxx.cn/actionLog/findLogList,响应请求头 ContentType表明响应是JSON，字符编码 utf8
	@ResponseBody //表明 该方法直接返回的是响应体的内容
	public Object getLogJson(UserActionLog userActionLog, HttpServletRequest request,
							 int pageNum, int pageSize
							 //@RequestParam(value = "pageNum", defaultValue = "0") Integer pageNum,
							 //@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize
	)
			throws Exception {
		PageSplit page;//判断
		ResponseList<UserActionLog> list = new ResponseList<UserActionLog>();
		if (PublicUtil.isJsonRequest(request)) {    //确认是否是post的json提交
			page = new GsonUtils().jsonRequest2Bean(request.getInputStream(), PageSplit.class);  //转换为指定类型的对象
			pageNum = page.getPageNum();
			pageSize = page.getPageSize();
		}
		if (pageNum <= 0) {
			pageNum = 1;
		}
		if (pageSize == 0) {
			pageSize = 10;
		}
		try {
			int toalNum;//总页码
			toalNum = actionLogService.getAllCount();//先把总条数赋值给总页数，作为缓存变量，减少下面算法的查找次数
			//toalNum = toalNum % 10 > 0 ? toalNum / 10 + 1 : toalNum / 10;//在每页固定条数下能不能分页完成，有余则加一页码
			toalNum = toalNum % pageSize > 0 ? toalNum / pageSize + 1 : toalNum / pageSize;     //在每页固定条数下能不能分页完成，有余则加一页码			System.out.println("========打印总页码===" + toalNum);
			List<UserActionLog> listData = actionLogService.findAll(pageNum, pageSize);//日志页面下，内容
			System.out.println("======打印日志结果=====" + listData);


			if (listData == null || listData.isEmpty()) {
				list.setCode(ResponseList.EMPUTY);
				list.setMsg(ResponseList.EMPUTY_STR);
				return new GsonUtils().toJson(list);
			}
			list.setCode(ResponseList.OK);
			list.setMsg(ResponseList.OK_STR);
			list.setTotalNum(toalNum);
			list.setPageNum(pageNum);
			list.setPageSize(pageSize);
			list.setData(listData);
			return new GsonUtils().toJson(list);
		} catch (Exception e) {
			e.printStackTrace();
			//返回查询失败其他结果
			list.setCode(ResponseObj.FAILED);
			list.setMsg(ResponseList.FAILED_STR);
			return new GsonUtils().toJson(list);
		}

	}
}
