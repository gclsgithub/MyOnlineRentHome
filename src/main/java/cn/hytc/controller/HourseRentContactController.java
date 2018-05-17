package cn.hytc.controller;

import cn.hytc.model.Hourse;
import cn.hytc.model.HourseContract;
import cn.hytc.model.User;
import cn.hytc.service.HourseRentContactService;
import cn.hytc.service.HourseService;
import cn.hytc.service.UserService;
import cn.hytc.utils.Resume_Word;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("generateHourseRentContact")
public class HourseRentContactController {
    @Autowired
    private HourseRentContactService hourseRentContactService;
    @Autowired
    private UserService userService;
    @Autowired
    private HourseService hourseService;

    @RequestMapping("downloadConteact")
    private String downloadContract(@Param("contractId") String contractId, HttpServletResponse response){
        List<HourseContract> hourseContractList=hourseRentContactService.searchHourseContractByContractId(contractId);
        String rentUserId=hourseContractList.get(0).getRentUserId()+"";
        String masterId=hourseContractList.get(0).getMasterId();
        User user1=userService.searchUserByUserId(rentUserId);
        User user2=userService.searchUserByUserId(masterId);
        String rentMoney=hourseContractList.get(0).getSingleMoney()*hourseContractList.get(0).getRentDay()+"";
        String rentDay=hourseContractList.get(0).getRentDay()+"";
        String contractContent=hourseContractList.get(0).getContractContent();
        String createTime=hourseContractList.get(0).getCreateTime();
        Map<String,Object> myMap=new HashMap<String, Object>();
        myMap.put("userName",user1.getUserName());
        myMap.put("masterName",user2.getUserName());
        myMap.put("rentMoney",rentMoney);
        myMap.put("rentDay",rentDay);
        myMap.put("contract",contractContent);
        myMap.put("createUser",createTime);
        File file=null;
        InputStream fin=null;
        ServletOutputStream out=null;
        file=Resume_Word.createDoc(myMap,"resume");
        try {
            fin=new FileInputStream(file);
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/msword");
            response.addHeader("Content-Disposition","attachment;filename=resume.doc");
            out=response.getOutputStream();
            byte[] buffer=new byte[1024];
            int bytesToRead=-1;
            while ((bytesToRead=fin.read(buffer))!=-1){
                out.write(buffer,0,bytesToRead);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (fin!=null){
                try {
                    fin.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (out!=null){
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (file !=null){
                file.delete();
            }
        }
        return null;
    }


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
