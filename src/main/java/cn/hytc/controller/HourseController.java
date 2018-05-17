package cn.hytc.controller;

import cn.hytc.model.Hourse;
import cn.hytc.service.HourseService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@ResponseBody
@RequestMapping("hourse")
public class HourseController {

    @Autowired
    private HourseService hourseService;

    @RequestMapping("deletHourse")
    private ModelAndView deletHourse(String hourseId){

        Integer result=hourseService.deletHourseByHourseId(hourseId);

        ModelAndView mv=searchAllHourse(3,1);
        return mv;
    }


    @RequestMapping("createHourse")
    private ModelAndView createHourse(Hourse hourse,String city){
        hourseService.createHourse(hourse,city);
        ModelAndView mv=searchAllHourse(0,3);
        return mv;

    }

    @RequestMapping("searchAllHourse")
    private  ModelAndView searchAllHourse(Integer page,Integer offSet){
        ModelAndView mv=new ModelAndView();

        List<Integer> pageList=new ArrayList<Integer>();
        if (page==null){
            page=0;
        }
        pageList.add(page);
        pageList.add(offSet);
        List<Hourse> hourseList= hourseService.searchHourseNoCondition(page,offSet);
        Integer account=hourseService.searchAllHourse();
        Integer leave=0;
        leave=account%3;
        if(leave!=0){
            account=account/3+1;
        }else {
            account=account/3;
        }
        mv.setViewName("jsps/backStage/bHourse");
        mv.addObject("hourseList",hourseList);
        mv.addObject("account",account);
        return mv;
    }

    @RequestMapping("bsearchHourseByHourseName")
    private ModelAndView SearchHourseByHourseName(String hourseName){
        ModelAndView mv=new ModelAndView();
        List<Hourse> hourseList=hourseService.searchHourseByName(hourseName,3,0);
        mv.addObject(hourseList);
        mv.setViewName("jsps/backStage/bHourse");
        return mv;
    }

    @RequestMapping("seachHourseByName")
    private ModelAndView SearchHourseListByName(@RequestParam("searchName") String name, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String userName=(String) request.getSession().getAttribute("userName");
        if ("".equals(userName) || null ==userName) {
            mv.setViewName("jsps/Login");
            return  mv;
        }
        mv.setViewName("jsps/HourseList");
        List<Hourse> hourseList = hourseService.searchHourseByKeyWord(name);
        mv.addObject(hourseList);
        return mv;
    }

    @RequestMapping("housrsedetail")
    private ModelAndView SeachHourseDetialByHouresId(@RequestParam("hourseId") String hourseId,HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String userName=(String) request.getSession().getAttribute("userName");
        if ("".equals(userName) || null ==userName) {
            mv.setViewName("jsps/login");
            return  mv;
        }
        Hourse hourse = hourseService.searchHourseByHourseId(hourseId);
        mv.addObject(hourse);
        return mv;
    }
}
