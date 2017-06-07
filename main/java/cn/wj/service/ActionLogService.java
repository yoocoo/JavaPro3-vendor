package cn.wj.service;
import cn.wj.domain.UserActionLog;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by WJ on 2017/4/24.
 */
public interface ActionLogService  extends BaseService<UserActionLog> {
	void add(HttpServletRequest request);

	/**
	 * 查询所有数据
	 * @param pageNum   页码
	 * @param pageSize  每页的查询数量
	 * @return
	 */
	List<UserActionLog> findAll(int pageNum, int pageSize);

	/**
	 * 获取总条数
	 * @return  获取总条数
	 */
	int getAllCount();
}
