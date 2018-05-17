package cn.hytc.service;

import cn.hytc.model.Address;
import cn.hytc.model.Hourse;

import java.util.List;

public interface HourseService {
    List<Hourse> searchHourseByKeyWord(String name);

    Hourse searchHourseByHourseId(String hourseId);

    List<Hourse> searchHourseNoCondition(Integer page, Integer offSet);

    Integer searchAllHourse();

    Integer deletHourseByHourseId(String hourseId);

    Address searchHourseAddressByHourseId(String hourseId);

    void createHourse(Hourse hourse, String city);

    List<Hourse> searchHourseByName(String hourseName,int start,int offPage);
}
