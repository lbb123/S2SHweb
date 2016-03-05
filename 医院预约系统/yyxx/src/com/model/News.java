package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "news")
public class News {
	/**
	 * 新闻id 必须有 无参数构造函数
	 */
	@Id
	@Column(name = "nid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int nid;

	/**
	 * 新闻标题
	 */
	@Column(name = "ntitle", length = 50)
	private String ntitle;
	/**
	 * 新闻内容
	 */
	@Column(name = "ncontent", length = 50)
	private String ncontent;

	/**
	 * 发布时间
	 */
	@Column(name = "ndate", length = 50)
	private String ndate;
	/**
	 * 发布者id
	 */
	@Column(name = "naid", length = 50)
	private String naid;
	/**
	 * 发布者名字
	 */
	@Column(name = "nauthor", length = 50)
	private String nauthor;
	/**
	 * 发布类型
	 */
	@Column(name = "ntype", length = 50)
	private String ntype;



	public int getNid() {
		return nid;
	}



	public void setNid(int nid) {
		this.nid = nid;
	}



	public String getNtitle() {
		return ntitle;
	}



	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}



	public String getNcontent() {
		return ncontent;
	}



	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}



	public String getNdate() {
		return ndate;
	}



	public void setNdate(String ndate) {
		this.ndate = ndate;
	}



	public String getNaid() {
		return naid;
	}



	public void setNaid(String naid) {
		this.naid = naid;
	}



	public String getNauthor() {
		return nauthor;
	}



	public void setNauthor(String nauthor) {
		this.nauthor = nauthor;
	}



	public String getNtype() {
		return ntype;
	}



	public void setNtype(String ntype) {
		this.ntype = ntype;
	}



	public News(int nid, String ntitle, String ncontent, String ndate,
			String naid, String nauthor, String ntype) {
		super();
		this.nid = nid;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.ndate = ndate;
		this.naid = naid;
		this.nauthor = nauthor;
		this.ntype = ntype;
	}



	public News() {
	}

}
