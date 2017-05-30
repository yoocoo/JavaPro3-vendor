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
	 * @param factory
	 * @throws Exception
	 */
	void add(Factory factory) throws Exception;

	/**
	 * date： 2017.05.30
	 * author： 王娇
	 * 更新或修改 生产商表中 字段，但是用户名不允许修改
	 * @param factory
	 * @throws Exception
	 */
	void update(Factory factory) throws Exception;

	/**
	 * date： 2017.05.30
	 * author： 王娇
	 * 得到  生产商表中 生产商ID ,用与动态建表
	 * @param accountName
	 * @return
	 */
	String findOneByName(String accountName);
}
