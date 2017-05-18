package com.ibcio;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.WsOutbound;
import org.apache.log4j.Logger;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class WebSocketMessageInbound extends MessageInbound {

	private static final Logger log = Logger.getLogger(MessageInbound.class);
	
	//当前连接的用户名称
	private final String user;

	public WebSocketMessageInbound(String user) {
		this.user = user;
	}

	public String getUser() {
		return this.user;
	}

	//建立连接的触发的事件
	@Override
	protected void onOpen(WsOutbound outbound) {
		// 触发连接事件，在连接池中添加连接
		JSONObject result = new JSONObject();
		result.element("type", "user_join");
		result.element("user", this.user);
		//向所有在线用户推送当前用户上线的消息
		WebSocketMessageInboundPool.sendMessage(result.toString());
		
		result = new JSONObject();
		result.element("type", "get_online_user");
		result.element("list", WebSocketMessageInboundPool.getOnlineUser());
		//向连接池添加当前的连接对象
		WebSocketMessageInboundPool.addMessageInbound(this);
		//向当前连接发送当前在线用户的列表
		WebSocketMessageInboundPool.sendMessageToUser(this.user, result.toString());
	}

	@Override
	protected void onClose(int status) {
		// 触发关闭事件，在连接池中移除连接
		WebSocketMessageInboundPool.removeMessageInbound(this);
		JSONObject result = new JSONObject();
		result.element("type", "user_leave");
		result.element("user", this.user);
		//向在线用户发送当前用户退出的消息
		WebSocketMessageInboundPool.sendMessage(result.toString());
	}

	@Override
	protected void onBinaryMessage(ByteBuffer message) throws IOException {
		throw new UnsupportedOperationException("Binary message not supported.");
	}

	//客户端发送消息到服务器时触发事件
	@Override
	protected void onTextMessage(CharBuffer message) throws IOException {
		//向所有在线用户发送消息
//		String[] split = message.toString().split("_");
		JsonObject jsonObject = new JsonParser().parse(message.toString()).getAsJsonObject();
		String asString = jsonObject.get("content").getAsString();
		String[] split = asString.split("_");
		for (String string : split) {
			System.out.println(string);
		}
		if (split.length==3&&split[0].equals("2")) {
			jsonObject.addProperty("content", split[2]);
			String from = jsonObject.get("from").getAsString();
			jsonObject.addProperty("from",from+"悄悄对你说");
			WebSocketMessageInboundPool.sendMessageToUser(split[1],jsonObject.toString());
			jsonObject.addProperty("from","你悄悄对"+split[1]+"说");
			WebSocketMessageInboundPool.sendMessageToUser(user,jsonObject.toString());
		}else {
			WebSocketMessageInboundPool.sendMessage(message.toString());
		}
	}
}
