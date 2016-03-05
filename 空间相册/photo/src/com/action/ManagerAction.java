package com.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import com.util.Results;
import com.model.Manager;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.UserService;
import com.util.Page;

public class ManagerAction extends ActionSupport {
	
	@Resource
	private UserService userService;
	
	private Manager manager;

	
	
	public Manager getManager() {
		return manager;
	}



	public void setManager(Manager manager) {
		this.manager = manager;
	}



	//ÓÃ»§µÇÂ¼
	@Action(value = "mlogin", results = {
			@Result(name = "success1",location = "/index2.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String login() {
		Manager queryM=userService.mlogins(manager);
		if (queryM != null && !queryM.equals("")) {
			Map session = ActionContext.getContext().getSession();
			session.put("mname", queryM.getName());
			return "success1";
		} else {
			return "error";
		}
	}
}
