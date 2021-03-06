package com.bishe.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;

import com.bishe.action.base.BaseAction;
import com.bishe.model.basemodel.BaseArticle;
import com.bishe.model.basemodel.BaseProduct;
import com.bishe.model.basemodel.BaseUser;
import com.bishe.service.ArticleService;
import com.bishe.service.UserService;
import com.bishe.util.PageObject;

@Controller
public class UserAction extends BaseAction {

	public static final Logger logger = Logger.getLogger(UserAction.class);
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	@Autowired
	private UserService userService;
	@Autowired
	private ArticleService articleService;

	private String userid;
	private String rows;
	private String page;
	private String keyword;
	private BaseUser user;
	private BaseArticle article;
	private String articleid;
	private String author;

	private String type;
	private File file;
	// 提交过来的file的名字
	private String fileFileName;

	private String rpassword;

	// 提交过来的file的MIME类型
	private String fileContentType;

	public void login() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		BaseUser baseUser = userService.findUser(user);
		if (baseUser != null) {
			if (baseUser.getStatus().equals("3")) {
				map.put("status", "2");
				writeJSON(map);
				return;
			}
			boolean equals = baseUser.getUsertype().equals("0");
			map.put("status", "1");
			baseUser.setCredit(baseUser.getCredit() + 3);
			userService.updateUser(baseUser);
			session.put("user", baseUser);
			baseUser.setStatus("1");
			if (equals) {
				map.put("status", "2");
			}
			userService.updateUser(baseUser);
		} else {
			map.put("status", "0");
		}
		System.out.println("ttt");
		writeJSON(map);
	}

	public String register() throws Exception {
		try {
			BaseUser userByName = userService.getUserByName(user);
			if (userByName != null) {
				this.addFieldError("err_msg", "注册失败！用户名已存在");
				return "err";
			}
			if (user.getUsertype().equals("1")) {

				String root ="D:/zhenbishe/bishe/src/main/webapp/upload";
				File file1 = new File(root + "\\" + fileFileName);
				FileCopyUtils.copy(file, file1);
				System.out.println("path:" + root + "\\" + fileFileName);
				user.setFile("upload" + "\\" + fileFileName);
			}
			user.setCredit(1);
			user.setUserid(createUserId());
			System.out.println(user);
			user.setStatus("1");
			int status = userService.insertUser(user);
			if (status == 0) {
				return "err";
			}
		} catch (Exception e) {
			logger.error("-- ", e);
			e.printStackTrace();
			return "err";
		}
		session.put("user", user);
		return "succ";
	}

	public void searchArticleWithAuthor() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("-------");
		try {
			List<BaseArticle> list = articleService.searchArticleWithAuthor(author);
			map.put("articleList", list);
			map.put("status", "1");
		} catch (Exception e) {
			map.put("status", "2");
		}
		writeJSON(map);
	}

	public void getArticleList() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		PageObject pageObject = new PageObject();
		try {
			int pagenum = 1;
			int rownum = 10;
			if (page != null) {
				pagenum = Integer.parseInt(page);
			}
			if (rows != null) {
				rownum = Integer.parseInt(rows);
			}
			pageObject.setSkip((pagenum - 1) * rownum);
			pageObject.setRownum(rownum);
			List<BaseArticle> userList = articleService.getArticleList(pageObject);
			/*for (BaseUser baseUser : userList) {
				System.out.println(baseUser);
			}*/
			map.put("data", userList);
			map.put("rowNum", articleService.getRowNum());
			map.put("status", "1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJSON(map);
		
	}
	
	public void getArticleType() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<BaseProduct> list = articleService.getTypess();
		map.put("data", list);
		writeJSON(map);
 	}
	
	public void loginout() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			BaseUser baseUser = (BaseUser) session.get("user");
			session.remove("user");
			BaseUser findUser = userService.findUser(baseUser);
			findUser.setStatus("0");
			System.out.println(findUser);
			userService.updateUser(findUser);
			map.put("status", "1");

		} catch (Exception e) {
			map.put("status", "2");
		}
		writeJSON(map);
	}

	public void alterArticleType() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			int status = articleService.alterArticleType(article);
			if (status == 1) {
				map.put("status", "1");
			} else {
				map.put("status", "0");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJSON(map);
	}
	
	public void deleteArticleById() throws Exception{
		System.out.println("222222");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			int status = articleService.deleteArticleById(articleid);
			if (status == 1) {
				map.put("status", "1");
			} else {
				map.put("status", "0");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJSON(map);
	}
	
	public void  deleteUserById() throws Exception{
		System.out.println("222222");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			int status = userService.deleteUserById(userid);
			if (status == 1) {
				map.put("status", "1");
			} else {
				map.put("status", "0");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJSON(map);
	}
	
	public void forbidUserById() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			int status = userService.forbidUserById(userid);
			if (status == 1) {
				map.put("status", "1");
			} else {
				map.put("status", "0");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJSON(map);
	}
	
	public void getNewsArticle() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		List<BaseArticle> seachArticleWithType = articleService.seachArticleWithType(type);
		map.put("articleList", seachArticleWithType);
		writeJSON(map);
	}
	
	public void write() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			article.setArticleid(createUserId());
			article.setCreatetime(createUserId());
			BaseUser baseUser = (BaseUser) session.get("user");
			baseUser.setCredit(baseUser.getCredit() + 5);
			userService.updateUser(baseUser);
			int status = articleService.insertArticle(article);
			System.out.println(article);
			if (status == 0) {
				map.put("status", "0");
			}
			map.put("status", "1");
		} catch (Exception e) {
			map.put("msg", "出了点小错误");
			logger.error("wrong!!", e);
		}
		writeJSON(map);
	}

	public void search() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<BaseArticle> searchArticleResult = articleService.getSearchArticleResult(keyword);
			map.put("articleList", searchArticleResult);
			map.put("status", "1");
		} catch (Exception e) {
			map.put("status", "2");
		}
		writeJSON(map);
	}

	public void searchArticleById() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			BaseArticle article = articleService.searchArticleById(articleid);
			map.put("article", article);
			map.put("status", "1");
			article.setCredit(article.getCredit() + 1);
			articleService.updateArtileCredit(article);
		} catch (Exception e) {
			map.put("status", "2");
			map.put("msg", "something wrong");
		}
		writeJSON(map);
	}

	public void getHotArticle() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		try {

			List<BaseArticle> searchHotArticle = articleService.searchHotArticle();
			map.put("articleList", searchHotArticle);
			map.put("status", "1");
		} catch (Exception e) {
			logger.error("-----------", e);
		}
		writeJSON(map);
	}

	public void getOnlineMember() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<BaseUser> onlineMember = userService.getOnlineMember();
			map.put("onlinemember", onlineMember);
			map.put("status", "1");
		} catch (Exception e) {
			map.put("status", "2");
			map.put("msg", "something wrong");
		}
		writeJSON(map);
	}

	public void getUserList() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		PageObject pageObject = new PageObject();
		try {
			int pagenum = 1;
			int rownum = 10;
			if (page != null) {
				pagenum = Integer.parseInt(page);
			}
			if (rows != null) {
				rownum = Integer.parseInt(rows);
			}
			pageObject.setSkip((pagenum - 1) * rownum);
			pageObject.setRownum(rownum);
			List<BaseUser> userList = userService.getUserList(pageObject);
			/*for (BaseUser baseUser : userList) {
				System.out.println(baseUser);
			}*/
			map.put("data", userList);
			map.put("rowNum", userService.getRowNum());
			map.put("status", "1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJSON(map);
	}
	
	public void seachArticleWithType() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<BaseArticle> seachArticleWithType = articleService.seachArticleWithType(type);
			map.put("articleList", seachArticleWithType);
			map.put("status", "1");
		} catch (Exception e) {
			map.put("status", "2");
			map.put("msg", "something wrong");
		}
		writeJSON(map);
	}

	public BaseUser getUser() {
		return user;
	}

	public void setUser(BaseUser user) {
		this.user = user;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getRpassword() {
		return rpassword;
	}

	public void setRpassword(String rpassword) {
		this.rpassword = rpassword;
	}

	public String createUserId() {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMDDhhmmss");
		return sdf.format(new Date());
	}

	public BaseArticle getArticle() {
		return article;
	}

	public void setArticle(BaseArticle article) {
		this.article = article;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getArticleid() {
		return articleid;
	}

	public void setArticleid(String articleid) {
		this.articleid = articleid;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
}
