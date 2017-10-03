package cn.qnight.model.service.impl;


import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.qnight.model.dao.EmployeeDao;
import cn.qnight.model.entity.Employee;
import cn.qnight.model.service.EmployeeService;

@Service
@Transactional
public class EmployeeServiceImpl extends BaseServiceImpl<Employee, String> implements EmployeeService {
	@Autowired
	public void setDao(EmployeeDao dao) {
		this.dao = dao;
	}
	
	@Autowired
	private EmployeeDao employeeDao;

	public Employee findByLoginnameAndPassword(String loginname, String password) {
		// TODO Auto-generated method stub
		return employeeDao.findByLoginnameAndPassword(loginname, password);
	}

	/** (非 Javadoc) 
	* <p>Title: excel</p> 
	* <p>Description: </p>  
	 * @throws FileNotFoundException 
	* @see cn.qnight.model.service.EmployeeService#excel() 
	*/
	@SuppressWarnings({ "deprecation", "resource" })
	@Override
	public void excel() throws FileNotFoundException {
		// TODO Auto-generated method stub
		List<Employee> list = employeeDao.getAll();
		int CountColumnNum = 7;
		int i =1 ;
		// 创建Excel文档
		HSSFWorkbook wb = new HSSFWorkbook() ;
		// sheet 对应一个工作页
		HSSFSheet sheet = wb.createSheet("employee表中的数据") ;
		HSSFRow firstrow = sheet.createRow(0); //下标为0的行开始
		HSSFCell[] firstcell = new HSSFCell[CountColumnNum];
		String[] names = new String[CountColumnNum];
		names[0] ="序号";
		names[1] ="姓名";
		names[2] ="性别";
		names[3] ="手机号";
		names[4] ="部门";
		names[5] ="职位";
		names[6] ="入职日期";
		for(int j= 0; j<CountColumnNum; j++){
		firstcell[j] = firstrow.createCell((short)j);
		firstcell[j].setCellValue(new HSSFRichTextString(names[j]));
		}
		/*for (Employee employee : list)
		{
		// 创建电子表格的一行
		HSSFRow row = sheet.createRow(i) ; // 下标为1的行开始
		for(int j=0;j<CountColumnNum;j++)
		{
		// 在一行内循环
		HSSFCell cell = row.createCell((short) j) ;
		// 设置表格的编码集，使支持中文
		//// 先判断数据库中的数据类型
		// 将结果集里的值放入电子表格中
		cell.setCellValue(new HSSFRichTextString(employee.getRealname())) ;
		}
		i++ ;
		}*/
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		for (Employee employee : list) {
			HSSFRow row = sheet.createRow(i);
			row.createCell((short) 0).setCellValue(i); ;
			row.createCell((short) 1).setCellValue(new HSSFRichTextString(employee.getRealname()));
			row.createCell((short) 2).setCellValue(new HSSFRichTextString(employee.getSex() == 0 ? "女" : "男"));
			row.createCell((short) 3).setCellValue(new HSSFRichTextString(employee.getPhone()));
			row.createCell((short) 4).setCellValue(new HSSFRichTextString(employee.getDepartmentid().getName()));
			row.createCell((short) 5).setCellValue(new HSSFRichTextString(employee.getJob().getTitle()));
			row.createCell((short) 6).setCellValue(new HSSFRichTextString(format.format(employee.getCreateTime())));
			i++ ;
		}
		
		// 创建文件输出流，准备输出电子表格
		OutputStream out = new FileOutputStream("E:\\employee.xls") ;
		try {
			wb.write(out) ;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			out.close() ;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("数据库导出成功") ;
		
	}

	/** (非 Javadoc) 
	* <p>Title: export</p> 
	* <p>Description: </p> 
	* @return 
	* @see cn.qnight.model.service.EmployeeService#export() 
	*/
	@Override
	public HSSFWorkbook export() {
		// TODO Auto-generated method stub
		List<Employee> list = employeeDao.getAll();
		int CountColumnNum = 7;
		int i =1 ;
		// 创建Excel文档
		HSSFWorkbook wb = new HSSFWorkbook() ;
		// sheet 对应一个工作页
		HSSFSheet sheet = wb.createSheet("employee表中的数据") ;
		HSSFRow firstrow = sheet.createRow(0); //下标为0的行开始
		HSSFCell[] firstcell = new HSSFCell[CountColumnNum];
		String[] names = new String[CountColumnNum];
		names[0] ="序号";
		names[1] ="姓名";
		names[2] ="性别";
		names[3] ="手机号";
		names[4] ="部门";
		names[5] ="职位";
		names[6] ="入职日期";
		for(int j= 0; j<CountColumnNum; j++){
		firstcell[j] = firstrow.createCell((short)j);
		firstcell[j].setCellValue(new HSSFRichTextString(names[j]));
		}
		/*for (Employee employee : list)
		{
		// 创建电子表格的一行
		HSSFRow row = sheet.createRow(i) ; // 下标为1的行开始
		for(int j=0;j<CountColumnNum;j++)
		{
		// 在一行内循环
		HSSFCell cell = row.createCell((short) j) ;
		// 设置表格的编码集，使支持中文
		//// 先判断数据库中的数据类型
		// 将结果集里的值放入电子表格中
		cell.setCellValue(new HSSFRichTextString(employee.getRealname())) ;
		}
		i++ ;
		}*/
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		for (Employee employee : list) {
			HSSFRow row = sheet.createRow(i);
			row.createCell((short) 0).setCellValue(i); ;
			row.createCell((short) 1).setCellValue(new HSSFRichTextString(employee.getRealname()));
			row.createCell((short) 2).setCellValue(new HSSFRichTextString(employee.getSex() == 0 ? "女" : "男"));
			row.createCell((short) 3).setCellValue(new HSSFRichTextString(employee.getPhone()));
			row.createCell((short) 4).setCellValue(new HSSFRichTextString(employee.getDepartmentid().getName()));
			row.createCell((short) 5).setCellValue(new HSSFRichTextString(employee.getJob().getTitle()));
			row.createCell((short) 6).setCellValue(new HSSFRichTextString(format.format(employee.getCreateTime())));
			i++ ;
		}
		
		return wb;
	}
	

}
	

