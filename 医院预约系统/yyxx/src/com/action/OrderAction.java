package com.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.model.Admin;
import com.model.Doctor;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.AdminService;
import com.service.OrderService;
import com.util.Orderdetail;
import com.util.Page;
import com.util.Results;
import com.model.Order;

//预约
public class OrderAction extends ActionSupport {
	@Resource
	private OrderService orderService;
	private Order order;
	private Doctor doctor;
	private User user;

	private int currentPage;// page工具类

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	// 添加预约信息
	@SuppressWarnings("deprecation")
	@Action(value = "orderadd", results = {
			@Result(name = "success", type = "redirect", location = "/userorderlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() throws Exception {
		order.setOtype("预约中");
		orderService.save(order);
		return "success";
	}
	
	 //修改-预约状态-预约成功
	 @Action(value = "doctororderupdate", results = {
	 @Result(name = "success", type="redirect", location = "/doctororderlist"),
	 @Result(name = "error", location = "/404.jsp") })
	 public String update() {
	 Order queryOrder= orderService.querybyid(order.getOid());
	 queryOrder.setOtype("预约成功");
	 orderService.update(queryOrder);
	 return "success";
	 }
	//修改-预约状态-预约失败
	 @Action(value = "doctororderupdate2", results = {
	 @Result(name = "success", type="redirect", location = "/doctororderlist"),
	 @Result(name = "error", location = "/404.jsp") })
	 public String update2() {
	 Order queryOrder= orderService.querybyid(order.getOid());
	 queryOrder.setOtype("预约失败");
	 orderService.update(queryOrder);
	 return "success";
	 }
	
	// 医生预约信息列表
	@Action(value = "doctororderlist", results = {
			@Result(name = "success", location = "/doctor/orderlist.jsp"),
			@Result(name = "error", location = "/doctor/login.jsp") })
	public String doctororderlist() {
		Map session = ServletActionContext.getContext().getSession();
		Doctor doctor = (Doctor) session.get("doctor");
		try {
			if (doctor.getName() == null || doctor.getName().equals("")) {
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("nologin", "您还没有登录，请登录");
				return "error";
			}
		} catch (Exception e) {
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("nologin", "您还没有登录，请登录");
			return "error";
		}
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(10);// 设置每页页数
		Results result = orderService.listdoctor(page, doctor.getDid());
		page = result.getPage();// 获得页数对象
		List<Order> orderList = result.getList();// 获得列表对象
		List<Orderdetail> Orderdetaillist = new ArrayList<Orderdetail>();
		for (Order queryorder : orderList) {
			User u=orderService.queryUser(queryorder.getUid());
			Orderdetail orderdetail=new Orderdetail();
			orderdetail.setUser(u);
			orderdetail.setOrder(queryorder);
			Orderdetaillist.add(orderdetail);
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("Orderdetaillist", Orderdetaillist);
		request.put("page", page);
		return "success";
	}
	//用户预约信息列表
	@Action(value = "userorderlist", results = {
			@Result(name = "success", location = "/orderlist.jsp"),
			@Result(name = "error", location = "/login.jsp") })
	public String list() {
		Map session = ServletActionContext.getContext().getSession();
		User user = (User) session.get("user");
		try {
			if (user.getName() == null || user.getName().equals("")) {
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("nologin", "您还没有登录，请登录");
				return "error";
			}
		} catch (Exception e) {
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("nologin", "您还没有登录，请登录");
			return "error";
		}
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(10);// 设置每页页数
		Results result = orderService.listuser(page, user.getId());
		page = result.getPage();// 获得页数对象
		List<Order> orderList = result.getList();// 获得列表对象
		List<Orderdetail> Orderdetaillist = new ArrayList<Orderdetail>();
		for (Order queryorder : orderList) {
			Doctor d=orderService.querydoctor(queryorder.getDid());
			Orderdetail orderdetail=new Orderdetail();
			orderdetail.setDoctor(d);
			orderdetail.setOrder(queryorder);
			Orderdetaillist.add(orderdetail);
		}
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("Orderdetaillist", Orderdetaillist);
		request.put("page", page);
		return "success";
	}

}
