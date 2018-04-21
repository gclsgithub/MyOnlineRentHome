package cn.hytc.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AreaDao {

    Integer searchAreaIcByCityName(String city);
}
