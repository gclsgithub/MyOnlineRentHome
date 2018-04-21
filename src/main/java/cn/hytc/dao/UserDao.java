package cn.hytc.dao;

import cn.hytc.model.Account;
import cn.hytc.model.User;
import cn.hytc.service.impl.UserDto;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserDao {
  /**
   *
   * @param user
   */
  void insertUser(User user);

  /**
   *
   * @param userName
   * @return
   */
  Integer searchUserName(@Param("userName") String userName);

  /**
   *  get userdetial by userName
   * @param usr
   * @return
   */
  User SearchUserByUserName(User usr);

  /**
   *
   */
  User searchUserByUserId(@Param("userId") String userId);

  /**
   * search for user and acooutn  relatived message
   * @param user
   */
  UserDto SeachUserAndAccountByUserName(User user);

  List<User> searchUserNoCondition(Map<String,Integer> pageList);

  Integer searchUserAccount();

  Integer updateUser(User user);

  Integer deletUserByUserId(@Param("userId") String userId);

  List<User> searchUserByUserName(String userName);

  Integer searchUserAccountByUserName(String userName);

    List<Account> searchUserAccountByUserId(@Param("userId") String userId);
}
