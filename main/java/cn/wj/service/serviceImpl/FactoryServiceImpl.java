package cn.wj.service.serviceImpl;

import cn.wj.dao.FactoryDao;
import cn.wj.domain.Factory;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.FactoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * date： 2017.05.30
 * author： 王娇
 */
@Service("FactoryService")
public class FactoryServiceImpl implements FactoryService {
	@Autowired
	private FactoryDao factoryDao;

	/**
	 * 系统管理员创建生产商，同时在生产商表 添加一条记录
	 *
	 * @param factory
	 * @throws Exception
	 */
	public void add(Factory factory) throws Exception {
		int result = 0;//表示受影响的行数
		try {
			result = factoryDao.add(factory);
		} catch (Exception e) {
			System.out.println("添加生产商失败，创建生产商用户时，已经判断唯一了");
			//其他异常情况
			throw new OtherThingsException(e);
		}
		if (result > 0)
			System.out.println("添加生产商成功！！！");
	}

	/**
	 * 2017.06.10
	 * 2.1.1 用户登录之后，修改个人资料，同时还要修改factory表中 头像地址
	 *
	 * @param factoryLogoPath
	 * @param accountName
	 * @return
	 */
	public void updateFactoryImage(String factoryLogoPath, String accountName) throws OtherThingsException {
	int result= 0;//受影响的行数默认为零
		try {
		result = factoryDao.updateFactoryImage(factoryLogoPath, accountName);
	} catch (Exception e) {
		System.out.println("更新用户表中用户头像失败");
		//其他用户更新失败异常
		throw new OtherThingsException(e);
	}
		if (result > 0) {
		System.out.println("更新生产商表中用户头像成功！");
	}
}


	/**
	 * 2017.06.10
	 * author： 王娇s
	 * 动态创建一级用户，并更新生产商表中 五张表名
	 *
	 * @param alarmTableName,s
	 * @throws Exception
	 */
	public void updateFactoryTableName(String cashTableName, String orderTableName, String saleTableName, String alarmTableName, String cashSaleTableName, String accountName) throws OtherThingsException {
		int result = 0;//表示受影响的行数
		try {
			result = factoryDao.updateFactoryTableName(cashTableName, orderTableName, saleTableName, alarmTableName, cashSaleTableName, accountName);
		} catch (Exception e) {
			System.out.println("更新生产商表中 五张表名失败！！");
			//其他异常情况
			throw new OtherThingsException(e);
		}
		if (result > 0)
			System.out.println("更新生产商表中 五张表名成功！！");
	}
//======================================================

	/**
	 * 更新或修改 生产商表中 字段，但是用户名不允许修改
	 *
	 * @param factory
	 * @throws Exception
	 */
	public void update(Factory factory) throws Exception {

	}
//===========================================================

	/**
	 * @param accountName
	 * @return
	 */
	public String findOneByName(String accountName) {
		return this.factoryDao.findOneByName(accountName);
	}

	//=========================================

	/**
	 * @param pageNum  页码
	 * @param pageSize 每页的查询数量
	 * @return
	 */
	public List<Factory> findAll(int pageNum, int pageSize) {
		return null;
	}
}
