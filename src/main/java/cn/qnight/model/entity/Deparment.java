package cn.qnight.model.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


/** 
* @ClassName: Deparment 
* @Description: TODO(部门) 
* @author zhangkai 
* @date 2017年3月17日 下午4:47:32 
*  
*/
@Entity(name="Deparment")
public class Deparment extends BaseEntity implements Serializable{
	
	
	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = 3073944431494262674L;

	private String name;
	
	@ManyToOne
	private Deparment parentid;
	
	@OneToMany(mappedBy = "parentid", cascade = { CascadeType.ALL })
	private List<Deparment> children;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Deparment getParentid() {
		return parentid;
	}

	public void setParentid(Deparment parentid) {
		this.parentid = parentid;
	}

	public List<Deparment> getChildren() {
		return children;
	}

	public void setChildren(List<Deparment> children) {
		this.children = children;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
