package cn.wj.service.serviceImpl;

import cn.wj.dao.RoleInMenuDao;
import cn.wj.domain.RoleInMenu;
import cn.wj.service.RoleInMenuService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ThinkPad on 2017/6/15.
 */
@Service("roleInMenuService")
public class RoleInRoleServiceImpl implements RoleInMenuService {
private  RoleInMenuDao roleInMenuDao;

	public List<RoleInMenu> getAllRoleMenu(RoleInMenu roleInMenu) {
		return roleInMenuDao.getAllRoleMenu(roleInMenu);
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
