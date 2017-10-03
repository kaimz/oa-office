package cn.qnight.model.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity(name="Calendar")
public class Calendar extends BaseEntity implements Serializable{

	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = -6274335862768423L;

	private String title;
	
	private Date start;
	
	private Date end;
	
	private Boolean allDay;
	
	private String employee;

	public String getTitle() {
		return title;
	}

	

	public String getEmployee() {
		return employee;
	}



	public void setEmployee(String employee) {
		this.employee = employee;
	}



	public void setTitle(String title) {
		this.title = title;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public Boolean getAllDay() {
		return allDay;
	}

	public void setAllDay(Boolean allDay) {
		this.allDay = allDay;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
