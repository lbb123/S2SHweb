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

import com.model.Company;
import com.model.Job;
import com.model.Message;
import com.model.Resume;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.CompanyService;
import com.service.JobService;
import com.service.MessageService;
import com.service.ResumeService;
import com.service.UserService;
import com.util.Page;
import com.util.Results;

//投递简历相关
public class MessageAction extends ActionSupport{
	@Resource
	private UserService userService;
	private User user;
	@Resource
	private CompanyService companyService;
	private Company company;
	@Resource
	private JobService jobService;
	private Job job;
	@Resource
	private ResumeService resumeService;
	private Resume resume;
	@Resource
	private MessageService messageService;
	private Message message;

	private int currentPage;//page工具类
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	public Resume getResume() {
		return resume;
	}
	public void setResume(Resume resume) {
		this.resume = resume;
	}
	//投简历之查询简历、公司
	@Action(value = "userTocompany", results = {
			@Result(name = "success", location = "/user/messageadd.jsp"),
			@Result(name = "error", location = "/user/login.jsp") })
	public String query() {
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
		Job queryjob=jobService.querybyid(job.getId());
		User queryuser=userService.querybyid(id);
		List<Resume> resumeList=resumeService.querybyuid(id);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("job", queryjob);
		request.put("user", queryuser);
		request.put("resumeList", resumeList);
		return "success";
	}
	//添加
	@Action(value = "messageadd", results = {
			@Result(name = "success", type="redirect", location = "/umessagelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() {
		SimpleDateFormat formatter = new SimpleDateFormat(
		"yyyy-MM-dd-HH:mm:ss");
         String dateString = formatter.format(new Date());
         message.setMshijian(dateString);
         message.setMstatus("已投递，公司未查看");
         messageService.save(message);
		return "success";
	}
	//用户投递列表
	@Action(value = "umessagelist", results = {
			@Result(name = "success",location = "/user/messagelist.jsp"),
			@Result(name = "error", location = "/user/login.jsp") })
	public String muserlist() {
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
		Results result =messageService.messageListbyuid(page,id);
		page = result.getPage();//获得页数对象		
		List<Message> messageList= result.getList();//获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("messageList", messageList);
		request.put("page", page);
		return "success";
	}
	
	//用户删除投递信息
	@Action(value = "messagedelete", results = {
			@Result(name = "success", type="redirect",location = "/umessagelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String messagedelete() {
		messageService.delete(message);
		return "success";
	}
	//企业拒绝投递信息
	@Action(value = "cmessagedelete", results = {
			@Result(name = "success", type="redirect",location = "/cmessagelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String cmessagedelete() {
		Message queryMessage=messageService.querybyid(message.getId());
		queryMessage.setMstatus("已投递，公司已拒接");
        messageService.update(queryMessage);
		return "success";
	}
	//企业查看投递列表
	@Action(value = "cmessagelist", results = {
			@Result(name = "success",location = "/company/messagelist.jsp"),
			@Result(name = "error", location = "/company/login.jsp") })
	public String cmessagelist() {
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
		Results result =messageService.messageListbycid(page,id);
		page = result.getPage();//获得页数对象		
		List<Message> messageList= result.getList();//获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("messageList", messageList);
		request.put("page", page);
		return "success";
	}
	//企业查看简历查询
	@Action(value = "cresumedetail", results = {
			@Result(name = "success",location = "/company/resumedetail.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String cdetail() {
		Resume query=resumeService.queryby(resume.getId());
		Message queryMessage=messageService.querybyid(message.getId());
		queryMessage.setMstatus("已投递，公司已查看");
        messageService.update(queryMessage);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("resume", query);
		return "success";
	}
	
}
