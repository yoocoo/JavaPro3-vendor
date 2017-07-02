package cn.wj.dao;

import cn.wj.domain.Factory;
import org.apache.ibatis.annotations.Param;
public interface FactoryDao extends Dao<Factory> {
	/**
	 * date： 2017.05.30
	 * author： 王娇
	 * 系统管理员创建生产商，同时在生产商表 添加一条记录
	 *
	 * @param factory
	 * @return
	 */
	int add(Factory factory);

	/**
	 * date： 2017.05.30
	 * author： 王娇
	 * 更新或修改 生产商表中 字段，但是用户名不允许修改
	 *
	 * @param factory
	 * @return
	 */
	int update(Factory factory);

	/**
	 * date： 2017.05.30
	 * author： 王娇
	 * 得到  生产商表中 生产商ID ,用与动态建表
	 * @param accountName
	 * @return
	 */
	String findOneByName(String accountName);

	/**
	 *6.10更新五张表名
	 * @param cashTableName
	 * @param orderTableName
	 * @param saleTableName
	 * @param alarmTableName
	 * @param cashSaleTableName
	 * @return
	 */
	int updateFactoryTableName(@Param("cashTableName") String cashTableName,
							   @Param("orderTableName") String orderTableName,
							   @Param("saleTableName") String saleTableName,
							   @Param("alarmTableName") String alarmTableName,
							   @Param("cashSaleTableName") String cashSaleTableName,
							   @Param("accountName") String accountName
	);

	/**
	 * 2.1.1 用户登录之后，修改个人资料，同时还要修改factory表中 头像地址
	 * @param factoryLogoPath
	 * @param accountName
	 * @return
	 */
	int updateFactoryImage(@Param("factoryLogoPath") String factoryLogoPath,@Param("accountName") String accountName);

	/**
	 * 2.2.1 生产商创建运营商账户 更新 所属的 factroy_id值
	 * @param accountName
	 * @return
	 */
	 int selectFactoryIdByName(@Param("accountName")  String accountName);
	//================================自动生成=========================================

	/**
	 *
	 * @param factoryId
	 * @return
	 */
	int deleteByPrimaryKey(Integer factoryId);

	int insert(Factory record);

	int insertSelective(Factory record);

	Factory selectByPrimaryKey(Integer factoryId);

	int updateByPrimaryKeySelective(Factory record);

	int updateByPrimaryKey(Factory record);
}