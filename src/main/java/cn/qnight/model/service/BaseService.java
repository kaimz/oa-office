package cn.qnight.model.service;

import java.io.Serializable;
import java.util.List;

import cn.qnight.common.Pager;
import cn.qnight.common.Pager.OrderType;
import cn.qnight.model.entity.BaseEntity;


public interface BaseService<T extends BaseEntity, PK extends Serializable> {
	Pager<T> findByPager(Pager<T> pager);

	Pager<T> findByPager(Pager<T> pager, String[] excludeFields);

	List<T> findByQueryProperty(T queryObject);

	List<T> findByQueryProperty(T queryObject, String[] excludeFields);

	T find(PK id);

	List<T> find(PK[] ids);

	T find(String propertyName, Object value);

	List<T> findList(String propertyName, Object value);

	List<T> findAll();
	
	List<T> findAllWithOrder(String orderField,OrderType orderType);

	Long findTotalCount();

	void delete(PK id);
	
	void save(T entity);
}
