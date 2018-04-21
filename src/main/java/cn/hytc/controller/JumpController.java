package cn.hytc.controller;

import cn.hytc.model.*;
import cn.hytc.service.HourseRentContactService;
import cn.hytc.service.HourseService;
import cn.hytc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("jump")
@Controller
public class JumpController {
    @Autowired
    private UserService userService;

    @Autowired
    private HourseService hourseService;

    @Autowired
    private HourseRentContactService hourseRentContactService;


    @RequestMapping("createHourse")
    private ModelAndView JumpToCreateHourse(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("jsps/createHourse");
        return mv;
    }

    @RequestMapping("login")
    public ModelAndView JumtoLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("jsps/Regex");
        return mv;
    }

    @RequestMapping("regex")
    public ModelAndView JumtoRegex() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("jsps/Login");
        return mv;
    }
    @RequestMapping("index")
    public ModelAndView JumtoIndex() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("jsps/Index");
        return mv;
    }
    @RequestMapping("addAccount")
    public ModelAndView JumtoAddAccount(String hourseId,HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String userId= (String) request.getSession().getAttribute("userId");
        List<Account> accountList=userService.searchUserAccountByUserId(userId);
        mv.addObject("accountList",accountList);
        mv.addObject("hourseId",hourseId);
        mv.setViewName("jsps/addAccount");
        return mv;
    }
    @RequestMapping("JumpToModifyUser")
    public ModelAndView JumpToModifyUser(String userId){
        ModelAndView mv=new ModelAndView();
        User user=userService.searchUserByUserId(userId);
        user.setUserId(Integer.valueOf(userId));
        mv.setViewName("jsps/backStage/bModifyUser");
        mv.addObject("user",user);
        return mv;
    }

    @RequestMapping("entire")
    private  ModelAndView  jumptoEntireDetial(String hourseId){
        ModelAndView mv=new ModelAndView();
        Address address= hourseService.searchHourseAddressByHourseId(hourseId);

        Hourse hourse=hourseService.searchHourseByHourseId(hourseId);

        String masterId= hourse.getMasterId();

        User user=userService.searchUserByUserId(masterId);

        Integer room=hourse.getRoom();
        Integer leaveRoom=hourse.getLeaveRoom();
        if (leaveRoom<=0) {
            List<User> rentUserList=new ArrayList<User>();
            List<HourseContract> hourseContractList= hourseRentContactService.searchHourseContractByHourseId(hourseId);
            for (HourseContract hourseContract:hourseContractList) {
                User rentUser=userService.searchUserByUserId(hourseContract.getCreateUser());
                rentUserList.add(rentUser);

            }
            mv.addObject("rentMSG","以下是合租者信息");
            mv.addObject("rentUserList",rentUserList);
            mv.addObject("MSG","对不起，该房型已经售完，无法出租。");
            mv.addObject("flag","0");
            mv.addObject("rentType","noHourse");
        }
        if (room!=leaveRoom){
            List<User> rentUserList=new ArrayList<User>();
            List<HourseContract> hourseContractList= hourseRentContactService.searchHourseContractByHourseId(hourseId);
            for (HourseContract hourseContract:hourseContractList) {
                User rentUser=userService.searchUserByUserId(""+hourseContract.getUserId());
                rentUserList.add(rentUser);
                mv.addObject("rentType","monthly");

            }
            mv.addObject("rentMSG","合租者信息");
            mv.addObject("rentUserList",rentUserList);
            mv.addObject("MSG","注意：该房型已经合租无法整租");
            mv.addObject("flag","1");
        }
        if(room==leaveRoom){
            mv.addObject("MSG","该房型可以整组或者合租");
            mv.addObject("flag","2");
            mv.addObject("rentType","entire");

        }
        mv.addObject("hourse",hourse);
        mv.addObject("hourseId",hourseId);
        mv.addObject("address",address);
        mv.addObject("user",user);
        mv.setViewName("jsps/hourseDetial");
        return mv;
    }


    @RequestMapping("monthly")
    private  ModelAndView  jumptoEntireDetialMonthdat(String hourseId){
        ModelAndView mv=new ModelAndView();
        Address address= hourseService.searchHourseAddressByHourseId(hourseId);

        Hourse hourse=hourseService.searchHourseByHourseId(hourseId);
        String masterId= hourse.getMasterId();
        User user=userService.searchUserByUserId(masterId);

        Integer room=hourse.getRoom();
        Integer leaveRoom=hourse.getLeaveRoom();
        if (leaveRoom<=0) {
            List<User> rentUserList=new ArrayList<User>();
            List<HourseContract> hourseContractList= hourseRentContactService.searchHourseContractByHourseId(hourseId);
            for (HourseContract hourseContract:hourseContractList) {
                User rentUser=userService.searchUserByUserId(hourseContract.getCreateUser());
                rentUserList.add(rentUser);

            }
            mv.addObject("rentMSG","以下是合租者信息");
            mv.addObject("rentUserList",rentUserList);
            mv.addObject("MSG","对不起，该房型已经售完，无法出租。");
            mv.addObject("flag","0");
            mv.addObject("rentType","noHourse");
        }
        if (room!=leaveRoom){
            List<User> rentUserList=new ArrayList<User>();
            List<HourseContract> hourseContractList= hourseRentContactService.searchHourseContractByHourseId(hourseId);
            for (HourseContract hourseContract:hourseContractList) {
                User rentUser=userService.searchUserByUserId(""+hourseContract.getUserId());
                rentUserList.add(rentUser);
                mv.addObject("rentType","monthly");

            }
            mv.addObject("rentMSG","合租者信息");
            mv.addObject("rentUserList",rentUserList);
            mv.addObject("MSG","注意：该房型已经合租无法整租");
            mv.addObject("flag","1");
        }
        if(room==leaveRoom){
            mv.addObject("MSG","该房型可以整组或者合租");
            mv.addObject("flag","2");
            mv.addObject("rentType","entire");

        }
        mv.addObject("hourseId",hourseId);
        mv.addObject("address",address);
        mv.addObject("user",user);
        mv.addObject("hourse",hourse);
        mv.setViewName("jsps/hourseDetial");
        return mv;
    }
}
