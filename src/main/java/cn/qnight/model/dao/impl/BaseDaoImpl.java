package cn.qnight.model.dao.impl;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Order;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import cn.qnight.common.CriteriasGenerator;
import cn.qnight.common.Pager;
import cn.qnight.common.ReflectUtils;
import cn.qnight.common.Pager.OrderType;
import cn.qnight.model.dao.BaseDao;
import cn.qnight.model.entity.BaseEntity;




/**
 * Dao实现类 - Dao实现类基类
 * 
 * @author wuchangwen
 */

@Transactional
public abstract class BaseDaoImpl<T extends BaseEntity, PK extends Serializable>
		implements BaseDao<T, PK> {

	// TODO 删除 更新时的空值判断
	protected Class<T> entityClass;

	@SuppressWarnings("unchecked")
	public BaseDaoImpl() {
		this.entityClass = null;
		Type type = getClass().getGenericSuperclass();
		if (type instanceof ParameterizedType) {
			Type[] parameterizedType = ((ParameterizedType) type)
					.getActualTypeArguments();
			this.entityClass = (Class<T>) parameterizedType[0];
		}
	}

	@PersistenceContext
	private EntityManager entityManager;

	public EntityManager getEntityManager() {
		return entityManager;
	}

	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	public T get(PK id) {
		Assert.notNull(id, "id is required");
		return getEntityManager().find(entityClass, id);
	}

	public List<T> get(PK[] ids) {
		Assert.notEmpty(ids, "ids must not be empty");
		String jpql = "from " + entityClass.getName()
				+ " as model where model.id in(:ids)";
		return getEntityManager().createQuery(jpql, entityClass)
				.setParameter("ids", ids).getResultList();
	}

	public T get(String propertyName, Object value) {
		Assert.hasText(propertyName, "propertyName must not be empty");
		Assert.notNull(value, "value is required");
		String jpql = "from " + entityClass.getName()
				+ " as model where model." + propertyName + " = ?";
		TypedQuery<T> query = getEntityManager().createQuery(jpql, entityClass)
				.setParameter(1, value);
		if (query.getResultList().size() == 0) {
			return null;
		} else {
			return query.getSingleResult();
		}
	}

	public List<T> getList(String propertyName, Object value) {
		Assert.hasText(propertyName, "propertyName must not be empty");
		Assert.notNull(value, "value is required");
		String jpql = "from " + entityClass.getName()
				+ " as model where model." + propertyName + " = ?";
		return getEntityManager().createQuery(jpql, entityClass)
				.setParameter(1, value).getResultList();
	}

	public List<T> getAll() {
		String jpql = "from " + entityClass.getName();
		return getEntityManager().createQuery(jpql, entityClass)
				.getResultList();
	}

	public List<T> getAll(String orderField, OrderType orderType) {
		String jpql = "from " + entityClass.getName() + " order by "
				+ orderField + " " + orderType.toString();
		return getEntityManager().createQuery(jpql, entityClass)
				.getResultList();
	}

	public Long getTotalCount() {
		String jpql = "select count(*) from " + entityClass.getName();
		return (Long) getEntityManager().createNamedQuery(jpql)
				.getSingleResult();
	}

	public boolean isUnique(String propertyName, Object oldValue,
			Object newValue) {
		Assert.hasText(propertyName, "propertyName must not be empty");
		Assert.notNull(newValue, "newValue is required");
		if (newValue == oldValue || newValue.equals(oldValue)) {
			return true;
		}
		if (newValue instanceof String) {
			if (oldValue != null
					&& StringUtils.equalsIgnoreCase((String) oldValue,
							(String) newValue)) {
				return true;
			}
		}
		T object = get(propertyName, newValue);
		return (object == null);
	}

	public boolean isExist(String propertyName, Object value) {
		Assert.hasText(propertyName, "propertyName must not be empty");
		Assert.notNull(value, "value is required");
		T object = get(propertyName, value);
		return (object != null);
	}

	public void save(T entity) {
		Assert.notNull(entity, "entity is required");
		getEntityManager().persist(entity);
	}

	public void update(T entity) {
		Assert.notNull(entity, "entity is required");
		getEntityManager().persist(entity);
	}

	public void delete(T entity) {
		Assert.notNull(entity, "entity is required");
		getEntityManager().remove(entity);

	}

	public void delete(PK id) {
		Assert.notNull(id, "id is required");
		T entity = get(id);
		getEntityManager().remove(entity);
	}

	public void delete(PK[] ids) {
		// TODO 批量删除，缓存的清除
		Assert.notEmpty(ids, "ids must not be empty");
		for (PK id : ids) {
			T entity = get(id);
			getEntityManager().remove(entity);
		}
	}

	public void flush() {
		getEntityManager().flush();
	}

	public void clear() {
		getEntityManager().clear();
	}

	public List<T> findByCriterias(CriteriasGenerator<T> criteriasGenerator) {
		Assert.notNull(criteriasGenerator,
				"criteriasGenerator entity is required");
		CriteriaBuilder criteriaBulder = getEntityManager()
				.getCriteriaBuilder();
		// 结果集条件
		CriteriaQuery<T> criteriaQuery = criteriaBulder
				.createQuery(entityClass);
		Root<T> root = criteriaQuery.from(entityClass);

		// 组合查询条件
		List<Predicate> criterias = new ArrayList<Predicate>();

		criterias.addAll(criteriasGenerator.generateCriterias(criteriaBulder,
				root));

		Predicate[] predicates = criterias.toArray(new Predicate[0]);
		criteriaQuery.where(criteriaBulder.and(predicates));
		TypedQuery<T> typeQuery = getEntityManager().createQuery(criteriaQuery);
		List<T> resultList = typeQuery.getResultList();
		return resultList;
	}

	public List<T> findByQueryProperty(T queryObject) {
		Assert.notNull(queryObject, "queryObject entity is required");
		return findByQueryProperty(queryObject, null);
	}

	public List<T> findByQueryProperty(T queryObject, String[] excludeFields) {
		Assert.notNull(queryObject, "queryObject entity is required");
		return findByQueryProperty(queryObject, excludeFields, null);
	}

	public List<T> findByQueryProperty(T queryObject, String[] excludeFields,
			CriteriasGenerator<T> criteriasGenerator) {
		Assert.notNull(queryObject, "queryObject entity is required");
		return findByQueryPropertyWithOrder(queryObject, excludeFields,
				criteriasGenerator, null);
	}

	public List<T> findByQueryPropertyWithOrder(T queryObject,
			Map<String, OrderType> orders) {
		Assert.notNull(queryObject, "queryObject entity is required");
		return findByQueryPropertyWithOrder(queryObject, null, orders);
	}

	public List<T> findByQueryPropertyWithOrder(T queryObject,
			String[] excludeFields, Map<String, OrderType> orders) {
		Assert.notNull(queryObject, "queryObject entity is required");
		return findByQueryPropertyWithOrder(queryObject, excludeFields, null,
				orders);
	}

	public List<T> findByQueryPropertyWithOrder(T queryObject,
			String[] excludeFields, CriteriasGenerator<T> criteriasGenerator,
			Map<String, OrderType> orders) {
		Assert.notNull(queryObject, "queryObject entity is required");
		CriteriaBuilder criteriaBulder = getEntityManager()
				.getCriteriaBuilder();
		// 结果集条件
		CriteriaQuery<T> criteriaQuery = criteriaBulder
				.createQuery(entityClass);
		Root<T> root = criteriaQuery.from(entityClass);

		// 组合查询条件
		List<Predicate> criterias = buildCriteriasQuery(queryObject,
				excludeFields, criteriaBulder, root);
		// 添加额外条件
		if (criteriasGenerator != null) {
			criterias.addAll(criteriasGenerator.generateCriterias(
					criteriaBulder, root));
		}

		Predicate[] predicates = criterias.toArray(new Predicate[0]);

		// 添加排序
		if (orders != null) {
			List<Order> orderList = new ArrayList<Order>();
			for (Entry<String, OrderType> entry : orders.entrySet()) {
				if (entry.getValue() == OrderType.desc) {
					orderList
							.add(criteriaBulder.desc(root.get(entry.getKey())));
				} else {
					orderList.add(criteriaBulder.asc(root.get(entry.getKey())));
				}
			}
			criteriaQuery.orderBy(orderList);
		}

		criteriaQuery.where(criteriaBulder.and(predicates));
		TypedQuery<T> typeQuery = getEntityManager().createQuery(criteriaQuery);
		List<T> resultList = typeQuery.getResultList();
		return resultList;
	}

	public Pager<T> findByPager(Pager<T> pager) {
		Assert.notNull(pager, "pager entity is required");
		return findByPager(pager, null);
	}

	public Pager<T> findByPager(Pager<T> pager, String[] excludeFields) {
		Assert.notNull(pager, "pager entity is required");
		return findByPager(pager, excludeFields, null);
	}

	public Pager<T> findByPager(Pager<T> pager, String[] excludeFields,
			CriteriasGenerator<T> criteriasGenerator) {
		Assert.notNull(pager, "pager entity is required");

		CriteriaBuilder criteriaBulder = getEntityManager()
				.getCriteriaBuilder();
		// 结果集条件
		CriteriaQuery<T> criteriaQuery = criteriaBulder
				.createQuery(entityClass);
		// 结果数条件
		CriteriaQuery<Long> countCriteriaQuery = criteriaBulder
				.createQuery(Long.class);
		Root<T> root = criteriaQuery.from(entityClass);
		Root<T> countRoot = countCriteriaQuery.from(entityClass);
		countCriteriaQuery.select(criteriaBulder.count(countRoot));

		T queryObject = pager.getQueryObject();
		// 组合查询条件
		List<Predicate> criterias = buildCriteriasQuery(queryObject,
				excludeFields, criteriaBulder, root);
		// 添加额外条件
		if (criteriasGenerator != null) {
			criterias.addAll(criteriasGenerator.generateCriterias(
					criteriaBulder, root));
		}
		if (pager.getCreateTimeMin() != null) {
			Path<Date> fieldPath = root.get("createTime");
			criterias.add(criteriaBulder.greaterThanOrEqualTo(fieldPath,
					pager.getCreateTimeMin()));
		}
		if (pager.getCreateTimeMax() != null) {
			Path<Date> fieldPath = root.get("createTime");
			criterias.add(criteriaBulder.lessThanOrEqualTo(fieldPath,
					pager.getCreateTimeMax()));
		}
		if (pager.getUpdateTimeMin() != null) {
			Path<Date> fieldPath = root.get("updateTime");
			criterias.add(criteriaBulder.greaterThanOrEqualTo(fieldPath,
					pager.getUpdateTimeMin()));
		}
		if (pager.getUpdateTimeMax() != null) {
			Path<Date> fieldPath = root.get("updateTime");
			criterias.add(criteriaBulder.lessThanOrEqualTo(fieldPath,
					pager.getUpdateTimeMax()));
		}
		Predicate[] predicates = criterias.toArray(new Predicate[0]);
		// 根据条件查询结果集
		criteriaQuery.where(criteriaBulder.and(predicates));

		if (pager.getOrders() != null) {
			List<Order> orderList = new ArrayList<Order>();
			for (Entry<String, OrderType> entry : pager.getOrders().entrySet()) {
				if (entry.getValue() == OrderType.desc) {
					orderList
							.add(criteriaBulder.desc(root.get(entry.getKey())));
				} else {
					orderList.add(criteriaBulder.asc(root.get(entry.getKey())));
				}
			}
			criteriaQuery.orderBy(orderList);
		}
		TypedQuery<T> typeQuery = getEntityManager().createQuery(criteriaQuery);
		// 设置分页信息
		typeQuery.setMaxResults(pager.getNumPerPage());
		typeQuery.setFirstResult((pager.getPageNum() - 1)
				* pager.getNumPerPage());
		List<T> resultList = typeQuery.getResultList();
		pager.setList(resultList);

		// 根据条件查询结果数
		countCriteriaQuery.where(criteriaBulder.and(predicates));
		Long totalCount = getEntityManager().createQuery(countCriteriaQuery)
				.getSingleResult();
		pager.setTotalCount(totalCount);
		return pager;
	}

	private List<Predicate> buildCriteriasQuery(T queryObject,
			String[] excludeFields, CriteriaBuilder criteriaBulder, Root<T> root) {
		List<Predicate> criterias = new ArrayList<Predicate>();
		Field[] fields = entityClass.getDeclaredFields();
		// 遍历所有字段，将字段和查询关键字进行匹配，形成查询条件
		for (Field field : fields) {
			if (queryObject != null) {
				// 字段名称
				String fieldName = field.getName();

				if (ArrayUtils.contains(excludeFields, fieldName)) {
					continue;
				}
				// 将Id屏蔽掉
				if ("id".equals(fieldName)) {
					continue;
				}
				//  将静态常量屏蔽掉
				if(Modifier.isStatic(field.getModifiers())){
					continue;
				}
				// 处理String类型的字段
				if ("class java.lang.Integer".equals(field.getGenericType()
						.toString())
						|| "int".equals(field.getGenericType().toString())
						|| "class java.lang.Short".equals(field
								.getGenericType().toString())
						|| "short".equals(field.getGenericType().toString())
						|| "class java.lang.Double".equals(field
								.getGenericType().toString())
						|| "double".equals(field.getGenericType().toString())
						|| "class java.lang.Char".equals(field.getGenericType()
								.toString())
						|| "char".equals(field.getGenericType().toString())
						|| "class java.lang.Float".equals(field
								.getGenericType().toString())
						|| "float".equals(field.getGenericType().toString())) {
					continue;
				} else if ("class java.lang.String".equals(field
						.getGenericType().toString())) {
					// 查询关键字
					String queryKey = null;
					queryKey = (String) ReflectUtils.invokeMethod(entityClass,
							queryObject,
							"get" + StringUtils.capitalize(fieldName));
					if (queryKey == null) {
						continue;
					}

					// 查询字段和关键字都不为空时，组合查询条件
					if (StringUtils.isNotEmpty(fieldName)
							&& StringUtils.isNotEmpty(queryKey)) {
						Path<String> fieldPath = root.get(fieldName);
						criterias.add(criteriaBulder.like(fieldPath, "%"
								+ queryKey + "%"));
					}
				} else if ("class java.lang.Byte".equals(field.getGenericType()
						.toString())
						|| "byte".equals(field.getGenericType().toString())) {
					// 查询关键字
					Byte queryKey = null;
					queryKey = (Byte) ReflectUtils.invokeMethod(entityClass,
							queryObject,
							"get" + StringUtils.capitalize(fieldName));
					if (queryKey == null) {
						continue;
					}
					if (StringUtils.isNotEmpty(fieldName)) {
						Path<Byte> fieldPath = root.get(fieldName);
						criterias
								.add(criteriaBulder.equal(fieldPath, queryKey));
					}
				} else if ("class java.lang.Boolean".equals(field
						.getGenericType().toString())
						|| "boolean".equals(field.getGenericType().toString())) {
					// 查询关键字
					Boolean queryKey = null;
					queryKey = (Boolean) ReflectUtils.invokeMethod(entityClass,
							queryObject,
							"get" + StringUtils.capitalize(fieldName));
					if (queryKey == null) {
						continue;
					}
					if (StringUtils.isNotEmpty(fieldName)) {
						Path<Boolean> fieldPath = root.get(fieldName);
						criterias
								.add(criteriaBulder.equal(fieldPath, queryKey));
					}
				} else {
					Class<?> fieldClazz = field.getType();
					if (BaseEntity.class.isAssignableFrom(fieldClazz)) {
						BaseEntity queryKey = null;
						queryKey = (BaseEntity) ReflectUtils.invokeMethod(
								entityClass, queryObject,
								"get" + StringUtils.capitalize(fieldName));
						if (queryKey == null
								|| StringUtils.isEmpty(queryKey.getId())) {
							continue;
						}

						if (StringUtils.isNotEmpty(fieldName)) {
							Path<Boolean> fieldPath = root.get(fieldName);
							criterias.add(criteriaBulder.equal(fieldPath,
									queryKey));
						}
					}
				}

			}
		}

		return criterias;
	}

}