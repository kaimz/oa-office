package cn.qnight.model.entity;

import java.io.Serializable;

import javax.persistence.Entity;

/** 
* @ClassName: Role 
* @Description: TODO(角色) 
* @author zhangkai 
* @date 2017年3月17日 下午4:45:23 
*  
*/
@Entity(name="Role")
public class Role extends BaseEntity implements Serializable{

	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = -1559611600811248220L;

	private String title;
	
	private String name;
	
	private Integer card;


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCard() {
		return card;
	}

	public void setCard(Integer card) {
		this.card = card;
	}
	
	
}
