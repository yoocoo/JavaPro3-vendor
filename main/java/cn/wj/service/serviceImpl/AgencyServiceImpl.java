package cn.wj.service.serviceImpl;

import cn.wj.dao.AgencyDao;
import cn.wj.domain.Agency;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.AgencyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 王娇 on 2017/5/25.
 * 运营商表格
 */
@Service("AgencyService")
public class AgencyServiceImpl implements AgencyService {
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	private AgencyDao agencyDao;

	/**
	 * 1.1 查找数据库中用户（注册时查重和登录时判空）
	 *  时间： 8.3 第二个功能 用于运营商角色登录的时候， 查询agency表中相关信息
	 * @param agency 用户bean
	 * @return 返回用户名
	 * @throws Exception
	 */
	public Agency findAgency(Agency agency) throws Exception {
		return agencyDao.findOneById(agency.getAccountName());
	}

	/**
	 * 2.1  添加运营商，一般要先检查 用户名是否为空，密码是否为空
	 *
	 * @param agency
	 * @throws Exception
	 */
	//public void addagency(Agency agency) throws OtherThingsException {
	//	int result = 0;//表示受影响行数
	//	try {
	//		result = agencyDao.add(agency);
	//	} catch (Exception e) {
	//		System.out.println("添加运营商失败，但是，一般创建这个运营商管理员用户账户，就已经做了判断，保证，用户名唯一性");
	//		//其他异常情况
	//		throw new OtherThingsException(e);
	//	}
	//	if (result > 0)
	//		System.out.println("添加运营商成功");
	//
	//}
	public void add(Agency agency) throws OtherThingsException {
		int result = 0;//表示受影响行数
		try {
			result = agencyDao.add(agency);
		} catch (Exception e) {
			System.out.println("添加运营商失败，但是，一般创建这个运营商管理员用户账户，就已经做了判断，保证，用户名唯一性");
			//其他异常情况
			throw new OtherThingsException(e);
		}
		if (result > 0)
			System.out.println("添加运营商成功");

	}



	/**
	 *  （暂时未使用）
	 *  更新 运营商表格 其中的一条记录
	 *
	 * @param agency
	 * @throws Exception
	 */
	public void update(Agency agency) throws Exception {

	}

	/**
	 * （暂时未使用）
	 * @param pageNum  页码
	 * @param pageSize 每页的查询数量
	 * @return
	 */
	public List<Agency> findAll(int pageNum, int pageSize) {
		return null;
	}
}
