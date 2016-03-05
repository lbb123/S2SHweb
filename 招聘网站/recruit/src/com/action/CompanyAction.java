package com.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.model.Company;
import com.model.Resume;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.CompanyService;
import com.service.UserService;
import com.util.Page;
import com.util.Results;

//公司
public class CompanyAction extends ActionSupport{
	@Resource
	private CompanyService companyService;
	private Company company;
	private int currentPage;//page工具类

	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	//注册
	@Action(value = "companyadd", results = {
			@Result(name = "success", location = "/company/login.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() {
		companyService.save(company);
		return "success";
	}
	//登录
	@Action(value = "companylogin", results = {
			@Result(name = "success",location = "/company/index.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String login() {
		Company query=companyService.logins(company);
		if (query != null && !query.equals("")) {
			Map session = ActionContext.getContext().getSession();
			session.put("companyname", query.getCompanyname());
			session.put("companyId", query.getId());
			return "success";
		} else {
			return "error";
		}
	}
	//登出
	@Action(value = "out2", results = {
			@Result(name = "success",location = "/index.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String out() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session1 = request.getSession();
		 session1.invalidate();
		return "success";
	}
	
	//查询
	@Action(value = "companyToUpdate", results = {
			@Result(name = "success",location = "/company/update.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String querybyid() {
		Company querycompany=companyService.querybyid(company.getId());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("company", querycompany);
		return "success";
	}
	//管理员查询
	@Action(value = "mcompanyToUpdate", results = {
			@Result(name = "success",location = "/manager/companyupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String mquerybyid() {
		Company querycompany=companyService.querybyid(company.getId());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("company", querycompany);
		return "success";
	}
	
	//修改
	@Action(value = "companyupdate", results = {
			@Result(name = "success",location = "/company/index.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String update() {
		companyService.update(company);
		return "success";
	}
	//管理员修改
	@Action(value = "mcompanyupdate", results = {
			@Result(name = "success", type="redirect",location = "/mcompanylist"),
			@Result(name = "error", location = "/404.jsp") })
	public String mupdate() {
		companyService.update(company);
		return "success";
	}
	//管理员删除
	@Action(value = "mcompanydelete", results = {
			@Result(name = "success", type="redirect",location = "/mcompanylist"),
			@Result(name = "error", location = "/404.jsp") })
	public String mcompanydelete() {
		companyService.delete(company);
		return "success";
	}
	
	//企业列表
	@Action(value = "mcompanylist", results = {
			@Result(name = "success",location = "/manager/companylist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String mcompanylist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());//设置当前页数
		page.setEveryPage(3);//设置每页页数	
		Results result =companyService.companylist(page);
		page = result.getPage();//获得页数对象		
		List<Company> companyList= result.getList();//获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("companyList", companyList);
		request.put("page", page);
		return "success";
	}
	
	
}
