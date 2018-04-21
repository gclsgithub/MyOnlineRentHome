package cn.hytc.controller;

import cn.hytc.model.Account;
import cn.hytc.model.User;
import cn.hytc.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("account")
@Controller
public class AccountController {

    @Autowired
    private AccountService accountService;


    @RequestMapping("addAccount")
    public String addAccount( Account account, HttpServletRequest request,RedirectAttributes attributes) {
        String userId= (String) request.getSession().getAttribute("userId");
        User user=new User();
        user.setUserId(Integer.valueOf(userId));
        boolean flag=accountService.addUserAccountMoney(user,account);
        if (flag==true){
            attributes.addAttribute("hourseId",account.getHourseId());
            if("on".equals(account.getRentType())){
                return "redirect:/generateHourseRentContact/entire.do";
            }
            return "redirect:/generateHourseRentContact/monthly.do";
        }
        return "redirect:/account/addAccount";
    }

}