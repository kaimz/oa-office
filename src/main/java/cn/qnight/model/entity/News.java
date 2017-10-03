package cn.qnight.model.entity;


import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;


/** 
* @ClassName: News 
* @Description: TODO(新闻) 
* @author zhangkai 
* @date 2017年3月17日 下午4:45:40 
*  
*/
@Entity(name="News")
public class News extends BaseEntity implements Serializable{
	
	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = -558148795396567857L;

	private String title;
	
	private String content;
	
	private String employee;
	/*是否启用 默认0启用*/
	private Boolean isenble;
	/*是否指定默认0no*/
	private Boolean istop;
	/*是否推荐默认0no*/
	private Boolean isRecommend;
	@ManyToOne
	private NewType newstype;
	
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
	public String getEmployee() {
		return employee;
	}
	public void setEmployee(String employee) {
		this.employee = employee;
	}
	public Boolean getIsenble() {
		return isenble;
	}
	public void setIsenble(Boolean isenble) {
		this.isenble = isenble;
	}
	public Boolean getIstop() {
		return istop;
	}
	public void setIstop(Boolean istop) {
		this.istop = istop;
	}
	public Boolean getIsRecommend() {
		return isRecommend;
	}
	public void setIsRecommend(Boolean isRecommend) {
		this.isRecommend = isRecommend;
	}
	public NewType getNewstype() {
		return newstype;
	}
	public void setNewstype(NewType newstype) {
		this.newstype = newstype;
	}
	
	
	
}
