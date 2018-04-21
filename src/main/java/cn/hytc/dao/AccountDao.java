package cn.hytc.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AccountDao {
    int addMoneyToUserAccount(Map<String, String> userAndAccountMap);

    List<String> searchUsrMoneyByUserId(@Param("userId") Integer userId);
}
