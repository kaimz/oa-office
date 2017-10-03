package cn.qnight.model.entity;

import java.io.Serializable;

import javax.persistence.Entity;

/** 
* @ClassName: NewType 
* @Description: TODO(新闻类型) 
* @author zhangkai 
* @date 2017年3月17日 下午4:45:30 
*  
*/
@Entity(name="Newtype")
public class NewType extends BaseEntity implements Serializable{
	
	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = 6356842427582332558L;
	private String title;


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
