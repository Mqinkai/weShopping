package com.smj.entiy;

import com.smj.entiy.goods.TGoods;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/5/15.
 */
public class OrderDto {
    private String id;
    private String bianhao;
    private String xiadanshi;
    private String zt;
    private String songhuodizhi;
    private String fukuanfangshi;
    private String zongjia;
    private String huiyuanId;
    private String del;
    private List<TGoods> goodsList = new ArrayList<TGoods>();

    //商品
    private String mingcheng;

    public String getMingcheng() {
        return mingcheng;
    }

    public void setMingcheng(String mingcheng) {
        this.mingcheng = mingcheng;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBianhao() {
        return bianhao;
    }

    public void setBianhao(String bianhao) {
        this.bianhao = bianhao;
    }

    public String getXiadanshi() {
        return xiadanshi;
    }

    public void setXiadanshi(String xiadanshi) {
        this.xiadanshi = xiadanshi;
    }

    public String getZt() {
        return zt;
    }

    public void setZt(String zt) {
        this.zt = zt;
    }

    public String getSonghuodizhi() {
        return songhuodizhi;
    }

    public void setSonghuodizhi(String songhuodizhi) {
        this.songhuodizhi = songhuodizhi;
    }

    public String getFukuanfangshi() {
        return fukuanfangshi;
    }

    public void setFukuanfangshi(String fukuanfangshi) {
        this.fukuanfangshi = fukuanfangshi;
    }

    public String getZongjia() {
        return zongjia;
    }

    public void setZongjia(String zongjia) {
        this.zongjia = zongjia;
    }

    public String getHuiyuanId() {
        return huiyuanId;
    }

    public void setHuiyuanId(String huiyuanId) {
        this.huiyuanId = huiyuanId;
    }

    public String getDel() {
        return del;
    }

    public void setDel(String del) {
        this.del = del;
    }

    public List<TGoods> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<TGoods> goodsList) {
        this.goodsList = goodsList;
    }
}
