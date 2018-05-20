package com.smj.entiy.goods;


import java.util.ArrayList;
import java.util.List;

public class Leibie {
    private int id;
    private String mingcheng;
    List<LeibieXiashu> leibieXiashus=new ArrayList<LeibieXiashu>();
    private String tupian;
    private String tuijian;

    public String getTuijian() {
        return tuijian;
    }

    public void setTuijian(String tuijian) {
        this.tuijian = tuijian;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMingcheng() {
        return mingcheng;
    }

    public void setMingcheng(String mingcheng) {
        this.mingcheng = mingcheng;
    }

    public List<LeibieXiashu> getLeibieXiashus() {
        return leibieXiashus;
    }

    public void setLeibieXiashus(List<LeibieXiashu> leibieXiashus) {
        this.leibieXiashus = leibieXiashus;
    }

    public String getTupian() {
        return tupian;
    }

    public void setTupian(String tupian) {
        this.tupian = tupian;
    }
}
