package cn.qnight.model.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import cn.qnight.common.CriteriasGenerator;
import cn.qnight.common.Pager;
import cn.qnight.common.Pager.OrderType;
import cn.qnight.model.entity.BaseEntity;

/**
 * Dao接口 - Dao基接口
 */

public interface BaseDao<T extends BaseEntity, PK extends Serializable> {

	/**
	 * 根据ID获取实体对象.
	 * 
	 * @param id
	 *            记录ID
	 * @return 实体对象
	 */
	public T get(PK id);

	
	/**
	 * 根据ID数组获取实体对象集合.
	 * 
	 * @param ids
	 *            ID对象数组
	 * 
	 * @return 实体对象集合
	 */
	public List<T> get(PK[] ids);
	
	/**
	 * 根据属性名和属性值获取实体对象.
	 * 
	 * @param propertyName
	 *            属性名称
	 * @param value
	 *            属性值
	 * @return 实体对象
	 */
	public T get(String propertyName, Object value);
	
	/**
	 * 根据属性名和属性值获取实体对象集合.
	 * 
	 * @param propertyName
	 *            属性名称
	 * @param value
	 *            属性值
	 * @return 实体对象集合
	 */
	public List<T> getList(String propertyName, Object value);

	/**
	 * 获取所有实体对象集合.
	 * 
	 * @return 实体对象集合
	 */
	public List<T> getAll();
	
	/**
	 * 获取所有实体对象集合并按字段排序.
	 * 
	 * @return 实体对象集合
	 */
	public List<T> getAll(String orderField,OrderType orderType);
	
	/**
	 * 获取所有实体对象总数.
	 * 
	 * @return 实体对象总数
	 */
	public Long getTotalCount();

	/**
	 * 根据属性名、修改前后属性值判断在数据库中是否唯一(若新修改的值与原来值相等则直接返回true).
	 * 
	 * @param propertyName
	 *            属性名称
	 * @param oldValue
	 *            修改前的属性值
	 * @param oldValue
	 *            修改后的属性值
	 * @return boolean
	 */
	public boolean isUnique(String propertyName, Object oldValue, Object newValue);
	
	/**
	 * 根据属性名判断数据是否已存在.
	 * 
	 * @param propertyName
	 *            属性名称
	 * @param value
	 *            值
	 * @return boolean
	 */
	public boolean isExist(String propertyName, Object value);

	/**
	 * 保存实体对象.
	 * 
	 * @param entity
	 *            对象
	 * @return
	 */
	public void save(T entity);

	/**
	 * 更新实体对象.
	 * 
	 * @param entity
	 *            对象
	 */
	public void update(T entity);
	
	/**
	 * 删除实体对象.
	 * 
	 * @param entity
	 *            对象
	 * @return
	 */
	public void delete(T entity);

	/**
	 * 根据ID删除实体对象.
	 * 
	 * @param id
	 *            记录ID
	 */
	public void delete(PK id);

	/**
	 * 根据ID数组删除实体对象.
	 * 
	 * @param ids
	 *            ID数组
	 */
	public void delete(PK[] ids);

	/**
	 * 刷新session.
	 * 
	 */
	public void flush();

	/**
	 * 清除Session.
	 * 
	 */
	public void clear();
	
	/**
	 * 根绝条件生成接口进行条件查询
	 * @param criteriasGenerator 条件查询
	 * @return 结果集
	 */
	public List<T> findByCriterias(CriteriasGenerator<T> criteriasGenerator);
	
	/**
	 * 根据对象属性查询结果
	 * @param queryObject 待查询的属性组合对象
	 * @return 结果集
	 */
	public List<T> findByQueryProperty(T queryObject);
	
	/**
	 * 根据对象属性查询结果
	 * @param queryObject 待查询的属性组合对象
	 * @param excludeFields 排除的属性
	 * @return 结果集
	 */
	public List<T>findByQueryProperty(T queryObject,String[] excludeFields);
	
	/**
	 * 根据对象属性查询结果
	 * @param queryObject 待查询的属性组合对象
	 * @param excludeFields 排除的属性
	 * @param criteriasGenerator 条件生成接口
	 * @return 结果集
	 */
	public List<T> findByQueryProperty(T queryObject, String[] excludeFields,
			CriteriasGenerator<T> criteriasGenerator);
	
	/**
	 * 根据对象属性查询结果,并按排序字段进行排序
	 * @param queryObject 待查询的属性组合对象
	 * @param orders 排序集合
	 * @return
	 */
	public List<T> findByQueryPropertyWithOrder(T queryObject,
			Map<String, OrderType> orders);
	
	/**
	 * 根据对象属性查询结果,并按排序字段进行排序
	 * @param queryObject 待查询的属性组合对象
	 * @param excludeFields 排除的属性
	 * @param orders 排序集合
	 * @return
	 */
	public List<T> findByQueryPropertyWithOrder(T queryObject,
			String[] excludeFields, Map<String, OrderType> orders);
	
	/**
	 * 根据对象属性查询结果,并按排序字段进行排序
	 * @param queryObject 待查询的属性组合对象
	 * @param excludeFields 排除的属性
	 * @param criteriasGenerator 条件生成接口
	 * @param orders 排序集合
	 * @return
	 */
	public List<T> findByQueryPropertyWithOrder(T queryObject,
			String[] excludeFields, CriteriasGenerator<T> criteriasGenerator,
			Map<String, OrderType> orders);
	
	/**
	 * 根据Pager对象进行查询(提供分页、查找、排序功能).
	 * 
	 * @param pager
	 *            Pager对象
	 * @return Pager对象
	 */
	public Pager<T> findByPager(Pager<T> pager);
	
	/**
	 * 根据Pager对象进行查询(提供分页、查找、排序功能).
	 * @param pager 带查询Pager对象
	 * @param excludesFields 不参与查询的字段集合
	 * @return Pager对象
	 */
	public Pager<T> findByPager(Pager<T> pager,String[] excludesFields);
	
	/**
	 * 根据Pager对象进行查询(提供分页、查找、排序功能).
	 * @param pager 带查询Pager对象
	 * @param excludeFields 不参与查询的字段集合
	 * @param criteriasGenerator 条件生成接口
	 * @return Pager对象
	 */
	public Pager<T> findByPager(Pager<T> pager, String[] excludeFields,
			CriteriasGenerator<T> criteriasGenerator) ;

}