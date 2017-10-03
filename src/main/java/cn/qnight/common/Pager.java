package cn.qnight.common;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 分页类
 * 
 * @author wuchangwen
 * 
 * @param <T>
 *            泛型，在实例化时填入具体类别
 * 
 */
public class Pager<T> {
	// TODO 问题：DWZ只支持单一字段排序，需修正
	// 排序方式
	public enum OrderType {
		asc, desc
	}

	public static final Integer MAX_PAGE_SIZE = 500;// 每页最大记录数限制

	private Integer pageNum = 1;// 当前页码
	private Integer numPerPage = 25;// 每页记录数
	private Long totalCount = 0l;// 总记录数
	private Integer pageCount = 0;// 总页数
	private T queryObject;// 查找属性
	private Date createTimeMin;
	private Date createTimeMax;
	private Date updateTimeMin;
	private Date updateTimeMax;
	private Map<String, OrderType> orders;
	private List<T> list;// 数据List
	

	public Pager() {
		// 默认按照创建时间排序
		orders = new HashMap<String, OrderType>();
		orders.put("createTime", OrderType.desc);
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		if (pageNum < 1) {
			pageNum = 1;
		}
		this.pageNum = pageNum;
	}

	public Integer getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(Integer numPerPage) {
		if (numPerPage < 1) {
			numPerPage = 1;
		} else if (numPerPage > MAX_PAGE_SIZE) {
			numPerPage = MAX_PAGE_SIZE;
		}
		this.numPerPage = numPerPage;
	}

	public Long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getPageCount() {
		pageCount = Long.valueOf(totalCount / numPerPage).intValue();
		if (totalCount % numPerPage > 0) {
			pageCount++;
		}
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public T getQueryObject() {
		return queryObject;
	}

	public void setQueryObject(T queryObject) {
		this.queryObject = queryObject;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public Date getCreateTimeMin() {
		return createTimeMin;
	}

	public void setCreateTimeMin(Date createTimeMin) {
		this.createTimeMin = createTimeMin;
	}

	public Date getCreateTimeMax() {
		return createTimeMax;
	}

	public void setCreateTimeMax(Date createTimeMax) {
		this.createTimeMax = createTimeMax;
	}

	public Date getUpdateTimeMin() {
		return updateTimeMin;
	}

	public void setUpdateTimeMin(Date updateTimeMin) {
		this.updateTimeMin = updateTimeMin;
	}

	public Date getUpdateTimeMax() {
		return updateTimeMax;
	}

	public void setUpdateTimeMax(Date updateTimeMax) {
		this.updateTimeMax = updateTimeMax;
	}

	public Map<String, OrderType> getOrders() {
		return orders;
	}

	public void setOrders(Map<String, OrderType> orders) {
		this.orders = orders;
	}

	public Long getStart() {
		if (totalCount == 0) {
			return 0l;
		} else {
			return Long.valueOf(numPerPage * (pageNum - 1)) + 1;
		}
	}

	public Long getEnd() {
		if (totalCount == 0) {
			return 0l;
		} else {
			if (pageNum == pageCount) {
				return totalCount;
			} else {
				return Long.valueOf(numPerPage * (pageNum - 1)) + list.size();
			}
		}
	}
}