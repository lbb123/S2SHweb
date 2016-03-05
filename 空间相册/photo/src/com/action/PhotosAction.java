package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.model.Photos;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.PhotosService;
import com.util.Page;
import com.util.Results;

public class PhotosAction extends ActionSupport {

	@Resource
	private PhotosService photosService;

	private int currentPage;// page工具类
	private Photos photos;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Photos getPhotos() {
		return photos;
	}

	public void setPhotos(Photos photos) {
		this.photos = photos;
	}

	// 创建相册
	@Action(value = "photosadd", results = {
			@Result(name = "success1", type = "redirect", location = "photoslist"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String add() {
		photos.setNum(0);
		photosService.save(photos);
		return "success1";
	}
	// 创建相册
	@Action(value = "mphotosadd", results = {
			@Result(name = "success1", type = "redirect", location = "mphotoslist"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String madd() {
		photos.setNum(0);
		photosService.save(photos);
		return "success1";
	}

	// 相册列表
	@Action(value = "photoslist", results = {
			@Result(name = "success1", location = "/mylist.jsp"),
			@Result(name = "error", location = "/login.jsp") })
	public String list() {
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
			request.put("nologin", "请登录后查看");
			return "error";
		}
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(3);// 设置每页页数
		Results result = photosService.Listbypageid(page,id);
		page = result.getPage();// 获得页数对象
		List<Photos> photosList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("photosList", photosList);
		request.put("page", page);
		return "success1";
	}
	// 所有相册列表
	@Action(value = "mphotoslist", results = {
			@Result(name = "success1", location = "/mmylist.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String mlist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(3);// 设置每页页数
		Results result = photosService.Listbypage(page);
		page = result.getPage();// 获得页数对象
		List<Photos> photosList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("photosList", photosList);
		request.put("page", page);
		return "success1";
	}

	// ajax相册列表
	@Action(value = "photoslist2")
	public void list2() throws IOException {
		List<Photos> photosList = photosService.List();// 获得列表对象
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		JSONArray json = JSONArray.fromObject(photosList);
		System.out.println(json.toString());
		out.println(json.toString());
		out.flush();
		out.close();
	}
	// ajax用户相册列表
	@Action(value = "photoslist3")
	public void list3() throws IOException {
		HttpServletRequest request2 = ServletActionContext.getRequest();
		 HttpSession session1 = request2.getSession();
		Object userId=session1.getAttribute("userId");
		int id = 0;
		try {
			id=Integer.valueOf(userId.toString());
		} catch (Exception e) {
			id = 0;
		}
		List<Photos> photosList = photosService.ListbyUid(id);// 获得列表对象
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		JSONArray json = JSONArray.fromObject(photosList);
		System.out.println(json.toString());
		out.println(json.toString());
		out.flush();
		out.close();
	}

	// 删除相册
	@Action(value = "photosdelete", results = {
			@Result(name = "success1", type = "redirect", location = "photoslist"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String delete() {
		photosService.delete(photos);
		return "success1";
	}
	// 删除相册
	@Action(value = "mphotosdelete", results = {
			@Result(name = "success1", type = "redirect", location = "mphotoslist"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String mdelete() {
		photosService.delete(photos);
		return "success1";
	}

	// 相册名修改
	@Action(value = "photosupdate", results = {
			@Result(name = "success1", type = "redirect", location = "photoslist"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String update() {
		photosService.update(photos);
		return "success1";
	}
	// 相册名修改
	@Action(value = "mphotosupdate", results = {
			@Result(name = "success1", type = "redirect", location = "mphotoslist"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String mupdate() {
		photosService.update(photos);
		return "success1";
	}

	// 相册查询
	@Action(value = "photosToupdate", results = {
			@Result(name = "success1", location = "/photosupdate.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String query() {
		Photos photos1 = photosService.query(photos);
		Map request = (Map) ActionContext.getContext().get("request");

		request.put("photos", photos1);
		return "success1";
	}
	// 相册查询
	@Action(value = "mphotosToupdate", results = {
			@Result(name = "success1", location = "/mphotosupdate.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String mquery() {
		Photos photos1 = photosService.query(photos);
		Map request = (Map) ActionContext.getContext().get("request");

		request.put("photos", photos1);
		return "success1";
	}
}
