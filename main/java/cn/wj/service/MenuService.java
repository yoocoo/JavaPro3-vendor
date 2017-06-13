package cn.wj.service;

import cn.wj.domain.Menu;
import java.util.List;
/**
 * Created by ThinkPad on 2017/6/4.
 */
public interface MenuService extends BaseService<Menu> {
	/**
	 * 得到所有菜单  6.10
	 * @param menu
	 * @return
	 */
	List<Menu> getAllMenu(Menu menu);
	//=======================
	///**
	// * 得到所有菜单  6.12
	// * @param pageNum
	// * @param pageSize
	// * @return
	// */
	//List<Menu> getAllMenu(int pageNum , int pageSize);
	//=======================


}
