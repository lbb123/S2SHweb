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

import com.model.News;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.NewsService;
import com.service.UserService;
import com.util.Page;
import com.util.Results;

public class NewsAction extends ActionSupport {
	@Resource
	private NewsService newsService;
	private News news;
	private int currentPage;// page工具类

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	// 新闻添加
	@Action(value = "newsadd", results = {
			@Result(name = "success",type="redirect", location = "/adminnewslist"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		news.setNdate(dateString);
		newsService.save(news);
		return "success";
	}


	// 管理员新闻查询
	@Action(value = "anewsToUpdate", results = {
			@Result(name = "success", location = "/admin/newsupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String querybyid() {
		News query = newsService.querybyid(news.getNid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("news", query);
		return "success";
	}
	// 新闻查询
	@Action(value = "newsdetail", results = {
			@Result(name = "success", location = "/newsdetail.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String newsdetail() {
		News query = newsService.querybyid(news.getNid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("news", query);
		return "success";
	}

	// 新闻修改
	@Action(value = "newsupdate", results = {
			@Result(name = "success", type="redirect", location = "/adminnewslist"),
			@Result(name = "error", location = "/404.jsp") })
	public String update() {
		newsService.update(news);
		return "success";
	}
	// 管理员新闻列表
	@Action(value = "adminnewslist", results = {
			@Result(name = "success", location = "/admin/newslist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String adminnewslist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = newsService.companylist(page);
		page = result.getPage();// 获得页数对象
		List<News> newsList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("newsList", newsList);
		request.put("page", page);
		return "success";
	}
	// 前台新闻列表
	@Action(value = "newslist", results = {
			@Result(name = "success", location = "/newslist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String newslist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(10);// 设置每页页数
		Results result = newsService.companylist(page);
		page = result.getPage();// 获得页数对象
		List<News> newsList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("newsList", newsList);
		request.put("page", page);
		return "success";
	}
	// 管理员删除新闻
	@Action(value = "newsdelete", results = {
			@Result(name = "success", type = "redirect", location = "/adminnewslist"),
			@Result(name = "error", location = "/404.jsp") })
	public String muserdelete() {
		newsService.delete(news);
		return "success";
	}
}
