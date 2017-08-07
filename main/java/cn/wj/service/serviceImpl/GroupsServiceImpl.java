package cn.wj.service.serviceImpl;

import cn.wj.dao.GroupsDao;
import cn.wj.domain.Groups;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.GroupsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * 时间：2017 年- 0 8 月 06 日
 * 功能说明： 运营商和系统管理员 对商品的管理列表
 * 作者 ： 王娇
 */
@Service("groupsService")
public class GroupsServiceImpl implements GroupsService {
	@Autowired
	private GroupsDao groupsDao;

	/**
	 * 功能说明： 1.1.1 得到 该运营商所拥有的一套商品列表
	 * 时间：2017 年 08 月06 日
	 * 作者：王娇
	 * @param agencyId
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Groups> getYgoodsList( int agencyId, int pageNum, int pageSize) throws Exception {
		List<Groups> ygoodsList = groupsDao.getYgoodsList(agencyId,1,10);
		return ygoodsList;
	}

	/**
	 * 功能说明：1.1.2 得到 该运营商所拥有的一套商品列表记录数
	 * 时间：2017 年 08 月06 日
	 * 作者：王娇
	 * @param agencyId
	 * @return
	 */
	public int getYgoodsCount( int agencyId) {
		return groupsDao.getYgoodsCount(agencyId);
	}

	/**
	 * 功能说明：1.1.3  运营商管理 对商品 更新分组信息
	 * @param groups
	 * @return
	 * @throws Exception
	 */
	public void updateGroupInfo(Groups groups) throws OtherThingsException {
		int result1 = 0;//受影响的行数默认为零
		try {
			result1 = groupsDao.updateGroupInfo(groups);
		} catch (Exception e) {
			System.out.println(" 运营商更新商品 分组 表 service失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result1 > 0) {
			System.out.println(" 运营商更新商品 分组 表 service更新用户信息成功！");
		}
	}

	//====================自动生成========================
	@Override
	public void add(Groups groups) throws Exception {

	}

	@Override
	public void update(Groups groups) throws Exception {

	}

	@Override
	public List<Groups> findAll(int pageNum, int pageSize) {
		return null;
	}
}
