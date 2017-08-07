package cn.wj.service.serviceImpl;

import cn.wj.dao.ActionLogDao;
import cn.wj.domain.UserActionLog;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.ActionLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 使用网络爬虫工具 UserAgent
 * Created by ThinkPad on 2017/4/24.
 */
@Service("actionLogService")
public class ActionLogServiceImpl implements ActionLogService {
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	private ActionLogDao actionLogDao;
	private UserActionLog userActionLog;

	public void add(HttpServletRequest request) {
		//获取请求参数集合
		//Map<String, String[]> params = request.getParameterMap();
		//String queryString = "";
		//for (String key : params.keySet()) {
		//	String[] valuse = params.get(key);
		//	for (int i = 0; i < valuse.length; i++) {
		//		String value = valuse[i];
		//		queryString += key += "=" + value + "&";
		//
		//	}
		//
		//}
		//userActionLog = new UserActionLog();
		//userActionLog.setMethod(request.getMethod());   //获取请求方式
		//if (request.getHeader("x-forwarded-for") == null) { //获取请求IP
		//	userActionLog.setIpAddrV4(request.getRemoteAddr());
		//
		//} else {
		//	userActionLog.setIpAddrV4(request.getHeader("x-forwarded-for"));
		//}
		//userActionLog.setOther(request.getHeader("User-Agent"));    //获取user-agent
		//userActionLog.setSessionId(request.getSession().getId());   //获取用户操作的sessionID，必须
		//userActionLog.setDescription(request.getRequestURI());  //获取访问的地址
		//if (!StringUtils.isEmpty(queryString)) userActionLog.setRequestBody(queryString);   //参数集合内容不为空存入数据库
		//
		//try {
		//	UserAgent agent = new UserAgent(request.getHeader("User-Agent"));   //载入user-agent
		//	userActionLog.setOsName(agent.getOperatingSystem().getName());  //设定os名称
		//	System.out.println("==========="+agent);
		//	userActionLog.setBroName(StringUtils.isEmpty(agent.getBrowser().getName()) ? "" : agent.getBrowser().getName()); //设定浏览器名称
		//	userActionLog.setBroVersion(StringUtils.isEmpty(agent.getBrowserVersion().getVersion()) ? "" : agent.getBrowserVersion().getVersion());    //设定浏览器版本
		//} catch (Exception e) {
		//	e.printStackTrace();
		//} finally {
		//	actionLogDao.add(userActionLog);
		//	System.out.println("==========="+userActionLog);
		//}

	}

	@Deprecated
	public void add(UserActionLog userActionLog) throws Exception {

	}

	public void update(UserActionLog userActionLog) throws Exception {

	}

	public List<UserActionLog> findAll(int pageNum, int pageSize) {
		List<UserActionLog> logList = actionLogDao.findAll( 1, 10);
		return logList;
		////因为数据库内容是从第一条出的数据，所以我们查询的 起始位置 = 页码 * 条数 + 1；
		//pageNum -= 1;
		//return actionLogDao.findAll(pageNum * pageSize, pageSize);
		////这里不需要加1，不然从第二条开始展示！
	}

	public int getAllCount() {
		return actionLogDao.getAllCount();
	}

	/**
	 * 测试
	 * @param
	 * @throws Exception
	 */
		//public void updateLogInfo( String broName, String broVersion , long id) throws OtherThingsException {
		public void updateLogInfo(UserActionLog userActionLog ) throws OtherThingsException {
			int result = 0;//受影响的行数默认为零
			try {
				//result = actionLogDao.updateLogInfo(broName,broVersion,id);
				result = actionLogDao.updateLogInfo(userActionLog);
			} catch (Exception e) {
				System.out.println("日志测试更新  失败");
				//其他用户添加失败异常
				throw new OtherThingsException(e);
			}
			if (result > 0) {
				System.out.println("日志测试更新 成功");
			}
		}

}

