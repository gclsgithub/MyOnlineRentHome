package cn.hytc.dao;

import cn.hytc.model.Account;
import cn.hytc.model.HourseContract;
import cn.hytc.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface HourseRentContactDao {

    /**
     * Search user and his account by user's name
     * @param user
     * @return User and Account
     */
    List<Account> SeachUserAndAccountByUserName(User user);

    /**
     * reduce account
     * @param account
     * @return
     */
    int reduceAccount(Account account);

    /**
     * create HourseContract
     * @param hourseContract
     */
    void createHourseContract(HourseContract hourseContract);

    Integer searchAllHourseContractCount();

    List<HourseContract> searchHourseNoCondition(Map<String,Integer> myMap);

    List<HourseContract> searchHourseContractByHourseId(String hourseId);
}
