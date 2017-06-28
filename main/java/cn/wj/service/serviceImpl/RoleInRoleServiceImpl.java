package cn.wj.service.serviceImpl;

import cn.wj.dao.RoleInMenuDao;
import cn.wj.domain.RoleInMenu;
import cn.wj.service.RoleInMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ThinkPad on 2017/6/15.
 */
@Service("roleInMenuService")
public class RoleInRoleServiceImpl implements RoleInMenuService {
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	private RoleInMenuDao roleInMenuDao;

	@Override
	/**
	 * 1.1.1
	 */
	public List<RoleInMenu> getAllRoleMenu(int pageNum, int pageSize) {
		//因为数据库内容是从第一条出的数据，所以我们查询的 起始位置 = 页码 * 条数 + 1；
		pageNum -= 1;
		return roleInMenuDao.getAllRoleMenu(pageNum * pageSize , pageSize);
	}

	/**
	 * 1.1.2
	 * @return
	 */
	@Override
	public int getAllCount() {
		return roleInMenuDao.getAllCount();
	}
	//===============自动生成=========


	public void add(RoleInMenu roleInMenu) throws Exception {

	}


	public void update(RoleInMenu roleInMenu) throws Exception {

	}


	public List<RoleInMenu> findAll(int pageNum, int pageSize) {
		return null;
	}


}
