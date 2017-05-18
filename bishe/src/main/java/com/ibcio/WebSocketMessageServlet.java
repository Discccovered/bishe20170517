package com.ibcio;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.StreamInbound;
import org.apache.catalina.websocket.WebSocketServlet;
import org.apache.log4j.Logger;

import com.bishe.model.basemodel.BaseUser;

@WebServlet(urlPatterns = { "/message"})
//如果要接收浏览器的ws://协议的请求就必须实现WebSocketServlet这个类
public class WebSocketMessageServlet extends org.apache.catalina.websocket.WebSocketServlet {

	private static final Logger log = Logger.getLogger(WebSocketServlet.class);
	private static final long serialVersionUID = 1L;
	
	public static int ONLINE_USER_COUNT	= 1;
	
	public String getUser(HttpServletRequest request){
		return ((BaseUser)request.getSession().getAttribute("user")).getUsername();
	}

	//跟平常Servlet不同的是，需要实现createWebSocketInbound，在这里初始化自定义的WebSocket连接对象
    @Override
    protected StreamInbound createWebSocketInbound(String subProtocol,HttpServletRequest request) {
        return new WebSocketMessageInbound(this.getUser(request));
    }
}
