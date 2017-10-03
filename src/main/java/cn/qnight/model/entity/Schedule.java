package cn.qnight.model.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


/** 
* @ClassName: Schedule 
* @Description: TODO(日程) 
* @author zhangkai 
* @date 2017年3月17日 上午10:45:56 
*  
*/
@Entity(name="Schedule")
public class Schedule extends BaseEntity implements Serializable{
	
	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = 1887648123767273862L;

	private String title;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private Employee employeeid;
	
	
	private Boolean iscomplete;
	
	
	@ManyToOne
	private Schedule parentid;
	
	private Boolean isdelete;
	
	@OneToMany(mappedBy="scheduleid")
	private List<Semail> semails;
	
	
	public List<Semail> getSemails() {
		return semails;
	}
	public void setSemails(List<Semail> semails) {
		this.semails = semails;
	}
	public Boolean getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(Boolean isdelete) {
		this.isdelete = isdelete;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public Employee getEmployeeid() {
		return employeeid;
	}
	public void setEmployeeid(Employee employeeid) {
		this.employeeid = employeeid;
	}


	public Boolean getIscomplete() {
		return iscomplete;
	}
	public void setIscomplete(Boolean iscomplete) {
		this.iscomplete = iscomplete;
	}

	public Schedule getParentid() {
		return parentid;
	}
	public void setParentid(Schedule parentid) {
		this.parentid = parentid;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	
	
}
