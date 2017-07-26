package org.fkit.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener {
	private static int num;
    @Override
    public void sessionCreated(HttpSessionEvent event) {
        // System.out.println("创建了");
        HttpSession session = event.getSession();// 获得Session对象
        // 通过Session获得servletcontext对象      
        ServletContext servletContext = session.getServletContext();
        /**
         * 1.获取num值
         * 2.加1
         * 3.存入servletcontext
         */
        Object object = servletContext.getAttribute("num");
        System.out.println(object);
//        if (object==null) {
//            servletContext.setAttribute("num", 1);
//            System.out.println("=======================================");
//        } else {
//            Object num = servletContext.getAttribute("num");
//            int num1 = (int) num;
            servletContext.setAttribute("num", ++num);
            System.out.println("输出==================================================");
//        }
    }
 
    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        // System.out.println("销毁了");
       HttpSession session = event.getSession();// 获得Session对象
        // 通过Session获得servletcontext对象
        ServletContext servletContext = session.getServletContext();
        System.out.println("结束=============================");
        /**
         *  1.获取num值
         *  2.减1
         *  3.存入servletcontext
         */
        servletContext.setAttribute("num", --num);
    }
 
}

