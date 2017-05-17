package com.bishe.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bishe.action.base.BaseAction;
import com.bishe.model.basemodel.BaseArticle;
import com.bishe.model.basemodel.BaseUser;
import com.bishe.service.ArticleService;
import com.bishe.service.UserService;

@Controller
public class UserAction extends BaseAction {

	public static final Log logger = LogFactory.getLog(UserAction.class);
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	@Autowired
	private UserService userService;

	@Autowired
	private ArticleService articleService;

	private String keyword;
	private BaseUser user;
	private File file;
	private BaseArticle article;
	private String articleid;
	
	// 提交过来的file的名字
	private String fileFileName;

	private String rpassword;

	// 提交过来的file的MIME类型
	private String fileContentType;

	public void login() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		BaseUser baseUser = userService.findUser(user);
		if (baseUser != null) {
			map.put("status", "1");
			baseUser.setCredit(baseUser.getCredit() + 3);
			userService.updateUser(baseUser);
			session.put("user", baseUser);
		} else {
			map.put("status", "0");
		}
		System.out.println("ttt");
		writeJSON(map);
	}

	public String register() throws Exception {
		try {
			if (user.getUsertype() == "1") {

				String root = ServletActionContext.getServletContext().getRealPath("/upload");

				InputStream is = new FileInputStream(file);

				OutputStream os = new FileOutputStream(new File(root, fileFileName));

				System.out.println("fileFileName: " + fileFileName);
				System.out.println(user);
				System.out.println("file: " + file.getName());
				System.out.println("file: " + file.getPath());
				System.out.println("tttttt" + root);
				byte[] buffer = new byte[500];
				int length = 0;

				while (-1 != (length = is.read(buffer, 0, buffer.length))) {
					os.write(buffer);
				}
				os.close();
				is.close();
				user.setFile(root);
			}
			user.setUserid(createUserId());
			System.out.println(user);
			int status = userService.insertUser(user);
			if (status == 0) {
				return "err";
			}
		} catch (Exception e) {
			logger.error("-- ", e);
			return "err";
		}
		session.put("user", user);
		return "succ";
	}

	public void loginout() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			session.remove("user");
			map.put("status", "1");
		} catch (Exception e) {
			map.put("status", "2");
		}
		writeJSON(map);
	}
	
	public void write() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			article.setArticleid(createUserId());
			article.setCreatetime(createUserId());
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
	
	public void searchArticleById() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			BaseArticle article = articleService.searchArticleById(articleid);
			map.put("article", article);
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
}
