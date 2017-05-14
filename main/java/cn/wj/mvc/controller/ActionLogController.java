package cn.wj.mvc.controller;

import cn.wj.domain.ResponseList;
import cn.wj.domain.UserActionLog;
import cn.wj.service.ActionLogService;
import cn.wj.utils.GsonUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
@Controller//表明这个是Controller,只要这个类放在Spring配置文件指定的Controller路径中就能自动装载
@RequestMapping("/actionLog")//域名后面跟着最外层地址
public class ActionLogController {
	@Autowired
	ActionLogService actionLogService;//自动注入ActionLogService

	/**
	 * 分页查找行为日志，其实druidd里面已经包含了行为日志
	 *
	 * @param pageNum  页码
	 * @param pageSize 每一页的条数
	 * @return
	 */
	@RequestMapping(value = "/findLogList",
			produces = "application/json;charset=utf-8")
	//设置其访问地址形式：http://xxx.cn/actionLog/findLogList,响应请求头 ContentType表明响应是JSON数九，字符编码 utf8
	@ResponseBody //表明 该方法直接返回的是响应体的内容
	public Object findLog(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize) {
		if (pageNum <= 0) {
			pageNum = 1;
		}
		if (pageSize == 0) {
			pageSize = 10;
		}
		int toalNum;//总页码
		ResponseList<UserActionLog> responseObj = new ResponseList<UserActionLog>();
		try {
			toalNum = actionLogService.getAllCount();//先把总条数赋值给总页数，作为缓存变量，减少下面算法的查找次数
			toalNum = toalNum % pageSize > 0 ? toalNum / pageSize + 1 : toalNum / pageSize;//在每页固定条数下能不能分页完成，有余则加一页码
			System.out.println("==========="+toalNum);
			List<UserActionLog> result = actionLogService.findAll(pageNum, pageSize);
			responseObj.setPageNum(pageNum);
			responseObj.setTotalNum(toalNum);
			responseObj.setPageSize(pageSize);
			if (result == null || result.size() == 0) {
				responseObj.setCode(responseObj.EMPUTY);
				responseObj.setMsg("查询结果为空");
				return new GsonUtils().toJson(responseObj);
			}
			responseObj.setCode(ResponseList.OK);
			responseObj.setMsg("查询成功");
			responseObj.setData(result);
			return new GsonUtils().toJson(responseObj);
		} catch (Exception e) {
			e.printStackTrace();
			//返回查询失败结果
			responseObj.setCode(ResponseList.FAILED);
			responseObj.setMsg("查询失败");
			return new GsonUtils().toJson(responseObj);
		}

	}
}
