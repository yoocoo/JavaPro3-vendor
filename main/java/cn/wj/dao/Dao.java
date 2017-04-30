package cn.wj.dao;

import java.io.Serializable;
import java.util.List;

/**
 * 通过接口编程2017/4/8.
 * @param <T> 泛型用于解耦 同时避免写重复的代码
 */
public interface Dao<T> {
	/**
	 * 添加某个对象
	 * @param t  待添加对象
	 * @return   返回影响的 行数
	 */
	int add(T  t);

	/**
	 * 删除某个对象
	 * 注意：在企业开发中，一般不做物理删除，只是添加某个字段对某数据进行可用控制
	 * @param t
	 * @return 返回受影响行数
	 */
	int del(T t);

	/**
	 * 更新某个对象
	 * @param t  待更新对象
	 * @return  返回受影响的行数
	 */
	int update(T t);

	/**
	 * 通过一个IS 查找一个对象
	 * @param Id  待查询的对象账号名
	 * @return  返回该Id对应的对象
	 */
	T findOneById(Serializable Id);

	/**
	 * 查找对象
	 * @return  返回对象集合
	 */
	List<T> findAll();


}
