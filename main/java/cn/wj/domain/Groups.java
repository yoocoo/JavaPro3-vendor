package cn.wj.domain;

import java.io.Serializable;

public class Groups implements Serializable {
    private Integer groupId;

    private String groupCode;

    private Integer agencyId;

    private String groupName;

    //================ 提供运营商查询的=商品列表增加字段==========================
    private Integer goodsId;
    private String goodsCode;
    private String goodsName;

    private String goodsImg;
    private String goodsUnit;//商品计量单位
    private Double price;//商品价格

    public String getGoodsCode() {
        return goodsCode;
    }

    public void setGoodsCode(String goodsCode) {
        this.goodsCode = goodsCode;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }
    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsImg() {
        return goodsImg;
    }

    public void setGoodsImg(String goodsImg) {
        this.goodsImg = goodsImg;
    }

    public String getGoodsUnit() {
        return goodsUnit;
    }

    public void setGoodsUnit(String goodsUnit) {
        this.goodsUnit = goodsUnit;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
    //==========================================

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode == null ? null : groupCode.trim();
    }

    public Integer getAgencyId() {
        return agencyId;
    }

    public void setAgencyId(Integer agencyId) {
        this.agencyId = agencyId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName == null ? null : groupName.trim();
    }

    @Override
    public String toString() {
        return "{"

                + '\"' + "groupId"  + '\"' + ":" + '\"' + groupId + '\"'
                + "," + '\"' +"groupCode"+ '\"' + ":" + '\"' + groupCode + '\"'
                + "," + '\"' +"agencyId" + '\"' + ":" + '\"' + agencyId + '\"'
                + "," + '\"' +"groupName" + '\"' + ":" + '\"' + groupName + '\"'
                + "," + '\"' +"goodsId"+ '\"' + ":" + '\"' + goodsId + '\"'
                + "," + '\"' +"goodsCode"+ '\"' + ":" + '\"' + goodsCode + '\"'
                + "," + '\"' +"goodsName" + '\"' + ":" + '\"' + goodsName + '\"'
                + "," + '\"' +"goodsImg" + '\"' + ":" + '\"' + goodsImg + '\"'
                + "," + '\"' +"goodsUnit"+ '\"' + ":" + '\"' + goodsUnit+ '\"'
                + "," + '\"' +"price"+ '\"' + ":" + '\"' + price + '\"'+
                '}';
    }
}