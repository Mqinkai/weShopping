package com.smj.entiy.goods;

/**
 * TGoods entity. @author MyEclipse Persistence Tools
 */

public class TGoods implements java.io.Serializable
{

	private Integer id;
	private Integer leibieId;
	private String leibieName;
	private String leibiexiashuId;
	private String mingcheng;
	private String jieshao;
	
	private String fujian;
	private Integer jiage;
	private Integer tejia;
	private String shifoutejia;
	
	private String del;
	private String fbid;
	private String saleflag;
	private String yuanjia;
private String fkfs;
	private String zh;
	//详情页面需要
	private String address;
	private String school;

	public String getLeibieName() {
		return leibieName;
	}

	public void setLeibieName(String leibieName) {
		this.leibieName = leibieName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getYuanjia() {
		return yuanjia;
	}

	public void setYuanjia(String yuanjia) {
		this.yuanjia = yuanjia;
	}

	public String getLeibiexiashuId() {
		return leibiexiashuId;
	}

	public void setLeibiexiashuId(String leibiexiashuId) {
		this.leibiexiashuId = leibiexiashuId;
	}

	public String getSaleflag() {
		return saleflag;
	}

	public void setSaleflag(String saleflag) {
		this.saleflag = saleflag;
	}

	public String getFbid() {
		return fbid;
	}

	public void setFbid(String fbid) {
		this.fbid = fbid;
	}

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public Integer getLeibieId()
	{
		return leibieId;
	}

	public void setLeibieId(Integer leibieId)
	{
		this.leibieId = leibieId;
	}

	public String getMingcheng()
	{
		return mingcheng;
	}

	public void setMingcheng(String mingcheng)
	{
		this.mingcheng = mingcheng;
	}

	public String getJieshao()
	{
		return jieshao;
	}

	public void setJieshao(String jieshao)
	{
		this.jieshao = jieshao;
	}

	public String getFujian()
	{
		return fujian;
	}

	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}

	public Integer getJiage()
	{
		return jiage;
	}

	public void setJiage(Integer jiage)
	{
		this.jiage = jiage;
	}

	public Integer getTejia()
	{
		return tejia;
	}

	public void setTejia(Integer tejia)
	{
		this.tejia = tejia;
	}

	public String getShifoutejia()
	{
		return shifoutejia;
	}

	public void setShifoutejia(String shifoutejia)
	{
		this.shifoutejia = shifoutejia;
	}

	public String getDel()
	{
		return del;
	}

	public void setDel(String del)
	{
		this.del = del;
	}

	public String getFkfs() {
		return fkfs;
	}

	public void setFkfs(String fkfs) {
		this.fkfs = fkfs;
	}

	public String getZh() {
		return zh;
	}

	public void setZh(String zh) {
		this.zh = zh;
	}
}