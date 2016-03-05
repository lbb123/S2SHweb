package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity  
@Table(name = "goods")  
public class Goods {  
    /** 
     * 商品id 必须有 无参数构造函数
     */  
    @Id  
    @Column(name = "gid")  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int gid;  
      
    /** 
     * 商品名称
     */  
    @Column(name = "gname", length = 50)  
    private String gname;  
      
    /** 
     * 商品详情/标识
     */  
    @Column(name = "gdetail", length = 250)  
    private String gdetail;  
    /** 
     * 商品价格
     */  
    @Column(name = "gprice", length = 50)  
    private String gprice; 
    /** 
     * 商品发布日期
     */  
    @Column(name = "gdate", length = 50)  
    private String gdate; 
    /** 
     * 商品类别cid
     */  
    @Column(name = "cid", length = 50)  
    private int cid; 
    /** 
     * 商品图片地址
     */  
    @Column(name = "gpic", length = 50)  
    private String gpic;
    /** 
     * 商品库存数量
     */  
    @Column(name = "gkucun", length = 50)  
    private int gkucun; 
    /** 
     * 商品状态0热卖1特价
     */  
    @Column(name = "gtype", length = 50)  
    private String gtype; 




	public int getGid() {
		return gid;
	}




	public void setGid(int gid) {
		this.gid = gid;
	}




	public String getGname() {
		return gname;
	}




	public void setGname(String gname) {
		this.gname = gname;
	}




	public String getGdetail() {
		return gdetail;
	}




	public void setGdetail(String gdetail) {
		this.gdetail = gdetail;
	}




	public String getGprice() {
		return gprice;
	}




	public void setGprice(String gprice) {
		this.gprice = gprice;
	}




	public String getGdate() {
		return gdate;
	}




	public void setGdate(String gdate) {
		this.gdate = gdate;
	}




	public int getCid() {
		return cid;
	}




	public void setCid(int cid) {
		this.cid = cid;
	}




	public String getGpic() {
		return gpic;
	}




	public void setGpic(String gpic) {
		this.gpic = gpic;
	}




	public int getGkucun() {
		return gkucun;
	}




	public void setGkucun(int gkucun) {
		this.gkucun = gkucun;
	}




	public String getGtype() {
		return gtype;
	}




	public void setGtype(String gtype) {
		this.gtype = gtype;
	}




	public Goods(int gid, String gname, String gdetail, String gprice,
			String gdate, int cid, String gpic, int gkucun, String gtype) {
		super();
		this.gid = gid;
		this.gname = gname;
		this.gdetail = gdetail;
		this.gprice = gprice;
		this.gdate = gdate;
		this.cid = cid;
		this.gpic = gpic;
		this.gkucun = gkucun;
		this.gtype = gtype;
	}




	public Goods() {
	}
   
}
