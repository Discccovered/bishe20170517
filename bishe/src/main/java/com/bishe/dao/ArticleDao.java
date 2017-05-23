package com.bishe.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.bishe.model.basemodel.BaseArticle;
import com.bishe.model.basemodel.BaseProduct;
import com.bishe.util.ArticlePageObject;
import com.bishe.util.PageObject;

@Repository
public interface ArticleDao {
	/*@Select("select * from article where type=#{type} limit #{rownum} offset #{skip} ")
	List<BaseArticle> getArticleList(ArticlePageObject articlePageObject);*/
	
	@Select("select a.*,t.typename from article a left join types t on a.type=t.articletype  where a.title like CONCAT('%',#{pattern},'%') or a.author like CONCAT('%',#{pattern},'%') or a.paragraph like CONCAT('%',#{pattern},'%') order by credit")
	List<BaseArticle> searchArticle(String pattern);
	
	@Select("select * from article order by credit desc limit 5")
	List<BaseArticle> searchHotArticle();
	
	@Insert("insert into article(articleid, title, author, createtime, paragraph, status,credit, picture, type) values(#{articleid},#{title},#{author},#{createtime},#{paragraph},#{status},#{credit},#{picture},#{type})")
	int insertArticle(BaseArticle article);
	
	@Select("select * from article where articleid=#{articleid}")
	BaseArticle searchArticleById(String articleid);

	@Select("select a.*,t.typename from article a left join types t on a.type=t.articletype where a.author=#{author} ")
	List<BaseArticle> searchArticleWithAuthor(String author);
	
	@Select("select a.*,t.typename from article a left join types t on a.type=t.articletype where a.type=#{type} ")
	List<BaseArticle> seachArticleWithType(String type);
	
	@Update("update article set credit=#{credit} where articleid=#{articleid}")
	int updateArtileCredit(BaseArticle article);

	@Select("select a.*,t.typename from article a left join types t on a.type=t.articletype  limit #{rownum} offset #{skip} ")
	List<BaseArticle> getArticleList(PageObject pageObject);

	@Select("select count(articleid) from article")
	int getRowNum();

	@Delete("delete from article where articleid=#{articleid}")
	int deleteArticleById(String articleid);

	@Update("update article set type=#{type},title=#{title},paragraph=#{paragraph} where articleid=#{articleid}")
	int alterArticleType(BaseArticle article);

	@Select("select * from types")
	List<BaseProduct> getTypes();
}
