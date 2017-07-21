package cn.wj.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class AlarmBase implements Serializable {
    //======================抽取作为 条件查询对应实体属性============================
    private String vendorName;// 销售表需要的 售货机名称

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    private Timestamp createTime;//作为销售表条件查询条件 ----开始时间

    public void setCreatTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getCreatTime() {
        return createTime;
    }

    private Timestamp endTime;//作为销售表条件-----结束时间

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    //========================抽取作为 条件查询对应实体属性====================================
    private Integer alarmId;

    private Integer vendorId;

    private Integer channelId;

    private Date occurTime;

    private Date ackTime;

    private String alarmCode;

    private String description;

    private String acked;

    private String reason;

    private String ackUser;

    private String eventId;

    public Integer getAlarmId() {
        return alarmId;
    }

    public void setAlarmId(Integer alarmId) {
        this.alarmId = alarmId;
    }

    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    public Integer getChannelId() {
        return channelId;
    }

    public void setChannelId(Integer channelId) {
        this.channelId = channelId;
    }

    public Date getOccurTime() {
        return occurTime;
    }

    public void setOccurTime(Date occurTime) {
        this.occurTime = occurTime;
    }

    public Date getAckTime() {
        return ackTime;
    }

    public void setAckTime(Date ackTime) {
        this.ackTime = ackTime;
    }

    public String getAlarmCode() {
        return alarmCode;
    }

    public void setAlarmCode(String alarmCode) {
        this.alarmCode = alarmCode == null ? null : alarmCode.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getAcked() {
        return acked;
    }

    public void setAcked(String acked) {
        this.acked = acked == null ? null : acked.trim();
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public String getAckUser() {
        return ackUser;
    }

    public void setAckUser(String ackUser) {
        this.ackUser = ackUser == null ? null : ackUser.trim();
    }

    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId == null ? null : eventId.trim();
    }
}