package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity  
@Table(name = "message")  
public class Message {  
    /** 
     * 留言id 必须有 无参数构造函数
     */  
    @Id  
    @Column(name = "mid")  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int mid;  
      
    /** 
     * 商品id
     */  
    @Column(name = "gid", length = 50)  
    private int gid;  
    /** 
     * 用户id
     */  
    @Column(name = "uid", length = 50)  
    private int uid; 
      
    /** 
     * 留言/评论内容
     */  
    @Column(name = "mcontent", length = 250)  
    private String mcontent;  
    /** 
     * 留言时间
     */  
    @Column(name = "mdate", length = 50)  
    private String mdate; 





	public int getMid() {
		return mid;
	}





	public void setMid(int mid) {
		this.mid = mid;
	}





	public int getGid() {
		return gid;
	}





	public void setGid(int gid) {
		this.gid = gid;
	}





	public int getUid() {
		return uid;
	}





	public void setUid(int uid) {
		this.uid = uid;
	}





	public String getMcontent() {
		return mcontent;
	}





	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}





	public String getMdate() {
		return mdate;
	}





	public void setMdate(String mdate) {
		this.mdate = mdate;
	}





	public Message(int mid, int gid, int uid, String mcontent, String mdate) {
		super();
		this.mid = mid;
		this.gid = gid;
		this.uid = uid;
		this.mcontent = mcontent;
		this.mdate = mdate;
	}





	public Message() {
	}
   
}
