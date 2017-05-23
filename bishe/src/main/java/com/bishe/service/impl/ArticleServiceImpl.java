package com.bishe.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bishe.dao.ArticleDao;
import com.bishe.model.basemodel.BaseArticle;
import com.bishe.model.basemodel.BaseProduct;
import com.bishe.service.ArticleService;
import com.bishe.util.PageObject;

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

	@Override
	public List<BaseArticle> searchArticleWithAuthor(String author) {
		return articleDao.searchArticleWithAuthor(author);
	}

	@Override
	public List<BaseArticle> seachArticleWithType(String type) {
		return articleDao.seachArticleWithType(type);
	}

	@Override
	public int updateArtileCredit(BaseArticle article) {
		return articleDao.updateArtileCredit(article);
	}

	@Override
	public List<BaseArticle> searchHotArticle() {
		return articleDao.searchHotArticle();
	}

	@Override
	public List<BaseArticle> getArticleList(PageObject pageObject) {
		return articleDao.getArticleList(pageObject);
	}

	@Override
	public int getRowNum() {
		return articleDao.getRowNum();
	}

	@Override
	public int deleteArticleById(String articleid) {
		return articleDao.deleteArticleById(articleid);
	}

	@Override
	public int alterArticleType(BaseArticle article) {
		return articleDao.alterArticleType(article);
	}

	@Override
	public List<BaseProduct> getTypess() {
		return articleDao.getTypes();
	}
	
	

}
