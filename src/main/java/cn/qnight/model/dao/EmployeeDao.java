package cn.qnight.model.dao;

import org.springframework.stereotype.Repository;

import cn.qnight.model.entity.Employee;

@Repository
public interface EmployeeDao extends BaseDao<Employee, String>{
	
	Employee findByLoginnameAndPassword(String loginname, String password);
}
