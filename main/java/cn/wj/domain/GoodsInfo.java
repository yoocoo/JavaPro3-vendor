package cn.wj.domain;

import java.io.Serializable;

public class GoodsInfo implements Serializable {
    private Integer goodsId;

    private String goodsCode;

    private String goodsName;

    private String goodsImg;
    private String goodsUnit;//商品计量单位
    private Double price;//商品价格

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

    private String groupCode;

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsCode() {
        return goodsCode;
    }

    public void setGoodsCode(String goodsCode) {
        this.goodsCode = goodsCode == null ? null : goodsCode.trim();
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getGoodsImg() {
        return goodsImg;
    }

    public void setGoodsImg(String goodsImg) {
        this.goodsImg = goodsImg == null ? null : goodsImg.trim();
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode == null ? null : groupCode.trim();
    }


    @Override
    public String toString() {
        return "{"

                + '\"' + "goodsId"  + '\"' + ":" + '\"' + goodsId + '\"'
                + "," + '\"' +"goodsCode"+ '\"' + ":" + '\"' + goodsCode + '\"'
                + "," + '\"' +"goodsName" + '\"' + ":" + '\"' + goodsName + '\"'
                + "," + '\"' +"goodsImg" + '\"' + ":" + '\"' + goodsImg + '\"'
                + "," + '\"' +"goodsUnit"+ '\"' + ":" + '\"' + goodsUnit + '\"'
                + "," + '\"' +"price"+ '\"' + ":" + '\"' + price + '\"'+
                '}';
    }
}