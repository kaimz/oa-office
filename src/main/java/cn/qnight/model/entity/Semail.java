package cn.qnight.model.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

/** 
* @ClassName: Semail 
* @Description: TODO(邮件关联) 
* @author zhangkai 
* @date 2017年3月28日 下午12:00:22 
*  
*/
@Entity(name="Semail")
public class Semail extends BaseEntity implements Serializable{

	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = 1284728536611666707L;

	@ManyToOne(cascade = { CascadeType.ALL })
	private Schedule scheduleid;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private Employee sendid;
	
	private Boolean isview;

	

	public Boolean getIsview() {
		return isview;
	}



	public void setIsview(Boolean isview) {
		this.isview = isview;
	}



	public Schedule getScheduleid() {
		return scheduleid;
	}



	public void setScheduleid(Schedule scheduleid) {
		this.scheduleid = scheduleid;
	}



	public Employee getSendid() {
		return sendid;
	}



	public void setSendid(Employee sendid) {
		this.sendid = sendid;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
