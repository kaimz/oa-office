package cn.qnight.model.service;

import java.io.FileNotFoundException;

import org.apache.poi.hssf.extractor.EventBasedExcelExtractor;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import cn.qnight.model.entity.Employee;

public interface EmployeeService extends BaseService<Employee, String>{

	Employee findByLoginnameAndPassword(String loginname, String password);

	void excel() throws FileNotFoundException;
	
	HSSFWorkbook export();
}
