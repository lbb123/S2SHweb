package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.model.Job;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.JobService;
import com.util.Page;
import com.util.Results;

//职位
public class JobAction extends ActionSupport{
	@Resource
	private JobService jobService;
	private Job job;
	private int currentPage;//page工具类

	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	//添加
	@Action(value = "jobadd", results = {
			@Result(name = "success", location = "/company/index.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() {
		SimpleDateFormat formatter = new SimpleDateFormat(
		"yyyy-MM-dd-HH:mm:ss");
         String dateString = formatter.format(new Date());
         job.setSendtime(dateString);
		jobService.save(job);
		return "success";
	}
	//简历列表
	@Action(value = "joblist", results = {
			@Result(name = "success",location = "/company/joblist.jsp"),
			@Result(name = "error", location = "/company/login.jsp") })
	public String joblist() {
		HttpServletRequest request2 = ServletActionContext.getRequest();
		 HttpSession session1 = request2.getSession();
		Object userId=session1.getAttribute("companyId");
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
		Results result =jobService.joblistbycid(page,id);
		page = result.getPage();//获得页数对象		
		List<Job> joblist= result.getList();//获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("joblist", joblist);
		request.put("page", page);
		return "success";
	}
	//管理员简历列表
	@Action(value = "mjoblist", results = {
			@Result(name = "success",location = "/manager/joblist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String mjoblist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());//设置当前页数
		page.setEveryPage(3);//设置每页页数	
		Results result =jobService.joblist(page);
		page = result.getPage();//获得页数对象		
		List<Job> joblist= result.getList();//获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("joblist", joblist);
		request.put("page", page);
		return "success";
	}
	
	//查询所有简历列表
	@Action(value = "findjoblist", results = {
			@Result(name = "success",location = "/joblist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String findjoblist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());//设置当前页数
		page.setEveryPage(6);//设置每页页数	
		Results result =jobService.joblist(page);
		page = result.getPage();//获得页数对象		
		List<Job> joblist= result.getList();//获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("joblist", joblist);
		request.put("page", page);
		return "success";
	}
	//职位删除
	@Action(value = "jobdelete", results = {
			@Result(name = "success", type="redirect",location = "/joblist"),
			@Result(name = "error", location = "/404.jsp") })
	public String delete() {
		jobService.delete(job);
		return "success";
	}
	//管理员职位删除
	@Action(value = "mjobdelete", results = {
			@Result(name = "success", type="redirect",location = "/mjoblist"),
			@Result(name = "error", location = "/404.jsp") })
	public String mdelete() {
		jobService.delete(job);
		return "success";
	}
	
	//职位查询
	@Action(value = "jobToUpdate", results = {
			@Result(name = "success",location = "/company/jobupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String querybyid() {
		Job query=jobService.querybyid(job.getId());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("job", query);
		return "success";
	}
	
	//职位修改
	@Action(value = "jobupdate", results = {
			@Result(name = "success", type="redirect",location = "/joblist"),
			@Result(name = "error", location = "/404.jsp") })
	public String update() {
		SimpleDateFormat formatter = new SimpleDateFormat(
		"yyyy-MM-dd-HH:mm:ss");
         String dateString = formatter.format(new Date());
         job.setSendtime(dateString);
		jobService.update(job);
		return "success";
	}
	//职位详情查询
	@Action(value = "jobdetail", results = {
			@Result(name = "success",location = "/jobtail.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String jobdetail() {
		Job query=jobService.querybyid(job.getId());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("job", query);
		return "success";
	}
	//职位模糊or查询
	@Action(value = "jobfind", results = {
			@Result(name = "success",location = "/joblistfind.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String jobfind() {
		List<Job> joblist= jobService.jobfind(job);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("joblist", joblist);
		return "success";
	}
	
}
