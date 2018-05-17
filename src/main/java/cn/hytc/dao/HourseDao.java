package cn.hytc.dao;

import cn.hytc.model.Address;
import cn.hytc.model.Hourse;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public interface HourseDao {
    List<Hourse> searchHourseByKeyWord(@Param("name") String name);

    Hourse searchHourseByHourseId(@Param("hourseId") String hourseId);

    List<Hourse> searchHourseNoCondition(Map<String,Integer> houseMap);

    Integer searchHourse();

    Integer updateHourseStatus(@Param("hourseId") String hourseId);

    Address searchAddressByHourseId(Integer hourseId);

    void createHourseeHourse(Hourse hourse);

    List<Hourse> searchHourseListByName(HashMap<String,Object> nameMap);
}
