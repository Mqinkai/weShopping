package com.smj.entiy;

import com.smj.entiy.goods.TGoods;

import java.util.Date;

/**
 * Created by  on 2018/5/17.
 */
public class Notice {
private String id;
    private String saleid;
    private String buyName;
    private String message;
    private String code;
    private Date date;
    private String goodsId;
    private String buyId;
  private TGoods good;
    public String getBuyId() {
        return buyId;
    }

    public void setBuyId(String buyId) {
        this.buyId = buyId;
    }

    public String getSaleid() {
        return saleid;
    }

    public void setSaleid(String saleid) {
        this.saleid = saleid;
    }

    public String getBuyName() {
        return buyName;
    }

    public void setBuyName(String buyName) {
        this.buyName = buyName;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public TGoods getGood() {
        return good;
    }

    public void setGood(TGoods good) {
        this.good = good;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
