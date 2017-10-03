package cn.qnight.model.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;


/** 
* @ClassName: Employee 
* @Description: TODO(员工) 
* @author zhangkai 
* @date 2017年3月17日 下午4:46:08 
*  
*/
@Entity(name="Employee")
public class Employee extends BaseEntity implements Serializable{

	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = 378358971237365781L;
	
	
	private String loginname;
	
	private String password;
	
	private String card;
	
	private Integer sex;
	
	private String email;
	
	private String phone;
	
	private String realname;
	
	private Date birth;
	
	@ManyToOne
	private Job job;
	
	@ManyToOne
	private Deparment departmentid;
	
	private String picture;
	
	@ManyToOne
	private Role roleid;
	
	private Boolean isusing;
	
	
	
	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public Boolean getIsusing() {
		return isusing;
	}

	public void setIsusing(Boolean isusing) {
		this.isusing = isusing;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public Deparment getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(Deparment departmentid) {
		this.departmentid = departmentid;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Role getRoleid() {
		return roleid;
	}

	public void setRoleid(Role roleid) {
		this.roleid = roleid;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}




	
	
}
