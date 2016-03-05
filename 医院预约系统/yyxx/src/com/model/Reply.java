package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity  
@Table(name = "reply")  
public class Reply {  
    /** 
     * 回复id 必须有 无参数构造函数
     */  
    @Id  
    @Column(name = "rid")  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int rid;  
      
    /** 
     * 回复内容
     */  
    @Column(name = "rcontent", length = 50)  
    private String rcontent;  
      
    /** 
     * 回复时间
     */  
    @Column(name = "rdate", length = 50)  
    private String rdate;  
    /** 
     * 留言id
     */  
    @Column(name = "mid", length = 50)  
    private int mid; 




	public int getRid() {
		return rid;
	}




	public void setRid(int rid) {
		this.rid = rid;
	}




	public String getRcontent() {
		return rcontent;
	}




	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}




	public String getRdate() {
		return rdate;
	}




	public void setRdate(String rdate) {
		this.rdate = rdate;
	}




	public int getMid() {
		return mid;
	}




	public void setMid(int mid) {
		this.mid = mid;
	}




	public Reply(int rid, String rcontent, String rdate, int mid) {
		super();
		this.rid = rid;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.mid = mid;
	}

	public Reply() {
	}
   
}
