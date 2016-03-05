package com.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.model.Manager;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.ManagerService;
import com.service.UserService;
//管理员
public class ManagerAction extends ActionSupport{
	@Resource
	private ManagerService managerService;
	private Manager manager;

	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	//登录
	@Action(value = "managerlogin", results = {
			@Result(name = "success",location = "/manager/index.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String login() {
		Manager query=managerService.logins(manager);
		if (query != null && !query.equals("")) {
			Map session = ActionContext.getContext().getSession();
			session.put("managername", query.getName());
			session.put("managerId", query.getId());
			return "success";
		} else {
			return "error";
		}
	}
	
}
