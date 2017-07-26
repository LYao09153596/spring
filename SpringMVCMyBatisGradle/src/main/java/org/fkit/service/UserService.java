package org.fkit.service;

import org.fkit.mapper.ManageUserMapper;
import org.fkit.mapper.UserMapper;
import org.fkit.model.ManageUser;
import org.fkit.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private ManageUserMapper manageUserMapper;
    
    public User getUser(String username, String pass) {
        User user = new User();
        user.setName(username);
        user.setPass(pass);
        return userMapper.selectOne(user);
    }
    
    
    public void updateUser(User user){
    	userMapper.updateByPrimaryKey(user);
    }
    
    public ManageUser getManageUser(String name, String pass) {
        ManageUser manageUser = new ManageUser();
        manageUser.setName(name);
        manageUser.setPass(pass);
        return manageUserMapper.selectOne(manageUser);
    }

    public void addUser(User user) {
        userMapper.insert(user);
    }
    
    public void modifyUser(String pass,String email){
    	User user = new User();
    	user.setEmail(email);
    	User user2 = userMapper.selectOne(user);
    	user2.setPass(pass);
    	userMapper.updateByPrimaryKey(user2);
    }
    
    public User getUserById(int id){
    	User user = new User();
    	user.setId(id);
    	return userMapper.selectByPrimaryKey(user);
    }
}
