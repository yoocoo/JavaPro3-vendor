package cn.wj.dao;

import cn.wj.domain.Agency;

import java.io.Serializable;

public interface AgencyDao extends Dao<Agency> {

	int add(Agency agency);

	//运营商表 增加记录
	//int addagency(Agency agency);
	//1.1  查找-登录运营商用户，查找用户是否存在  第二个功能 运营商角色登录之后，查询运营商表格相关信息-->
	Agency findOneById(Serializable Id);

	//2.2增加语句-注册新的运营商用户 ，在数据库中，主键id设置为自增长，时间无默认值，sql语句中CURRENT_TIMESTAMP就是获取当前系统时间-->

	int update(Agency agency);






	//================自动生成=====================================
	//int insert(Agency record);
	//
	//int insertSelective(Agency record);
}