package com.bishe.action.base;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

/**
 * 基础Action
 * 
 * @author founder
 * 
 *         更新历史： 1.2012-6-12 增加page和rows两个属性，用于jQuery EasyUI分页控件。——李宗锦
 * 
 */
public abstract class BaseAction extends ActionSupport
		implements ServletRequestAware, ServletResponseAware, SessionAware, Preparable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 345498243316974623L;

	protected final Log logger = LogFactory.getLog(BaseAction.class);

	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected Map<String, Object> session;
	protected Map<String, Object> application;
	/**
	 * jQuery EasyUI 分页控件页码参数
	 */
	protected String page = "1";

	/**
	 * jQuery EasyUI 分页控件每页至多显示数
	 */
	protected String rows = "20";

	protected int pageNo;

	protected int size;

	protected String moduleId;

	public void setApplication(Map<String, Object> arg0) {
		this.application = arg0;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	/**
	 * 将字符串写入到response
	 * 
	 * @param text
	 * @throws Exception
	 */
	protected void writeText(String text) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(text);
	}

	/**
	 * 将JSON对象写入到response
	 * 
	 * @param jsonObject
	 * @throws Exception
	 */
	protected void writeJSON(Object jsonObject) throws Exception {
		Gson gson = new Gson();
		String result = gson.toJson(jsonObject);
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().write(result);
	}

	protected void writeJSONP(String callback, Object jsonObject) throws Exception {
		Gson gson = new Gson();
		String result = gson.toJson(jsonObject);
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().write(callback + "(" + result + ")");
	}

	/**
	 * 对给定字符进行 URL 解码
	 * 
	 * @param value
	 *            String
	 * @return String
	 */
	public String decode(String value) {
		String result = "";
		if (!isEmpty(value)) {
			try {
				result = java.net.URLDecoder.decode(value, "UTF-8");
				result = java.net.URLDecoder.decode(result, "UTF-8");
			} catch (UnsupportedEncodingException ex) {

			}
		}
		return result;
	}

	/**
	 * 对给定字符进行 URL 编码
	 * 
	 * @param value
	 *            String
	 * @return String
	 */
	public String encode(String value) {
		String result = "";
		if (!isEmpty(value)) {
			try {
				result = java.net.URLEncoder.encode(value, "UTF-8");
				result = java.net.URLEncoder.encode(result, "UTF-8");
			} catch (UnsupportedEncodingException ex) {

			}
		}
		return result;
	}

	public boolean isEmpty(String value) {
		if (null == value || "".equals(value.trim()))
			return true;
		else
			return false;
	}

	public String getPage() {
		return page == null ? "1" : page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getRows() {
		return rows == null ? "20" : rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	@SuppressWarnings("unchecked")
	public void prepare() throws Exception {
		pathMap = (Map<String, String>) ServletActionContext.getServletContext().getAttribute("pathMap");
	}

	protected Map<String, String> pathMap;// 路径列表

	public Map<String, String> getPathMap() {
		return pathMap;
	}

	public void setPathMap(Map<String, String> pathMap) {
		this.pathMap = pathMap;
	}

	public String getModuleId() {
		return moduleId;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = (moduleId == null ? request.getParameter("moduleId") : moduleId);
	}

	public boolean isNull(String src) {
		if (src == null) {
			return true;
		} else if ("".equals(src) || "".equals(src.trim())) {
			return true;
		}
		return false;
	}

}