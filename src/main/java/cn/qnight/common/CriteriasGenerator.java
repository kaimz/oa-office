package cn.qnight.common;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import cn.qnight.model.entity.BaseEntity;

/**
 * 查询条件生成接口
 * @author wuchangwen
 *
 * @param <T>
 */
public interface CriteriasGenerator<T extends BaseEntity> {
	/**
	 * 根据CriteriaBuilder对象和Root对象生成查询条件
	 * @param cb CriteriaBuilder
	 * @param root Root对象
	 * @return 条件集合
	 */
	List<Predicate> generateCriterias(CriteriaBuilder cb,Root<T> root);
}
