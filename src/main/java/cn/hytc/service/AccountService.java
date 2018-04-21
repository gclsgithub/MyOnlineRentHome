package cn.hytc.service;

import cn.hytc.model.Account;
import cn.hytc.model.User;

public interface AccountService {
    /**
     *  add Money to someone's account
     * @param user
     * @param account
     * @return
     */
    boolean addUserAccountMoney(User user, Account account);
}
