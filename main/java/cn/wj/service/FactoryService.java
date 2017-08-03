package cn.wj.service;

import cn.wj.domain.Factory;

/**
 * Created by ThinkPad on 2017/5/30.
 */
public interface FactoryService extends BaseService<Factory> {
	/**
	 * date： 2017.05.30
	 * author： 王娇
	 * 系统管理员创建生产商，同时在生产商表 添加一条记录
	 *
	 * @param factory
	 * @throws Exception
	 */
	void add(Factory factory) throws Exception;

	/**
	 * 2.2.1 生产商创建运营商账户 更新 所属的 factroy_id值
	 * @param accountName
	 * @throws Exception
	 */
	void selectFactoryIdByName(String accountName)throws Exception;

	/**
	 * 2017.06.10
	 * 2.1.1 用户登录之后，修改个人资料，同时还要修改factory表中 头像地址
	 * @param factoryLogoPath
	 * @param accountName
	 * @return
	 */
	void updateFactoryImage(String factoryLogoPath, String accountName)throws Exception;
//====================================
	/**
	 * 2017.06.10
	 * author： 王娇
	 * 动态创建一级用户，并更新生产商表中 五张表名
	 *
	 * @param cashSaleTableName
	 * @throws Exception
	 */
	void updateFactoryTableName(String cashTableName,String orderTableName, String saleTableName, String alarmTableName, String cashSaleTableName,String accountName ) throws Exception;
//===================================
	/**
	 * date： 2017.05.30
	 * author： 王娇
	 * 更新或修改 生产商表中 字段，但是用户名不允许修改
	 *
	 * @param factory
	 * @throws Exception
	 */
	void update(Factory factory) throws Exception;
//==================================
	/**
	 * date： 2017.05.30
	 * author： 王娇
	 * 得到  生产商表中 生产商ID ,用与动态建表
	 *
	 * @param accountName
	 * @return
	 */
	String findOneByName(String accountName);

	/**
	 *  获得放到 运营商查询到归属的生产商的 生产商描述
	 * @param factoryId
	 * @throws Exception
	 */
	String  findFactoryById(int factoryId)throws Exception;

}
