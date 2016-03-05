package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity  
@Table(name = "orderitem")  
public class Orderitem {  
    /** 
     * 订单物品id 必须有 无参数构造函数
     */  
    @Id  
    @Column(name = "oiid")  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int oiid;  
      
    /** 
     * 订单id
     */  
    @Column(name = "oid", length = 50)  
    private int oid; 
    /** 
     * 物品id
     */  
    @Column(name = "gid", length = 50)  
    private int gid;
      
    /** 
     * 物品数量
     */  
    @Column(name = "gnum", length = 50)  
    private int gnum;  






	public int getOiid() {
		return oiid;
	}



	public void setOiid(int oiid) {
		this.oiid = oiid;
	}



	public int getOid() {
		return oid;
	}



	public void setOid(int oid) {
		this.oid = oid;
	}



	public int getGid() {
		return gid;
	}



	public void setGid(int gid) {
		this.gid = gid;
	}



	public int getGnum() {
		return gnum;
	}



	public void setGnum(int gnum) {
		this.gnum = gnum;
	}








	public Orderitem(int oiid, int oid, int gid, int gnum) {
		super();
		this.oiid = oiid;
		this.oid = oid;
		this.gid = gid;
		this.gnum = gnum;
	}



	public Orderitem() {
	}
   
}
