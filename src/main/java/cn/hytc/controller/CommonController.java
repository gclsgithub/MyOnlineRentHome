package cn.hytc.controller;

import cn.hytc.service.HourseRentContactService;
import cn.hytc.service.HourseService;
import cn.hytc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("common")
public class CommonController {

    @Autowired
    private HourseService hourseService;

    @Autowired
    private HourseRentContactService hourseRentContactService;

    @Autowired
    private UserService userService;

    @RequestMapping("getCommonMessage")
    private ModelAndView SearchCommonMessage(HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        Integer hourseCount=hourseService.searchAllHourse();
        Integer hourseContractCount=hourseRentContactService.searchAllHourseContract();
        Integer userCount=userService.searchUserAccount();
        mv.addObject("hourseCount",hourseCount);
        mv.addObject("hourseContractCount",hourseContractCount);
        mv.addObject("userCount",userCount);
        mv.setViewName("jsps/backStage/bDataAnalyse");
        return mv;
    }
}
