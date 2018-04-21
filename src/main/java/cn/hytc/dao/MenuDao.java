package cn.hytc.dao;

import cn.hytc.model.Menu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuDao {

    /**
     * 根据用户Id去查询user
     * @param userType
     * @return
     */
    List<Menu> searchMenuByUserType(@Param("userType") String userType);
}
