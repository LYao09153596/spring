package org.fkit.controller;

import org.fkit.model.*;
import org.fkit.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.soap.Detail;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

@Controller
public class GoodController {
    @Autowired
    private GoodService goodService;

    @RequestMapping(value = "/main")
    public String main(Model model,HttpSession httpSession) {
    	int count = 0;
        if(httpSession.getServletContext().getAttribute("num")!=null){
        	count = (int) httpSession.getServletContext().getAttribute("num");
        }
        model.addAttribute("count",count);
        List<Good> goodList = goodService.getAllGood();
        model.addAttribute("goodList", goodList);
        return "main";
    }

    @RequestMapping(value = "/detatil/{id}")
    public String detatil(@PathVariable("id") int id, Model model,Comment comment, 
                          HttpSession httpSession) {
        Good good = goodService.getGoodById(id);
        List<GoodColor> goodColorList = goodService.getColorByGoodId(id);
        if (comment.getComment() != null) {
            User user = (User) httpSession.getAttribute("user");
            comment.setId(null);
            comment.setUserId(user.getId());
            comment.setUserName(user.getName());
            goodService.insertComment(comment);
        }
        List<Comment> commentList = goodService.getComment(id);
        List<GoodPicture> goodPictureList = goodService.getGoodPicture(id);
        List<GoodPicture> goodPictureList1 = new ArrayList<GoodPicture>();
        for(int i=1;i<goodPictureList.size();i++){
        	goodPictureList1.add(goodPictureList.get(i));
        }
        model.addAttribute("goodPicture1",goodPictureList.get(0));
        model.addAttribute("goodPictureList1",goodPictureList1);
        model.addAttribute("good", good);
        model.addAttribute("commentList", commentList);
        model.addAttribute("goodColorList", goodColorList);
        return "detatil";
    }

    @RequestMapping(value = "/buyCar")
    public String buyCar(UserGood userGood,Collect collect,Model model, HttpSession httpSession,@RequestParam("buttonCar") String buttonCar) {
    	User user = (User) httpSession.getAttribute("user");
    	if(buttonCar.equals("add1")){
    		int i = userGood.getBuyCount();
    		userGood.setBuyCount(null);
    		if(goodService.selectHavedBuyCar(userGood)==null){
	    		userGood.setUserId(user.getId());
	            userGood.setUserName(user.getName());
	            userGood.setBuyCount(i);
	            goodService.insertBuyCar(userGood);
    		}else{
    			UserGood userGood1 = goodService.selectHavedBuyCar(userGood);
    			userGood1.setBuyCount(userGood1.getBuyCount()+i);
    			goodService.updateBuyCar(userGood1);
    		}
            List<UserGood> userGoodList = goodService.getAllOrder(user.getId());
            model.addAttribute("userGoodList", userGoodList);
            model.addAttribute("userId",user.getId());
            return "buycar2";
        }else if(buttonCar.equals("0")){
        	List<UserGood> userGoodList = goodService.getAllOrder(user.getId());
            model.addAttribute("userGoodList", userGoodList);
            model.addAttribute("userId",user.getId());
			return "buycar2";
		}else{
        	collect.setUserId(user.getId());
        	if(goodService.selectHavedCollect(collect)==null){
        		goodService.insertGoodCollect(collect);
        	}
        	Collect collect1 = new Collect();
        	collect1.setUserId(user.getId());
        	List<Collect> collectList = goodService.getAllGoodCollect(collect1);
        	model.addAttribute("collectList",collectList);
        	return "collect";
        }
    }
    
    @RequestMapping(value = "/goodManage")
    public String goodManage(Model model) {
        List<Good> goodList = goodService.getAllGood();
        model.addAttribute("goodList", goodList);
        return "goodManage";
    }
    
    @RequestMapping(value = "/goodUpdate")
    public String updateGood(Model model,Good good) {
    	goodService.updateGood(good);
    	List<Good> goodList = goodService.getAllGood();
        model.addAttribute("goodList", goodList);
        return "goodManage";
    }
    
    @RequestMapping(value = "/goodAdd")
    public String addGood(Model model,Good good) {
    	goodService.addGood(good);
    	List<Good> goodList = goodService.getAllGood();
        model.addAttribute("goodList", goodList);
        return "goodManage";
    }
    
    @RequestMapping(value = "/goodDelete")
    public String deleteGood(Model model,@RequestParam("id") int id ) {
    	goodService.deleteGood(id);
    	List<Good> goodList = goodService.getAllGood();
        model.addAttribute("goodList", goodList);
        return "goodManage";
    }
    
    @RequestMapping(value = "/collectDelete")
    public String collectDelete(Model model,@RequestParam("id") int id,HttpSession session) {
    	User user = (User) session.getAttribute("user");
    	System.out.println(id);
    	goodService.deleteCollect(id);
    	Collect collect = new Collect();
    	collect.setUserId(user.getId());
    	List<Collect> collectList = goodService.getAllGoodCollect(collect);
        model.addAttribute("collectList", collectList);
        return "collect";
    }
    @RequestMapping(value="/select/{i}")
    public String findGood(@PathVariable("i") String i,Model model){
		List<Good> goodList = new ArrayList<Good>();
		System.out.println(i);
    	if(i.equals("A1")){
    		goodList = goodService.getRootGood(i);
    	}else if(i.equals("B2")){
    		goodList = goodService.getRootGood(i);
    	}else if(i.equals("C3")){
    		System.out.println("我还不存在");
    	}else{
    	 goodList = goodService.getNextGood(i);
    	}
    	model.addAttribute("goodList",goodList);
    	return "goodManage";
    }
    
	@RequestMapping(value="/add")
	public String add(Model model,@RequestParam("id") int id,HttpSession httpSession){
		UserGood userGood1 = new UserGood();
		userGood1.setId(id);
		UserGood userGood  = goodService.selectHavedBuyCar(userGood1);
		User user = (User) httpSession.getAttribute("user");
		userGood.setBuyCount(userGood.getBuyCount()+1);
		goodService.updateBuyCar(userGood);
		List<UserGood> userGoodList = goodService.getAllOrder(user.getId());
        model.addAttribute("userGoodList", userGoodList);
		return "buycar2";
	}
    

    
    @RequestMapping(value="/reduce")
    public String reduce(Model model,@RequestParam("id") int id,HttpSession httpSession){
		UserGood userGood1 = new UserGood();
		userGood1.setId(id);
		UserGood userGood  = goodService.selectHavedBuyCar(userGood1);
		User user = (User) httpSession.getAttribute("user");
		if(userGood.getBuyCount()>1){
			userGood.setBuyCount(userGood.getBuyCount()-1);
		}
		goodService.updateBuyCar(userGood);
		List<UserGood> userGoodList = goodService.getAllOrder(user.getId());
        model.addAttribute("userGoodList", userGoodList);
		return "buycar2";
	}
    
    @RequestMapping(value = "/remove")
    public String remove(Model model, @RequestParam("id") int id,HttpSession httpSession) {
    	UserGood userGood1 = new UserGood();
		userGood1.setId(id);
		UserGood userGood  = goodService.selectHavedBuyCar(userGood1);
		User user = (User) httpSession.getAttribute("user");
    	goodService.deleteBuyCar(id);
    	List<UserGood> userGoodList = goodService.getAllOrder(user.getId());
        model.addAttribute("userGoodList", userGoodList);
        return "buycar2";
    }
    
    
//    @RequestMapping(value="/goOrder")
//    public String goOrder(Model model, ){
//    	
//    	
//    }
}
