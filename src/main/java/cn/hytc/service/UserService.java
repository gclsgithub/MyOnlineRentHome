package cn.hytc.service;

import cn.hytc.model.Account;
import cn.hytc.model.Menu;
import cn.hytc.model.User;

import java.util.List;

public interface  UserService {
    /**
     * @See inset into User
     * @param user
     */
    boolean insert(User user);

    /**
     * login
     * @param user
     * @return status
     */
    List<String> doLogin(User user);

    /**
     *search User by User Id
     */
    User searchUserByUserId(String userId);

    /**
     * search MenuList By user
     * @param user
     * @return
     */
    List<Menu> searchMenuListByUser(User user);

    /**
     * search User No Condition and do page
     * @return
     */
    List<User> searchUserNoCondition(List<Integer> getPage);

    /**
     * 查询所有的用户总数
     * @return
     */
    Integer searchUserAccount();

    /**
     * updata user
     * @param user
     * @return
     */
    Integer updateUser(User user);

    /**
     * 根据UserId 删除用户数据（逻辑删除）
     * @param userId
     * @return
     */
    Integer deletUserUserByUserId(String userId);

    List<User> searchUserByUserName(String search_text);

    Integer searchUserAccountByUserName(String search_text);

    List<Account> searchUserAccountByUserId(String hourseId);
}
