package cn.wj.mvc.controller;

import cn.wj.domain.PageSplit;
import cn.wj.domain.ResponseList;
import cn.wj.domain.ResponseObj;
import cn.wj.domain.UserActionLog;
import cn.wj.service.ActionLogService;
import cn.wj.utils.DataTablePageUtil;
import cn.wj.utils.GsonUtils;
import cn.wj.utils.PublicUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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
	private ResponseObj responseObj;//封装 放到前端页面 数据

	@RequestMapping(value = "/logMain")
	public ModelAndView logMain(HttpServletRequest request, UserActionLog userActionLog) throws Exception {
		ModelAndView mav = new ModelAndView("user_system/list_action_log");

		mav.addObject("logJson", getLogJson(userActionLog, request, 1, 10));
		//把首页需要的json数据直接扔到 view里面，在js代码中，可以看到如何使用

		return mav;
	}



	/**
	 * 时间： 2017 年 7 月  18 日
	 * 作者： 王娇
	 * 说明： 生产商管理员  按归属条件 查询 销售表 数据（ 按时间段，按指定售货机）
	 * 基于jquery DataTable API 插件 的分页
	 *
	 * @return
	 */
	@RequestMapping(value = "/findLogList", method = RequestMethod.POST)
	public void PageInfoSname(HttpServletRequest request,UserActionLog userActionLog,
							  HttpServletResponse response, HttpSession session,
							  @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
							  @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) throws Exception {
		//String tableName = factory.getAlarmTableName();
		//String vendorName = vendor.getVendorName();


		//使用DataTables的属性接收分页数据
		DataTablePageUtil<UserActionLog> dataTable = new DataTablePageUtil<UserActionLog>(request);
		//开始的分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期
		//========== 参数列表 start==============================================
		List<UserActionLog> logList = actionLogService.findAll( 1, 10);
		System.out.println("===打印分页请求现金表" + logList);
		//用PageInfo对结果进行包装
		PageInfo<UserActionLog> pageInfo = new PageInfo<UserActionLog>(logList);
		//封装数据给DataTables
		dataTable.setDraw(dataTable.getDraw());
		dataTable.setData(pageInfo.getList());
		System.out.println("===打印 查询条件（一） pageInfo.getList()===" + pageInfo.getList());
		dataTable.setRecordsTotal(actionLogService.getAllCount());
		dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
		//返回数据到页面
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json");
			response.getWriter().write(new GsonUtils().toJson(dataTable));
			System.out.println("日志列表=====" + new GsonUtils().toJson(dataTable));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/editLogList",
			method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object shengRegVendor(HttpServletRequest request, HttpServletResponse response,UserActionLog userActionLog) throws Exception {
		Object result;
		responseObj = new ResponseObj<UserActionLog>();

		try {
			//long  id= userActionLog.getId();
			//System.out.println("打印要修改谁的日子："+id);
			//String  name1= userActionLog.getBroName();
			//String  name2= userActionLog.getBroName();

			//System.out.println("打印要name1："+name1);

			//actionLogService.updateLogInfo(name1,name2,id);//新注册售货机时， 售货机表格 添加一条记录
			actionLogService.updateLogInfo(userActionLog);//新注册售货机时， 售货机表格 添加一条记录

		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("其他 的错误");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("恭喜，更新日志 成功");
		responseObj.setData(userActionLog);//
		System.out.println("===更新日志 ：：：=====" + userActionLog);// 只有注册时输入表单项数，其他在后台sql语句中赋了一定的初始值
		//vendor.setNextUrl(request.getContextPath() + "/mvc/home");//单独控制地址
		result = new GsonUtils().toJson(responseObj);
		System.out.println("result:"+result);
		result = result;
		return result;
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
