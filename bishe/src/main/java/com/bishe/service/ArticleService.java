package com.bishe.service;


import java.util.List;

import com.bishe.model.basemodel.BaseArticle;

public interface ArticleService {
	int insertArticle(BaseArticle article);
	List<BaseArticle> getSearchArticleResult(String keywords);
	BaseArticle searchArticleById(String articleid);
}