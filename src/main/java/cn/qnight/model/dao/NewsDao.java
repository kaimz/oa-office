package cn.qnight.model.dao;

import java.util.List;

import cn.qnight.model.entity.News;

public interface NewsDao extends BaseDao<News, String>{

	List<News> queryTitleList();
}
