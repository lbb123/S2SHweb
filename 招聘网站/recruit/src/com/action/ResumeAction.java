package com.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.model.Resume;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.service.ResumeService;
import com.util.Page;
import com.util.Results;

//简历
public class ResumeAction {
	
	@Resource
	private ResumeService resumeService;
	private Resume resume;
	private int currentPage;//page工具类
	public Resume getResume() {
		return resume;
	}
	public void setResume(Resume resume) {
		this.resume = resume;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	//简历创建
	@Action(value = "resumeadd", results = {
			@Result(name = "success", type="redirect",location = "/resumelist"),
			@Result(name = "error", location = "/user/login.jsp") })
	public String add() {
		HttpServletRequest request2 = ServletActionContext.getRequest();
		HttpSession session1 = request2.getSession();
		Object userId=session1.getAttribute("userId");
		int id = 0;
		try {
			id=Integer.valueOf(userId.toString());
		} catch (Exception e) {
			id = 0;
		}
		if (id==0) {
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("nologin", "您还没有登录，请登录后操作");
			return "error";
		}
		resume.setUid(id);
		resumeService.save(resume);
		return "success";
	}
	
	//简历列表
	@Action(value = "resumelist", results = {
			@Result(name = "success", location = "/user/resumelist.jsp"),
			@Result(name = "error", location = "/user/login.jsp") })
	public String resumelist() {
		HttpServletRequest request2 = ServletActionContext.getRequest();
		HttpSession session1 = request2.getSession();
		Object userId=session1.getAttribute("userId");
		int id = 0;
		try {
			id=Integer.valueOf(userId.toString());
		} catch (Exception e) {
			id = 0;
		}
		if (id==0) {
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("nologin", "您还没有登录，请登录后操作");
			return "error";
		}
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());//设置当前页数
		page.setEveryPage(3);//设置每页页数	
		Results result =resumeService.resumelistby(page,id);
		page = result.getPage();//获得页数对象		
		List<Resume> resumeList= result.getList();//获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("resumeList", resumeList);
		request.put("page", page);
		return "success";
	}
	//管理员简历列表
	@Action(value = "mresumelist", results = {
			@Result(name = "success", location = "/manager/resumelist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String mresumelist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());//设置当前页数
		page.setEveryPage(3);//设置每页页数	
		Results result =resumeService.resumelist(page);
		page = result.getPage();//获得页数对象		
		List<Resume> resumeList= result.getList();//获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("resumeList", resumeList);
		request.put("page", page);
		return "success";
	}
	//简历删除
	@Action(value = "resumedelete", results = {
			@Result(name = "success", type="redirect",location = "/resumelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String delete() {
		resumeService.delete(resume);
		return "success";
	}
	//管理员简历删除
	@Action(value = "mresumedelete", results = {
			@Result(name = "success", type="redirect",location = "/mresumelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String mdelete() {
		resumeService.delete(resume);
		return "success";
	}
	
	//简历修改查询
	@Action(value = "resumeToUpdate", results = {
			@Result(name = "success",location = "/user/resumeupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String queryby() {
		Resume query=resumeService.queryby(resume.getId());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("resume", query);
		return "success";
	}
	
	//简历修改
	@Action(value = "resumeupdate", results = {
			@Result(name = "success", type="redirect",location = "/resumelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String update() {
		resumeService.update(resume);
		return "success";
	}
	//简历查询
	@Action(value = "resumedetail", results = {
			@Result(name = "success",location = "/user/resumedetail.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String detail() {
		Resume query=resumeService.queryby(resume.getId());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("resume", query);
		return "success";
	}
	
	//管理员简历查询
	@Action(value = "mresumedetail", results = {
			@Result(name = "success",location = "/manager/resumedetail.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String mdetail() {
		Resume query=resumeService.queryby(resume.getId());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("resume", query);
		return "success";
	}

}
