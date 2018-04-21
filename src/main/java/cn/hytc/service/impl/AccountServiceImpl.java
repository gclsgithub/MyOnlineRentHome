package cn.hytc.service.impl;

import cn.hytc.dao.AccountDao;
import cn.hytc.model.Account;
import cn.hytc.model.User;
import cn.hytc.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountDao accountDao;

    @Transactional
    public boolean addUserAccountMoney(User user, Account account) {
        Map<String ,String> userAndAccountMap=new HashMap<String, String>();
        userAndAccountMap.put("userId",user.getUserId().toString());

        List<String> money=accountDao.searchUsrMoneyByUserId(user.getUserId());
        Double accountMoney=Double.valueOf(account.getAddMoney())+Double.valueOf(money.get(0));
        userAndAccountMap.put("accountMoney",accountMoney.toString());
        int result=accountDao.addMoneyToUserAccount(userAndAccountMap);
        if (result==2){
            return true;
        }
        return false;
    }
}
