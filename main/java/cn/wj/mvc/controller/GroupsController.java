package cn.wj.mvc.controller;

import cn.wj.domain.GoodsInfo;
import cn.wj.domain.Groups;
import cn.wj.domain.ResponseObj;
import cn.wj.domain.User;
import cn.wj.service.serviceImpl.GoodsInfoServiceImpl;
import cn.wj.service.serviceImpl.GroupsServiceImpl;
import cn.wj.utils.DataTablePageUtil;
import cn.wj.utils.GsonUtils;
import cn.wj.utils.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

//import cn.wj.utils.StringUtils;

/**
 * 功能说明： 商品管理业务实现
 * 时间： 2017 年 8 月 06 日
 * 作者： 王娇
 * 一更时间：
 *
 */
@Controller
@RequestMapping("/groupsAction")
public class GroupsController {
	//注入service对象
	@Autowired
	private GroupsServiceImpl groupsService;//自动载入 商品分组表格Service对象
	@Autowired
	private GoodsInfoServiceImpl goodsInfoService; //自动载入 商品信息表 Service 对象
	private ResponseObj responseObj;//封装 放到前端页面 数据

	/**
	 * 说明：接收 运营商 管理商品的页面
	 * 创建日期： 2017 年 08 月 06日
	 * 创建者： 王娇
	 * 一更时间：
	 * @param request
	 * @param groups
	 * @return
	 */
	@RequestMapping(value = "listYgoodsPage")
	public ModelAndView listsvendorpage(HttpServletRequest request, Groups groups) {
		ModelAndView view = new ModelAndView("vendor/yun/goods_yun_list");
		return view;
	}
	/**
	 * 时间： 2017 年 7 月  10  日
	 * 作者： 王娇
	 * 说明： 生产商管理员请求 所属的售货机列表
	 * 基于jquery DataTable API 插件 的分页
	 *
	 * @return
	 */
	@RequestMapping(value = "/listYgoodsList", method = RequestMethod.POST)
	public void PageInfoVendor(HttpServletRequest request,
							   HttpServletResponse response, HttpSession session,
							   Groups groups, User user,
							   @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
							   @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) throws Exception {
		int aId = user.getAgencyId();
		//使用DataTables的属性接收分页数据
		DataTablePageUtil<Groups> dataTable = new DataTablePageUtil<Groups>(request);
		//开始分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期用到
		System.out.println("===日志打印前台接收数据查询的运营商ID:::===" + aId);
		List<Groups> yunGoodsList = groupsService.getYgoodsList(aId,1,10);
		//用PageInfo对结果进行包装
		PageInfo<Groups> pageInfo = new PageInfo<Groups>(yunGoodsList);
		//封装数据给DataTables
		dataTable.setDraw(dataTable.getDraw());
		dataTable.setData(pageInfo.getList());
		//dataTable.setData(pageInfo.);
		dataTable.setRecordsTotal(groupsService.getYgoodsCount(aId));
		//dataTable.setRecordsTotal((int) pageInfo.getTotal());
		dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
		//返回数据到页面
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json");
			response.getWriter().write(new GsonUtils().toJson(dataTable));
			System.out.println(" 页面显示的数据=运营商商品管理列表：yunGoodsList====" + new GsonUtils().toJson(dataTable));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	/**
	 * 时间：2017 年 08 月 07 日
	 * 功能说明：运营商管理员 修改商品信息
	 * 作者：王娇
	 * @param request
	 * @param response
	 * @param session
	 * @param groups
	 * @param goodsInfo
	 * @return
	 */
	@RequestMapping(value = "/editGoodsList",
			method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object updateInfo(@RequestParam(required = false) MultipartFile file,HttpServletRequest request,
							   HttpServletResponse response, HttpSession session,
							   Groups groups, GoodsInfo goodsInfo){
		Object result;
		responseObj = new ResponseObj<GoodsInfo>();
		if (null == goodsInfo) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("商品信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		if (StringUtils.isEmpty(goodsInfo.getGoodsName())
				//||StringUtils.isEmpty(goodsInfo.getGoodsImg())
				) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("2.商品信息详情不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		//if (null == file || file.isEmpty()) {
		//	responseObj = new ResponseObj();
		//	responseObj.setCode(ResponseObj.FAILED);
		//	responseObj.setMsg("上传商品图片不能为空");
		//	return new GsonUtils().toJson(responseObj);
		//}
		//更新商品信息
		try {
			//获取新上传头像地址
			//String fileName = file.getOriginalFilename();
			//System.out.println("新上传商品文件原始文件名==" + fileName);
			// 获取图片的扩展名
			//String extensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
			// 新的图片文件名 = 本地静态资源目录+上传的文件原名
			//String newFileName = "/ssm_vendor/" + "static" + "/" + "upload" + "/" + fileName;
			//System.out.println("新上传文件组合出来的文件名字==" + newFileName);
			//ServletContext servletContext = request.getSession().getServletContext();
			//System.out.println("====打印商品上传图片的要获取项目路径==" + servletContext);
			goodsInfoService.updateGoodsInfo(goodsInfo);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("更新商品信息其他错误，请联系系统管理员 邮箱：***@qq.com");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("商品信息资料更新成功");
		//groups.setNextUrl(request.getContextPath() + "/mvc/home");//单独控制地址
		responseObj.setData(goodsInfo);
		System.out.println("====goodsInfo:===" + goodsInfo);
		result = new GsonUtils().toJson(responseObj);
		result = result;
		return result;
	}
	/**
	 * 说明： 统一修改个人头像入口
	 * 创建上传头像接口
	 * 在登录的窗口已经实现 动态显示用户头像
	 * 注册时使用 初始头像
	 * 更新完善日期： 2017 年 6 月 11 日
	 * 作者： 王娇
	 *
	 * @param file
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/editGoodsImg"
			, method = RequestMethod.POST
			, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object uploadHeadPic(@RequestParam(required = false) MultipartFile file, HttpServletRequest request, GoodsInfo goodsInfo,HttpServletResponse response,  HttpSession session) throws Exception {
		//保存相对路径到数据库，，图片写入数据库
		Object result;
		responseObj = new ResponseObj<User>();
		if (null == goodsInfo) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("商品 信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		if (null == file || file.isEmpty()) {
			responseObj = new ResponseObj();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("商品图像文件不能为空");
			return new GsonUtils().toJson(responseObj);
		}

		//获取新上传头像地址
		String fileName = file.getOriginalFilename();
		System.out.println("新上传文件原始文件名==" + fileName);

		// 获取图片的扩展名
		String extensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
		// 新的图片文件名 = 本地静态资源目录+上传的文件原名
		String newFileName = "/ssm_vendor/" + "static" + "/" + "upload" + "/" + fileName;

		System.out.println("新上传文件组合出来的文件名字==" + newFileName);
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("头像上传成功");
		responseObj.setMsg("文件原名为：" + file.getOriginalFilename());
		responseObj.setMsg("文件长度为：" + file.getSize());
		responseObj.setfileName(fileName);
		responseObj.setData(goodsInfo);
		session.setAttribute("userinfo", goodsInfo);
		session.setAttribute("file", fileName);
		System.out.println("===存入session信息,新上传的新头像地址===" + fileName);
		System.out.println("===存入session信息,修改头像后userinfo===" + goodsInfo);
		//获得项目的路径
		ServletContext servletContext = request.getSession().getServletContext();
		System.out.println("====打印要获取项目路径==" + servletContext);

		//设定上传的位置，设定文件保存的目录
		String path = servletContext.getRealPath("/static/upload/" + fileName);
		System.out.println("====打印要存的路径==" + path);

		//创建文件目录
		//File f = new File(path);
		//如果目录不存在就在创建
		//if (!f.exists()){
		//	f.mkdirs();
		//}if (!file.isEmpty()){
		//	try{
		//		FileOutputStream fos = new FileOutputStream(path+"/"+fileName);
		//		System.out.println("====打印要存的try里路径==" + fos);
		//		InputStream in = file.getInputStream();
		//		int b = 0;
		//		while ((b = in.read())!= -1){
		//			fos.write(b);
		//		}
		//		fos.close();
		//		in.close();
		//		responseObj.setCode(ResponseObj.OK);
		//		responseObj.setMsg("=========上传文件成功=====");
		//		//Materialdir materialdir = new Materialdir();
		//		//materialdir.setMaterialdirid(materialdirid);
		//		//materialdir.setMaterialname(fName);
		//		//materialdir.setMaterialurl(path);
		//		//materialdir.setUploadtime(new DateUtil().DateToString(new Date()));
		//		//materialdirService.add(materialdir);
		//		//System.out.println("=========上传文件成功======");
		//		//this.write(response,true);
		//	}catch (Exception e) {
		//		e.printStackTrace();
		//		responseObj.setCode(ResponseObj.FAILED);
		//		responseObj.setMsg("=========上传文件失败=====");
		//		result = new GsonUtils().toJson(responseObj);
		//		return result;
		//
		//	}
		//}
		try {
			int gid = goodsInfo.getGoodsId();
			System.out.println("得到用户名==" + gid);
			//String name = String.valueOf(userService.findUserInfo(user.getAccountName()));
			goodsInfoService.updateGoodsImg(newFileName, gid);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("更新商品图像其他错误");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		return new GsonUtils().toJson(responseObj);
	}

	/**
	 * 时间：2017 年 08 月 07 日
	 * 功能说明：运营商管理员 修改商品分组信息
	 * 作者：王娇
	 * @param request
	 * @param response
	 * @param session
	 * @param groups
	 * @param goodsInfo
	 * @return
	 */
	@RequestMapping(value = "/editGroupList",
			method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object updateGroupInfo( HttpServletRequest request,
								  HttpServletResponse response, HttpSession session,
								  Groups groups, GoodsInfo goodsInfo){
		Object result;
		responseObj = new ResponseObj<Groups>();
		if (null == groups) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("分组信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}//不能掌控

		if (StringUtils.isEmpty(groups.getGroupName())) {//必须保证某些字段不能为空
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("1.分组编码信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		//更新分组信息
		try {

			groupsService.updateGroupInfo(groups);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("更新分组信息其他错误，请联系系统管理员 邮箱：***@qq.com");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("商品分组资料更新成功");
		responseObj.setData(groups);
		System.out.println("====groups:===" + groups);
		result = new GsonUtils().toJson(responseObj);
		result = result;
		return result;
	}

	/**
	 * 时间：2017 年 08 月 08日
	 * 功能说明：运营商管理员 新增 商品分组信息
	 * 作者：王娇
	 * @param request
	 * @param response
	 * @param session
	 * @param groups

	 * @return
	 */
	@RequestMapping(value = "/addGroupList",
			method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object addGroupInfo(HttpServletRequest request,
								  HttpServletResponse response, HttpSession session,
								  Groups groups){
		Object result;
		responseObj = new ResponseObj<Groups>();
		if (null == groups) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("新增分组不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		if (StringUtils.isEmpty(groups.getGroupName())) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("新增分组编码信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		//更新商品信息
		try {
			groupsService.yunAddGroup(groups);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("新增分组信息其他错误，请联系系统管理员 邮箱：***@qq.com");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("新增商品分组记录更新成功");
		//groups.setNextUrl(request.getContextPath() + "/mvc/home");//单独控制地址
		responseObj.setData(groups);
		System.out.println("====groups:===" + groups);
		result = new GsonUtils().toJson(responseObj);
		result = result;
		return result;
	}
	/**
	 * 时间：2017 年 08 月 08日
	 * 功能说明：运营商管理员 新增 商品信息
	 * 作者：王娇
	 * @param request
	 * @param response
	 * @param session

	 * @return
	 */
	@RequestMapping(value = "/addGoodsList",
			method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object addGroupInfo(HttpServletRequest request,
							   HttpServletResponse response, HttpSession session,GoodsInfo goodsInfo){
		Object result;
		responseObj = new ResponseObj<Groups>();
		if (null == goodsInfo) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("新增的商品信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		if (StringUtils.isEmpty(goodsInfo.getGoodsName()) || StringUtils.isEmpty(goodsInfo.getGoodsImg())
				|| StringUtils.isEmpty(goodsInfo.getGoodsCode())|| StringUtils.isEmpty(goodsInfo.getGoodsUnit())
				|| StringUtils.isEmpty(goodsInfo.getGroupCode()) || goodsInfo.getPrice()==null
				) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("请检查新增商品详情不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		//增加商品信息
		try {
			goodsInfoService.yunAddGoods(goodsInfo);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("新增商品信息其他错误，请联系系统管理员 邮箱：***@qq.com");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("新增商品信息记录 成功");
		responseObj.setData(goodsInfo);
		System.out.println("====groups:===" + goodsInfo);
		result = new GsonUtils().toJson(responseObj);
		result = result;
		return result;
	}
	/**
	 * 时间：2017 年 08 月 08日
	 * 功能说明：运营商管理员 删除 商品信息
	 * 作者：王娇
	 * @param request
	 * @param response
	 * @param session

	 * @return
	 */
	@RequestMapping(value = "/deleteGoodsList",
			method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object deleteGroupInfo(HttpServletRequest request,
							   HttpServletResponse response, HttpSession session,GoodsInfo goodsInfo){
		Object result;
		responseObj = new ResponseObj<Groups>();
		//删除商品信息
		try {
			goodsInfoService.deleteGoodsInfo(goodsInfo);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("删除商品信息其他错误，请联系系统管理员 邮箱：***@qq.com");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("删除商品信息记录 成功");
		responseObj.setData(goodsInfo);
		System.out.println("====groups:===" + goodsInfo);
		result = new GsonUtils().toJson(responseObj);
		result = result;
		return result;
	}
}
