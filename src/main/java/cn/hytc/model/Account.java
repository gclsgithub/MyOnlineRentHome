package cn.hytc.model;

public class Account {
    /**
     * accountId key
     */
    private  int accountId;
    /**
     * accoount Name
     */
    private String accountName;
    /**
     * accountMoney
     */
    private String accountMoney;
    /**
     * account user
     */
    private int userId;

    private String addMoney;

    private String leaveMoney;

    private Integer rentDay;

    private String  hourseId;

    private String  rentType;

    public String getRentType() {
        return rentType;
    }

    public void setRentType(String rentType) {
        this.rentType = rentType;
    }

    public String getHourseId() {
        return hourseId;
    }

    public void setHourseId(String hourseId) {
        this.hourseId = hourseId;
    }

    public String getAddMoney() {
        return addMoney;
    }

    public void setAddMoney(String addMoney) {
        this.addMoney = addMoney;
    }

    public Integer getRentDay() {
        return rentDay;
    }

    public void setRentDay(Integer rentDay) {
        this.rentDay = rentDay;
    }

    public String getLeaveMoney() {
        return leaveMoney;
    }

    public void setLeaveMoney(String leaveMoney) {
        this.leaveMoney = leaveMoney;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getAccountMoney() {
        return accountMoney;
    }

    public void setAccountMoney(String accountMoney) {
        this.accountMoney = accountMoney;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
