package cn.hytc.controller;

import cn.hytc.model.Menu;
import cn.hytc.model.User;
import cn.hytc.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@ResponseBody
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("searchAllUserByUserName")
    private  ModelAndView searchAllUserByUserName(String search_text){
        ModelAndView mv=new ModelAndView();
        List<User> userList=userService.searchUserByUserName(search_text);
        Integer account=userService.searchUserAccountByUserName(search_text);
        mv.addObject("userList",userList);
        mv.addObject("account",account);
        mv.setViewName("jsps/backStage/bUser");
        return mv;
    }

    @RequestMapping("deletUser")
    public  ModelAndView deletUserUser(String userId){
       userService.deletUserUserByUserId(userId);
       ModelAndView mv=  searchAllUser(0,1);
       return mv;
    }

    @RequestMapping("update")
    public ModelAndView updateUser(User user){
        ModelAndView mv=  searchAllUser(0,1);
        userService.updateUser(user);
        return mv;
    }
    @RequestMapping(value = "searchAllUser")
    public ModelAndView searchAllUser(Integer page,Integer offSet){
        ModelAndView mv=new ModelAndView();
        List<Integer> pageList=new ArrayList<Integer>();
        if (page==null){
            page=0;
        }
       pageList.add(page);
       pageList.add(offSet);
       List<User> userList= userService.searchUserNoCondition(pageList);
       Integer account=userService.searchUserAccount();
       Integer leave=0;
       leave=account%3;
       if(leave!=0){
          account=account/3+1;
        }else {
           account=account/3;
       }
       mv.setViewName("jsps/backStage/bUser");
       mv.addObject("userList",userList);
       mv.addObject("account",account);
       return mv;
    }
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public ModelAndView doLogin(User user,HttpServletRequest request) {
        ModelAndView mv=new ModelAndView();
        List<String> status=userService.doLogin(user);
        if ("true".equals(status.get(0))){
            request.getSession().setAttribute("userName",user.getUserName());
            request.getSession().setAttribute("userId",status.get(2));
            if ("1".equals(status.get(1)) || "2".equals(status.get(1))){
                List<Menu> menulist= userService.searchMenuListByUser(user);
                mv.addObject("menulist",menulist);
                mv.setViewName("jsps/backStage/bIndex");
            }else{
                mv.setViewName("jsps/Index");
            }
        }
        if("false".equals(status.get(0))){
            mv.addObject("stageError","对不起，用户不存在");
            mv.setViewName("jsps/Login");
        }
        return mv;
    }

    @RequestMapping(value = "regex", method = RequestMethod.POST)
    public ModelAndView doRegex(User user) {
        ModelAndView mv=new ModelAndView();
        if (null != user && !"".equals(user)) {
            boolean flag = userService.insert(user);
            if (flag == true) {
                mv.setViewName("/jsps/Index");
                return mv;
            }
            mv.setViewName("/jsps/Regex");
            return mv;
        }
        mv.setViewName("/jsps/Regex");
        return mv;
    }
}
