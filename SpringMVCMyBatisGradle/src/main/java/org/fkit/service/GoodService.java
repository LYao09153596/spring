package org.fkit.service;

import org.fkit.mapper.*;
import org.fkit.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class GoodService {
    @Autowired//依赖注入
    private GoodMapper goodMapper;
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private GoodColorMapper goodColorMapper;
    @Autowired
    private UserGoodMapper userGoodMapper;
    @Autowired
    private GoodPictureMapper goodPictureMapper;
    @Autowired
    private CollectMapper collectMapper;
    @Autowired
    private OrderMapper orderMapper;
    
    public List<Good> getAllGood() {
        return goodMapper.selectAll();
    }

    public Good getGoodById(int id) {
        Good good = new Good();
        good.setId(id);
        return goodMapper.selectOne(good);
    }

    public void insertComment(Comment comment) {
        commentMapper.insert(comment);
    }

    public List<Comment> getComment(int goodId) {
        Comment comment = new Comment();
        comment.setGoodId(goodId);
        return commentMapper.select(comment);
    }
    
    
    public List<GoodColor> getColorByGoodId(int id) {
        GoodColor goodColor = new GoodColor();
        goodColor.setGoodId(id);
        return goodColorMapper.select(goodColor);
    }

    public void insertBuyCar(UserGood userGood){
        userGoodMapper.insert(userGood);
    }
    
    public void updateBuyCar(UserGood userGood){
    	userGoodMapper.updateByPrimaryKey(userGood);
    }
    
    public void deleteBuyCar(int id){
   		userGoodMapper.deleteByPrimaryKey(id);
   }
    public List<UserGood> getAllOrder(int userId){
        UserGood userGood = new UserGood();
        userGood.setUserId(userId);
        return userGoodMapper.select(userGood);
    }
    
//===========================================
    public Good getGood (Integer id, String goodName,Integer goodPrice,String goodProduct,String goodPicture,
    		String goodRating,String goodCount,String goodSaled) {
        Good good = new Good();
        good.setId(id);
        good.setGoodName(goodName);
        good.setGoodPrice(goodPrice);
        good.setGoodProduct(goodProduct);
        good.setGoodPicture(goodPicture);
        good.setGoodRating(goodRating);
        good.setGoodCount(goodCount);
        good.setGoodSaled(goodSaled);
        return goodMapper.selectOne(good);
    }

    public void addGood(Good good) {
        goodMapper.insert(good);
    }
    public void updateGood(Good good){
    	goodMapper.updateByPrimaryKey(good);
    }
    public void deleteGood(int id){
    	goodMapper.deleteByPrimaryKey(id);
    }
    public void deleteCollect(int id){
    	collectMapper.deleteByPrimaryKey(id);
    }
    public List<Good> getNextGood(String goodRelation){
    	Good good = new Good();
    	good.setGoodRelation(goodRelation);
    	return goodMapper.select(good);
    }
    
    public List<Good> getRootGood(String goodRelation){
    	Good good = new Good();
    	good.setGoodRelation(goodRelation);
    	List<Good> goodList = goodMapper.selectAll();
    	List<Good> goods=new ArrayList<Good>();
    	for(Good gd:goodList){
    		if(gd.getGoodRelation().contains(goodRelation)){
    			goods.add(gd);
    		}
    	}
    	return goods;
    }
    
    public List<GoodPicture> getGoodPicture(int id){
    	GoodPicture goodPicture = new GoodPicture();
    	goodPicture.setGoodId(id);
    	List<GoodPicture> lists = goodPictureMapper.select(goodPicture);
    	return lists;
    }
    
   public List<Collect> getAllGoodCollect(Collect collect){
	return collectMapper.select(collect);
   }
   
   public void insertGoodCollect(Collect collect){
	   collectMapper.insert(collect);
   }
   
   public Collect selectHavedCollect(Collect collect){
	   return collectMapper.selectOne(collect);
   }
   
   public UserGood selectHavedBuyCar(UserGood userGood){
	   return userGoodMapper.selectOne(userGood);
   }
   
   public void insertOrder(Order order){
	   orderMapper.insert(order);
   }
   
   public List<Order> getAllTbOrder(){
	   return orderMapper.selectAll();
   }
}

