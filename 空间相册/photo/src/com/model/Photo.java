package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Photo")
public class Photo {
	/**
	 * ��Ƭid ������ �޲������캯��
	 */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	/**
	 * ��Ƭ��
	 */
	@Column(name = "name", length = 50)
	private String name;

	/**
	 * ��Ƭ��ʶ//ʱ���
	 */
	@Column(name = "time", length = 250)
	private String time;
	/**
	 * ��Ƭ��ַ
	 */
	@Column(name = "path", length = 50)
	private String path;

	/**
	 * �������
	 */
	@Column(name = "photosId", length = 50)
	private int photosId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getPhotosId() {
		return photosId;
	}

	public void setPhotosId(int photosId) {
		this.photosId = photosId;
	}


	public Photo(int id, String name, String time, String path, int photosId) {
		super();
		this.id = id;
		this.name = name;
		this.time = time;
		this.path = path;
		this.photosId = photosId;
	}

	public Photo() {
	}

}
