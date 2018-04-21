package cn.hytc.service.impl;

import cn.hytc.dao.MenuDao;
import cn.hytc.dao.UserDao;
import cn.hytc.model.Account;
import cn.hytc.model.Menu;
import cn.hytc.model.User;
import cn.hytc.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private MenuDao menuDao;

    /**
     *
     * @param user
     * @return
     */
    public List<Menu> searchMenuListByUser(User user) {
       User myuser= userDao.SearchUserByUserName(user);
        List<Menu> menuList=menuDao.searchMenuByUserType(myuser.getUserType());
        return menuList;
    }

    public List<User> searchUserNoCondition(List<Integer> pageList) {
        Map<String,Integer> pageMap=new HashMap<String, Integer>();
        pageMap.put("start",pageList.get(0));
        pageMap.put("offSet",pageList.get(1));
        List<User> userList=  userDao.searchUserNoCondition(pageMap);
        return userList;
    }

    public Integer searchUserAccount() {
        Integer account=userDao.searchUserAccount();
        return account;
    }

    @Transactional
    public Integer updateUser(User user) {
        String passWord=user.getPassWord();
        String md5PassWord = DigestUtils.md5Hex(passWord);
        user.setPassWord(md5PassWord);
        Integer result=userDao.updateUser(user);
        return result;
    }


    @Transactional
    public Integer deletUserUserByUserId(String userId) {
       Integer result= userDao.deletUserByUserId(userId);
        return result;
    }

    public List<User> searchUserByUserName(String search_text) {
        String userName="%"+search_text+"%";
        List<User> userList=userDao.searchUserByUserName(userName);
        return userList;
    }

    public Integer searchUserAccountByUserName(String search_text) {
        String userName="%"+search_text+"%";
        Integer count=userDao.searchUserAccountByUserName(userName);
        return count;
    }

    public List<Account> searchUserAccountByUserId(String userId) {
        List<Account>accountList=userDao.searchUserAccountByUserId(userId);
        return  accountList;
    }

    public User searchUserByUserId(String userId){
        User user =userDao.searchUserByUserId(userId);
        return user;
    }



    /**
     * logins
     *
     * @param user
     * @return
     */
    public List<String> doLogin(User user) {
        int count = userDao.searchUserName(user.getUserName());
        List<String> status = new ArrayList<String>();
        if (count == 1) {
            User dbuser = userDao.SearchUserByUserName(user);
            String passWord = user.getPassWord();
            String md5PassWord = DigestUtils.md5Hex(passWord);
            if (dbuser != null) {
                if (md5PassWord.equals(dbuser.getPassWord())) {
                    status.add("true");
                    status.add(dbuser.getUserType());
                    status.add(dbuser.getUserId().toString());
                    return status;
                }
            }
        }
        status.add("false");
        return status;
    }

    /**
     * insert user
     *
     * @param user
     */
    @Transactional
    public boolean insert(User user) {
        int count = userDao.searchUserName(user.getUserName());
        if (count == 0) {
            String passWord = user.getPassWord();
            String md5PassWord = DigestUtils.md5Hex(passWord);
            user.setPassWord(md5PassWord);
            userDao.insertUser(user);
            return true;
        }
        return false;
    }
}
