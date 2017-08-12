package cn.wj.dao;

import cn.wj.domain.Groups;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GroupsDao extends Dao<Groups> {
    // 1.1.1 得到 该运营商所拥有的一套商品列表

    List<Groups> getYgoodsList(@Param("agencyId") int agencyId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    //1.1.2 得到 该运营商所拥有的一套商品列表记录数
    int getYgoodsCount(@Param("agencyId") int agencyId);
    //1.1.3运营商管理员更新 商品分组信息
     int  updateGroupInfo(Groups groups);
     //2.1.1 运营商管理员 新增分组信息
     int  yunAddGroup (Groups groups);

    //============================自动生成============
    int insert(Groups record);

    int insertSelective(Groups record);
}