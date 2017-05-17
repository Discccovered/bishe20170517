package com.bishe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.bishe.model.basemodel.BaseArticle;
import com.bishe.util.ArticlePageObject;

@Repository
public interface ArticleDao {
	@Select("select * from article where type=#{type} limit #{rownum} offset #{skip} ")
	List<BaseArticle> getArticleList(ArticlePageObject articlePageObject);
	
	@Select("select a.*,t.typename from article a left join types t on a.type=t.articletype  where a.title like CONCAT('%',#{pattern},'%') or a.author like CONCAT('%',#{pattern},'%') or a.paragraph like CONCAT('%',#{pattern},'%') order by credit")
	List<BaseArticle> searchArticle(String pattern);
	
	@Insert("insert into article(articleid, title, author, createtime, paragraph, status,credit, picture, type) values(#{articleid},#{title},#{author},#{createtime},#{paragraph},#{status},#{credit},#{picture},#{type})")
	int insertArticle(BaseArticle article);
	
	@Select("select * from article where articleid=#{articleid}")
	BaseArticle searchArticleById(String articleid);

	@Select("select a.*,t.typename from article a left join types t on a.type=t.articletype where a.author=#{author} ")
	List<BaseArticle> searchArticleWithAuthor(String author);
}
