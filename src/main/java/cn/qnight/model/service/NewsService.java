package cn.qnight.model.service;

import java.util.List;

import cn.qnight.model.entity.News;

public interface NewsService extends BaseService<News, String> {

	List<News> queryTitleList();
}
