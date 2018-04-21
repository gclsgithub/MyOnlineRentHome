package cn.hytc.service.impl;

import cn.hytc.dao.AreaDao;
import cn.hytc.dao.HourseDao;
import cn.hytc.dao.UserDao;
import cn.hytc.model.Address;
import cn.hytc.model.Hourse;
import cn.hytc.model.User;
import cn.hytc.service.HourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HourseServiceImpl implements HourseService {


    @Autowired
    private HourseDao hourseDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private AreaDao areaDao;

    public List<Hourse> searchHourseByName(String name) {
        //当没有keyword的时候搜索全部
        name="'%"+name+"%'";
        List<Hourse> hourseList= hourseDao.searchHourseListByName(name);
        return hourseList;
    }

    public Hourse searchHourseByHourseId(String hourseId){
        Hourse hourse=hourseDao.searchHourseByHourseId(hourseId);
        return  hourse;
    }

    public List<Hourse> searchHourseNoCondition(Integer start, Integer offSet) {
        Map<String,Integer> houseMap=new HashMap<String, Integer>();
        houseMap.put("start",start);
        houseMap.put("offSet",offSet);
        List<Hourse> hourseList=hourseDao.searchHourseNoCondition(houseMap);
        List<Hourse> myHourseList=new ArrayList<Hourse>();
        for (Hourse hourse:hourseList) {
            User user=userDao.searchUserByUserId(hourse.getMasterId());
            hourse.setUserName(user.getUserName());
            myHourseList.add(hourse);
        }
        return myHourseList;
    }

    public Integer searchAllHourse() {
       Integer result= hourseDao.searchHourse();
        return result;
    }

    public Integer deletHourseByHourseId(String hourseId) {
        return hourseDao.updateHourseStatus(hourseId);
    }

    public Address searchHourseAddressByHourseId(String hourseId) {
        Address address=hourseDao.searchAddressByHourseId(Integer.valueOf(hourseId));
        return  address;
    }

    public void createHourse(Hourse hourse, String city) {
        hourse.setHourseAreaId(city);
        hourse.setLeaveRoom(hourse.getRoom());
        hourseDao.createHourseeHourse(hourse);
    }
}
