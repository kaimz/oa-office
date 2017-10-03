package cn.qnight.model.dao.impl;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import cn.qnight.model.dao.EmployeeDao;
import cn.qnight.model.entity.Employee;

@Repository
public class EmployeeDaoImpl extends BaseDaoImpl<Employee, String> implements EmployeeDao{

	public Employee findByLoginnameAndPassword(String loginname, String password) {
		// TODO Auto-generated method stub
		String sql = "select a from Employee as a where a.loginname = :loginname and a.password = :password";
		Query query = getEntityManager().createQuery(sql, entityClass);
		query.setParameter("loginname", loginname);
		query.setParameter("password", password);
		return query.getResultList().size() == 0 ? null : (Employee) query.getSingleResult();
	}

}
