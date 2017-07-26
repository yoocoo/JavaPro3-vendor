package cn.wj.dao;

import cn.wj.domain.Menu;

import java.util.List;

public interface MenuDao extends Dao<Menu> {

	/**
	 * 得到所有菜单  6.10
	 * @param menu
	 * @return
	 */
	List<Menu>  getAllMenu(Menu menu);

	///**
	// * 得到所有菜单 6.12
	// *
	// * @param limit  起始位置
	// * @param offset 每页数量
	// * @return
	// */
	//List<Menu> getAllMenu(@Param("offset") int offset, @Param("limit") int limit);

	//================================自动生成=========================================
	int deleteByPrimaryKey(Integer menuId);

	int insert(Menu record);

	int insertSelective(Menu record);

	Menu selectByPrimaryKey(Integer menuId);

	int updateByPrimaryKeySelective(Menu record);

	int updateByPrimaryKey(Menu record);
}