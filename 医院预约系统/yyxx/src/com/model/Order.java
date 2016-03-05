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
     * 预约表id 必须有 无参数构造函数
     */  
    @Id  
    @Column(name = "oid")  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int oid;  
      
    /** 
     * 预约的医生id
     */  
    @Column(name = "did", length = 50)  
    private int did;  
      
    /** 
     * 预约的用户id
     */  
    @Column(name = "uid", length = 50)  
    private int uid;  
    /** 
     * 预约的状态
     */  
    @Column(name = "otype", length = 50)  
    private String otype; 
    /** 
     * 预约的时间
     */  
    @Column(name = "odate", length = 50)  
    private String odate; 





	public int getOid() {
		return oid;
	}





	public void setOid(int oid) {
		this.oid = oid;
	}





	public int getDid() {
		return did;
	}





	public void setDid(int did) {
		this.did = did;
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





	public String getOdate() {
		return odate;
	}





	public void setOdate(String odate) {
		this.odate = odate;
	}





	public Order(int oid, int did, int uid, String otype, String odate) {
		super();
		this.oid = oid;
		this.did = did;
		this.uid = uid;
		this.otype = otype;
		this.odate = odate;
	}





	public Order() {
	}
   
}
