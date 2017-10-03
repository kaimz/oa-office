package cn.qnight.model.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.GenericGenerator;


/** 
* @ClassName: BaseEntity 
* @Description: TODO(基类) 
* @author zhangkai 
* @date 2017年3月17日 下午4:47:42 
*  
*/
@MappedSuperclass
public abstract class BaseEntity {
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	@Id
	@GeneratedValue(generator = "system-uuid")
	@Column(length = 32)
	private String id;

	@Column(updatable=false)
	private Date createTime;

	private Date updateTime;
	
	private String description;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
