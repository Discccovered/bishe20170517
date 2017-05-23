package com.bishe.service;


import java.util.List;

import com.bishe.model.basemodel.BaseArticle;
import com.bishe.model.basemodel.BaseProduct;
import com.bishe.util.PageObject;

public interface ArticleService {
	int insertArticle(BaseArticle article);
	List<BaseArticle> getSearchArticleResult(String keywords);
	BaseArticle searchArticleById(String articleid);
	List<BaseArticle> searchArticleWithAuthor(String author);
	List<BaseArticle> searchHotArticle();
	List<BaseArticle> seachArticleWithType(String type);
	int updateArtileCredit(BaseArticle article);
	List<BaseArticle> getArticleList(PageObject pageObject);
	int getRowNum();
	int deleteArticleById(String articleid);
	int alterArticleType(BaseArticle article);
	List<BaseProduct> getTypess();
	
	
}
