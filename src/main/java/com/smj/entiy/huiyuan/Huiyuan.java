package com.smj.entiy.huiyuan;

import java.util.Date;

/**
 * Created on 2018/2/22.
 */
public class Huiyuan {
    private String id;
    private String userName; //用户名
    private String userBz;  //1 新注册用户（未初始化信息），2以添加收货地址联系方式等信息
    private String email;
    private String password;
    private String code; //1普通会员
    private String tel;
    private String tx;
    private String carNum;//购物车数量
    private String xingming;
    private Date sr;
    private String srup; //上传用的时间
    private String address;
    private String xingbie = "";
    private String csrq;
    private String school;

    private String province;
    private String city;
    private String area;

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getSrup() {
        return srup;
    }

    public void setSrup(String srup) {
        this.srup = srup;
    }

    public Date getSr() {
        return sr;
    }

    public void setSr(Date sr) {
        this.sr = sr;
    }

    public String getCsrq() {
        return csrq;
    }

    public void setCsrq(String csrq) {
        this.csrq = csrq;
    }

    public String getXingbie() {
        return xingbie;
    }

    public void setXingbie(String xingbie) {
        this.xingbie = xingbie;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserBz() {
        return userBz;
    }

    public void setUserBz(String userBz) {
        this.userBz = userBz;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getTx() {
        return tx;
    }

    public void setTx(String tx) {
        this.tx = tx;
    }

    public String getCarNum() {
        return carNum;
    }

    public void setCarNum(String carNum) {
        this.carNum = carNum;
    }

    public String getXingming() {
        return xingming;
    }

    public void setXingming(String xingming) {
        this.xingming = xingming;
    }


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
