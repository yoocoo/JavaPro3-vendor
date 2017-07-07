package cn.wj.service;

import java.io.Serializable;
import java.util.List;

/**
 * Service层作为WEB应用的数据驱动层，在其中加入事物管理，考虑在Dao层中使用存储过程等设计使得程序执行更加高效
 * 面向接口编程，需要通过泛型解耦然后继承和实现BaseService接口
 * 1.在Service的实现上面使用@Service(“xxxService”)注解
 * 2.在Dao层调用的地方打上注解@Autowired
 * 3.在controller里面调用Service这里同样需要在定义的地方注解@Autowired
 * Created by ThinkPad on 2017/4/8.
 */
public interface BaseService<T extends Serializable> {
	void add(T t) throws Exception;

	void update(T t) throws Exception;

	/**
	 * 集合查询
	 * @param pageNum   页码
	 * @param pageSize  每页的查询数量
	 * @return     返回受影响的行数
	 */
	List<T> findAll(int pageNum, int pageSize);



}
