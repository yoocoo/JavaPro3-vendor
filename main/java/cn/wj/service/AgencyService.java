package cn.wj.service;

import cn.wj.domain.Agency;

import java.util.List;

/**
 * Created by 王娇 on 2017/5/25.
 * 功能 ：  运营商 表格
 */
public interface AgencyService extends BaseService<Agency> {
	/**
	 * 查找数据库中用户（注册时查重和登录时判空）
	 *
	 * @param agency
	 * @return
	 * @throws Exception
	 */
	Agency findAgency(Agency agency) throws Exception;
	/**
	 * 系统管理员 sysuseradd 添加一条记录到 运营商表格中
	 *
	 * @param agency
	 * @throws Exception
	 */
	//void addagency(Agency agency) throws Exception;
	void add(Agency agency) throws Exception;
	/**
	 * 更新 运营商表 的一条数据
	 *
	 * @param agency
	 * @throws Exception
	 */
	void update(Agency agency) throws Exception;

	/**
	 * 返回 运营商表中所有记录（待细致筛查！！）
	 *
	 * @param pageNum  页码
	 * @param pageSize 每页的查询数量
	 * @return
	 */
	List<Agency> findAll(int pageNum, int pageSize);
}
