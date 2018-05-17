package cn.hytc.service.impl;

import cn.hytc.dao.HourseRentContactDao;
import cn.hytc.dao.UserDao;
import cn.hytc.model.Account;
import cn.hytc.model.HourseContract;
import cn.hytc.model.User;
import cn.hytc.service.HourseRentContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HourseRentContactServiceImpl implements HourseRentContactService{
        @Autowired
        private HourseRentContactDao hourseRentContactDao;

        @Transactional
        public boolean creatContract(HourseContract hourseContract) {
            boolean flag = true;
            double money = Double.valueOf(hourseContract.getSingleMoney()) *  Double.valueOf(hourseContract.getRentDay());
            String rentType=hourseContract.getRentType();
            if ("on".equals(rentType)){
                hourseContract.setRentMethod("1");
            }
            else{
                hourseContract.setRentMethod("2");
            }
            int rentUser = hourseContract.getUserId();
            User user = new User();
            user.setUserId(rentUser);
            String leaveMoney=null;

            //judge account's monry is not satisfied
            List<Account> accountList= hourseRentContactDao.SeachUserAndAccountByUserName(user);
            List<Integer> accountIdList=new ArrayList<Integer>();
            for(int i=0;i<accountList.size();i++) {
                if (new Double(accountList.get(i).getAccountMoney()) < money) {
                    flag = false;
                    return flag;
                }
                accountIdList.add(accountList.get(i).getAccountId());
            }

            //satified judge and reduce account and create contract
            for (int i=0;i<accountIdList.size();i++){
                if (((new Double(accountList.get(i).getAccountMoney())) - money)>0) {
                    leaveMoney = (new Double(accountList.get(i).getAccountMoney()) - money) + "";
                    Account myaccount = new Account();
                    myaccount.setLeaveMoney(leaveMoney);
                    myaccount.setAccountId(accountIdList.get(i));
                    int result = hourseRentContactDao.reduceAccount(myaccount);
                    if (result == 1) {
                        break;
                    }
                }
            }
            hourseContract.setMoney(money);
            hourseContract.setIsPayed("Y");
            hourseRentContactDao.createHourseContract(hourseContract);
            return flag;
        }

    public List<HourseContract> searchHourseNoCondition(Integer page, Integer offSet) {
        Map<String,Integer>myMap=new HashMap<String, Integer>();
        myMap.put("start",page);
        myMap.put("offSet",offSet);
        List<HourseContract> hourseContractList=hourseRentContactDao.searchHourseNoCondition(myMap);
        return hourseContractList;
    }

    public Integer searchAllHourseContract() {
        Integer result =hourseRentContactDao.searchAllHourseContractCount();
        return result;
    }

    public List<HourseContract> searchHourseContractByHourseId(String hourseId) {
        List<HourseContract> hourseContract=hourseRentContactDao.searchHourseContractByHourseId(hourseId);
        return hourseContract;
    }

    public List<HourseContract> searchHourseContractByContractId(String contractId) {
        return hourseRentContactDao.searchHourseContractByHourseId(contractId);
    }
}
