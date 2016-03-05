package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity  
@Table(name = "orderlist")  
public class Order {  
    /** 
     * 订单id 必须有 无参数构造函数
     */  
    @Id  
    @Column(name = "oid")  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int oid;  
      
    /** 
     * 订单号
     */  
    @Column(name = "obiaohao", length = 50)  
    private String obiaohao;  
      
    /** 
     * 订单提交日期 
     */  
    @Column(name = "odate", length = 50)  
    private String odate;  
    /** 
     * 提交者id(用户id)
     */  
    @Column(name = "uid", length = 50)  
    private int uid; 
    /** 
     * 订单处理状态
     */  
    @Column(name = "otype", length = 50)  
    private String otype; 
    /** 
     * 收货人姓名
     */  
    @Column(name = "oname", length = 50)  
    private String oname; 
    /** 
     * 订单送货地址
     */  
    @Column(name = "oaddress", length = 50)  
    private String oaddress; 
    /** 
     * 订单付款方式
     */  
    @Column(name = "ofukuang", length = 50)  
    private String ofukuang; 
    /** 
     * 订单送货方式
     */  
    @Column(name = "ofasong", length = 50)  
    private String ofasong; 
    /** 
     * 订单人手机号
     */  
    @Column(name = "ophone", length = 50)  
    private String ophone; 
    /** 
     * 订单人邮件
     */  
    @Column(name = "oemail", length = 50)  
    private String oemail; 
    /** 
     * 订单总价
     */  
    @Column(name = "ozongjia", length = 50)  
    private String ozongjia;
    /** 
     * 订单备注
     */  
    @Column(name = "obeizhu", length = 250)  
    private String obeizhu;




	public String getOname() {
		return oname;
	}




	public void setOname(String oname) {
		this.oname = oname;
	}




	public int getOid() {
		return oid;
	}




	public void setOid(int oid) {
		this.oid = oid;
	}




	public String getObiaohao() {
		return obiaohao;
	}




	public void setObiaohao(String obiaohao) {
		this.obiaohao = obiaohao;
	}




	public String getOdate() {
		return odate;
	}




	public void setOdate(String odate) {
		this.odate = odate;
	}




	public int getUid() {
		return uid;
	}




	public void setUid(int uid) {
		this.uid = uid;
	}




	public String getOtype() {
		return otype;
	}




	public void setOtype(String otype) {
		this.otype = otype;
	}




	public String getOaddress() {
		return oaddress;
	}




	public void setOaddress(String oaddress) {
		this.oaddress = oaddress;
	}




	public String getOfukuang() {
		return ofukuang;
	}




	public void setOfukuang(String ofukuang) {
		this.ofukuang = ofukuang;
	}




	public String getOfasong() {
		return ofasong;
	}




	public void setOfasong(String ofasong) {
		this.ofasong = ofasong;
	}




	public String getOphone() {
		return ophone;
	}




	public void setOphone(String ophone) {
		this.ophone = ophone;
	}




	public String getOemail() {
		return oemail;
	}




	public void setOemail(String oemail) {
		this.oemail = oemail;
	}




	public String getOzongjia() {
		return ozongjia;
	}




	public void setOzongjia(String ozongjia) {
		this.ozongjia = ozongjia;
	}




	public String getObeizhu() {
		return obeizhu;
	}




	public void setObeizhu(String obeizhu) {
		this.obeizhu = obeizhu;
	}








	public Order(int oid, String obiaohao, String odate, int uid, String otype,
			String oname, String oaddress, String ofukuang, String ofasong,
			String ophone, String oemail, String ozongjia, String obeizhu) {
		super();
		this.oid = oid;
		this.obiaohao = obiaohao;
		this.odate = odate;
		this.uid = uid;
		this.otype = otype;
		this.oname = oname;
		this.oaddress = oaddress;
		this.ofukuang = ofukuang;
		this.ofasong = ofasong;
		this.ophone = ophone;
		this.oemail = oemail;
		this.ozongjia = ozongjia;
		this.obeizhu = obeizhu;
	}




	public Order() {
	}
   
}
