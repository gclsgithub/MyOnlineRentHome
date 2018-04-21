package cn.hytc.model;

public class HourseContract {
    /**
     * contract ID key
     */
    private int contractId;
    /**
     * rent user ID
     */
    private int rentUserId;
    /**
     * rent hourse Id
     */
    private int hourseId;
    /**
     * master hourse Id
     */
    private String masterId;

    private int userId;
    private String masterName;
    private String fileName;
    private String contractContent;
    /**
     * rent total money in jsp it is three six or nine
     */
    private int rentDay;
    private String leaveMoney;
    private String createTime;
    private String createUser;

    public String getLeaveMoney() {
        return leaveMoney;
    }

    public void setLeaveMoney(String leaveMoney) {
        this.leaveMoney = leaveMoney;
    }

    /**
     * rent method is full hourse or rent by many people
     */
    private String rentMethod;
    /**
     * singele money
     */
    private Double singleMoney;
    /**
     * total money
     */
    private Double money;
    /**
     * set shop car setting if isPayed is no this hourse add into pay car
     */
    private String isPayed;
    private String rentType;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getMasterName() {
        return masterName;
    }

    public void setMasterName(String masterName) {
        this.masterName = masterName;
    }

    public int getHourseId() {
        return hourseId;
    }

    public void setHourseId(int hourseId) {
        this.hourseId = hourseId;
    }

    public String getRentType() {
        return rentType;
    }

    public void setRentType(String rentType) {
        this.rentType = rentType;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getRentUserId() {
        return rentUserId;
    }

    public void setRentUserId(int rentUserId) {
        this.rentUserId = rentUserId;
    }

    public String getMasterId() {
        return masterId;
    }

    public void setMasterId(String masterId) {
        this.masterId = masterId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getContractContent() {
        return contractContent;
    }

    public void setContractContent(String contractContent) {
        this.contractContent = contractContent;
    }

    public int getRentDay() {
        return rentDay;
    }

    public void setRentDay(int rentDay) {
        this.rentDay = rentDay;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public String getRentMethod() {
        return rentMethod;
    }

    public void setRentMethod(String rentMethod) {
        this.rentMethod = rentMethod;
    }

    public Double getSingleMoney() {
        return singleMoney;
    }

    public void setSingleMoney(Double singleMoney) {
        this.singleMoney = singleMoney;
    }

    public String getIsPayed() {
        return isPayed;
    }

    public void setIsPayed(String isPayed) {
        this.isPayed = isPayed;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }
}
