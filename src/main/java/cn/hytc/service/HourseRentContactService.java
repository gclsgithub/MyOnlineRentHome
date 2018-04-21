package cn.hytc.service;

import cn.hytc.model.HourseContract;

import java.util.List;

public interface HourseRentContactService {
   boolean creatContract (HourseContract hourseContract);

    List<HourseContract> searchHourseNoCondition(Integer page, Integer offSet);

    Integer searchAllHourseContract();

    List<HourseContract> searchHourseContractByHourseId(String hourseId);
}
