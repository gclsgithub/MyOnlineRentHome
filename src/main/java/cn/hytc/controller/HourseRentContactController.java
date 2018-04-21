package cn.hytc.controller;

import cn.hytc.model.Hourse;
import cn.hytc.model.HourseContract;
import cn.hytc.model.User;
import cn.hytc.service.HourseRentContactService;
import cn.hytc.service.HourseService;
import cn.hytc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("generateHourseRentContact")
public class HourseRentContactController {
    @Autowired
    private HourseRentContactService hourseRentContactService;
    @Autowired
    private UserService userService;
    @Autowired
    private HourseService hourseService;

    @RequestMapping("searchAllHourseContract")
    private ModelAndView searchAllHourseContract(Integer page,Integer offSet){
        ModelAndView mv=new ModelAndView();
        List<Integer> pageList=new ArrayList<Integer>();
        if (page==null){
            page=0;
        }
        pageList.add(page);
        pageList.add(offSet);
        List<HourseContract> hourseContractList= hourseRentContactService.searchHourseNoCondition(page,offSet);
        Integer account=hourseRentContactService.searchAllHourseContract();
        Integer leave=0;
        leave=account%3;
        if(leave!=0){
            account=account/3+1;
        }else {
            account=account/3;
        }
        mv.setViewName("jsps/backStage/bHourseContract");
        mv.addObject("hourseContractList",hourseContractList);
        mv.addObject("account",account);
        return mv;
    }

    /**
     * 整组
     * @param hourseId
     * @return
     */
    @RequestMapping("entire")
    private ModelAndView JumpToEntriy(String hourseId) {
        ModelAndView mv = new ModelAndView();
        //根据传入的hourseId查询出它的userId作为masterId
        Hourse hourse = hourseService.searchHourseByHourseId(hourseId);
        User user = userService.searchUserByUserId(hourse.getUserId());
        HourseContract hc = new HourseContract();
        hc.setRentType("entire");
        hc.setHourseId(Integer.parseInt(hourseId));
        hc.setMasterId(hourse.getUserId());
        hc.setSingleMoney(hourse.getSingleMoney());
        hc.setMasterName(user.getUserName());
        mv.setViewName("jsps/Contract");
        mv.addObject("hc", hc);
        return mv;
    }

    /**
     * 合租
     * @param hourseId
     * @return
     */
    @RequestMapping("monthly")
    public ModelAndView JumpToMonthly(String hourseId) {
        ModelAndView mv = new ModelAndView();
        //根据传入的hourseId查询出它的userId作为masterId
        Hourse hourse = hourseService.searchHourseByHourseId(hourseId);
        User user = userService.searchUserByUserId(hourse.getUserId());
        HourseContract hc = new HourseContract();
        hc.setRentType("monthly");
        hc.setHourseId(Integer.parseInt(hourseId));
        hc.setMasterId(hourse.getUserId());
        hc.setMasterName(user.getUserName());
        hc.setRentType("monthly");
        hc.setSingleMoney(hourse.getSingleMoney());
        mv.setViewName("jsps/Contract");
        mv.addObject("hc", hc);
        return mv;
    }

    @RequestMapping("createContract")
    public ModelAndView CreateContract(HourseContract hourseContract, HttpServletRequest request,String flag) {
        ModelAndView mv = new ModelAndView();
        Integer userId=Integer.valueOf(request.getSession().getAttribute("userId")+"");
        hourseContract.setUserId(userId);
        hourseContract.setRentUserId(userId);
       boolean flag1= hourseRentContactService.creatContract(hourseContract);
       if (flag1==false){
           mv.setViewName("jsps/Contract");
           /*
           mv.addObject("hourseId",hourseContract.getHourseId());
           mv.addObject("masterId",hourseContract.getMasterId());
           mv.addObject("masterName",hourseContract.getMasterName());
           mv.addObject("rentType",hourseContract.getRentType());
           mv.addObject("singleMoney",hourseContract.getSingleMoney());
           */
           mv.addObject("hc",hourseContract);
           mv.addObject("AccountMessage","余额不足，请<a href='http://localhost:8089/jump/addAccount.do?hourseId="+hourseContract.getHourseId()+"&rentType="+hourseContract.getRentType()+"'>充值</a>");
           return mv;
       }
       mv.setViewName("jsps/BuySuccess");
       mv.addObject("BuySuccessMessage","购买成功，等候商家与您确认");
       return mv;
    }

    @RequestMapping("noHourse")
    private ModelAndView NoHourseCanRentAndJump(String keyWord){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("jsps/Index");
        return mv;
    }

}
