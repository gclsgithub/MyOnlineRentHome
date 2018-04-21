package cn.hytc.model;

public class Hourse {
    /**
     * UserId
     */
    private String userId;
    /**
     * 用户名
     */
    private String userName;
    /**
     * 房屋Id
     */
    private int hourseId;
    /**
     * 地区表示
     */
    private String hourseAreaId;
    /**
     * 房屋种类
     */
    private String categoeryId;
    /**
     * 目前状态   在库可租还是不在库未上线
     */
    private String status;

    private String hourseName;

    private String isRent;

    private String masterId;

    private String startTime;

    private String endTime;

    private Double singleMoney;

    private Integer room;

    private Integer leaveRoom;

    private String rentType;

    private String keyWord;


    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public String getRentType() {
        return rentType;
    }
    public void setRentType(String rentType) {
        this.rentType = rentType;
    }

    public Integer getRoom() {
        return room;
    }

    public void setRoom(Integer room) {
        this.room = room;
    }

    public Integer getLeaveRoom() {
        return leaveRoom;
    }

    public void setLeaveRoom(Integer leaveRoom) {
        this.leaveRoom = leaveRoom;
    }

    public String getHourseName() {
        return hourseName;
    }

    public void setHourseName(String hourseName) {
        this.hourseName = hourseName;
    }

    public Double getSingleMoney() {
        return singleMoney;
    }

    public void setSingleMoney(Double singleMoney) {
        this.singleMoney = singleMoney;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setHourseId(int hourseId) {
        this.hourseId = hourseId;
    }

    public void setHourseAreaId(String hourseAreaId) {
        this.hourseAreaId = hourseAreaId;
    }

    public void setCategoeryId(String categoeryId) {
        this.categoeryId = categoeryId;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setIsRent(String isRent) {
        this.isRent = isRent;
    }

    public void setMasterId(String masterId) {
        this.masterId = masterId;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getHourseId() {
        return hourseId;
    }

    public String getHourseAreaId() {
        return hourseAreaId;
    }

    public String getCategoeryId() {
        return categoeryId;
    }

    public String getStatus() {
        return status;
    }

    public String getIsRent() {
        return isRent;
    }

    public String getMasterId() {
        return masterId;
    }

    public String getStartTime() {
        return startTime;
    }

    public String getEndTime() {
        return endTime;
    }
}
