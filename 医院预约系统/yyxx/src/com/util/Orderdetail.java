package com.util;

import com.model.Doctor;
import com.model.Order;
import com.model.User;

//预约信息整合
public class Orderdetail {
	
	private Doctor doctor;
	private Order order;
	private User user;
	public Doctor getDoctor() {
		return doctor;
	}
	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

}
