package cn.wj.mvc.controller;

import cn.wj.domain.AlarmBase;
import cn.wj.domain.Factory;
import cn.wj.domain.ResponseObj;
import cn.wj.domain.Vendor;
import cn.wj.service.serviceImpl.AlarmBaseServiceImpl;
import cn.wj.service.serviceImpl.FactoryServiceImpl;
import cn.wj.service.serviceImpl.VendorServiceImpl;
import cn.wj.utils.DataTablePageUtil;
import cn.wj.utils.GsonUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

/**
 * 说明： 售货机-- 现金表 实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 20 日
 * 一更时间：  2017 年 07 月 21 日
 */
@Controller
@RequestMapping("/alarmAction")
public class AlarmBaseController {
	@Autowired
	//注入Service 对象
	private AlarmBaseServiceImpl alarmBaseService;//自动载入售货机销售表service对象
	@Autowired
	private VendorServiceImpl vendorService;//自动载入 售货机表格Service对象
	private FactoryServiceImpl factoryService;//载入 生产商Service对象
	private ResponseObj responseObj;

	/**
	 * 说明：接收 生产商管理员售货机 故障表 接收数据的页面
	 * 创建日期： 2017 年 07 月 20 日
	 * 创建者： 王娇
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "listSalarmPage")
	public ModelAndView listsalarmpage(HttpServletRequest request, AlarmBase alarmBase) throws Exception {
		ModelAndView view = new ModelAndView("vendor/sheng/vendor_sheng_alarmcount");
		return view;
	}
	/**
	 * 说明：接收 确认 故障表 接收数据的页面
	 * 创建日期： 2017 年 07 月 24 日
	 * 创建者： 王娇
	 *
	 * @param request
	 * @return
	 */
	//@RequestMapping(value = "listAckedPage")
	//public ModelAndView listNoAlarm(HttpServletRequest request, AlarmBase alarmBase) throws Exception {
	//	ModelAndView view = new ModelAndView("vendor/sheng/vendor_no_alarm");
	//	return view;
	//}

	/**
	 * 时间： 2017 年 7 月  18 日
	 * 作者： 王娇
	 * 说明： 生产商管理员  按归属条件 查询 销售表 数据（ 按时间段，按指定售货机）
	 * 基于jquery DataTable API 插件 的分页
	 *
	 * @return
	 */
	@RequestMapping(value = "/shengAlarmName", method = RequestMethod.POST)
	public void PageInfoSname(HttpServletRequest request,
							  HttpServletResponse response, HttpSession session,
							  Vendor vendor, AlarmBase alarmBase, Factory factory,
							  @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
							  @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) throws Exception {
		String tableName = factory.getAlarmTableName();
		String vendorName = vendor.getVendorName();
		System.out.println("===打印分页请求生产商的售货 故障名的===:" + tableName);
		System.out.println("===打印页面传进来的vendorName ==" + vendorName);
		Timestamp startTime = alarmBase.getCreatTime();
		Timestamp endTime = alarmBase.getEndTime();
		System.out.println("===（ 按时间段，按指定售货机）打印前台传过来时间 开始===:" + startTime);
		System.out.println("===（ 按时间段，按指定售货机）打印前台传过来时间 结束===:" + endTime);
		//使用DataTables的属性接收分页数据
		DataTablePageUtil<AlarmBase> dataTable = new DataTablePageUtil<AlarmBase>(request);
		//开始的分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期
		//========== 参数列表 start==============================================
		List<AlarmBase> shengAlarmNameList = alarmBaseService.getAllShengAlarmName(tableName, vendorName, startTime, endTime, 1, 10);
		System.out.println("===打印分页请求现金表" + shengAlarmNameList);
		//用PageInfo对结果进行包装
		PageInfo<AlarmBase> pageInfo = new PageInfo<AlarmBase>(shengAlarmNameList);
		//封装数据给DataTables
		dataTable.setDraw(dataTable.getDraw());
		dataTable.setData(pageInfo.getList());
		System.out.println("===打印 查询条件（一） pageInfo.getList()===" + pageInfo.getList());
		dataTable.setRecordsTotal(alarmBaseService.getShengAlarmCountName(tableName, vendorName, startTime, endTime));
		dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
		//返回数据到页面
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json");
			response.getWriter().write(new GsonUtils().toJson(dataTable));
			System.out.println("生产商 双条件查询 故障结果=====" + new GsonUtils().toJson(dataTable));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//============录入数据库中，筛查 统计数值================================
		//=======================================================================


	}
	/**
	 * 时间： 2017 年 7 月  24 日
	 * 作者： 王娇
	 * 说明：   未确认警告表
	 * 基于jquery DataTable API 插件 的分页
	 *
	 * @return
	 */
	@RequestMapping(value = "/NoAlarmName", method = RequestMethod.POST)
	public void PageInfo(HttpServletRequest request,
							  HttpServletResponse response, HttpSession session,
							  Vendor vendor, AlarmBase alarmBase, Factory factory,
							  @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
							  @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) throws Exception {
		String tableName = factory.getAlarmTableName();
		System.out.println("===打印分页 请求生产商的售货 故障名的===:" + tableName);
		//使用DataTables的属性接收分页数据
		DataTablePageUtil<AlarmBase> dataTable = new DataTablePageUtil<AlarmBase>(request);
		//开始的分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期
		//========== 参数列表 start==============================================
		List<AlarmBase> noNameList = alarmBaseService.getNoAlarmName(tableName,  1, 10);
		System.out.println("===打印分页请求现金表" + noNameList);
		//用PageInfo对结果进行包装
		PageInfo<AlarmBase> pageInfo = new PageInfo<AlarmBase>(noNameList);
		//封装数据给DataTables
		dataTable.setDraw(dataTable.getDraw());
		dataTable.setData(pageInfo.getList());
		dataTable.setRecordsTotal(alarmBaseService.getNoAlarmCountName(tableName));
		dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
		//返回数据到页面
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json");
			response.getWriter().write(new GsonUtils().toJson(dataTable));
			System.out.println(" 打印未确认 故障结果=====" + new GsonUtils().toJson(dataTable));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//============录入数据库中，筛查 统计数值================================
		//=======================================================================
	}

	/**
	 * 时间： 2017 年 7 月 24 日
	 * 说明：  确认故障
	 *
	 * @param request
	 * @param response
	 * @param alarmBase
	 * @return
	 */
	@RequestMapping(value = "/ackedAlarmName", method = RequestMethod.POST)
	public Object PassAlarm(HttpServletRequest request,
							 HttpServletResponse response, Factory factory,
							Vendor vendor,AlarmBase alarmBase) throws Exception {
		Object result;
		responseObj = new ResponseObj<Vendor>();
		//  确认故障信息
		try {
			int alarmId = alarmBase.getAlarmId();
			String tableName = factory.getAlarmTableName();
			String ackUser = alarmBase.getAckUser();
			alarmBaseService.AlarmAcked(tableName,ackUser,alarmId);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("确认故障，其他错误");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("确认故障成功");
		responseObj.setData(alarmBase);
		result = new GsonUtils().toJson(responseObj);
		System.out.println("=====打印result =" + result);
		result = result;
		return result;
	}

}


