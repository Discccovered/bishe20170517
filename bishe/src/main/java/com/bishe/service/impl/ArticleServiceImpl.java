package com.bishe.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bishe.dao.ArticleDao;
import com.bishe.model.basemodel.BaseArticle;
import com.bishe.service.ArticleService;

@Service("articleService")
@Transactional
public class ArticleServiceImpl implements ArticleService {

	@Resource
	private ArticleDao articleDao;
	
	@Override
	public int insertArticle(BaseArticle article) {
		return articleDao.insertArticle(article);
	}

	@Override
	public List<BaseArticle> getSearchArticleResult(String keywords) {
		return articleDao.searchArticle(keywords);
	}

	@Override
	public BaseArticle searchArticleById(String articleid) {
		
		return articleDao.searchArticleById(articleid);
	}
	
	

}