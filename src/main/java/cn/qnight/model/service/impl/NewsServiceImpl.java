package cn.qnight.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.qnight.model.dao.NewsDao;
import cn.qnight.model.entity.News;
import cn.qnight.model.service.NewsService;

@Service
@Transactional
public class NewsServiceImpl extends BaseServiceImpl<News, String> implements NewsService {

	@Autowired
	public void setDao(NewsDao dao) {
		this.dao = dao;
	}
	
	@Autowired
	private NewsDao newsDao;

	@Override
	public List<News> queryTitleList() {
		// TODO Auto-generated method stub
		return newsDao.queryTitleList();
	}
}
