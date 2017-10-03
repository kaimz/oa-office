package cn.qnight.model.entity;

import java.io.Serializable;

import javax.persistence.Entity;

/** 
* @ClassName: Journal 
* @Description: TODO(日志) 
* @author zhangkai 
* @date 2017年3月17日 下午4:45:44 
*  
*/
@Entity(name="Journal")
public class Journal extends BaseEntity implements Serializable{
	
	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = 9141256629464217930L;

	private String title;
	
	private String content;
	
	private String employeeid;
	
	private Boolean type;

	

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmployeeid() {
		return employeeid;
	}

	public void setEmployeeid(String employeeid) {
		this.employeeid = employeeid;
	}

	public Boolean getType() {
		return type;
	}

	public void setType(Boolean type) {
		this.type = type;
	}
	
}
