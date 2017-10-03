package cn.qnight.model.service.impl;

import java.io.Serializable;
import java.util.List;


import cn.qnight.common.Pager;
import cn.qnight.common.Pager.OrderType;
import cn.qnight.model.dao.BaseDao;
import cn.qnight.model.entity.BaseEntity;
import cn.qnight.model.service.BaseService;

public abstract class BaseServiceImpl<T extends BaseEntity, PK extends Serializable>
		implements BaseService<T, PK> {

	protected BaseDao<T, PK> dao;

	public Pager<T> findByPager(Pager<T> pager) {
		return dao.findByPager(pager);
	}

	public Pager<T> findByPager(Pager<T> pager, String[] excludeFields) {
		return dao.findByPager(pager, excludeFields);
	}

	public List<T> findByQueryProperty(T queryObject) {
		return dao.findByQueryProperty(queryObject);
	}

	public List<T> findByQueryProperty(T queryObject, String[] excludeFields) {
		return dao.findByQueryProperty(queryObject, excludeFields);
	}

	public T find(PK id) {
		return dao.get(id);
	}

	public List<T> find(PK[] ids) {
		return dao.get(ids);
	}

	public T find(String propertyName, Object value) {
		return dao.get(propertyName, value);
	}

	public List<T> findList(String propertyName, Object value) {
		return dao.getList(propertyName, value);
	}

	public List<T> findAll() {
		return dao.getAll();
	}
	
	public List<T> findAllWithOrder(String orderField,OrderType orderType){
		
		return dao.getAll(orderField, orderType);
	}

	public Long findTotalCount() {
		return dao.getTotalCount();
	}

	public void delete(PK id) {
		dao.delete(id);
	}
	
	public void save(T entity){
		dao.save(entity);
	}
}
