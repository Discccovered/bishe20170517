package com.bishe.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.bishe.model.basemodel.BaseUser;
import com.bishe.service.UserService;

/**
 * Application Lifecycle Listener implementation class SessionListenerM
 *
 */
public class SessionListenerM implements HttpSessionListener {

	
    /**
     * Default constructor. 
     */
    public SessionListenerM() {
       
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
    	HttpSession session = arg0.getSession();
    	BaseUser baseUser = (BaseUser) session.getAttribute("user");
    	if (baseUser!=null) {
    		ApplicationContext application = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
    		UserService userService = (UserService) application.getBean("userService");
			BaseUser userByName = userService.getUserByName(baseUser);
			System.out.println(userByName);
			userByName.setStatus("0");
			userService.updateUser(userByName);
			session.removeAttribute("user");
		}
    	System.out.println("session closed");
    }
	
}
