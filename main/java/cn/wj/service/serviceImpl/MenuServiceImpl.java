package cn.wj.service.serviceImpl;

import cn.wj.dao.MenuDao;
import cn.wj.domain.Menu;
import cn.wj.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ThinkPad on 2017/6/4.
 */
@Service("menuService")
public class MenuServiceImpl implements MenuService{
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	private MenuDao menuDao;
	/**
	 * 得到所有菜单  显示菜单表内容
	 * @param menu
	 * @return
	 */
	public List<Menu> getAllMenu(Menu menu) {
		return menuDao.getAllMenu(menu);
	}

	///**
	// * 得到所有菜单  显示菜单表内容 6.12
	// * @param pageNum
	// * @param pageSize
	// * @return
	// */
	//public  List<Menu> getAllMenu(int pageNum, int pageSize){
	//	//因为数据库内容是从第一条出的数据，所以我们查询的 起始位置 = 页码 * 条数 + 1；
	//	pageNum -= 1;
	//	return menuDao.getAllMenu(pageNum * pageSize + 1, pageSize);
	//}





















	public void add(Menu menu) throws Exception {

	}

	public void update(Menu menu) throws Exception {

	}

	public List<Menu> findAll(int pageNum, int pageSize) {
		return null;
	}
}
