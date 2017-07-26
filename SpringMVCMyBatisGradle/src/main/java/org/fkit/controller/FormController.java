package org.fkit.controller;

import org.fkit.model.ManageUser;
import org.fkit.model.Order;
import org.fkit.model.User;
import org.fkit.model.UserGood;
import org.fkit.service.GoodService;
import org.fkit.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
//import sun.misc.FormattedFloatingDecimal;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

/**
 * Created by dell on 2017/6/16.
 */
@Controller
public class FormController {
    @Autowired
    private UserService userService;
    @Autowired
    private GoodService goodService;

    @RequestMapping(value = "/{formName}")
    public String login(@PathVariable("formName") String formName,Model model,HttpServletRequest request) {
    	Cookie[] cookies = request.getCookies();
    	if(cookies!=null){
    		for(Cookie c:cookies){
        		if(c.getName().equals("cUser")){
        			String[] s=c.getValue().split(" ");
        			model.addAttribute("username",s[0]);
        			model.addAttribute("pass",s[1]);
        		}
        	}
    	}
        return formName;
    }


    @RequestMapping(value = "/goMain", method = RequestMethod.POST)
    public String loginForm(@RequestParam("username") String username, @RequestParam("pass") String pass, Model model,
                            HttpSession httpSession, HttpServletResponse response,@RequestParam("buttonUser") String buttonUser) {
        User user = new User();
    	if(buttonUser.equals("user1")){
        	user = userService.getUser(username, pass);
        }else{
        	ManageUser manageUser  = new ManageUser();
        	manageUser = userService.getManageUser(username, pass);
        	user.setId(manageUser.getId());
        	user.setName(manageUser.getName());
        	user.setPass(manageUser.getPass());
        }
        httpSession.setAttribute("user", user);
        if (user != null) {
        	Cookie cUser = new Cookie("cUser",user.getName()+" "+user.getPass());
//        	Cookie cPass = new Cookie("pass",user.getPass());
        	cUser.setMaxAge(24*6000);
//        	cPass.setMaxAge(24*6000);
        	response.addCookie(cUser);
//        	response.addCookie(cPass);
        	if(buttonUser.equals("user1")){	
        		return "redirect:/main";
        	}else{
        		return "redirect:/goodManage";
        	}
            
        } else {
            model.addAttribute("message", "用户名或者密码错误，请确认！");
            return "login";
        }
    }
    
    @RequestMapping(value = "/goRegister", method = RequestMethod.POST)
    public String register(User user, Model model) {
        userService.addUser(user);
        model.addAttribute("success", "恭喜您注册成功，请登录!");
        return "login";
    }
//    显示用户信息
    @RequestMapping(value = "/showMessage")
    public String showUser(HttpSession session,Model model) {
    	User user= (User) session.getAttribute("user");
    	model.addAttribute("user",user);
        return "showMessage";
    }
    
//    更改密码
    @RequestMapping(value = "/updateUser")
    public String updateUser(@RequestParam("Password") String pass ,Model model,HttpSession session) {
    	User user= (User) session.getAttribute("user");
    	user.setPass(pass);
    	userService.updateUser(user);
        return "login";
    }
//    忘记密码，邮箱找回
    @RequestMapping (value="/forget")
    public String forget (@RequestParam("email") String email,@RequestParam("userName")String userName, HttpServletRequest request){ 
    	try {
    	Properties props = new Properties();
    	props.put ("username1","jn_liyao@163.com"); 
    	props.put ("password1","liyao123"); 
    	props.put ("mail.transport.protocol","smtp"); 
    	props.put ("mail.smtp.host","smtp.163.com"); 
    	props.put ("mail.smtp.port","25");
    	Session mailSession = Session.getDefaultInstance(props);
    	Message msg = new MimeMessage(mailSession);
    	msg.setFrom(new InternetAddress("jn_liyao@163.com"));
    	msg.addRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
    	msg.setSubject("找回密码");
    	msg.setContent("<h1>此邮件为官方邮件！请点击下面链接完成找回密码操作！</h1><h3><a href='http://localhost:8090/getPassword?email="+email+"'>http://localhost:8090/SendMail/servlet/GetPasswordServlet</a></h3>","text/html;charset=UTF-8");
    	msg.saveChanges();
    	
    	
    	Transport transport = mailSession.getTransport("smtp"); 
    	transport.connect(props.getProperty("mail.smtp.host"),props.getProperty("username1"),props.getProperty("password1"));
    	transport.sendMessage(msg, msg.getAllRecipients()); 
    	transport.close();
    	request.setAttribute("information","找回密码成功，请登录");
    	
    } catch (Exception e) {
    	
    	
    }
    return "redirect:/login";
    }
    
    @RequestMapping(value="/getPassword")
    public ModelAndView getPassword (String email, HttpServletRequest request, HttpSession session,ModelAndView mv){ 
    	Random random=new Random();
    	String randomPassword=random.nextInt(9000)+1000+""; 
    	session.setAttribute ("randomPassword", randomPassword); 
    	userService.modifyUser(randomPassword, email); 
    	mv.setViewName("getPassword"); 
    	return mv;
    }
    
    @RequestMapping(value="/goForget")
    public String goForget (){ 
    	return "forget";
    }
    
    
    @RequestMapping (value="/already")
    public String already (@RequestParam("userId") int userId, HttpServletRequest request){ 
    	try {
    	Properties props = new Properties();
    	props.put ("username2","jn_liyao@163.com"); 
    	props.put ("password2","liyao123"); 
    	props.put ("mail.transport.protocol","smtp"); 
    	props.put ("mail.smtp.host","smtp.163.com"); 
    	props.put ("mail.smtp.port","25");
    	Session mailSession = Session.getDefaultInstance(props);
    	Message msg = new MimeMessage(mailSession);
    	msg.setFrom(new InternetAddress("jn_liyao@163.com"));
    	User user = userService.getUserById(userId);
    	String email = user.getEmail();
    	msg.addRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
    	msg.setSubject("PureEyes");
    	msg.setContent("<h1>您的订单已经形成，我们会尽快发货！</h1>","text/html;charset=UTF-8");
    	msg.saveChanges();
    	Transport transport = mailSession.getTransport("smtp"); 
    	transport.connect(props.getProperty("mail.smtp.host"),props.getProperty("username2"),props.getProperty("password2"));
    	transport.sendMessage(msg, msg.getAllRecipients()); 
    	transport.close();
    	
    }
    	catch (Exception e) {	
    }
    	List<UserGood> userGoodList = goodService.getAllOrder(userId);
    	Date date = new Date();
    	date.getTime();
    	for(UserGood UG:userGoodList){
    		Order order = new Order();
    		order.setUserId(userId);
    		order.setUserName(UG.getUserName());
    		order.setGoodId(UG.getGoodId());
    		order.setGoodName(UG.getGoodName());
    		order.setTraffic(UG.getTraffic());
    		order.setBuyCount(UG.getBuyCount());
    		order.setPrice(UG.getPrice());
    		order.setTime(new Date());
    		order.setOrderId((int) date.getTime());
    		System.out.println(order);
    		goodService.insertOrder(order);
    		List<Order> orderList = goodService.getAllTbOrder();
//    		model
    		goodService.deleteBuyCar(UG.getId());
    	}
    	return "order";
    }
}
