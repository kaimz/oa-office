package cn.qnight.model.entity;

import java.io.Serializable;

import javax.persistence.Entity;


/** 
* @ClassName: Job 
* @Description: TODO(工作职位) 
* @author zhangkai 
* @date 2017年3月17日 下午4:45:50 
*  
*/
@Entity(name="Job")
public class Job extends BaseEntity implements Serializable{
	
	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = -7204999430999733873L;
	private String title;


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
