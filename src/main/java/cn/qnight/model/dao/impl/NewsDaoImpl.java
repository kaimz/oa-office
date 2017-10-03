package cn.qnight.model.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import cn.qnight.model.dao.NewsDao;
import cn.qnight.model.entity.News;

@Repository
public class NewsDaoImpl extends BaseDaoImpl<News, String> implements NewsDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<News> queryTitleList() {
		// TODO Auto-generated method stub
		String sql = "select n.id as id,n.title as title,n.newstype.title as newstype,n.description as description,n.createTime as createTime "
				+ "from News n where n.isenble = true order by n.createTime desc";
		Query query = getEntityManager().createQuery(sql);
		
		return query.getResultList();
	}

}
